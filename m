Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C86824860C9
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 07:58:45 +0100 (CET)
Received: from localhost ([::1]:49552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5MjU-0004Wi-BP
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 01:58:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1n5MYh-0001HD-1B
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 01:47:38 -0500
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:22644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1n5MYc-0003Tg-H7
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 01:47:33 -0500
Received: from pps.filterd (m0127837.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 205N5d7j019176;
 Wed, 5 Jan 2022 22:47:28 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=xTXUa0V5/w7nkUas7PxLZMYxnH++OqMtYi1YlrXD+tU=;
 b=x9Ly7IkIxhzDpWu1ITZKpBdFab25s8khIvuodSRlBTEc/1RoIfo2crxoQIJyyrlmUWgA
 w3kGQsKjyIo28HKrxvR5wAKmYFEFv9HhviTGMA0al6h3D5Acf/Z0l4DZwZZ1Kk9USQJe
 grl32U3WBuguCfCoTJJXr8zpalAtPMgATxKekvNbXlngbkRw0R91SiSWxOPONRGiI7ol
 U6+MqMHeNm/fYfWpptJzSj+SD0CmKZlg09SyTaxeaEI0LKS9v57XUkQELhEsylVKXTb6
 UI0ikfrxcxHLd/aBCzYRFDcS5olS6KHR4Q1chzFVSuVssN7NPavnVVcrRnlcRaTL4lQM uw== 
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam08lp2046.outbound.protection.outlook.com [104.47.74.46])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3ddmq00jfk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Jan 2022 22:47:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eQNtKlE4pc38WG+96z/Rs+0m/B+hDP/jCFh6E4BZ5YaiyYWedPQYGiyQuJNPf4ObVGI/DbTukBDMv4bYeptRsz/q2FyZO1u1UYaB+JAdbubckx/h9BCb3qIpdWwHL3gTELA2Dx6TkEzpD2IYq7LLMIt4yxbtqqSDXaAP7/yusNYoXDuaqlELDO8SFjkFPhJLrDclmRBzZMRk0sQyYyboFukYbkSgbO5VTtYTj2FBqXKq61HQ1nkggMm3xI+9UCL0jVCbwZLICFHcC38kiMtqDKGouJU0XYRrSZGnIiHgE853EMmDZBUxq85ERxKdBJCMzDrvO2glEQlpmWaiyuBN3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xTXUa0V5/w7nkUas7PxLZMYxnH++OqMtYi1YlrXD+tU=;
 b=csrFbbLFwIyTv34wAJ5Qqjsw625GixirubneXpPP/4X7NOzxTMIMwRRIRKCsK8Sfe8cUNRXSHJ9sNpt5n8KOZOhFw6FDOZTRHhV2r/deMTuC2Iq/H/8n94WGQUe0ZHEdGGFJX7Tn2lawAamFxzlN7PSLETLBNk6l1dSZbb4INUblXRWxV+63mt+TndZSGFrkiXIeXW0NVSdMUpFd4SRb3vJIK54vsCBMMj9IOU0Zehc1cchWtKuCdFbC+9yCQXX93KiBJ709FDwM8t/7vWIDSLorjA4glMl/7HeDOZYqAY36o6BdM7fIsSdqJ7X1npSM5wo8toVGhg0a33c78eroMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BL3PR02MB7938.namprd02.prod.outlook.com (2603:10b6:208:355::20)
 by BL0PR02MB6530.namprd02.prod.outlook.com (2603:10b6:208:1c1::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Thu, 6 Jan
 2022 06:47:26 +0000
Received: from BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::3c2f:b2dd:a0b5:74da]) by BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::3c2f:b2dd:a0b5:74da%6]) with mapi id 15.20.4867.009; Thu, 6 Jan 2022
 06:47:26 +0000
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: "stefanha@redhat.com" <stefanha@redhat.com>, "marcandre.lureau@redhat.com"
 <marcandre.lureau@redhat.com>, "mst@redhat.com" <mst@redhat.com>,
 "david@redhat.com" <david@redhat.com>
