Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1FFF3B20D3
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 21:12:22 +0200 (CEST)
Received: from localhost ([::1]:41784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw8IO-0005N7-VT
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 15:12:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lw8HY-0004hC-KU
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 15:11:28 -0400
Received: from mga01.intel.com ([192.55.52.88]:25751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lw8HW-0005w1-5K
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 15:11:27 -0400
IronPort-SDR: tQuIxBfmUd8awKqYotbjWuKz0xvFebFav/h6DKWG/QZqB4x1P89e1bzxJwLvJVo3sI7NGAXSE/
 sP6fBaSAkhig==
X-IronPort-AV: E=McAfee;i="6200,9189,10024"; a="228907440"
X-IronPort-AV: E=Sophos;i="5.83,294,1616482800"; d="scan'208";a="228907440"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2021 12:11:19 -0700
IronPort-SDR: BPcXt1ZCk/y9pDo++ufaRcvgfF0Qcuj+43h6wTDBdXgU+tXpZMQh8jGCXgt4MIB39O4R8KcBwl
 QMCww9pcUNzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,294,1616482800"; d="scan'208";a="487442504"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga001.jf.intel.com with ESMTP; 23 Jun 2021 12:11:18 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Wed, 23 Jun 2021 12:11:18 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Wed, 23 Jun 2021 12:11:17 -0700
Received: from orsmsx611.amr.corp.intel.com ([10.22.229.24]) by
 ORSMSX611.amr.corp.intel.com ([10.22.229.24]) with mapi id 15.01.2242.008;
 Wed, 23 Jun 2021 12:11:17 -0700
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: RE: [PATCH v3 3/5] ui: Create sync objects and fences only for blobs
Thread-Topic: [PATCH v3 3/5] ui: Create sync objects and fences only for blobs
Thread-Index: AQHXZtTYJy9EF+mm+EOgPYQ+xcZiwqsht3mAgABALFA=
Date: Wed, 23 Jun 2021 19:11:17 +0000
Message-ID: <2b7a5e50d754416fba8fc271054b0db1@intel.com>
References: <20210621192425.1188442-1-vivek.kasireddy@intel.com>
 <20210621192425.1188442-4-vivek.kasireddy@intel.com>
 <20210623081515.ezdchomanr73wrp5@sirius.home.kraxel.org>
In-Reply-To: <20210623081515.ezdchomanr73wrp5@sirius.home.kraxel.org>
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

>   Hi,
>=20
> >      dmabuf->buf.fd =3D res->dmabuf_fd;
> > +    dmabuf->buf.blob =3D true;
>=20
> Do you actually need the 'blob' field?
> I think checking 'fd' instead should work too.
[Kasireddy, Vivek] I want these changes to be limited to blob resources onl=
y as I do not
know how they might affect other use-cases or whether they are needed there=
 or not. I
don't think I can rely on fd as vfio/display.c also populates the fd field:
    dmabuf =3D g_new0(VFIODMABuf, 1);
    dmabuf->dmabuf_id  =3D plane.dmabuf_id;
    dmabuf->buf.width  =3D plane.width;
    dmabuf->buf.height =3D plane.height;
    dmabuf->buf.stride =3D plane.stride;
    dmabuf->buf.fourcc =3D plane.drm_format;
    dmabuf->buf.modifier =3D plane.drm_format_mod;
    dmabuf->buf.fd     =3D fd;

Therefore, I need a way to identify a dmabuf that is associated with blobs =
vs others.

Thanks,
Vivek

