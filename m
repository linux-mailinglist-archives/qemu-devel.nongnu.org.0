Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B124900C5
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 05:21:54 +0100 (CET)
Received: from localhost ([::1]:35066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9JWj-00022l-Hs
	for lists+qemu-devel@lfdr.de; Sun, 16 Jan 2022 23:21:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1n9JO2-00076o-De
 for qemu-devel@nongnu.org; Sun, 16 Jan 2022 23:12:54 -0500
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:61404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1n9JNo-0003N3-K7
 for qemu-devel@nongnu.org; Sun, 16 Jan 2022 23:12:53 -0500
Received: from pps.filterd (m0127838.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20GKxQNx032449;
 Sun, 16 Jan 2022 20:12:37 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=NtM9o550nUP3yb93VP2RWhxfXwHcdlYOhpQg1QJie10=;
 b=YWxMM7JeUAPVVX9gaK1n1mP0LpbeOIAvMgmZmm1EQ66HVG7fEmFyIcNrcubHXbPGVRZA
 iYWnOlr5fSQ44MPATbE70xWC64ZPtDYLgMs/kGWZARQGD3ddQNrcolWRMe+xU/HKbNJq
 kfkci7lJAPG0NDD6w8iRlFTSWOJ/Kk+eBE5eXL5UTei+1YmcW4bDeNLYU+h0FvpQP7nW
 hNlotRPelVdGr19WZ6ryiO6RiSqaCOCPDllRCe5XhMt/w20cGa2TDg3HBo5B56aHGJFu
 wFNaLBQpf1tlSan8AR9cy9qxFak/8BDmb5F/qZ+Upnna3/Bxcdf6dYFDHebWFKtzNAmZ cQ== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2173.outbound.protection.outlook.com [104.47.58.173])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3dkxq1tagf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 16 Jan 2022 20:12:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y4IZXu4b2C/fuymeM9Pw2FGPreppn1c3lvgSuhSMfbxjqM/+tmQFhllGiDK8TGcoSDZIVnYAaNJwRIN9/bRMDLSosk4V1JgnQtKqlXUL/3hU6vPfJ67OL5lJR5PF6Rq5fgNQIzRWvIPjYyNGIq5DdGgHgZk+rF/7N7q1F7xxjPYiz5Hz/8re3SkEXxhz5Wlne/FPxRoXmiL9oOSy1nRHqIYoCjxPVrqEhFzTUNKrlbMUGAKap5qrSAvtd4fT2HE2SXQhmbS12IBkZd7K2OZUPBeORAYF+RSyhYErmtLh51FX+LUrz08EnkkveQUNk4fUdDmrO1iXPryk7RKI+/pijg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NtM9o550nUP3yb93VP2RWhxfXwHcdlYOhpQg1QJie10=;
 b=mEE26R7obC47whfVnDATfudltosSP76kPlMfngPaoRiFOZ7Wt7CXoLUa3aVnyAH1M59i8Wcd3FPoWLcwcoByJK64VSTrQhEDeFnK6aItowYoojBzUR+yCGM3mVuSbD/XzibuxLJb0sADFsaj2v5akbrdESo41CAm9/9OGwOSQBvtEpFoIVKPsh8ImnpjHDGyQR3EQN6bu05FkdTx9yXFEPsQ70bV0eKq6Zoy87wqMukjKdkhfay9LjmMEWi/SHK6PxG1tnuEvVGCk1Aa0KxNPTPZMgpX9iXYlwGgDBlcp1mPzSO69mdKPOXdmxSaWwNExGfcISLp6YK8T2DmRowHnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BL3PR02MB7938.namprd02.prod.outlook.com (2603:10b6:208:355::20)
 by BL3PR02MB8018.namprd02.prod.outlook.com (2603:10b6:208:359::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9; Mon, 17 Jan
 2022 04:12:35 +0000
Received: from BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::4ce1:59d7:578d:7e75]) by BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::4ce1:59d7:578d:7e75%5]) with mapi id 15.20.4888.013; Mon, 17 Jan 2022
 04:12:35 +0000
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: "stefanha@redhat.com" <stefanha@redhat.com>, "marcandre.lureau@redhat.com"
 <marcandre.lureau@redhat.com>, "mst@redhat.com" <mst@redhat.com>,
 "david@redhat.com" <david@redhat.com>
