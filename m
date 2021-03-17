Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C53233F277
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 15:22:33 +0100 (CET)
Received: from localhost ([::1]:45386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMX4C-0004rZ-9N
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 10:22:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lMX2J-0003wU-W7
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 10:20:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43283)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lMX2H-0005sV-Cp
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 10:20:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615990832;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XM3bn47hO/eCuSh0x+FaEW2pavuxTfVF7u82h/deVqo=;
 b=Q+JZPcRaav0bhgjKfEBAZirKnaWZ81s18QrHhiYHgLM/yg59sQP49YBdqGOiCbvPY+stj3
 Pw/PshM6ZI1QSyK5tfffHsiIdJdWlToAOsAh1jasH4g7n71NKSCGF+drzber4Yu8MA/COF
 cnFguB5CZJpJkHACulKhqcuVCSEl74k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-190-5fdLbIwHPla6F18pQAE7Pw-1; Wed, 17 Mar 2021 10:20:26 -0400
X-MC-Unique: 5fdLbIwHPla6F18pQAE7Pw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 604B5801817;
 Wed, 17 Mar 2021 14:20:24 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-141.ams2.redhat.com
 [10.36.112.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 68070101E249;
 Wed, 17 Mar 2021 14:20:20 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 706DD180038B; Wed, 17 Mar 2021 15:20:18 +0100 (CET)
Date: Wed, 17 Mar 2021 15:20:18 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
Subject: Re: [RFC 0/1] Use dmabufs for display updates instead of pixman
Message-ID: <20210317142018.yriyydwxovtrfaus@sirius.home.kraxel.org>
References: <20210302080358.3095748-1-vivek.kasireddy@intel.com>
 <20210302120350.5zqcrdajdpszezpr@sirius.home.kraxel.org>
 <aaa8d88e16c34f9c94c3df2f11b06b74@intel.com>
 <20210309093739.xr7ue2gzt7ws7mgl@sirius.home.kraxel.org>
 <b77b8f12e2774d32acb206235c7f87d1@intel.com>
MIME-Version: 1.0
In-Reply-To: <b77b8f12e2774d32acb206235c7f87d1@intel.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "Kim, Dongwon" <dongwon.kim@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "Zhang,
 Tina" <tina.zhang@intel.com>, "Vetter, Daniel" <daniel.vetter@intel.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 17, 2021 at 08:28:33AM +0000, Kasireddy, Vivek wrote:
> Hi Gerd,
> Sorry for the delayed response. I wanted to wait until I finished my proof-of-concept --
> that included adding synchronization --  to ask follow up questions.
> 
> > >
> > > Does your work above not count for anything?
> > 
> > It is quite old, and I think not up-to-date with the final revision of the blob resource
> > specification.  I wouldn't be able to update this in near future due to being busy with other
> > projects.  Feel free to grab & update & submit these patches though.
> [Kasireddy, Vivek] Sure, we'll take a look at your work and use that as a starting
> point. Roughly, how much of your work can be reused?

There are some small udmabuf support patches which can probably be
reused pretty much as-is.  Everything else needs larger changes I
suspect, but it's been a while I looked at this ...

> Also, given my limited understanding of how discrete GPUs work, I was wondering how 
> many copies would there need to be with blob resources/dmabufs and whether a zero-copy
> goal would be feasible or not?

Good question.

Right now there are two copies (gtk ui):

  (1) guest ram -> DisplaySurface -> gtk widget (gl=off), or
  (2) guest ram -> DisplaySurface -> texture (gl=on).

You should be able to reduce this to one copy for gl=on ...

  (3) guest ram -> texture

... by taking DisplaySurface out of the picture, without any changes to
the guest/host interface.  Drawback is that it requires adding an opengl
dependency to virtio-gpu even with virgl=off, because the virtio-gpu
device will have to handle the copy to the texture then, in response to
guest TRANSFER commands.

When adding blob resource support:

Easiest is probably supporting VIRTIO_GPU_BLOB_MEM_GUEST (largely
identical to non-blob resources) with VIRTIO_GPU_BLOB_FLAG_USE_SHAREABLE
(allows the host to create a shared mapping).  Then you can go create a
udmabuf for the resource on the host side.  For the non-gl code path you
can mmap() the udmabuf (which gives you a linear mapping for the
scattered guest pages) and create a DisplaySurface backed by guest ram
pages (removing the guest ram -> DisplaySurface copy).  For the gl code
path you can create a texture backed by the udmabuf and go render on the
host without copying at all.

Using VIRTIO_GPU_BLOB_MEM_GUEST + VIRTIO_GPU_BLOB_FLAG_USE_SHAREABLE for
resources needs guest changes too, either in mesa (when using virgl) or
the kernel driver's dumb buffer handling (when not using virgl).

Alternatively (listed more for completeness):

You can create a blob resource with VIRTGPU_BLOB_MEM_HOST3D (requires
virgl, see also virgl_drm_winsys_resource_create_blob in mesa).  It will
be allocated by the host, then mapped into the guest using a virtual pci
memory bar.  Guest userspace (aka mesa driver) can mmap() these
resources and has direct, zero-copy access to the host resource.

Going to dma-buf export that, import into i915, then let the gpu render
implies we are doing p2p dma from a physical (pci-assigned) device to
the memory bar of a virtual pci device.

Doing that should be possible, but frankly I would be surprised if that
actually works out-of-the-box.  Dunno how many dragons are lurking here.
Could become an interesting challenge to make that fly.

> > Beside the code duplication this is also a maintainance issue.  This adds one more
> > configuration to virtio-gpu.  Right now you can build virtio-gpu with virgl (depends on
> > opengl), or you can build without virgl (doesn't use opengl then).  I don't think it is a good
> > idea to add a third mode, without virgl support but using opengl for blob dma-bufs.
> [Kasireddy, Vivek] We'll have to re-visit this part but for our use-case with virtio-gpu, we
> are disabling virglrenderer in Qemu and virgl DRI driver in the Guest. However, we still
> need to use Opengl/EGL to convert the dmabuf (guest fb) to texture and render as part of
> the UI/GTK updates. 

Well, VIRTGPU_BLOB_MEM_HOST3D blob resources are created using virgl
renderer commands (VIRGL_CCMD_PIPE_RESOURCE_CREATE).  So supporting that
without virglrenderer is not an option.

VIRTIO_GPU_BLOB_MEM_GUEST might be possible without too much effort.

> > > On a different note, any particular reason why Qemu UI EGL
> > > implementation is limited to Xorg and not extended to Wayland/Weston
> > > for which there is GTK glarea?
> > 
> > Well, ideally I'd love to just use glarea.  Which happens on wayland.
> > 
> > The problem with Xorg is that the gtk x11 backend uses glx not egl to create an opengl
> > context for glarea.  At least that used to be the case in the past, maybe that has changed
> > with newer versions.  qemu needs egl contexts though, otherwise dma-bufs don't work.  So
> > we are stuck with our own egl widget implementation for now.  Probably we will be able
> > to drop it at some point in the future.

> [Kasireddy, Vivek] GTK X11 backend still uses GLX and it seems like that is not going to 
> change anytime soon.

Hmm, so the egl backend has to stay for the time being.

> Having said that, I was wondering if it makes sense to add a new
> purely Wayland backend besides GtkGlArea so that Qemu UI can more quickly adopt new
> features such as explicit sync. I was thinking about the new backend being similar to this:
> https://cgit.freedesktop.org/wayland/weston/tree/clients/simple-dmabuf-egl.c

I'd prefer to not do that.

> The reason why I am proposing this idea is because even if we manage to add explicit 
> sync support to GTK and it gets merged, upgrading Qemu GTK support from 3.22 
> to > 4.x may prove to be daunting. Currently, the way I am doing explicit sync is
> by adding these new APIs to GTK and calling them from Qemu:

Well, we had the same code supporting gtk2+3 with #ifdefs.  There are
also #ifdefs to avoid using functions deprecated during 3.x lifetime.
So I expect porting to gtk4 wouldn't be too bad.

Also I expect qemu wouldn't be the only application needing sync
support, so trying to get that integrated with upstream gtk certainly
makes sense.

> Lastly, on a different note, I noticed that there is a virtio-gpu Windows driver here:
> https://github.com/virtio-win/kvm-guest-drivers-windows/tree/master/viogpu
> 
> We are going to try it out but do you know how up to date it is kept?

No, not following development closely.

take care,
  Gerd


