Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7641A389DD8
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 08:25:45 +0200 (CEST)
Received: from localhost ([::1]:47758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljc7r-0008F4-W8
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 02:25:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1ljc6O-0007Q4-N3
 for qemu-devel@nongnu.org; Thu, 20 May 2021 02:24:12 -0400
Received: from mga04.intel.com ([192.55.52.120]:54486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1ljc6L-000665-8h
 for qemu-devel@nongnu.org; Thu, 20 May 2021 02:24:11 -0400
IronPort-SDR: 1RsavCiG23B0bobTz7M+yWsYffggLfgngSvnyfBjX2O2I49ErrfTQsVTUzHbcffGEukYnqcXeB
 0iWGas08Z8kA==
X-IronPort-AV: E=McAfee;i="6200,9189,9989"; a="199203043"
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; d="scan'208";a="199203043"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2021 23:24:00 -0700
IronPort-SDR: w97zMF2yoQATUYKqvi6uMLt6EMmRDlnbb2akSVYM+EOEIfk6Ve+DEeXtJJmg8oy4ZIUs+XvBWR
 CLnGSz/7IY8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; d="scan'208";a="631286377"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by fmsmga005.fm.intel.com with ESMTP; 19 May 2021 23:24:00 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Wed, 19 May 2021 23:23:59 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Wed, 19 May 2021 23:23:58 -0700
Received: from orsmsx611.amr.corp.intel.com ([10.22.229.24]) by
 ORSMSX611.amr.corp.intel.com ([10.22.229.24]) with mapi id 15.01.2242.008;
 Wed, 19 May 2021 23:23:58 -0700
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: RE: [PATCH v5 03/13] virtio-gpu: Add udmabuf helpers
Thread-Topic: [PATCH v5 03/13] virtio-gpu: Add udmabuf helpers
Thread-Index: AQHXTEWkoA54FN3boUiBxzpmEs7P9KrqyQWAgAEVuLA=
Date: Thu, 20 May 2021 06:23:58 +0000
Message-ID: <957d144a53ed4549944cbb09fdffe2cb@intel.com>
References: <20210519001414.786439-1-vivek.kasireddy@intel.com>
 <20210519001414.786439-4-vivek.kasireddy@intel.com>
 <20210519061339.dq4yfrc7j42jdj5g@sirius.home.kraxel.org>
In-Reply-To: <20210519061339.dq4yfrc7j42jdj5g@sirius.home.kraxel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.5.1.3
dlp-reaction: no-action
x-originating-ip: [10.1.200.100]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Received-SPF: pass client-ip=192.55.52.120;
 envelope-from=vivek.kasireddy@intel.com; helo=mga04.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Gerd,
=20
> > +#ifdef CONFIG_LINUX
>=20
> > +void virtio_gpu_init_udmabuf(struct virtio_gpu_simple_resource *res)
>=20
> > +#else
>=20
> > +void *virtio_gpu_init_udmabuf(struct virtio_gpu_simple_resource *res)
> > +{
> > +    /* nothing (stub) */
> > +    return NULL
> > +}
>=20
> Fails to build for !linux ...
>=20
> You can place the stubs in a file in the stubs/ directory instead.
> They'll be used via weak symbol references instead of #ifdefs then.
[Kasireddy, Vivek] Will do; should I send the whole series (v6) again with =
this and the
other error in patch #10 fixed or just the fixed versions of these specific=
 patches?

Sorry for the tangential discussion...
On a completely different topic, I wanted to ask a question on behalf of a =
colleague who
is trying to enable passthrough with virtio-gpu but for a Windows guest. It=
 appears the
guest boots only if we specify the option -vga virtio (not sure what happen=
s with virtio=3Dstd)
as Windows launches a "Microsoft Basic Display Adapter" driver for this VGA=
 device=20
and Qemu displays the Desktop for this device (via the calls in virtio-vga.=
c). However,
since we only care about virtio-gpu-pci device for which we created a guest=
 driver, we=20
want to have Qemu display the content/fb from virtio-gpu instead of the vga=
 device.=20
I see that in set_scanout:

g->parent_obj.enable =3D 1;
and, then this in virtio-vga.c:

static void virtio_vga_base_update_display(void *opaque)                   =
                                                                           =
                                                            VirtIOVGABase *=
vvga =3D opaque;                                                           =
                                                                           =
                                                VirtIOGPUBase *g =3D vvga->=
vgpu;                                                                      =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                      if (g->enable) {
    g->hw_ops->gfx_update(g);
} else {
    vvga->vga.hw_ops->gfx_update(&vvga->vga);
}

Since the parent_obj is different the above code is always going into the e=
lse part.=20
Is the goal here to show the content from virtio-gpu if there is a set_scan=
out?

The only way we are able to get everything to work as expected is to enable=
 our virtio-gpu
guest driver for the VGA device instead of the virtio-gpu PCI device. But w=
e are not sure
if this would be OK or not. We don't run into these issues for Linux guests=
 as we only=20
enable virtio-gpu-pci as we have -vga none. We'd like to the do the same fo=
r Windows
guests but it looks like it needs the VGA device to be available to boot. S=
o, our other
option (as we cannot disable the vga device) is to have Qemu accept content=
 only from=20
virtio-gpu-pci instead of virtio-vga. Would it make sense to do this? Do yo=
u think there
is a better way to do what we are trying to do?

Thanks,
Vivek