Subject: [PATCH v3 6/6] libvhost-user: handle removal of identical regions
Thread-Topic: [PATCH v3 6/6] libvhost-user: handle removal of identical regions
Thread-Index: AQHYC1h1GoOP5FV9bkuu4JxnCe3gIw==
Date: Mon, 17 Jan 2022 04:12:35 +0000
Message-ID: <20220117041050.19718-7-raphael.norwitz@nutanix.com>
References: <20220117041050.19718-1-raphael.norwitz@nutanix.com>
In-Reply-To: <20220117041050.19718-1-raphael.norwitz@nutanix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.20.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 584de1f3-3c89-4f3d-0475-08d9d96f97b5
x-ms-traffictypediagnostic: BL3PR02MB8018:EE_
x-microsoft-antispam-prvs: <BL3PR02MB80187E1053614BCEFF03824DEA579@BL3PR02MB8018.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: O68tfmaEAao3Jz7/sTwhvfLPDwmX+9DSf87VWEHZQNFeWRGLPY/qw1GKq4sK1Fm++mZ/2m3Eu1ASGUoZSybP/o9S10UXbbiuaBc0WEAqG6mja2u9sa3XpBxg9faoTxDkAvU2a9Jk4C3Pb5Kj9h/pnJytIdOyWlihXTh2yn1axS+UQbU6ev72TxGERW+CedoCIzQoMEPzThINsPgXpvj0eXbeFBppf5FqG2ViAvt9xZ0u04PgMhfcZYGQkOJHwlbxr9eyDun233ZxDACD4QVpvZMMY3/Gnl3/NpRR4LdwVdOu2/oYULqP06t/RCQcfZN036HWksAT3FM75LmaOIkb3az2KRrnc6BBTNoEekXRqb6gzatvpdjnnay+xSJK5KY39HeQ4jlc7CJD5OYXW5Aq1E4/OGqPPzgDTtoJvW/LdFqu4vW+o3FYshHIxFbsJV0I+zZBu6suBpkK6JVJGJdl9mbkjFzrCdv46ivJd0ounnPqEcw02csklsnbJ4SKI6Xp53D5xKsW09/1OQqpArKMkskG6QXvyX2uR23TZQbKen/KiY+t9H4yL4na8gmykBqi6P8AY4H1vM2aZ4Gw2B9EDRHRM9MSsNSJFcNtzT5b8mQ6e/DlpFKXtbYflfQlBMgK5FPF6I52yVaE7p/1UMhMn+VisxDo+Vfq3TtfUFne9vfBquTlXXjfUSitvhCPCmMqSJvft6HHxpMbyDRNrXpSVg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR02MB7938.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(38100700002)(508600001)(66946007)(1076003)(316002)(71200400001)(64756008)(83380400001)(36756003)(8676002)(76116006)(66446008)(66556008)(6486002)(66476007)(86362001)(6506007)(8936002)(44832011)(2906002)(26005)(6512007)(5660300002)(4326008)(38070700005)(54906003)(122000001)(110136005)(186003)(2616005)(107886003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?hd1FEM1lyP33b/TrYD8QD7fyAOqj32b/P5DE+iScNdq4Ni7DdipcK4oZlz?=
 =?iso-8859-1?Q?R3vrGoAW+Dn3IIdRnfleDrjLlb0LBfuddnDdL7JY4xVDEB049xkXtV4dS/?=
 =?iso-8859-1?Q?cP6JpMgUPiMpq3JsEXBfCc5iOB1/pJ9vTyPSkANmEgEWf+OqceM3u44DTZ?=
 =?iso-8859-1?Q?LSNWLzIwiQM9gwS0xEeKIRjDITO/Dj4USxmmlCvsUyC8E0LCvJ3tWPCpg1?=
 =?iso-8859-1?Q?esO2lcEva3jAAFEjEMzv6RJWBqNzDUM6XoMQGm6RMAXaHJEQjIJlbY5tEA?=
 =?iso-8859-1?Q?MpC+C0/42f3Jzea+B8M/NGOVY8fZwIAVd9vX+k02DCMXu0pjMP/6eCx0vZ?=
 =?iso-8859-1?Q?EK+r8Rxebx1J9CM0iz5lBhFubEtsmSBBatfOnAXKO0FECMMFFCBRfxxUHz?=
 =?iso-8859-1?Q?GBm0xXl/ktXxdnbGKFcMpqhNUCCCUKO0akqQ+dLzm39oZUzidJWKwI4CIv?=
 =?iso-8859-1?Q?JssET3ScK1JQlCRLXCPYd2afrFXpXJ0y9IFyvNwK7DeV4fRhuSujbJ71WR?=
 =?iso-8859-1?Q?htMVoBeSttDkKZH+Ov8EJUUE9dK9gdPozNVvn6fCgHtP7KImqx8wl1nP5W?=
 =?iso-8859-1?Q?TjbNseqTie8nVe5BPmfoCFklglamzBvBg/uhnVOyPeQLB5XxxeXbInLIiS?=
 =?iso-8859-1?Q?bDvL6MHK5dMz9mCw2JVOjih+mTii58bQ9VZ/BlhXYskKYDvCZLZaACqoPu?=
 =?iso-8859-1?Q?W4xeq13M+EUwOGdh67twGxqIoB3yOqwfsmGnOFjxL3N9eunU4EBTKCyQf0?=
 =?iso-8859-1?Q?If99whzBGQMluhbF98qKrmxXxnC0FOwJzUcdRAMSOdCRKFiU8yWXQtl5gO?=
 =?iso-8859-1?Q?jC3nMOE8G0IquHtZ7vbrNy/DkbPIS5yscQWuBK9S28Q1CMmDLnM/EguiMr?=
 =?iso-8859-1?Q?ifu8UrRCEneEls5p9ifA6TEgxzkj1p3PVIEstYTbYxbSfT7fCQbTYJKIuA?=
 =?iso-8859-1?Q?P2wW6xHfFSOjIpqvHnMT3gfp+Y4Js8jMOJgedvQjNMgAJCL+GowX0zD0qd?=
 =?iso-8859-1?Q?k8eD1y4dj07cIedmuv7x/mUSrPpkussUIWziJfy49jL3653jUl5yKtFcoE?=
 =?iso-8859-1?Q?JVapjywidcf9fD+zjDuvVDJawt0o6U51OlW0N0p83FLxLtrHZAMnRWaVWd?=
 =?iso-8859-1?Q?4QIfVm+jnsxLQVh9OPBeZ6e+ojTczOSlL9WsPT+11s3flTFx+THSraes3y?=
 =?iso-8859-1?Q?6hernZvtj+XwFTIn8CCXTaq58YhVUmrCYr5Z24zNxVKwURksDq9xBlMW7T?=
 =?iso-8859-1?Q?+4d3Fb9nRAgt41WUAP5M9K5dbcvKJSsLisAQrJgdUCwgbmGFrE5nfjuS8z?=
 =?iso-8859-1?Q?avUlCPYvuOdgoHP1kJrOecyMvBcSdCnnj+YRwXiSXuW6MyXO9J4uID+YXk?=
 =?iso-8859-1?Q?NsCZUnesza6ktNe+f+uV7NrOeTkwJH2IhOTrpvDIkbs1wmn7vZVgiDpuJV?=
 =?iso-8859-1?Q?ryJ+8uHnqnRoJdxzyL85wSwmrlVtELmiBGpPMNdtysmAqbTXU8aZTeOjEW?=
 =?iso-8859-1?Q?K0slr2Bs1D+Ggl8F/jP5wvoF63HnWKvowKR0GaXktGoYoX5LD2JqK4i/wn?=
 =?iso-8859-1?Q?YlIhUhyIYZmVruc2oNucHFtPY+WUEdhLLlbcXTuuj6zoLiWRdZyC48jFFQ?=
 =?iso-8859-1?Q?sG2Q8v8HdhbFAxyRvlc9KE4Dh/V4U/F8CKPSzVd9LMiHHLWVg4E5rdo3cF?=
 =?iso-8859-1?Q?6wKPT832/DP6H1Vi90a6WL0vwYGSyp7fVNZOeD3Z4Nz0nMFMK0GJhAC5fy?=
 =?iso-8859-1?Q?OdCrmihwBGrXh9KBLhMHQlqUE=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR02MB7938.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 584de1f3-3c89-4f3d-0475-08d9d96f97b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2022 04:12:35.9143 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6M12pk7LDBhI82MxrSqLzstzzeQQHTIImrVgjbA3xeHeDfc1QSeFW4E/Fw9uhss5hEXBbgzLqEMiZBVeLgD3Y1TupMhckhLc1xORG31wTmk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR02MB8018
X-Proofpoint-ORIG-GUID: 2FgkBzG0XxhQVHzUhBSz_VT6rNk1VhV5
X-Proofpoint-GUID: 2FgkBzG0XxhQVHzUhBSz_VT6rNk1VhV5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-17_01,2022-01-14_01,2021-12-02_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=raphael.norwitz@nutanix.com; helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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

Today if QEMU (or any other VMM) has sent multiple copies of the same
region to a libvhost-user based backend and then attempts to remove the
region, only one instance of the region will be removed, leaving stale
copies of the region in dev->regions[].

This change resolves this by having vu_rem_mem_reg() iterate through all
regions in dev->regions[] and delete all matching regions.

Suggested-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
---
 subprojects/libvhost-user/libvhost-user.c | 28 +++++++++++++----------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvho=
st-user/libvhost-user.c
index 2a1fa00a44..0ee43b8e93 100644
--- a/subprojects/libvhost-user/libvhost-user.c
+++ b/subprojects/libvhost-user/libvhost-user.c
@@ -821,6 +821,7 @@ static bool
 vu_rem_mem_reg(VuDev *dev, VhostUserMsg *vmsg) {
     VhostUserMemoryRegion m =3D vmsg->payload.memreg.region, *msg_region =
=3D &m;
     int i;
+    bool found =3D false;
=20
     if (vmsg->fd_num !=3D 1) {
         vmsg_close_fds(vmsg);
@@ -856,21 +857,24 @@ vu_rem_mem_reg(VuDev *dev, VhostUserMsg *vmsg) {
                 munmap(m, r->size + r->mmap_offset);
             }
=20
-            break;
+            /*
+             * Shift all affected entries by 1 to close the hole at index =
i and
+             * zero out the last entry.
+             */
+            memmove(dev->regions + i, dev->regions + i + 1,
+                    sizeof(VuDevRegion) * (dev->nregions - i - 1));
+            memset(dev->regions + dev->nregions - 1, 0, sizeof(VuDevRegion=
));
+            DPRINT("Successfully removed a region\n");
+            dev->nregions--;
+            i--;
+
+            found =3D true;
+
+            /* Continue the search for eventual duplicates. */
         }
     }
=20
-    if (i < dev->nregions) {
-        /*
-         * Shift all affected entries by 1 to close the hole at index i an=
d
-         * zero out the last entry.
-         */
-        memmove(dev->regions + i, dev->regions + i + 1,
-               sizeof(VuDevRegion) * (dev->nregions - i - 1));
-        memset(dev->regions + dev->nregions - 1, 0,
-               sizeof(VuDevRegion));
-        DPRINT("Successfully removed a region\n");
-        dev->nregions--;
+    if (found) {
         vmsg_set_reply_u64(vmsg, 0);
     } else {
         vu_panic(dev, "Specified region not found\n");
--=20
2.20.1

