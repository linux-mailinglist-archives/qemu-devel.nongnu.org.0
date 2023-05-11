Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD806FE8B3
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 02:32:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwuCi-0004la-Gg; Wed, 10 May 2023 20:30:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pwuCg-0004lC-Bk
 for qemu-devel@nongnu.org; Wed, 10 May 2023 20:30:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pwuCe-0007Fv-1z
 for qemu-devel@nongnu.org; Wed, 10 May 2023 20:30:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683765038;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6rVxzhc7yLOyqzReLBNMSYu87SsIYMDmUffoxAWPI7M=;
 b=anPX0RKv+WPnVP7fAkkW7z0koHan32TdSfPfRj4okL5RLkiQ0jJ4zU036E8r/qhxXhe18J
 suac4Z5yIioqC8Er9bECdr4eqNHIx06ymeRwkKNLk4E0RCBLGOEZD3HD/FIvHA7xa6eWF2
 3FqZt2oSNFDp8Ygmbw0ILb2jCeMYMF0=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-519-jzSZPs58PVmcU5b3hmIl-A-1; Wed, 10 May 2023 20:30:31 -0400
X-MC-Unique: jzSZPs58PVmcU5b3hmIl-A-1
Received: by mail-lf1-f71.google.com with SMTP id
 2adb3069b0e04-4f13b1c06aaso4628910e87.1
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 17:30:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683765030; x=1686357030;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6rVxzhc7yLOyqzReLBNMSYu87SsIYMDmUffoxAWPI7M=;
 b=Fsh3yyNDZi7omwJnfqpTTR7pY6xhecgo7X3aBeZxqtqh8wnObI6O6k/7C20vGZ4lK4
 XQMx5rl0x/RDq08z+hVNhOnpa1C+vdHkjYVhrlr5aNDSPN9DDTo0ZtI/rBLhvYHMTGq5
 guziIi/ncT2GkDiumAvTgIdnQJs0bKJhbtUzmaXeF/e4ScBVshD/WO/zI557yEnNIVbQ
 wIQ3RhaaeRkF5Xwrq1bw2M8Gj+9kQ2LIzwMfo4qmC2mrZ1HtQx3yi3Z3SPKWUUzL8uOJ
 Ls4hF5hKNh8HhTH3h2DT39rxl72tlTlJLeGpS+YN0ptPyZw/l/xSjzZedUG+NijnD8yP
 USkg==
X-Gm-Message-State: AC+VfDxEyZ2/o1mHDfVe9fSK8SpGJWCnNagCsXFxwq5ndJFdgSszixwt
 NfU6osOTNRPBV/yerxkuf9gInDL7DAI2h/hNya9nVLVgRhA6jKBGdKijnuOrRphgd2K9JIdoan8
 +chusoV/M57k9ACbPe01303j21xgbzpU=
X-Received: by 2002:ac2:5464:0:b0:4e8:3ea0:cf37 with SMTP id
 e4-20020ac25464000000b004e83ea0cf37mr2189714lfn.34.1683765030244; 
 Wed, 10 May 2023 17:30:30 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7+H8vcPRPNvVuAu437O99jjoHYzCoXjP4chFYFwyGm8OTQ9H+/A5Ed/yCXUn9alHT6bixFWwgJj5wFKG1xatI=
X-Received: by 2002:ac2:5464:0:b0:4e8:3ea0:cf37 with SMTP id
 e4-20020ac25464000000b004e83ea0cf37mr2189710lfn.34.1683765029922; Wed, 10 May
 2023 17:30:29 -0700 (PDT)
MIME-Version: 1.0
References: <366bbcafdb6e0373f0deb105153768a8c0bded87.camel@gmail.com>
 <6b31f5f523af93d47cac37509caf8036e183e136.camel@gmail.com>
 <df848403-385b-c5e6-0a0a-581dd398d90b@msgid.tls.msk.ru>
In-Reply-To: <df848403-385b-c5e6-0a0a-581dd398d90b@msgid.tls.msk.ru>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 11 May 2023 08:30:18 +0800
Message-ID: <CACGkMEsfUAaykVJYAL-4UsqhS=v3GEemHmkcgjj0z1m1EZh-Gg@mail.gmail.com>
Subject: Re: [PATCH 1/1] e1000e: Fix tx/rx counters
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: timothee.cocault@gmail.com, qemu-devel@nongnu.org, 
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Thu, May 11, 2023 at 2:54=E2=80=AFAM Michael Tokarev <mjt@tls.msk.ru> wr=
ote:
>
> 10.04.2023 18:27, timothee.cocault@gmail.com wrote:
> > The bytes and packets counter registers are cleared on read.
> >
> > Copying the "total counter" registers to the "good counter" registers h=
as
> > side effects.
> > If the "total" register is never read by the OS, it only gets increment=
ed.
> > This leads to exponential growth of the "good" register.
> >
> > This commit increments the counters individually to avoid this.
>
> Smells like a -stable material, is it not?

Yes, tagged for stable.

Thanks

>
> Thanks,
>
> /mjt
>


