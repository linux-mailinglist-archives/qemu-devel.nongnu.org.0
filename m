Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 513F4341126
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 00:43:45 +0100 (CET)
Received: from localhost ([::1]:48908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lN2Ip-0006OG-TX
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 19:43:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lN2H5-0005az-6j
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 19:41:55 -0400
Received: from mga14.intel.com ([192.55.52.115]:60844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lN2H2-0006HD-4b
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 19:41:54 -0400
IronPort-SDR: zbY1L6o4XxlVSo0DeD7GUIXC9kihdmhlBam4KEq/m1C2lQcAJggg34vWvxDD9lgiP/Bj58ksFz
 QVk5bIishSdw==
X-IronPort-AV: E=McAfee;i="6000,8403,9927"; a="189166843"
X-IronPort-AV: E=Sophos;i="5.81,259,1610438400"; d="scan'208";a="189166843"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2021 16:41:44 -0700
IronPort-SDR: FpYLpJHvtH/sH+UbyxiQ3mxarsWvmCQnvB2q7MRqrDgI7fRC04GocoVy1OHWCYtXOtp7mq3L6r
 UvQ+uH3eL3uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,259,1610438400"; d="scan'208";a="523437913"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga004.jf.intel.com with ESMTP; 18 Mar 2021 16:41:43 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 18 Mar 2021 16:41:42 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 18 Mar 2021 16:41:42 -0700
Received: from orsmsx611.amr.corp.intel.com ([10.22.229.24]) by
 ORSMSX611.amr.corp.intel.com ([10.22.229.24]) with mapi id 15.01.2106.013;
 Thu, 18 Mar 2021 16:41:42 -0700
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: RE: [RFC 0/1] Use dmabufs for display updates instead of pixman
Thread-Topic: [RFC 0/1] Use dmabufs for display updates instead of pixman
Thread-Index: AQHXDzwZ+OI5gY9jG0mrUFozYSd6RKpxH9oAgAor3ECAAKuegIAL5frwgADq4gCAAbYywA==
Date: Thu, 18 Mar 2021 23:41:42 +0000
Message-ID: <4846736e7a6c49ae87703e4381a8722f@intel.com>
References: <20210302080358.3095748-1-vivek.kasireddy@intel.com>
 <20210302120350.5zqcrdajdpszezpr@sirius.home.kraxel.org>
 <aaa8d88e16c34f9c94c3df2f11b06b74@intel.com>
 <20210309093739.xr7ue2gzt7ws7mgl@sirius.home.kraxel.org>
 <b77b8f12e2774d32acb206235c7f87d1@intel.com>
 <20210317142018.yriyydwxovtrfaus@sirius.home.kraxel.org>
In-Reply-To: <20210317142018.yriyydwxovtrfaus@sirius.home.kraxel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.5.1.3
dlp-reaction: no-action
x-originating-ip: [10.22.254.132]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Received-SPF: pass client-ip=192.55.52.115;
 envelope-from=vivek.kasireddy@intel.com; helo=mga14.intel.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
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
Cc: "Kim,
 Dongwon" <dongwon.kim@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "Zhang,
 Tina" <tina.zhang@intel.com>, "Vetter, Daniel" <daniel.vetter@intel.com>,
 =?iso-8859-1?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Gerd,
Thank you for taking the time to explain how support for blob resources nee=
ds
to be added. We are going to get started soon and here are the tasks we are
planning to do in order of priority:

1) Add support for VIRTIO_GPU_BLOB_MEM_GUEST +
VIRTIO_GPU_BLOB_FLAG_USE_SHAREABLE
2) Upgrade Qemu GTK UI from 3.22 to 4.x
3) Add explicit sync support to GTK4 and Qemu UI
4) Add support for VIRTGPU_BLOB_MEM_HOST3D=20

We'll start sending patches as we go along.

Thanks,
Vivek


> > [Kasireddy, Vivek] Sure, we'll take a look at your work and use that
> > as a starting point. Roughly, how much of your work can be reused?
>=20
> There are some small udmabuf support patches which can probably be reused=
 pretty much
> as-is.  Everything else needs larger changes I suspect, but it's been a w=
hile I looked at this
> ...
>=20
> > Also, given my limited understanding of how discrete GPUs work, I was
> > wondering how many copies would there need to be with blob
> > resources/dmabufs and whether a zero-copy goal would be feasible or not=
?
>=20
> Good question.
>=20
> Right now there are two copies (gtk ui):
>=20
>   (1) guest ram -> DisplaySurface -> gtk widget (gl=3Doff), or
>   (2) guest ram -> DisplaySurface -> texture (gl=3Don).
>=20
> You should be able to reduce this to one copy for gl=3Don ...
>=20
>   (3) guest ram -> texture
>=20
> ... by taking DisplaySurface out of the picture, without any changes to t=
he guest/host
> interface.  Drawback is that it requires adding an opengl dependency to v=
irtio-gpu even
> with virgl=3Doff, because the virtio-gpu device will have to handle the c=
opy to the texture
> then, in response to guest TRANSFER commands.
>=20
> When adding blob resource support:
>=20
> Easiest is probably supporting VIRTIO_GPU_BLOB_MEM_GUEST (largely identic=
al to
> non-blob resources) with VIRTIO_GPU_BLOB_FLAG_USE_SHAREABLE
> (allows the host to create a shared mapping).  Then you can go create a u=
dmabuf for the
> resource on the host side.  For the non-gl code path you can mmap() the u=
dmabuf (which
> gives you a linear mapping for the scattered guest pages) and create a Di=
splaySurface
> backed by guest ram pages (removing the guest ram -> DisplaySurface copy)=
.  For the gl
> code path you can create a texture backed by the udmabuf and go render on=
 the host
