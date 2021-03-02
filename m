Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2175A329DAB
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 13:05:50 +0100 (CET)
Received: from localhost ([::1]:40354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH3mf-0003Xx-6Y
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 07:05:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lH3l1-0002Jh-VL
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 07:04:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34229)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lH3kw-0006Bf-6Y
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 07:04:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614686641;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EUmlhXEc43SmoVcgf6d6QDmD9TwlhsFYOumT6Xm1024=;
 b=c3kUAUQG9ZC9lHTY6gt5Z9Y2+rxuiPE8o6vciI/Mv7dTARG5eiA5pgccLVL3ZwfPS70hha
 NlygQ8IbHGILQ/2M+LnClQvugfbPCupnfQGH6RzEG+tC7+7HAUJX4G1fgEhp2pFGqIQCwU
 Ad8GGgg0PzsY40+VtuZmjtTnlgvYzQw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-602-itoXC8pmONy9clDQvlhMCA-1; Tue, 02 Mar 2021 07:03:57 -0500
X-MC-Unique: itoXC8pmONy9clDQvlhMCA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E049B107ACC7;
 Tue,  2 Mar 2021 12:03:55 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-154.ams2.redhat.com
 [10.36.112.154])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B357710016FA;
 Tue,  2 Mar 2021 12:03:52 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id ED17818000AB; Tue,  2 Mar 2021 13:03:50 +0100 (CET)
Date: Tue, 2 Mar 2021 13:03:50 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: Re: [RFC 0/1] Use dmabufs for display updates instead of pixman
Message-ID: <20210302120350.5zqcrdajdpszezpr@sirius.home.kraxel.org>
References: <20210302080358.3095748-1-vivek.kasireddy@intel.com>
MIME-Version: 1.0
In-Reply-To: <20210302080358.3095748-1-vivek.kasireddy@intel.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Dongwon Kim <dongwon.kim@intel.com>,
 qemu-devel@nongnu.org,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 02, 2021 at 12:03:57AM -0800, Vivek Kasireddy wrote:
> This is still a WIP/RFC patch that attempts to use dmabufs for display
> updates with the help of Udmabuf driver instead of pixman. This patch
> is posted to the ML to elicit feedback and start a discussion whether
> something like this would be useful or not for mainly non-Virgl
> rendered BOs and also potentially in other cases.

Yes, it surely makes sense to go into that direction.
The patch as-is doesn't, it breaks the guest/host interface.
That's ok-ish for a quick proof-of-concept, but clearly not
merge-able.

> TODO:
> - Use Blob resources for getting meta-data such as modifier, format, etc.

That is pretty much mandatory.  Without blob resources there is no
concept of resources shared between host and guest in virtio-gpu,
all data is explicitly copied with transfer commands.

Which implies quite a bit of work because we don't have blob resource
support in qemu yet.

> - Test with Virgil rendered BOs to see if this can be used in that case..

That also opens up the question how to go forward with virtio-gpu in
general.  The object hierarchy we have right now (skipping pci + vga
variants for simplicity):

  TYPE_VIRTIO_GPU_BASE (abstract base)
   -> TYPE_VIRTIO_GPU (in-qemu implementation)
   -> TYPE_VHOST_USER_GPU (vhost-user implementation)

When compiled with opengl + virgl TYPE_VIRTIO_GPU has a virgl=on/off
property.  Having a single device is not ideal for modular builds.
because the hw-display-virtio-gpu.so module has a dependency on
ui-opengl.so so that is needed (due to symbol references) even for the
virgl=off case.  Also the code is a bit of a #ifdef mess.

I think we should split TYPE_VIRTIO_GPU into two devices.  Remove
virgl+opengl support from TYPE_VIRTIO_GPU.  Add a new
TYPE_VIRTIO_GPU_VIRGL, with either TYPE_VIRTIO_GPU or
TYPE_VIRTIO_GPU_BASE as parent (not sure which is easier), have all
opengl/virgl support code there.

I think when using opengl it makes sense to also require virgl, so we
can use the virglrenderer library to manage blob resources (even when
the actual rendering isn't done with virgl).  Also reduces the
complexity and test matrix.

Maybe it even makes sense to deprecate in-qemu virgl support and focus
exclusively on the vhost-user implementation, so we don't have to
duplicate all work for both implementations.

> Considerations/Challenges:
> - One of the main concerns with using dmabufs is how to synchronize access
> to them and this use-case is no different. If the Guest is running Weston,
> then it could use a maximum of 4 color buffers but uses only 2 by default and
> flips between them if it is not sharing the FBs with other plugins while
> running with the drm backend. In this case, how do we make sure that Weston
> and Qemu UI are not using the same buffer at any given time?

There is graphic_hw_gl_block + graphic_hw_gl_flushed for syncronization.
Right now this is only wired up in spice, and it is rather simple (just
stalls virgl rendering instead of providing per-buffer syncronization).

> - If we have Xorg running in the Guest, then it gets even more interesting as
> Xorg in some cases does frontbuffer rendering (uses DRM_IOCTL_MODE_DIRTYFB).

Well, if the guest does frontbuffer rendering we can't do much about it
and have to live with rendering glitches I guess.

take care,
  Gerd


