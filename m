Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F9338F483
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 22:39:01 +0200 (CEST)
Received: from localhost ([::1]:42376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llHLo-0003IC-9r
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 16:39:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1llHKD-0001hU-O2
 for qemu-devel@nongnu.org; Mon, 24 May 2021 16:37:21 -0400
Received: from mga03.intel.com ([134.134.136.65]:16522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1llHKA-0002DR-T0
 for qemu-devel@nongnu.org; Mon, 24 May 2021 16:37:21 -0400
IronPort-SDR: QsJ6x+jX/5n7fNWPtTpNi43tIpsmgQr58BYyVUF9J1Ld1QnIrKvtLWxVYIzsg8Fg5Amuyzved5
 i8MjGvGh5s5w==
X-IronPort-AV: E=McAfee;i="6200,9189,9994"; a="202067824"
X-IronPort-AV: E=Sophos;i="5.82,325,1613462400"; d="scan'208";a="202067824"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2021 13:37:06 -0700
IronPort-SDR: H1jVGbNX36dC2TFXLo+3OBnC/GBQx55Rqp/N4K+TQkFhGbbAJq+0N/bcQJJTnfkA+VGanqvMX5
 Wrt3+BPyYfiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,325,1613462400"; d="scan'208";a="632768875"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by fmsmga005.fm.intel.com with ESMTP; 24 May 2021 13:37:05 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Mon, 24 May 2021 13:37:05 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Mon, 24 May 2021 13:37:04 -0700
Received: from orsmsx611.amr.corp.intel.com ([10.22.229.24]) by
 ORSMSX611.amr.corp.intel.com ([10.22.229.24]) with mapi id 15.01.2242.008;
 Mon, 24 May 2021 13:37:04 -0700
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: RE: [PATCH v5 03/13] virtio-gpu: Add udmabuf helpers
Thread-Topic: [PATCH v5 03/13] virtio-gpu: Add udmabuf helpers
Thread-Index: AQHXTEWkoA54FN3boUiBxzpmEs7P9KrqyQWAgAhS4+A=
Date: Mon, 24 May 2021 20:37:04 +0000
Message-ID: <3c23985ffb484236a3e29682585cc366@intel.com>
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
Received-SPF: pass client-ip=134.134.136.65;
 envelope-from=vivek.kasireddy@intel.com; helo=mga03.intel.com
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

>=20
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
>=20
> Advantage: the stubs are compiled unconditionally so errors like this
> don't go unnoticed that easily.
[Kasireddy, Vivek] Gave it a try but because of res->image, we'd need to co=
nsider the
Pixman dependency. I think we have the following options to address this:
1) Add pixman dependency to stubs. This may not be acceptable given that th=
e other
dependencies are glib, socket, etc which are pretty basic.
2) Cast the objects (such as virtio_gpu_simple_resource) as void * to the f=
unctions that
we have stubs for. This also may not be acceptable as I don't see other stu=
bs doing this.
3) Move some core objects (such as VirtIOGPUBase and its dependencies that =
do not
deal with pixman) into a new header and include that in virtio-gpu.h and th=
e new stubs
file. This seems like the way to go but needs some work as virtio-gpu.h has=
 a lot of stuff
and is included in a lot of places. If it is not a problem, I can do this i=
n a small separate
series but keep the ifdef for this series?

Will send out a v6 for this series soon.

Thanks,
Vivek

>=20
> take care,
>   Gerd


