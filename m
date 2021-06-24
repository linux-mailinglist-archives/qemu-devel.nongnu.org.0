Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 976323B35DB
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 20:36:46 +0200 (CEST)
Received: from localhost ([::1]:32928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwUDV-0007Zv-4A
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 14:36:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lwUBf-0006hI-UU
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 14:34:51 -0400
Received: from mga18.intel.com ([134.134.136.126]:57507)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lwUBd-0002JO-3G
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 14:34:51 -0400
IronPort-SDR: +BPmOGC5foM6ufznJ8CzTxPiq1JV2lRaB0cev2PRliBcaD3EHp7ddKTKwpZ4XpIs91whXpn+TN
 AreJG/eeFDPA==
X-IronPort-AV: E=McAfee;i="6200,9189,10025"; a="194833927"
X-IronPort-AV: E=Sophos;i="5.83,296,1616482800"; d="scan'208";a="194833927"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2021 11:34:41 -0700
IronPort-SDR: qpDs6IW7/S/1b9bsAf5CeqSAwk5iOpASnmM5JlnNb12dNqwW2YzZ+QbFNJ8MEqu/2QkLJ4xoG3
 RN0K7qdw9g8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,296,1616482800"; d="scan'208";a="487874356"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by orsmga001.jf.intel.com with ESMTP; 24 Jun 2021 11:34:41 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Thu, 24 Jun 2021 11:34:41 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Thu, 24 Jun 2021 11:34:40 -0700
Received: from orsmsx611.amr.corp.intel.com ([10.22.229.24]) by
 ORSMSX611.amr.corp.intel.com ([10.22.229.24]) with mapi id 15.01.2242.008;
 Thu, 24 Jun 2021 11:34:40 -0700
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: RE: [PATCH v3 3/5] ui: Create sync objects and fences only for blobs
Thread-Topic: [PATCH v3 3/5] ui: Create sync objects and fences only for blobs
Thread-Index: AQHXZtTYJy9EF+mm+EOgPYQ+xcZiwqsht3mAgABALFCAAVjlgIAALCwA
Date: Thu, 24 Jun 2021 18:34:40 +0000
Message-ID: <9177ff8bd70a40c184e76ed7b2942842@intel.com>
References: <20210621192425.1188442-1-vivek.kasireddy@intel.com>
 <20210621192425.1188442-4-vivek.kasireddy@intel.com>
 <20210623081515.ezdchomanr73wrp5@sirius.home.kraxel.org>
 <2b7a5e50d754416fba8fc271054b0db1@intel.com>
 <20210624083921.5ciwcykojkb2fey6@sirius.home.kraxel.org>
In-Reply-To: <20210624083921.5ciwcykojkb2fey6@sirius.home.kraxel.org>
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
Received-SPF: pass client-ip=134.134.136.126;
 envelope-from=vivek.kasireddy@intel.com; helo=mga18.intel.com
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

> > >
> > > >      dmabuf->buf.fd =3D res->dmabuf_fd;
> > > > +    dmabuf->buf.blob =3D true;
> > >
> > > Do you actually need the 'blob' field?
> > > I think checking 'fd' instead should work too.
> > [Kasireddy, Vivek] I want these changes to be limited to blob resources=
 only as I do not
> > know how they might affect other use-cases or whether they are needed t=
here or not. I
> > don't think I can rely on fd as vfio/display.c also populates the fd fi=
eld:
> >     dmabuf =3D g_new0(VFIODMABuf, 1);
> >     dmabuf->dmabuf_id  =3D plane.dmabuf_id;
> >     dmabuf->buf.width  =3D plane.width;
> >     dmabuf->buf.height =3D plane.height;
> >     dmabuf->buf.stride =3D plane.stride;
> >     dmabuf->buf.fourcc =3D plane.drm_format;
> >     dmabuf->buf.modifier =3D plane.drm_format_mod;
> >     dmabuf->buf.fd     =3D fd;
> >
> > Therefore, I need a way to identify a dmabuf that is associated with bl=
obs vs others.
>=20
> And it actually is a dma-buf too (the guest display provided by i915 gvt
> mdev driver).  So fencing that should work, right?
[Kasireddy, Vivek] Well, for virtio-gpu, as you know we are adding a dma fe=
nce to
resource_flush to make it wait until it gets signalled by Qemu. We might ha=
ve to do
to something similar on i915 GVT side but I do not have the hardware to wri=
te a patch
and test it out -- as i915 GVT is not supported for > Gen 9 platforms.

>=20
> Even if we have to restrict it to some kinds of dma-bufs the field
> should have a more descriptive name like "allow_fences".
[Kasireddy, Vivek] I think limiting this to blobs makes sense at the moment=
. If need be,
we can extend it to include dma-bufs generated by i915 GVT later. Let me se=
nd a
v4 with your suggestion to change the name.

Thanks,
Vivek
>=20
> take care,
>   Gerd


