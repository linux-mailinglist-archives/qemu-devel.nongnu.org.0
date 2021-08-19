Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0743F1DCD
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 18:27:45 +0200 (CEST)
Received: from localhost ([::1]:54504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGktN-0006Bd-1V
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 12:27:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1mGks3-00059n-G6
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 12:26:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46068)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1mGks1-0000Q1-RW
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 12:26:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629390379;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rhNPASckNZvnpFIiG6lVchMBaWRjor5dePWYvzcMItM=;
 b=ayh2JPmL1G0486pX+RBAt20ZowZNZ/rX9wa8QZJed+6jWTE997C+ysZeXHTJ/B5LW3caNI
 KgpXriWDo4EaiYp7SP/Lqh7VMy9CyWCGhk0dlsRuCm8K01s2z6zbVRcuJQDsp20+nmOcnm
 PcmfsCcQ7aIe5JrTN7qL3Q4MqbxNqs0=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-25-mnPkoRq6NPipV9GlgIWGhA-1; Thu, 19 Aug 2021 12:26:18 -0400
X-MC-Unique: mnPkoRq6NPipV9GlgIWGhA-1
Received: by mail-ot1-f71.google.com with SMTP id
 v42-20020a056830092a00b0051827b113ecso3022437ott.22
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 09:26:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=69ALGd1yxKTzvnMbtojToEMrZyLhp6EJw4gjewGE2AQ=;
 b=RNJB2Xuo7bZgW+9/nFD9ah/bZfLRaqfL+uEHLD/9kpg8QKX4c2WOtAXf47agIzxuBx
 U7MDfdwow0mG2VB+exavJt2qDeMURuLxZF2tOLFYJtzp1Xb5pimlzHpzPIVFdCQYfeva
 KIVS7vsOhySEnK89J7+Gn4DPceRUuaxhwx9pp7mbKo6AM2qqVEJsDmdrlhqmVPAdYc7C
 ISlHpAuYAI0TLwl55WojGb2cteygzm0xGGVRrlNBiMs4Grw2NQ7A5Xh6w402lyi8JpB9
 R+BTYhtMCFz1sMBnr7PhTEVuUEIa6rFro13MsZj/Ys49ByP5ecEUw/I3gN1jlVXtkJP5
 ghug==
X-Gm-Message-State: AOAM5311AsPiHHP5xUffD9UUaqIbNvBygKwnzgUFpy52qlO3x+kikYvl
 06NjQUmwo589MhDaKgmyX4g35szato6SyrzUeC9EfvTweBH6/vSW1lPdFfPIkr7nXDjG3susV4L
 JyvN8Lx/Ul2udKWk=
X-Received: by 2002:a05:6830:9c7:: with SMTP id
 y7mr12674048ott.111.1629390377785; 
 Thu, 19 Aug 2021 09:26:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxsqvv1qtxa/VBqew3KeXEHmMwUxeFcKJBf/lnz5zx74uBEk6pXc3oxlh8Nl+GJSyvhRRJjmw==
X-Received: by 2002:a05:6830:9c7:: with SMTP id
 y7mr12674028ott.111.1629390377517; 
 Thu, 19 Aug 2021 09:26:17 -0700 (PDT)
Received: from redhat.com ([198.99.80.109])
 by smtp.gmail.com with ESMTPSA id x12sm747091oie.56.2021.08.19.09.26.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 09:26:16 -0700 (PDT)
Date: Thu, 19 Aug 2021 10:26:15 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: John Johnson <john.g.johnson@oracle.com>
Subject: Re: [PATCH RFC v2 01/16] vfio-user: introduce vfio-user protocol
 specification
Message-ID: <20210819102615.0c5ac7fd.alex.williamson@redhat.com>
In-Reply-To: <D15CA27E-B5F8-4ADA-B4F6-94F6C1CA3DFA@oracle.com>
References: <cover.1629131628.git.elena.ufimtseva@oracle.com>
 <a928987fdb794e44784186c4aa5135bc6c88d0fc.1629131628.git.elena.ufimtseva@oracle.com>
 <20210817170408.78be6ac7.alex.williamson@redhat.com>
 <D15CA27E-B5F8-4ADA-B4F6-94F6C1CA3DFA@oracle.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Jag Raman <jag.raman@oracle.com>, Swapnil Ingle <swapnil.ingle@nutanix.com>,
 John Levon <john.levon@nutanix.com>,
 QEMU Devel Mailing List <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 19 Aug 2021 15:32:16 +0000
John Johnson <john.g.johnson@oracle.com> wrote:

> > On Aug 17, 2021, at 7:04 PM, Alex Williamson <alex.williamson@redhat.co=
m> wrote:
> >=20
> >=20
> > The address/size paradigm falls into the same issues as the vfio kernel
> > interface where we can't map or unmap the entire 64-bit address space,
> > ie. size is limited to 2^64 - 1.  The kernel interface also requires
> > PAGE_SIZE granularity for the DMA, which means the practical limit is
> > 2^64 - PAGE_SIZE.  If we had a redo on the kernel interface we'd use
> > start/end so we can express a size of (end - start + 1).
> >=20
> > Is following the vfio kernel interface sufficiently worthwhile for
> > compatibility to incur this same limitation?  I don't recall if we've
> > already discussed this, but perhaps worth a note in this design doc if
> > similarity to the kernel interface is being favored here.  See for
> > example QEMU commit 1b296c3def4b ("vfio: Don't issue full 2^64 unmap").
> > Thanks,
> >  =20
>=20
>=20
> =09I=E2=80=99d prefer to stay as close to the kernel i/f as we can.
> An earlier version of the spec used a vhost-user derived structure
> for MAP & UNMAP.  This made it more difficult to add the bitmap
> field when vfio added migration capability, so we switched to the
> ioctl() structure.
>=20
> =09It looks like vfio_dma_unmap() takes a 64b =E2=80=98size=E2=80=99 arg
> (ram_addr_t)  How did you unmap an entire 64b address space?

It's called from the MemoryListener which operates on
MemoryRegionSections, which uses Int128 that get's chunked to
ram_addr_t for vfio_dma_unmap().  We do now have
VFIO_DMA_UNMAP_FLAG_ALL in the kernel API which gives us an option to
clear the whole 64bit address space in one ioctl, but it's not a high
priority to make use of in QEMU since it still needs to handle older
kernels.

> The comment there mentions a bug where iova+size wraps the end of the
> 64b space.

Right, that's a separate issue that's just a bug in the kernel.  That's
been fixed, but the QEMU code exists for now as a workaround for any
broken kernels in the wild.  Thanks,

Alex