Subject: [PATCH v2 1/5] libvhost-user: Add vu_rem_mem_reg input validation
Thread-Topic: [PATCH v2 1/5] libvhost-user: Add vu_rem_mem_reg input validation
Thread-Index: AQHYAslEhQY8WRvwAEOt3/M7Uq9W0A==
Date: Thu, 6 Jan 2022 06:47:26 +0000
Message-ID: <20220106064717.7477-2-raphael.norwitz@nutanix.com>
References: <20220106064717.7477-1-raphael.norwitz@nutanix.com>
In-Reply-To: <20220106064717.7477-1-raphael.norwitz@nutanix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.20.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c7b8c46a-801f-417f-cf26-08d9d0e066cb
x-ms-traffictypediagnostic: BL0PR02MB6530:EE_
x-microsoft-antispam-prvs: <BL0PR02MB65305EAC968A83D766190168EA4C9@BL0PR02MB6530.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:346;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HSsmclzK6YUhI2bVLfi0HerXqa1Ogq3yUNSLS+K56PhELXy/5mIK64QJEqwC2E2zvNHG1cR4DM/D+A44Qxd9FGE/+rx7AsUCP/AjjrW2dUW4+tJsBrL616XxTd+3EWK82I522hvApu5WXYpLt3oO/HAIcIewl7VoKCDmOnKKLeT/sjHzM9lCGLvEC09QjSsOVtbL/aS684FVvmH0+ozggyrb9WekcA3CN7E8Y+mRW3ifDXud5tD8hhTsNtDbzM1jDu8+v0tpCkpkK1f9HU8ewVFQiVUPi4BNO5bWQKh99KizOzrrZSNEnrItSDp/WHizQNTbdbIWRjPkYy3BFBHTFVwUs6alydYSP+rGcWnLqfS0KdkpEHJxSqJ2FHk+gMwUwvTQDOJhamUGBsLlehhFIOFkL0DMHA6aEdYtjHwTNNfEVe1ZXSaFyXP/X2b0kSvbxQ7uZfqylWN6k57zUBahvVp0Qcznj5NujR7Mdu663X+NDVG35S9Vk55d/JZm2r1yOwI4Ugt8Swsckc5ktyU4Ud+N0JeHiMsqlB6lyOB3rVroLC3qyFauP+gwHX0sQASpN5cmQl4BR9c1p4riZriPXDQSu9uv6dBDZAvZv7NkYe3Pt3Weg7AYTijtW/YF0a3g1kyXwZ2KfC2mfW/AeVnKF/dMuRf5nfzqYVHSbuberASUNibZO8il9uTuY0Rg0H0YlCSHIqPaNJ9SRk8fIKNJ/Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR02MB7938.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6506007)(508600001)(66446008)(4326008)(76116006)(186003)(2906002)(316002)(4744005)(122000001)(6512007)(66476007)(71200400001)(66556008)(66946007)(5660300002)(91956017)(64756008)(54906003)(6486002)(38070700005)(110136005)(44832011)(36756003)(1076003)(2616005)(38100700002)(86362001)(107886003)(8676002)(26005)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?JN26IwEAQkPFkN4RqXfG8UKxqP8xhAx90Np2rtec4tLK89xMIVqVc+HPUy?=
 =?iso-8859-1?Q?CTh/yj/PGV9blF8oOR85DB5q+KII/uVRKOz9iZaToGtgBKGSAH36itK9mu?=
 =?iso-8859-1?Q?4a46TSlq6XAJjEetU0cwu5HhkUpgM3LgQT2eMtDJpbWrfxakW35VkexvFP?=
 =?iso-8859-1?Q?2tCPk6TQh9LU3CMSQzaB8WGerdxHU4zYd8XKPtte1qnnAvd4lBXJTKA4eO?=
 =?iso-8859-1?Q?M9WlM9TX8oE2IJjQOUHsGL7wWOUJf5Qct7dgf3yzYpjGsE9SSMKdrk/aaE?=
 =?iso-8859-1?Q?Qu0MeRetlEVS8UzrPH2rbar/s/KarZjJKvwzwuKFtYKHZiGUHUpfrE+1Ta?=
 =?iso-8859-1?Q?p3/TFi0PR4cCBmS8MdThL9EswK8/sglQhgYnm4a1X/ptKo44hBkhuMiLgx?=
 =?iso-8859-1?Q?RhgE8dv2ddoWPOlFX/6JiGjZeyRKcrQ+JsWrGEcstx0YaOOvuYS3eAiEYD?=
 =?iso-8859-1?Q?kdizlZH5S9MXrMGDnuK3jK5CSVdN7n0fT2qIb/9h8w7qBeUktykgOqOK8G?=
 =?iso-8859-1?Q?T4b7PRDQ9DHKAlN8E2Vskz1f+dz9K0yhvHBnsCvh2IRmnzZKHCeWEcxHO+?=
 =?iso-8859-1?Q?mxIAmguJ01eNvC0uIFqsVabJz4MY7Oyym+1sZvmNvKU8gc70Aol8KisFdQ?=
 =?iso-8859-1?Q?fMR+Aqh2hjqn4loKF62Xlw9ZzbDiaMdjjKDKzOOVAGbmyFH2wWO5x9wVxb?=
 =?iso-8859-1?Q?1XF+VpBRI83rR8Rp7bpTahfI/V/Q2runKWAz6FqVecMzkOF5x3MywVnyyt?=
 =?iso-8859-1?Q?gltPGDd1K7GhyVYKnzweGy9qZA6Whv/EaV8I4C026HmYGVg/zYFngcMbOR?=
 =?iso-8859-1?Q?c8npnv306echny3R3Ns1yrthe/ZxyJDRcYdOQd4pSEJuo5wfhtRhFcL/7Z?=
 =?iso-8859-1?Q?v0vgAe+5J0m17bV+s5nJu4k8Kw8HbpCkIWvkFJ54BblBIwHe5KK62fSp4m?=
 =?iso-8859-1?Q?mZKN+Q/FlxII8LrLRLKV+FEezXuPC+OsEI/445B4Ftj4F3UWNYdTgq4W3O?=
 =?iso-8859-1?Q?w8IR6DeC9H+c8eERmWzR3JHifs6peQkQAy655cjglADLqvDE9bgAcqcTK0?=
 =?iso-8859-1?Q?jzUO0OwF+Pl2e9H5zyX1i7hR84srI/VTfUe7f3nWC5fbXh8NcGQWMt0o73?=
 =?iso-8859-1?Q?7HOBsVRM/Ldi2tCtPB1bqnp4+eWOIRxXsaQiETd+kcNEI4dCVorDwJlW+f?=
 =?iso-8859-1?Q?b9qhsmHLQaqeguuAq5TukPrluDZ2AHQ110BVVBY7Ei94PRAd2NyUKyk0pI?=
 =?iso-8859-1?Q?Oc/mpnLNHHxJZAK04sEcm2zEjypLVD7lAAsMJ4rpRb0mk2tYhmW90+U+2p?=
 =?iso-8859-1?Q?vSjJ518c3Vke/u5w2d+TMmjuaLqdytXhHJKj5OrsJo71z/yo0i2hNwpIgE?=
 =?iso-8859-1?Q?PM3RdEhx0MlLHASf/MnTBk7Fu1J/j39aeOi13lzXpOO9gl7t3l5Prwyucm?=
 =?iso-8859-1?Q?0s8HgcnB0tmrKz3tss3gBk8JldIIqVKtubovyjR/W2QF0g4RleLAtW5iLC?=
 =?iso-8859-1?Q?yWB5daTITPoNk68M7zRpXhC5fbf0kD2ULc9y2zCpQzKxwkMlAEgYz6dqPh?=
 =?iso-8859-1?Q?W0djDrrVlk+OHCkISmqmRgHi8n5ga9xoIxWM2e7BlNdOA7mewaDQlxE5KC?=
 =?iso-8859-1?Q?CvV9JV5y7U3OaKbhJcTn2QPWBAHEMaZNoz6zwT2IZh15F/Xn7sb2KH1dKQ?=
 =?iso-8859-1?Q?QQ0P8qrlI309LtvXzuF/VVnwnwSVy/YsNkqJKwMkIoQo2px2+YXGvqRscU?=
 =?iso-8859-1?Q?rHkNT2EV1L+0peYtKLaZWrpFQ=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR02MB7938.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7b8c46a-801f-417f-cf26-08d9d0e066cb
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2022 06:47:26.5051 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T1zau8uPcYTkQa18MJUrfbSUJ9IAT3e4qHfxv9aHCp9KwZznGWZp5a3prkWFx9LmFjzVm38PtGOSNm1qYZRwDGEFCUu9FzNf4GtFEjuRlSQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB6530
X-Proofpoint-GUID: z-5gjyDMUx7eHETzrRY-M0IsQ1EYsqss
X-Proofpoint-ORIG-GUID: z-5gjyDMUx7eHETzrRY-M0IsQ1EYsqss
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-06_02,2022-01-04_01,2021-12-02_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=raphael.norwitz@nutanix.com; helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "raphael.s.norwitz@gmail.com" <raphael.s.norwitz@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
---
 subprojects/libvhost-user/libvhost-user.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvho=
st-user/libvhost-user.c
index 787f4d2d4f..a6dadeb637 100644
--- a/subprojects/libvhost-user/libvhost-user.c
+++ b/subprojects/libvhost-user/libvhost-user.c
@@ -801,6 +801,12 @@ vu_rem_mem_reg(VuDev *dev, VhostUserMsg *vmsg) {
     VuDevRegion shadow_regions[VHOST_USER_MAX_RAM_SLOTS] =3D {};
     VhostUserMemoryRegion m =3D vmsg->payload.memreg.region, *msg_region =
=3D &m;
=20
+    if (vmsg->fd_num !=3D 1 ||
+        vmsg->size !=3D sizeof(vmsg->payload.memreg)) {
+        vu_panic(dev, "VHOST_USER_REM_MEM_REG received multiple regions");
+        return false;
+    }
+
     DPRINT("Removing region:\n");
     DPRINT("    guest_phys_addr: 0x%016"PRIx64"\n",
            msg_region->guest_phys_addr);
--=20
2.20.1

