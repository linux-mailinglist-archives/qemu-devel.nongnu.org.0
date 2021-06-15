Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1478A3A8C47
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 01:12:35 +0200 (CEST)
Received: from localhost ([::1]:60836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltIET-0002yN-Lo
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 19:12:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1ltIDR-0002Al-26
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 19:11:29 -0400
Received: from mga01.intel.com ([192.55.52.88]:16459)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1ltIDN-0002Tc-BO
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 19:11:28 -0400
IronPort-SDR: q1km3NIbhVuJE4tmKci/dz3c8sQyA9D1H7UUSTJ8faeFEC6kHxWHXcAERNJUBVDFpWKTUKfctC
 3c/XnjRbtjsQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10016"; a="227568223"
X-IronPort-AV: E=Sophos;i="5.83,276,1616482800"; d="scan'208";a="227568223"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2021 16:11:10 -0700
IronPort-SDR: aHkezY/yrYT3VMUo27RJPFGuyU5w3IPzeoqPZYKbjOBgNe39v7IXCDUcV4yErTJngZAbD4Vwdz
 Eb8HEe5bDseA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,276,1616482800"; d="scan'208";a="484647210"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by orsmga001.jf.intel.com with ESMTP; 15 Jun 2021 16:11:09 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Tue, 15 Jun 2021 16:11:09 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Tue, 15 Jun 2021 16:11:09 -0700
Received: from orsmsx611.amr.corp.intel.com ([10.22.229.24]) by
 ORSMSX611.amr.corp.intel.com ([10.22.229.24]) with mapi id 15.01.2242.008;
 Tue, 15 Jun 2021 16:11:08 -0700
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: RE: [PATCH v2 2/8] ui/egl: Add egl helpers to help with
 synchronization
Thread-Topic: [PATCH v2 2/8] ui/egl: Add egl helpers to help with
 synchronization
Thread-Index: AQHXXkx/Ksv5L5BLwUCI5tlrR51wk6sVCDyAgACxo5A=
Date: Tue, 15 Jun 2021 23:11:08 +0000
Message-ID: <ea7e97778bfb4a2388b800fdb4f3ef0f@intel.com>
References: <20210610224837.670192-1-vivek.kasireddy@intel.com>
 <20210610224837.670192-3-vivek.kasireddy@intel.com>
 <20210615053151.ucxtisr5ujlsnv2g@sirius.home.kraxel.org>
In-Reply-To: <20210615053151.ucxtisr5ujlsnv2g@sirius.home.kraxel.org>
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
Received-SPF: pass client-ip=192.55.52.88;
 envelope-from=vivek.kasireddy@intel.com; helo=mga01.intel.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
> > +void egl_dmabuf_create_fence(QemuDmaBuf *dmabuf)
> > +{
> > +    if (dmabuf->sync) {
> > +        dmabuf->fence_fd =3D eglDupNativeFenceFDANDROID(qemu_egl_displ=
ay,
> > +                                                      dmabuf->sync);
> > +        eglDestroySyncKHR(qemu_egl_display, dmabuf->sync);
> > +        dmabuf->sync =3D NULL;
> > +    }
> > +}
>=20
> > +void egl_dmabuf_wait_sync(QemuDmaBuf *dmabuf)
> > +{
>=20
> Hmm, still the blocking wait.  Can't you do something like
[Kasireddy, Vivek] Right, it is a blocking wait; but this gets called from =
a new GTK thread
that does the actual drawing.=20

> "qemu_set_fd_handler(dmabuf->fence_fd, ...)" to avoid the
> eglClientWaitSyncKHR() completely?
[Kasireddy, Vivek] Yeah, I think this is also doable; let me look into it.

Thanks,
Vivek
>=20
> take care,
>   Gerd


