Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6BE56F029A
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 10:32:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prx2R-0007nm-T7; Thu, 27 Apr 2023 04:31:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1prx2F-0007nO-K8
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 04:31:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1prx22-0002IL-On
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 04:31:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682584274;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9AefsbERDd9tqz90wFlSN3Ca0O2JSwxgbn8w0x+/zc0=;
 b=M5C3usTflXY57QB0/Y/OOmVyXqQC890OYhXOIwWhRbBUl0wqqLzykIBA03EhApPDRkFHD6
 SpXwq1+eiJIKPVHtaWlkesVxLxZqyyExtigPZJyPiLGB+ys/KsfsoJj/Vqyn9Gr4aJIdtv
 nKKCVdz+Fi8k/AucDNWFxfYpEdHaJS4=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-228-7GpKZ8tWNUKiQqEL65Pk5w-1; Thu, 27 Apr 2023 04:31:12 -0400
X-MC-Unique: 7GpKZ8tWNUKiQqEL65Pk5w-1
Received: by mail-ua1-f72.google.com with SMTP id
 a1e0cc1a2514c-77aad9af412so3300275241.0
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 01:31:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682584272; x=1685176272;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9AefsbERDd9tqz90wFlSN3Ca0O2JSwxgbn8w0x+/zc0=;
 b=PXrJvcGKxitGXWle6lX+A6QdLa36JemURvLcLZO8QNrQT8F3Mk9oaMf65PW56jz+Ht
 qaR9/vfRTpG6FNO+zIKIcl3B86v4qA3+lb1T31apyy/oViqlsihknmaHD+CzSooK68zo
 qxi2aRdQiNb1ZHCRLZGpRGjhztbCUNcAdl77z/VdFZEbI1p5Yy+zgsdpCQIruSELVbMn
 /mBUnCEaoqLK1QH667Fj+OFIl5/+QiYJPOm/i3U1p0poOipO8eaGEqMm88A4ySA1A1/P
 vnpb8qqcO3pK098RpZVjcKyceUCKjk8459qzyOvMwhdtzIuMmHjitSafMGkOSfCiZUsM
 zN/w==
X-Gm-Message-State: AC+VfDz6Baz+RPuPRZ3+7dbSCcbSOXVCCCydZtRnLAkV6Ts/Yn3SQZlR
 RS7LiT/e0QFhrPj31qnf2lbrELFLdoxVzsFuuTT0GkEmY7WzICWt+Zlz/7K9ZxdeLfraXfnojsD
 xzgSQJx9LXsV5uAVerdiwD+W6w2nSjRo=
X-Received: by 2002:a05:6102:cc7:b0:42f:e8ba:c448 with SMTP id
 g7-20020a0561020cc700b0042fe8bac448mr2055726vst.16.1682584272015; 
 Thu, 27 Apr 2023 01:31:12 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6AxdmRUP/58ZCupx+r9EuFmAZ6gW+5yKQJje39ksjfqzTmnjDKqz9wR19q20b8bo7s7m2JEeginxyFlRZs5gY=
X-Received: by 2002:a05:6102:cc7:b0:42f:e8ba:c448 with SMTP id
 g7-20020a0561020cc700b0042fe8bac448mr2055714vst.16.1682584271745; Thu, 27 Apr
 2023 01:31:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230425133851.489283-1-thuth@redhat.com>
 <5fc11d22-275d-cc8d-bf9c-f1c015cbee23@redhat.com>
 <ZEoyNt0UtSYRt9Go@redhat.com>
In-Reply-To: <ZEoyNt0UtSYRt9Go@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 27 Apr 2023 10:31:00 +0200
Message-ID: <CABgObfbqD+C4aME0yApeb_9dWA=22Yz+oi_7ECUtf6A4McHrhA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/3] Deprecate the qemu-system-i386 binary
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org, 
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Apr 27, 2023 at 10:28=E2=80=AFAM Daniel P. Berrang=C3=A9 <berrange@=
redhat.com> wrote:
> > I wonder if we should take this a step further and rename qemu-system-x=
86_64
> > to qemu-system-x86!  Distros can if they wish create symlinks to both
> > qemu-system-i386 and qemu-system-x86_64.
>
> I can't help feeling this just creates a new upgrade burden for distros
> for no obvious win.

We can create the symlinks on install as well during the deprecation
period. It doesn't have to be done by distros.

For me, the main benefit of implementing -x86 for system emulation is
that we need to move user-mode emulation to the x86_64 backend anyway.
And the less difference between the two emulation scenarios, the
better.

Paolo

> Things have gone quite recently, but if we introduce next-generation
> QEMU system emulator binary which is 100% QMP based, I think that would
> be the ideal time to change naming convention to -x86
>
> With regards,
> Daniel
> --
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
>


