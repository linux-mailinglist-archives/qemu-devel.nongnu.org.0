Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F8533223E
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 10:42:34 +0100 (CET)
Received: from localhost ([::1]:47396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJYsr-0002Br-88
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 04:42:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lJYoQ-0006zW-Lx
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 04:37:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lJYoO-0001Gx-Nm
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 04:37:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615282676;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2u8ZB9Xd5ZJ8xVrlFRa/hrfoXZZl6MBQrnzoCnl9gow=;
 b=IAvAZ7Vz9r4FlFNNwTTL2c79Woj0TSRiHc0czTYqFL88lKiTlZyZ2i2EzzyZxXAxUnWaq3
 V2Cj2cJPnXeevo6Dlr7Fur31bZRQPEMM5Vk+QRM/Rexp6/gsvDLjjZtoCL2nPQZPAY/Zpp
 31p0UyccfXd2tLtvcMwU8ysBO52N+q4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-471-boSBmf4PNNqkEL4BGZVPWw-1; Tue, 09 Mar 2021 04:37:52 -0500
X-MC-Unique: boSBmf4PNNqkEL4BGZVPWw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 13BDB1005D45;
 Tue,  9 Mar 2021 09:37:51 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-41.ams2.redhat.com
 [10.36.113.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3E30761F55;
 Tue,  9 Mar 2021 09:37:41 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 79FB218000A2; Tue,  9 Mar 2021 10:37:39 +0100 (CET)
Date: Tue, 9 Mar 2021 10:37:39 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
Subject: Re: [RFC 0/1] Use dmabufs for display updates instead of pixman
Message-ID: <20210309093739.xr7ue2gzt7ws7mgl@sirius.home.kraxel.org>
References: <20210302080358.3095748-1-vivek.kasireddy@intel.com>
 <20210302120350.5zqcrdajdpszezpr@sirius.home.kraxel.org>
 <aaa8d88e16c34f9c94c3df2f11b06b74@intel.com>
MIME-Version: 1.0
In-Reply-To: <aaa8d88e16c34f9c94c3df2f11b06b74@intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, "Kim,
 Dongwon" <dongwon.kim@intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> > That is pretty much mandatory.  Without blob resources there is no concept of resources
> > shared between host and guest in virtio-gpu, all data is explicitly copied with transfer
> > commands.
> [Kasireddy, Vivek] My understanding of virtio-gpu and the concept of resources is still
> fairly limited but are blob resources really needed for non-Virgl use-cases -- other than
> something like a dmabuf/scanout blob that shares the meta-data such as modifer? I
> thought the main motivation for blob resources would be to avoid the explicit copy you
> mentioned for Virgl workloads. 

Well, you want avoid the copy as well, right?  With blob resources you
can do that in a well defined way, i.e. the guest knows what you are
doing and behaves accordingly.  Without blob resources you can't, at
least not without violating the guests expectation that any changes it
does only visible to the host after an explicit transfer (aka copy)
command.

> > Which implies quite a bit of work because we don't have blob resource support in qemu
> > yet.
> [Kasireddy, Vivek] I was scrubbing through old mailing list messages to understand the
> motivation behind blob resources as to why they are needed and came across this:
> https://gitlab.freedesktop.org/virgl/qemu/-/commits/virtio-gpu-next
> 
> Does your work above not count for anything?

It is quite old, and I think not up-to-date with the final revision of
the blob resource specification.  I wouldn't be able to update this in
near future due to being busy with other projects.  Feel free to grab
& update & submit these patches though.

> > I think when using opengl it makes sense to also require virgl, so we can use the
> > virglrenderer library to manage blob resources (even when the actual rendering isn't done
> > with virgl).  Also reduces the complexity and test matrix.
> [Kasireddy, Vivek] When you say "using opengl" are you referring to the presentation of
> the rendered buffer via dmabuf or pixman? If yes, I am not sure why this would need to
> depend on Virgl.

Well, you can probably do it without virgl as well.  But why?  Instead
of just using the virglrenderer library effectively duplicate the blob
resource management bits in qemu?

Beside the code duplication this is also a maintainance issue.  This
adds one more configuration to virtio-gpu.  Right now you can build
virtio-gpu with virgl (depends on opengl), or you can build without
virgl (doesn't use opengl then).  I don't think it is a good idea to
add a third mode, without virgl support but using opengl for blob
dma-bufs.

> For our use-case(s) where we are using virtio-gpu in buffer sharing mode,
> we'd still need opengl for submitting the dmabuf to UI, IIUC.

Correct.  When you want use dma-bufs you need opengl.

> > Maybe it even makes sense to deprecate in-qemu virgl support and focus exclusively on
> > the vhost-user implementation, so we don't have to duplicate all work for both
> > implementations.
> [Kasireddy, Vivek] Is the vhost-user implementation better in terms of performance, generally? 

It is better both in terms of security (it's easier to sandbox) and
performance.  The in-qemu implementation runs in the qemu iothread.
Which also handles a bunch of other jobs.  Also virglrenderer being busy
-- for example with compiling complex shaders -- can block qemu for a
while, which in turn can cause latency spikes in the guest.  With the
vhost-user implementation this is not a problem.

Drawback is the extra communication (and synchronization) needed between
vhost-user + qemu to make the guest display available via spice or gtk.

The latter can possibly be solved by exporting the guest display as
pipewire remote desktop (random idea I didn't investigate much yet).

> On a different note, any particular reason why Qemu UI EGL
> implementation is limited to Xorg and not extended to Wayland/Weston
> for which there is GTK glarea?

Well, ideally I'd love to just use glarea.  Which happens on wayland.

The problem with Xorg is that the gtk x11 backend uses glx not egl to
create an opengl context for glarea.  At least that used to be the case
in the past, maybe that has changed with newer versions.  qemu needs egl
contexts though, otherwise dma-bufs don't work.  So we are stuck with
our own egl widget implementation for now.  Probably we will be able to
drop it at some point in the future.

HTH,
  Gerd


