Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C636A5BA092
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Sep 2022 20:03:43 +0200 (CEST)
Received: from localhost ([::1]:55004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYtDC-0007hJ-08
	for lists+qemu-devel@lfdr.de; Thu, 15 Sep 2022 14:03:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <t.zhang2@samsung.com>)
 id 1oYt8y-0004na-9H; Thu, 15 Sep 2022 13:59:20 -0400
Received: from mailout2.w2.samsung.com ([211.189.100.12]:12327)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <t.zhang2@samsung.com>)
 id 1oYt8v-0000vs-RA; Thu, 15 Sep 2022 13:59:19 -0400
Received: from uscas1p1.samsung.com (unknown [182.198.245.206])
 by mailout2.w2.samsung.com (KnoxPortal) with ESMTP id
 20220915175906usoutp0234a6daf1d45605646457e4e1d0a4f410~VGnltQwgT2964229642usoutp02J;
 Thu, 15 Sep 2022 17:59:06 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w2.samsung.com
 20220915175906usoutp0234a6daf1d45605646457e4e1d0a4f410~VGnltQwgT2964229642usoutp02J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1663264746;
 bh=24mldY0PCcXqT5qVgqmgcl3UHVvw8VlXjSTF6WT9nDk=;
 h=From:To:CC:Subject:Date:References:From;
 b=nWe8JREZTTxwb72BE1wPJv3hEJ+5/PX/1kElmJpLHmJmHugOEyz+zTdynMTwBmAQa
 lOD2BeuLPFWhStr7/fGaW3XVELAy1jd3R0quNitPHz1NKQVRWx61iKENVv6xkYiw5A
 EpEt4DK/jx9HMrWEHbT97ZMfjewr0PAe3cJpjt7U=
Received: from ussmges2new.samsung.com (u111.gpu85.samsung.co.kr
 [203.254.195.111]) by uscas1p1.samsung.com (KnoxPortal) with ESMTP id
 20220915175906uscas1p1b3338e62653f57a0cbcce3055ea3b8db~VGnlhHAye1009410094uscas1p1l;
 Thu, 15 Sep 2022 17:59:06 +0000 (GMT)
Received: from uscas1p2.samsung.com ( [182.198.245.207]) by
 ussmges2new.samsung.com (USCPEMTA) with SMTP id A7.40.18126.9E763236; Thu,
 15 Sep 2022 13:59:05 -0400 (EDT)
Received: from ussmgxs1new.samsung.com (u89.gpu85.samsung.co.kr
 [203.254.195.89]) by uscas1p1.samsung.com (KnoxPortal) with ESMTP id
 20220915175905uscas1p122c0408beff433071df5df348553be22~VGnlOciXi2171821718uscas1p1G;
 Thu, 15 Sep 2022 17:59:05 +0000 (GMT)
X-AuditID: cbfec36f-ff9ff700000146ce-0b-632367e9f4b8
Received: from SSI-EX2.ssi.samsung.com ( [105.128.2.145]) by
 ussmgxs1new.samsung.com (USCPEXMTA) with SMTP id 3D.B4.19363.9E763236; Thu,
 15 Sep 2022 13:59:05 -0400 (EDT)
Received: from SSI-EX2.ssi.samsung.com (105.128.2.227) by
 SSI-EX2.ssi.samsung.com (105.128.2.227) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.2375.24; Thu, 15 Sep 2022 10:59:04 -0700
Received: from SSI-EX2.ssi.samsung.com ([105.128.2.227]) by
 SSI-EX2.ssi.samsung.com ([105.128.2.227]) with mapi id 15.01.2375.024; Thu,
 15 Sep 2022 10:59:04 -0700
From: Tong Zhang <t.zhang2@samsung.com>
To: Ben Widawsky <ben.widawsky@intel.com>, Jonathan Cameron
 <jonathan.cameron@huawei.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: "ztong0001@gmail.com" <ztong0001@gmail.com>, "qemu-trivial@nongnu.org"
 <qemu-trivial@nongnu.org>, Tong Zhang <t.zhang2@samsung.com>
