Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A28633EB7D
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 09:29:33 +0100 (CET)
Received: from localhost ([::1]:39938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMRYZ-0001Yw-RZ
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 04:29:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lMRXr-00018U-BI
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 04:28:47 -0400
Received: from mga14.intel.com ([192.55.52.115]:56286)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lMRXn-0006Np-Rl
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 04:28:46 -0400
IronPort-SDR: 6IS8EkHo+ftGZXod5sMtQkkLDaNuTITX+EqihWqS23MeXLgYVEw+ININcN4RSPraQWliQYujIU
 8ILlLmcMFlaA==
X-IronPort-AV: E=McAfee;i="6000,8403,9925"; a="188781103"
X-IronPort-AV: E=Sophos;i="5.81,255,1610438400"; d="scan'208";a="188781103"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2021 01:28:35 -0700
IronPort-SDR: I78RpfAbYm98sLravO3yIh0lvX77vV8BfA0TNMBPIcEjdiu2CcB9OeDKIY/bFdyUjNM8IujSyl
 X1anYYP2lrkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,255,1610438400"; d="scan'208";a="522784137"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by orsmga004.jf.intel.com with ESMTP; 17 Mar 2021 01:28:34 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 17 Mar 2021 01:28:34 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 17 Mar 2021 01:28:34 -0700
Received: from orsmsx611.amr.corp.intel.com ([10.22.229.24]) by
 ORSMSX611.amr.corp.intel.com ([10.22.229.24]) with mapi id 15.01.2106.013;
 Wed, 17 Mar 2021 01:28:34 -0700
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: RE: [RFC 0/1] Use dmabufs for display updates instead of pixman
Thread-Topic: [RFC 0/1] Use dmabufs for display updates instead of pixman
Thread-Index: AQHXDzwZ+OI5gY9jG0mrUFozYSd6RKpxH9oAgAor3ECAAKuegIAL5frw
Date: Wed, 17 Mar 2021 08:28:33 +0000
Message-ID: <b77b8f12e2774d32acb206235c7f87d1@intel.com>
References: <20210302080358.3095748-1-vivek.kasireddy@intel.com>
 <20210302120350.5zqcrdajdpszezpr@sirius.home.kraxel.org>
 <aaa8d88e16c34f9c94c3df2f11b06b74@intel.com>
 <20210309093739.xr7ue2gzt7ws7mgl@sirius.home.kraxel.org>
In-Reply-To: <20210309093739.xr7ue2gzt7ws7mgl@sirius.home.kraxel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.5.1.3
dlp-reaction: no-action
x-originating-ip: [10.1.200.100]
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
Sorry for the delayed response. I wanted to wait until I finished my proof-=
of-concept --
that included adding synchronization --  to ask follow up questions.

> >
> > Does your work above not count for anything?
>=20
> It is quite old, and I think not up-to-date with the final revision of th=
e blob resource
> specification.  I wouldn't be able to update this in near future due to b=
eing busy with other
> projects.  Feel free to grab & update & submit these patches though.
[Kasireddy, Vivek] Sure, we'll take a look at your work and use that as a s=
tarting
point. Roughly, how much of your work can be reused?

Also, given my limited understanding of how discrete GPUs work, I was wonde=
ring how=20
many copies would there need to be with blob resources/dmabufs and whether =
a zero-copy
goal would be feasible or not?

>=20
> Beside the code duplication this is also a maintainance issue.  This adds=
 one more
> configuration to virtio-gpu.  Right now you can build virtio-gpu with vir=
gl (depends on
> opengl), or you can build without virgl (doesn't use opengl then).  I don=
't think it is a good
> idea to add a third mode, without virgl support but using opengl for blob=
 dma-bufs.
[Kasireddy, Vivek] We'll have to re-visit this part but for our use-case wi=
th virtio-gpu, we
are disabling virglrenderer in Qemu and virgl DRI driver in the Guest. Howe=
ver, we still
need to use Opengl/EGL to convert the dmabuf (guest fb) to texture and rend=
er as part of
the UI/GTK updates.=20

>=20
>=20
> > On a different note, any particular reason why Qemu UI EGL
> > implementation is limited to Xorg and not extended to Wayland/Weston
> > for which there is GTK glarea?
>=20
> Well, ideally I'd love to just use glarea.  Which happens on wayland.
>=20
> The problem with Xorg is that the gtk x11 backend uses glx not egl to cre=
ate an opengl
> context for glarea.  At least that used to be the case in the past, maybe=
 that has changed
> with newer versions.  qemu needs egl contexts though, otherwise dma-bufs =
don't work.  So
> we are stuck with our own egl widget implementation for now.  Probably we=
 will be able
> to drop it at some point in the future.
[Kasireddy, Vivek] GTK X11 backend still uses GLX and it seems like that is=
 not going to=20
change anytime soon. Having said that, I was wondering if it makes sense to=
 add a new
purely Wayland backend besides GtkGlArea so that Qemu UI can more quickly a=
dopt new
features such as explicit sync. I was thinking about the new backend being =
similar to this:
https://cgit.freedesktop.org/wayland/weston/tree/clients/simple-dmabuf-egl.=
c

The reason why I am proposing this idea is because even if we manage to add=
 explicit=20
sync support to GTK and it gets merged, upgrading Qemu GTK support from 3.2=
2=20
to > 4.x may prove to be daunting. Currently, the way I am doing explicit s=
ync is
by adding these new APIs to GTK and calling them from Qemu:

static int
create_egl_fence_fd(EGLDisplay dpy)
{
        EGLSyncKHR sync =3D eglCreateSyncKHR(dpy,
                                           EGL_SYNC_NATIVE_FENCE_ANDROID,
                                           NULL);
        int fd;

        g_assert(sync !=3D EGL_NO_SYNC_KHR);
        fd =3D eglDupNativeFenceFDANDROID(dpy, sync);
        g_assert(fd >=3D 0);

        eglDestroySyncKHR(dpy, sync);

        return fd;
}

static void
wait_for_buffer_release_fence(EGLDisplay dpy)
{
        int ret;
        EGLint attrib_list[] =3D {
                EGL_SYNC_NATIVE_FENCE_FD_ANDROID, release_fence_fd,
                EGL_NONE,
        };

        if (release_fence_fd < 0)
          return;

        EGLSyncKHR sync =3D eglCreateSyncKHR(dpy,
                                           EGL_SYNC_NATIVE_FENCE_ANDROID,
                                           attrib_list);
        g_assert(sync);

        release_fence_fd =3D -1;
        eglClientWaitSyncKHR(dpy, sync, 0,
                             EGL_FOREVER_KHR);
        eglDestroySyncKHR(dpy, sync);
}

And, of-course, I am tying the wait above to a dma_fence associated with th=
e
previous guest FB that is signalled to ensure that the Host is done using t=
he FB=20
thereby providing explicit synchronization between Guest and Host. It seems=
 to
work OK but I was wondering if you had any alternative ideas or suggestions=
=20
for doing explicit or implicit sync that are more easier.

Lastly, on a different note, I noticed that there is a virtio-gpu Windows d=
river here:
https://github.com/virtio-win/kvm-guest-drivers-windows/tree/master/viogpu

We are going to try it out but do you know how up to date it is kept?


Thanks,
Vivek



