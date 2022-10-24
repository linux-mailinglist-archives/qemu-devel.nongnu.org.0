Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4863760B1B9
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 18:34:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omzNz-0007GN-Os; Mon, 24 Oct 2022 11:29:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Clay.Mayers@kioxia.com>)
 id 1omzNy-0007GC-4G
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 11:29:06 -0400
Received: from usmailhost21.kioxia.com ([12.0.68.226]
 helo=SJSMAIL01.us.kioxia.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <Clay.Mayers@kioxia.com>)
 id 1omzNw-0000g0-3Q
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 11:29:05 -0400
Received: from SJSMAIL01.us.kioxia.com (10.90.133.90) by
 SJSMAIL01.us.kioxia.com (10.90.133.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.32; Mon, 24 Oct 2022 08:22:57 -0700
Received: from SJSMAIL01.us.kioxia.com ([::1]) by SJSMAIL01.us.kioxia.com
 ([fe80::213a:a308:b836:4a06%3]) with mapi id 15.01.2375.032; Mon, 24 Oct 2022
 08:22:57 -0700
From: Clay Mayers <Clay.Mayers@kioxia.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>, "Fam
 Zheng" <fam@euphon.net>, =?iso-8859-1?Q?Phlippe_Mathieu-Daud=E9?=
 <f4bug@amsat.org>, Dmitry Fomichev <dmitry.fomichev@wdc.com>
Subject: RE: [PATCH V2 0/4] hw/block/nvme: Implement ZNS finish-zone ZDC AEN
Thread-Topic: [PATCH V2 0/4] hw/block/nvme: Implement ZNS finish-zone ZDC AEN
Thread-Index: AQHY5aY4pNtOdbFOA0uMGvVaZoR3h64drOQg
Date: Mon, 24 Oct 2022 15:22:57 +0000
Message-ID: <7bedb8d5019f49db8b2102badfdac821@kioxia.com>
References: <20221021231038.1042659-1-clay.mayers@kioxia.com>
In-Reply-To: <20221021231038.1042659-1-clay.mayers@kioxia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.93.77.43]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Received-SPF: pass client-ip=12.0.68.226; envelope-from=Clay.Mayers@kioxia.com;
 helo=SJSMAIL01.us.kioxia.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

> From:  clay.mayers@kioxia.com
> Sent: Friday, October 21, 2022 4:11 PM
> To: qemu-devel@nongnu.org
> Cc: Keith Busch <kbusch@kernel.org>; Klaus Jensen <its@irrelevant.dk>; Fa=
m
> Zheng <fam@euphon.net>; Phlippe Mathieu-Daud=E9 <f4bug@amsat.org>
> Subject: [PATCH V2 0/4] hw/block/nvme: Implement ZNS finish-zone ZDC AEN
>=20
> From: Clay Mayers <clay.mayers@kioxia.com>
>=20
> ZNS controllers have the option to limit the time a zone can remain in
> the active state.  It begins with a background process in the controller
> setting the finish-zone-recommended FZR attribute for a zone.  As part of
> setting this attribute, the zone's id is added to the namespace's
> zone-descriptor-changed (ZDC) log page. If enabled, items added to the
> ZDC log page generate a ZDC "asynchronous event notification" AEN.
> Optionally,
> the control can induce a "zone excursion" forcing the zone into the finis=
hed
> state that also generates a ZDC event.
>=20
> Zone enabled applications need to properly handle ZDC events. In a real
> device,
> the timeout is many hours making testing an application difficult.
> Implemented is the generation of FZR ZDC events to speed up O/S and
> application
> testing.
>=20
> Added to the zoned NVMe command set is an optional, per-namespace timer
> (zoned.finish_time) to set the FZR attr for long-lived active zones; A pe=
r
> namespace ZDC log page; AEN results to including CQE.DW1 (the NSID of the
> ZDC
> AEN) and generating a ZDC AEN if it's been enabled. Zone excursions are n=
ot
> modeled.
>=20
> See section 5.5 of the NVMe Zoned Namespace Command Set Specification
> v1.1
> for more details.
>=20
> Changes since v1
> - Fixed offset length checking in zdc log page
> - Moved zdc_event_queued to the patch 4
> - Unwatched zdc events in nvme_exit()
>=20
> Clay Mayers (4):
>   hw/block/nvme: add ZONE_FINISH_RECOMMENDED functionality
>   hw/block/nvme: add zone descriptor changed log page
>   hw/block/nvme: supply dw1 for aen result
>   hw/block/nvme: add zone descriptor changed AEN
>=20
>  docs/system/devices/nvme.rst |   5 +
>  hw/nvme/ctrl.c               | 174 +++++++++++++++++++++++++++++++++--
>  hw/nvme/ns.c                 |  15 +++
>  hw/nvme/nvme.h               |  37 +++++++-
>  hw/nvme/trace-events         |   3 +-
>  include/block/nvme.h         |  14 ++-
>  6 files changed, 233 insertions(+), 15 deletions(-)
>=20
> --
> 2.27.0

I forgot to add Dmitry to the CC list for v2