Subject: [PATCH] mem/cxl_type3: fix GPF DVSEC
Thread-Topic: [PATCH] mem/cxl_type3: fix GPF DVSEC
Thread-Index: AQHYySzYu7wI4rSEKUmzQ9Q4nFspbg==
Date: Thu, 15 Sep 2022 17:59:04 +0000
Message-ID: <20220915175853.2902-1-t.zhang2@samsung.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [105.128.2.176]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprCKsWRmVeSWpSXmKPExsWy7djX87ov05WTDU6cNrfoetbPbLFq4TU2
 i+O9O1gs1p6Zy2px8tV5NgdWj52z7rJ7tBx5y+qxeM9LJo8n1zYzBbBEcdmkpOZklqUW6dsl
 cGWc7GpmLZjOVjH12gamBsYjLF2MnBwSAiYS87qXsHYxcnEICaxklHi58h8LhNPKJPHhWQMr
 TNXO/11MEIm1jEDOGijnE6PEw87FUP3LGCWOXf7BDtLCJqAu8atzERtIQkSgj1Hi98aDzCAO
 s0Ano8S+JzvBBgsL6EocuLABzBYRMJI4vXMRE4StJzHx2mGwE1kEVCUeLTwCVsMrYCEx7eQC
 sBpGATGJ76fWgNnMAuISt57MZ4I4VlBi0ew9zBC2mMS/XQ/ZIGxFifvfX7JD1OtJ3Jg6hQ3C
 1pZYtvA1M8R8QYmTM59Ag0ZS4uCKG+DQkBCYySEx/+UFoAYOIMdFYt8kJYgaaYmr16dC7aqX
 mHnrByNEfQ+jxJoj69khEtYSv47ugVrMJ/H31yNGiDm8Eh1tQhMYlWYheWEWkvNmITlvFpLz
 FjCyrGIULy0uzk1PLTbKSy3XK07MLS7NS9dLzs/dxAhMOKf/Hc7fwXj91ke9Q4xMHIyHGCU4
 mJVEePtCFJKFeFMSK6tSi/Lji0pzUosPMUpzsCiJ8y7L3JAoJJCeWJKanZpakFoEk2Xi4JRq
 YPL4sTVsynHVNucbO3e3T/hZoL/vqFdjNPe/61e0i66syuF1KXiXdulmg2TO3o/GmvwXHxu8
 KosQdduZcXMDb3383vlZ90Orc9jjDV37fLbkKZp+mrvufpdPDOs61ykmLUePx1l0T8458/f7
 qWldeWvf3fA5eet//cze437lC3akJznFL2zv4Fj6rfKP/lYfxorAwIcvePfudJNYdfvP6mKV
 mwfSI1jWdbpzBm0wcH53wKVp3tmylRN6jOwjjq4y3hk5saZPKVJXQkjhGbvcitvBZ/yiW0NN
 dy75+HRbRMQWoTdXW4QKsiZOOCHCeONeu/Iu6+QrE/kWcAd4qr7jm+z0gYF5Ul9Dp5F/ic6B
 SUosxRmJhlrMRcWJAL4TFO6nAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuplkeLIzCtJLcpLzFFi42LJbGCaqPsyXTnZ4MFGFYuuZ/3MFqsWXmOz
 ON67g8Vi7Zm5rBYnX51nc2D12DnrLrtHy5G3rB6L97xk8nhybTNTAEsUl01Kak5mWWqRvl0C
 V8bJrmbWgulsFVOvbWBqYDzC0sXIySEhYCKx838XE4gtJLCaUeLlavUuRi4g+xOjxJclbUwQ
 zjJGiW2H1zKDVLEJqEv86lzEBpIQEehjlPi98SAziMMs0Mkose/JTlaQKmEBXYkDFzaA2SIC
 RhKndy5igrD1JCZeOwy2m0VAVeLRwiNgNbwCFhLTTi4Aq2EUEJP4fmoNmM0sIC5x68l8Johb
 BSSW7DnPDGGLSrx8/I8VwlaUuP/9JTtEvZ7EjalT2CBsbYllC18zQ8wXlDg58wnUz5ISB1fc
 YJnAKDoLyYpZSNpnIWmfhaR9ASPLKkbx0uLi3PSKYsO81HK94sTc4tK8dL3k/NxNjMAYO/3v
 cOQOxqO3PuodYmTiYDzEKMHBrCTC2xeikCzEm5JYWZValB9fVJqTWnyIUZqDRUmcV8h1YryQ
 QHpiSWp2ampBahFMlomDU6qBibt+6RNGrqh5JqdZ4pedjuz55LOa0W7mrLdTVDZN0fWRbi5Z
 NDUn2vOA5/FXH7uPaT39k2BQfZp95vuCnGeN069aiNxeoMqw/RVXyeoJ/4Qadv5eV2OtsktC
 w7no7sRHXaG8m/oF7CIvbw3j7tn4kV+r3vNSolv87HyJA2v/fd6wOPlAsOuxoyLrczUrH501
 36U2V3OBvUcnpx6b7uz0aXOurw1syY2MZiwW+GWs+1w2UFrvq1F0h3ZpemHExksTmsRbtK6F
 XHe0dd0379qFzW3hbK+f+PVYX4jK3qSQmpharmqqv9ix5FG5taBZ2Kf1LqVKG5VZs3WuXnhx
 8pTNunWTD96aJ5xotOdj+mkZJZbijERDLeai4kQAggOe9SADAAA=
X-CMS-MailID: 20220915175905uscas1p122c0408beff433071df5df348553be22
CMS-TYPE: 301P
X-CMS-RootMailID: 20220915175905uscas1p122c0408beff433071df5df348553be22
References: <CGME20220915175905uscas1p122c0408beff433071df5df348553be22@uscas1p1.samsung.com>
Received-SPF: pass client-ip=211.189.100.12; envelope-from=t.zhang2@samsung.com;
 helo=mailout2.w2.samsung.com
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The structure is for device dvsec not port dvsec. Change type to fix
this issue.

Signed-off-by: Tong Zhang <t.zhang2@samsung.com>
---
 hw/mem/cxl_type3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/mem/cxl_type3.c b/hw/mem/cxl_type3.c
index 3bf2869573..ada2108fac 100644
--- a/hw/mem/cxl_type3.c
+++ b/hw/mem/cxl_type3.c
@@ -49,7 +49,7 @@ static void build_dvsecs(CXLType3Dev *ct3d)
         .phase2_power =3D 0x33, /* 0x33 miliwatts */
     };
     cxl_component_create_dvsec(cxl_cstate, CXL2_TYPE3_DEVICE,
-                               GPF_DEVICE_DVSEC_LENGTH, GPF_PORT_DVSEC,
+                               GPF_DEVICE_DVSEC_LENGTH, GPF_DEVICE_DVSEC,
                                GPF_DEVICE_DVSEC_REVID, dvsec);
 }
=20
--=20
2.25.1

