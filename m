Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44725332057
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 09:19:54 +0100 (CET)
Received: from localhost ([::1]:46730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJXaq-0004LS-Qv
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 03:19:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lJXZY-0003vn-RY
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 03:18:32 -0500
Received: from mga14.intel.com ([192.55.52.115]:39396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lJXZV-0003vE-SS
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 03:18:32 -0500
IronPort-SDR: zYkBGtCA2FNwjesrXhYLyZQ/e4fkCPFVHr2jke+qvVZyTv66AG2l6H7BkfQT7j9pwnhv6BITmj
 FmNp6sfN7h8w==
X-IronPort-AV: E=McAfee;i="6000,8403,9917"; a="187549616"
X-IronPort-AV: E=Sophos;i="5.81,234,1610438400"; d="scan'208";a="187549616"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2021 00:18:22 -0800
IronPort-SDR: 2+yulLCLD2zFzBghqT+uUFa/cwHmYCwFgn/xXGROMAffyuN8JQhl5fmjpytKxJ8XGPWYJlZgA+
 PFX5wnvl5hVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,234,1610438400"; d="scan'208";a="369704631"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga003.jf.intel.com with ESMTP; 09 Mar 2021 00:18:22 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 9 Mar 2021 00:18:22 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 9 Mar 2021 00:18:21 -0800
Received: from orsmsx611.amr.corp.intel.com ([10.22.229.24]) by
 ORSMSX611.amr.corp.intel.com ([10.22.229.24]) with mapi id 15.01.2106.013;
 Tue, 9 Mar 2021 00:18:21 -0800
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: RE: [RFC 0/1] Use dmabufs for display updates instead of pixman
Thread-Topic: [RFC 0/1] Use dmabufs for display updates instead of pixman
Thread-Index: AQHXDzwZ+OI5gY9jG0mrUFozYSd6RKpxH9oAgAor3EA=
Date: Tue, 9 Mar 2021 08:18:21 +0000
Message-ID: <aaa8d88e16c34f9c94c3df2f11b06b74@intel.com>
References: <20210302080358.3095748-1-vivek.kasireddy@intel.com>
 <20210302120350.5zqcrdajdpszezpr@sirius.home.kraxel.org>
In-Reply-To: <20210302120350.5zqcrdajdpszezpr@sirius.home.kraxel.org>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, "Kim,
 Dongwon" <dongwon.kim@intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 =?iso-8859-1?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Gerd,

> Yes, it surely makes sense to go into that direction.
> The patch as-is doesn't, it breaks the guest/host interface.
> That's ok-ish for a quick proof-of-concept, but clearly not merge-able.
>=20
> > TODO:
> > - Use Blob resources for getting meta-data such as modifier, format, et=
c.
>=20
> That is pretty much mandatory.  Without blob resources there is no concep=
t of resources
> shared between host and guest in virtio-gpu, all data is explicitly copie=
d with transfer
> commands.
[Kasireddy, Vivek] My understanding of virtio-gpu and the concept of resour=
ces is still
fairly limited but are blob resources really needed for non-Virgl use-cases=
 -- other than
something like a dmabuf/scanout blob that shares the meta-data such as modi=
fer? I
thought the main motivation for blob resources would be to avoid the explic=
it copy you
mentioned for Virgl workloads.=20

>=20
> Which implies quite a bit of work because we don't have blob resource sup=
port in qemu
> yet.
[Kasireddy, Vivek] I was scrubbing through old mailing list messages to und=
erstand the
motivation behind blob resources as to why they are needed and came across =
this:
https://gitlab.freedesktop.org/virgl/qemu/-/commits/virtio-gpu-next

Does your work above not count for anything?

>=20
> > - Test with Virgil rendered BOs to see if this can be used in that case=
..
>=20
> That also opens up the question how to go forward with virtio-gpu in gene=
ral.  The object
> hierarchy we have right now (skipping pci + vga variants for simplicity):
>=20
>   TYPE_VIRTIO_GPU_BASE (abstract base)
>    -> TYPE_VIRTIO_GPU (in-qemu implementation)
>    -> TYPE_VHOST_USER_GPU (vhost-user implementation)
>=20
> When compiled with opengl + virgl TYPE_VIRTIO_GPU has a virgl=3Don/off pr=
operty.
> Having a single device is not ideal for modular builds.
> because the hw-display-virtio-gpu.so module has a dependency on ui-opengl=
.so so that is
> needed (due to symbol references) even for the virgl=3Doff case.  Also th=
e code is a bit of a
> #ifdef mess.
>=20
> I think we should split TYPE_VIRTIO_GPU into two devices.  Remove
> virgl+opengl support from TYPE_VIRTIO_GPU.  Add a new
> TYPE_VIRTIO_GPU_VIRGL, with either TYPE_VIRTIO_GPU or
> TYPE_VIRTIO_GPU_BASE as parent (not sure which is easier), have all openg=
l/virgl
> support code there.
>=20
> I think when using opengl it makes sense to also require virgl, so we can=
 use the
> virglrenderer library to manage blob resources (even when the actual rend=
ering isn't done
> with virgl).  Also reduces the complexity and test matrix.
[Kasireddy, Vivek] When you say "using opengl" are you referring to the pre=
sentation of
the rendered buffer via dmabuf or pixman? If yes, I am not sure why this wo=
uld need to
depend on Virgl. For our use-case(s) where we are using virtio-gpu in buffe=
r sharing mode,
we'd still need opengl for submitting the dmabuf to UI, IIUC.

>=20
> Maybe it even makes sense to deprecate in-qemu virgl support and focus ex=
clusively on
> the vhost-user implementation, so we don't have to duplicate all work for=
 both
> implementations.
[Kasireddy, Vivek] Is the vhost-user implementation better in terms of perf=
ormance, generally?=20

> > case, how do we make sure that Weston and Qemu UI are not using the sam=
e buffer at
> any given time?
>=20
> There is graphic_hw_gl_block + graphic_hw_gl_flushed for syncronization.
> Right now this is only wired up in spice, and it is rather simple (just s=
talls virgl rendering
> instead of providing per-buffer syncronization).
[Kasireddy, Vivek] I guess that might work for Virgl rendering but not for =
our use-case. What
we need is a way to tell if the previously submitted dmabuf has been consum=
ed by the Host=20
compositor or not before we release/close it. Weston (wl_buffer.release eve=
nt and fences)=20
and EGL (sync and fences) do provide few options but I am not sure if GTK l=
ets us use
any of those or not. Any recommendations? EGLSync objects?

On a different note, any particular reason why Qemu UI EGL implementation i=
s limited to Xorg
and not extended to Wayland/Weston for which there is GTK glarea?

Thanks,
Vivek

>=20
> take care,
>   Gerd


