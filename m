Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EBC740ACCE
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 13:51:40 +0200 (CEST)
Received: from localhost ([::1]:38734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ6yR-0003LW-N2
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 07:51:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mQ6wM-0001s6-V0
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 07:49:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24329)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mQ6wL-0005Ms-4R
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 07:49:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631620168;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n+yAB/cqqN2gn6+IuW90mh920laZSutrLVF06XC3LYE=;
 b=UEjCX2NeIBEbiK+HhdLUluJ0QfqeK2eOxzfCJz0Ywud9Q2Vxi3mCTFvk388bh10ENp151O
 u0W7JtlmFrKZ5Hnx6fWbjQeRy38Z+ScEZj5GANKSne/uPU20k8TjdOe7KEGntQ53lSAvfO
 ihJoq7JinMYHNZeFCvCSIOm3zPj6no4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-461-jK82oaTVNomDLA_7tp7xng-1; Tue, 14 Sep 2021 07:49:27 -0400
X-MC-Unique: jK82oaTVNomDLA_7tp7xng-1
Received: by mail-wm1-f69.google.com with SMTP id
 b139-20020a1c8091000000b002fb33c467c8so6340951wmd.5
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 04:49:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=n+yAB/cqqN2gn6+IuW90mh920laZSutrLVF06XC3LYE=;
 b=zOpbId6rPZ1LttPP3yeVERDj8/+o5ct9JPJ3rNsw27olPbS7KhonP5bWNqavHnME66
 Um0Mo9O+8lprAe0gb2iy4kc/HSrkXlnEKFgZaI0NYPDJ13K5iBNvW1L9PWelUxPp2DO+
 kNLoeUf5WL5E4D+wyYjrv1OkawRdXohyUQ0ZoDoIsbH4T8/31ZfR0RbMdNR/Fmj4TrGj
 xS1+mSC5NqkscrXV4xGQmjQUJS+ACXspbnLoLA9/ntLKv/daFC9rDnGm5RVTuCxvFufJ
 QVPI351gozKSzhs5coh43dvfBN6tRN+cnwPwhyrD5eHbxtqO0jqpLo+lSzSHHcf90a1x
 CHIA==
X-Gm-Message-State: AOAM531huCtvPuclk8ykO176J1Nf78ej8PC6NftqNelSL2IZB/G33foi
 itIctLoOA7EW/1UVLn2Xw3ogt4CF67Z0VK3kjuLs82Cfpl8Kx9LDOLe98nt+3vdaOo3U/IpXQWi
 X1kMatZEAaXIPX2g=
X-Received: by 2002:a05:6000:1b8d:: with SMTP id
 r13mr18624847wru.230.1631620165198; 
 Tue, 14 Sep 2021 04:49:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzp6fHxphneQSfo4OCMXm9GkszCNSpLa/EiFU43qk9dV3K1jG74VeA9OOP8SctUDZWF8cj5LQ==
X-Received: by 2002:a05:6000:1b8d:: with SMTP id
 r13mr18624823wru.230.1631620164912; 
 Tue, 14 Sep 2021 04:49:24 -0700 (PDT)
Received: from redhat.com ([2.55.151.134])
 by smtp.gmail.com with ESMTPSA id c2sm10246090wrs.60.2021.09.14.04.49.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Sep 2021 04:49:24 -0700 (PDT)
Date: Tue, 14 Sep 2021 07:49:20 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH] vhost-vsock: fix migration issue when seqpacket is
 supported
Message-ID: <20210914074909-mutt-send-email-mst@kernel.org>
References: <20210907124935.147164-1-sgarzare@redhat.com>
 <YTdnkPR+LjNFXaeQ@redhat.com>
 <20210909044603-mutt-send-email-mst@kernel.org>
 <YTnNlEz+0LohJHRG@redhat.com>
 <20210909063623-mutt-send-email-mst@kernel.org>
 <20210913125142.t34brj4qfvngkfgh@steredhat>
 <20210913094508-mutt-send-email-mst@kernel.org>
 <20210914104209.knw76yfzs2547rrb@steredhat>
MIME-Version: 1.0
In-Reply-To: <20210914104209.knw76yfzs2547rrb@steredhat>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Jiang Wang <jiang.wang@bytedance.com>,
 qemu-stable@nongnu.org, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Arseny Krasnov <arseny.krasnov@kaspersky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 14, 2021 at 12:42:09PM +0200, Stefano Garzarella wrote:
> On Mon, Sep 13, 2021 at 09:46:48AM -0400, Michael S. Tsirkin wrote:
> > On Mon, Sep 13, 2021 at 02:51:42PM +0200, Stefano Garzarella wrote:
> > > On Fri, Sep 10, 2021 at 02:35:53AM -0400, Michael S. Tsirkin wrote:
> > > > On Thu, Sep 09, 2021 at 10:02:12AM +0100, Daniel P. Berrangé wrote:
> > > > > On Thu, Sep 09, 2021 at 04:47:42AM -0400, Michael S. Tsirkin wrote:
> > > > > > On Tue, Sep 07, 2021 at 02:22:24PM +0100, Daniel P. Berrangé wrote:
> > > > > > > On Tue, Sep 07, 2021 at 02:49:35PM +0200, Stefano Garzarella wrote:
> > > > > > > > Commit 1e08fd0a46 ("vhost-vsock: SOCK_SEQPACKET feature bit support")
> > > > > > > > enabled the SEQPACKET feature bit.
> > > > > > > > This commit is released with QEMU 6.1, so if we try to migrate a VM where
> > > > > > > > the host kernel supports SEQPACKET but machine type version is less than
> > > > > > > > 6.1, we get the following errors:
> > > > > > > >
> > > > > > > >     Features 0x130000002 unsupported. Allowed features: 0x179000000
> > > > > > > >     Failed to load virtio-vhost_vsock:virtio
> > > > > > > >     error while loading state for instance 0x0 of device '0000:00:05.0/virtio-vhost_vsock'
> > > > > > > >     load of migration failed: Operation not permitted
> > > > > > > >
> > > > > > > > Let's disable the feature bit for machine types < 6.1, adding a
> > > > > > > > `features` field to VHostVSock to simplify the handling of upcoming
> > > > > > > > features we will support.
> > > > > > >
> > > > > > > IIUC, this will still leave migration broken for anyone migrating
> > > > > > > a >= 6.1 machine type between a kernel that supports SEQPACKET and
> > > > > > > a kernel lacking that, or vica-verca.
> > > > > > >
> > > > > > > If a feature is dependant on a host kernel feature we can't turn
> > > > > > > that on automatically as part of the machine type, as we need
> > > > > > > ABI stability across migration indepdant of kernel version.
> > > > > > >
> > > > > > >
> > > > > > > Regards,
> > > > > > > Daniel
> > > > > >
> > > > > > This is a fundamental problem we have with kernel accelerators.
> > > > > > A higher level solution at management level is needed.
> > > > > > For now yes, we do turn features on by default,
> > > > > > consistent kernels on source and destination are assumed.
> > > > > > For downstreams not a problem at all as they update
> > > > > > userspace and kernel in concert.
> > > > >
> > > > > Even downstream in RHEL that is not actually valid anymore. Container
> > > > > based deployment has killed any assumptions that can be made in this
> > > > > respect. Even if the userspace and kernel are updated in lockstep in
> > > > > a particular RHEL release, you cannot assume the running environment
> > > > > will have a matched pair.
> > > > >
> > > > > Users can be running QEMU userspace from RHEL-8.5 inside a container
> > > > > that has been deployed on a host using a 8.3 kernel. We've even had
> > > > > cases of running QEMU from RHEL-8, on a RHEL-7 host.
> > > > >
> > > > > Regards,
> > > > > Daniel
> > > >
> > > > Is there finally an interest in addressing this then?  This would
> > > > involve collecting host features across a cluster and for each host
> > > > figuring out a configuration that works for migration. IIRC a tool was
> > > > proposed for the task (to live alongside e.g. qemu-img).
> > > 
> > > Apart from the tool, what if we provide a mechanism for adding/removing
> > > device features at run-time?
> > > After migration we could tell the guest that a feature is no longer
> > > available.
> > > 
> > > Maybe it's too complicated, but it would allow us to solve the problem of
> > > migrating between different kernels or, with vDPA, between different devices
> > > that don't support all features.
> > 
> > Possible going forward but not supported by the spec at this point,
> > and tricky to do generally.
> > It's possible to do it in a vsock specific way since sockets
> > are currently closed across migration.
> 
> Yep, I see.
> 
> > 
> > 
> > > >
> > > > As long as we just stick to the machine type the best we can do is
> > > > probably to keep doing what we do now (hope that the two host kernels
> > > > are more or less consistent) as otherwise we'd have to never enable any
> > > > new features in vsock.
> > > 
> > > Should we at least merge this patch to allow to migrate a VM between a new
> > > and an old qemu even if the kernel is the same?
> > > 
> > > Thanks,
> > > Stefano
> > 
> > I'm inclined to do this, yes.
> > 
> 
> If you haven't queued it yet, I'd like to send a v2 using an `on,off,auto`
> property: `auto` would be the actual behavior when enabled, `on` instead
> requires that the kernel supports the feature otherwise there is an error.
> 
> Thanks,
> Stefano

go ahead pls.