> without copying at all.
>=20
> Using VIRTIO_GPU_BLOB_MEM_GUEST +
> VIRTIO_GPU_BLOB_FLAG_USE_SHAREABLE for resources needs guest changes too,
> either in mesa (when using virgl) or the kernel driver's dumb buffer hand=
ling (when not
> using virgl).
>=20
> Alternatively (listed more for completeness):
>=20
> You can create a blob resource with VIRTGPU_BLOB_MEM_HOST3D (requires vir=
gl,
> see also virgl_drm_winsys_resource_create_blob in mesa).  It will be allo=
cated by the
> host, then mapped into the guest using a virtual pci memory bar.  Guest u=
serspace (aka
> mesa driver) can mmap() these resources and has direct, zero-copy access =
to the host
> resource.
>=20
> Going to dma-buf export that, import into i915, then let the gpu render i=
mplies we are
> doing p2p dma from a physical (pci-assigned) device to the memory bar of =
a virtual pci
> device.
>=20
> Doing that should be possible, but frankly I would be surprised if that a=
ctually works out-
> of-the-box.  Dunno how many dragons are lurking here.
> Could become an interesting challenge to make that fly.
>=20
> > > Beside the code duplication this is also a maintainance issue.  This
> > > adds one more configuration to virtio-gpu.  Right now you can build
> > > virtio-gpu with virgl (depends on opengl), or you can build without
> > > virgl (doesn't use opengl then).  I don't think it is a good idea to =
add a third mode,
> without virgl support but using opengl for blob dma-bufs.
> > [Kasireddy, Vivek] We'll have to re-visit this part but for our
> > use-case with virtio-gpu, we are disabling virglrenderer in Qemu and
> > virgl DRI driver in the Guest. However, we still need to use
> > Opengl/EGL to convert the dmabuf (guest fb) to texture and render as pa=
rt of the
> UI/GTK updates.
>=20
> Well, VIRTGPU_BLOB_MEM_HOST3D blob resources are created using virgl rend=
erer
> commands (VIRGL_CCMD_PIPE_RESOURCE_CREATE).  So supporting that without
> virglrenderer is not an option.
>=20
> VIRTIO_GPU_BLOB_MEM_GUEST might be possible without too much effort.
>=20
> > > > On a different note, any particular reason why Qemu UI EGL
> > > > implementation is limited to Xorg and not extended to
> > > > Wayland/Weston for which there is GTK glarea?
> > >
> > > Well, ideally I'd love to just use glarea.  Which happens on wayland.
> > >
> > > The problem with Xorg is that the gtk x11 backend uses glx not egl
> > > to create an opengl context for glarea.  At least that used to be
> > > the case in the past, maybe that has changed with newer versions.
> > > qemu needs egl contexts though, otherwise dma-bufs don't work.  So
> > > we are stuck with our own egl widget implementation for now.  Probabl=
y we will be
> able to drop it at some point in the future.
>=20
> > [Kasireddy, Vivek] GTK X11 backend still uses GLX and it seems like
> > that is not going to change anytime soon.
>=20
> Hmm, so the egl backend has to stay for the time being.
>=20
> > Having said that, I was wondering if it makes sense to add a new
> > purely Wayland backend besides GtkGlArea so that Qemu UI can more
> > quickly adopt new features such as explicit sync. I was thinking about =
the new backend
> being similar to this:
> > https://cgit.freedesktop.org/wayland/weston/tree/clients/simple-dmabuf
> > -egl.c
>=20
> I'd prefer to not do that.
>=20
> > The reason why I am proposing this idea is because even if we manage
> > to add explicit sync support to GTK and it gets merged, upgrading Qemu
> > GTK support from 3.22 to > 4.x may prove to be daunting. Currently,
> > the way I am doing explicit sync is by adding these new APIs to GTK and=
 calling them
> from Qemu:
>=20
> Well, we had the same code supporting gtk2+3 with #ifdefs.  There are als=
o #ifdefs to
> avoid using functions deprecated during 3.x lifetime.
> So I expect porting to gtk4 wouldn't be too bad.
>=20
> Also I expect qemu wouldn't be the only application needing sync support,=
 so trying to get
> that integrated with upstream gtk certainly makes sense.
>=20
> > Lastly, on a different note, I noticed that there is a virtio-gpu Windo=
ws driver here:
> > https://github.com/virtio-win/kvm-guest-drivers-windows/tree/master/vi
> > ogpu
> >
> > We are going to try it out but do you know how up to date it is kept?
>=20
> No, not following development closely.
>=20
> take care,
>   Gerd


