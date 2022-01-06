Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 795294860DB
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 08:06:17 +0100 (CET)
Received: from localhost ([::1]:59218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5Mqm-0002iY-FN
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 02:06:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1n5MYs-0001IW-HJ
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 01:47:47 -0500
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:19576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1n5MYk-0003Us-Gd
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 01:47:42 -0500
Received: from pps.filterd (m0127840.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 205N628Z016432;
 Wed, 5 Jan 2022 22:47:35 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=zyXPgW+0qzttbT91NqCoOCa9/f2y2Xi7NjmTjYqCXGQ=;
 b=TQw1AMdAcUHSY4l5kydAh/T01Pq7ZU8QCTRvixd8VBiScipkYxKQpTd0yJEI6lCzlbRj
 oBe5RgJh37hGBIwxevLptbFZxpBZ+xYLngIoVISGbxk6KfHfUuz6JG6hLSiGctZIrU2g
 NEi/5bOQYnbaIpgD+I8q90STDGma/QNpGu+W4hfydtVwBSm8fzCSAvZGNhMOsMs3fHEy
 0aYQYYmXYwclJUGW13Vkk/AZtL+vnT9xiBRIWwL3aHiIRgn5w9hCu8yin21ow+gsDUYJ
 hZbjtBP5R1AzWtTIVcL40xwVpuPOo0Pme5qvhRUtaWXR4NeR/9KoNxklwWa2seJC7QTd Zw== 
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam08lp2047.outbound.protection.outlook.com [104.47.74.47])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3ddmq0rjs8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Jan 2022 22:47:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G7PuFfnNNvr4WWhKovBmL28tj289Jg2AM5hcgfiyQOvXjrvZI7GP/ok2WI3NL8Wopy57syNqpFwIe/5/buij0Q5zZgXAGEO7WPh2Zd8MUBbTT+cFnN4RxsaDkZAYmm1Ja+f9dSwJXnj7Dw5x3CObpLk5hhNM75Tbr6s9lqtolE+agB7v2WReRvXiabBVaVadOaK3s6i+Y5nLShIEdMaD0JyRC/nAHtjTvqPDviSh3S52PKadz5Kanv/OmrsOU49NteeAQpG87xdb8aWGXJDdF+TPm3DfZLjmNGXBdSnJ4zLsA/3snhvtrONe6b9m3Xbg61G+seJb17od0wzqEvo8/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zyXPgW+0qzttbT91NqCoOCa9/f2y2Xi7NjmTjYqCXGQ=;
 b=lTRYYqAgMsZ+hvqdNKvyiL1JJiNGEM59JUb5qEgyr3I8W+72vj1zpG6sPafGpv4EcZY0EAKziTJ77EdpauuQ7csbnBEMJ2k4wJfZM18W3RkGWBIfjaUQUkrniyXyyNu7xK/xF3xewdPcdb3VerT3P+/+xgItnNHcLGEEqf3hKzMepVuWb92JEpnyX1jvqjY5rH09b93ArBJ0x2CtkSzPx4XpCQZa+L3ibDWPariTaqBCCR2aAE2hPhaF2vbkSwe+GYaKGuaQZ6wQXvd0K3z+NQ2gaPVf9Y2J1wzOBRBOAewKGToSicJVupN8ZnFUrdl5hA92JE5Td5YykrW9LDqy+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BL3PR02MB7938.namprd02.prod.outlook.com (2603:10b6:208:355::20)
 by BL0PR02MB6530.namprd02.prod.outlook.com (2603:10b6:208:1c1::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Thu, 6 Jan
 2022 06:47:33 +0000
Received: from BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::3c2f:b2dd:a0b5:74da]) by BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::3c2f:b2dd:a0b5:74da%6]) with mapi id 15.20.4867.009; Thu, 6 Jan 2022
 06:47:33 +0000
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: "stefanha@redhat.com" <stefanha@redhat.com>, "marcandre.lureau@redhat.com"
 <marcandre.lureau@redhat.com>, "mst@redhat.com" <mst@redhat.com>,
 "david@redhat.com" <david@redhat.com>
Subject: [PATCH v2 3/5] libvhost-user: Simplify VHOST_USER_REM_MEM_REG
Thread-Topic: [PATCH v2 3/5] libvhost-user: Simplify VHOST_USER_REM_MEM_REG
Thread-Index: AQHYAslImWaDAIu9xEeLpLVwuoQw7Q==
Date: Thu, 6 Jan 2022 06:47:33 +0000
Message-ID: <20220106064717.7477-4-raphael.norwitz@nutanix.com>
References: <20220106064717.7477-1-raphael.norwitz@nutanix.com>
In-Reply-To: <20220106064717.7477-1-raphael.norwitz@nutanix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.20.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f430a195-4789-4361-2377-08d9d0e06b21
x-ms-traffictypediagnostic: BL0PR02MB6530:EE_
x-microsoft-antispam-prvs: <BL0PR02MB6530E9E49E94B1EE1871B1CEEA4C9@BL0PR02MB6530.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GkCzXC2BShy331s79JCKXFkD0WZr+MvGQ4e2J0rft/sqqsG1RA5WNpYQF/MGhMDlpYnCxCvs1xGxRmoesmzDXJIzNbpfYVTJ9eIYuhD8+qTG/sljlyJJ4DYnUt+MPzsnv5bCQtpP6CYc96n19ym16Han48hobnCXqNOdscCvT7bNDi/WFLp/4I7ZxjcKRX2/K0VZB2cYZ7+6VTZcccNCp1OIZFWPEgB/5p2K4hIqhYQ+m2mILrSR1K+1C6d/ggIJYWZ88Jq1401LqtjzqA10p3zKfovzckfZl49ATO8rI7ibtQbrL53tbaOnmP9xqoEnq/KJUO93gA9bIOyh5D51g0pLlFuxpatQuP7o0zSITrk5RuJCDy9LGTZ19N3K21KFycqCpGeHWdcHeKWN7PqrJR3tkATKpKAEqfbSF3EBHAWkTJGz67iR/CHaEKQbzdH2/TBFQT040tliQV2f8QRFm/pwGS0UMoF1MoJ8X4CLCDLXkw14fh6qE+6HbtVhaYMo/B0nLHlzcI+U5z6+ftoDpY+DcMqy0RYkgZCfGbhr+xBzr1QcVmVbmlYDQa28PxXP1ojpur0Ua/Q4Xok1c1DlmeXyy/hBTLmXJcgCO5sHWr4dt+xFPQcXSROwLswXHyB8xAX7MqrpSmO+f/sQaJptH7V7V4+YzBaa3wozcQRUFwPHADhTY+L6yfcGwhFIVluWTyo7ipPMNUnRn6jp98YS9Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR02MB7938.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6506007)(508600001)(66446008)(4326008)(76116006)(186003)(2906002)(316002)(122000001)(6512007)(66476007)(71200400001)(66556008)(66946007)(5660300002)(91956017)(64756008)(54906003)(6486002)(38070700005)(110136005)(44832011)(36756003)(83380400001)(1076003)(2616005)(38100700002)(86362001)(107886003)(8676002)(26005)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?E5oWJux5Jh9yGddWbD7Jm6J5wNA28Vzu52v4LNyiNgWs4bwH1H9sp4k8GA?=
 =?iso-8859-1?Q?IOqyZTMFZyJpWJUmQMYK9x5xvTDDg+izvXfZQNzfJl24SEJ1v5lDbC8xhs?=
 =?iso-8859-1?Q?Ry+sOFw0F8e81oiz49zDmAmgTiO60M7ZGYw+TSNKJz9otkn+5BfuNDsFUM?=
 =?iso-8859-1?Q?I47AgphtEuNGANPsborV7r9SftNSvG1qCsnPIxLD22aZOmSKBf8cT083rX?=
 =?iso-8859-1?Q?Q6LwHSK0CqylGNPMnP9+A812uvqUotWbS/dnIUNm/BBuVGoJisSt/B/nXT?=
 =?iso-8859-1?Q?x/TgA7Az9HcftpjSK4hLMFT5aqZrvm+UhET/yOpaY0vjC0jbCxGvYDtx/U?=
 =?iso-8859-1?Q?SUngn0Kry+fshIZ6gI4/5G6eRmxBSFyWGvkestcsvf+EaCdikj+x46jRV1?=
 =?iso-8859-1?Q?4GkldvN9u2EMAJ1bdVMQC8oIpNms101zSbRrwLQsg++8o7bLaATTzUY2oT?=
 =?iso-8859-1?Q?Ts75+jZp33lT9/THG+WFQDinAcMVv0RFyzFLY3d1FeX7npd5sGLHGLUZtg?=
 =?iso-8859-1?Q?zGQRA8PuLnv1uo6QHNHWG/YarQGsbtLJfMPwJ0PISFFSzX9TxaACNAcs3d?=
 =?iso-8859-1?Q?IJSAo5CcbooJpsMSywvdmTjnd6XRcBoPiXASy522kQxxsZ/YbmLoY6MTb/?=
 =?iso-8859-1?Q?ZAERWOlki3brLZrFmbjB/LJY9TLm6a3blSU6vlSWpy/j9PYLIb0IvwnXmj?=
 =?iso-8859-1?Q?cDSJ7Q+v/o9MoQi7tY2ZeKev9rxrR2R1bjraBmKYDzc2yVlf/+MLmLrWdX?=
 =?iso-8859-1?Q?hKBiLcUaOQ+sz4mCyvYJ8L2o3awuFAPdmpqcAH94AhW6veTW4nIgeEW8KF?=
 =?iso-8859-1?Q?WleIjhaOwXYi0c5j6eUY7MG1mLlrQkY0h9IA5Q8qHuBihYXPGmGd+9K4Uz?=
 =?iso-8859-1?Q?53T67vYTs2wK9aGdtxdgGSPlJVPwbDbAhEtGF+4TVwil5qLPxmSqlm1o4l?=
 =?iso-8859-1?Q?rtXk/jVeDPysxa9EhfwhAy93XTRk/P9aHyEBoVxApGQ+qu09DAJV+Q22Lz?=
 =?iso-8859-1?Q?a3GqrBW0JP1bGqqVH7Az5cJ+pW6YMmWamURQGSp8hx1UnjS4E928hS6z+I?=
 =?iso-8859-1?Q?GxPpGJjzLYv2kzjp5t9JtVN74Pt4mJ1XxL6kRUZfxTrUPv7kD2uyifFpV3?=
 =?iso-8859-1?Q?ZKK02jCEi7uVg9TMzz0LxvabZc8tt0uMs16w01BaamFd+xvhbd8zkT0tSf?=
 =?iso-8859-1?Q?DUOCSu86PYA9dW0AblHcHIUYX2LcBxUtl4S6m4xO4OWVo3vlrDZx0wMwYg?=
 =?iso-8859-1?Q?0N/X+vZhdU35SmtN8t43/bcdunYwz4i1IPsDH592OfV4Ao2ydKwg3Il7R6?=
 =?iso-8859-1?Q?ThfRxu4GLlVuu1PIX6W8MguUXcyxbck4DG0zdZ314zpBsisNq841USvkAZ?=
 =?iso-8859-1?Q?3wRdVbGfx6ndzonwD/HQOz5Q3GoFLaPrUco5/1Vxs6D4E/5vjau6cRBvTb?=
 =?iso-8859-1?Q?/8sYude7XKQo448L1gDWr85UEx2H0/lDWXxDUWbfGqWiGUcYGZirwuJOgo?=
 =?iso-8859-1?Q?qWKj+/mRBKSydruAseqL9/WoMEPWOK7c8a6gABmb8hQMa5c0x+tr2K6o8o?=
 =?iso-8859-1?Q?AimjUrgBL0+gQ9TtHpBsMaSKFj35zZwH0Xj2vQ9yw01xwIyxZMAkujiXmj?=
 =?iso-8859-1?Q?6sVziUjKcTRJ9O7J8k5/B7xLMirkb8KwBXpVyEkGgkFz9Do37yIJwCwLuu?=
 =?iso-8859-1?Q?LrzVsHGsr1gqxOTOw5hdZUOcsjsaSCBI99N7EkpOT7ER6VXhbLJLje+U+b?=
 =?iso-8859-1?Q?Of9Jhp1mgcHqYBIzGotMqEJpc=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR02MB7938.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f430a195-4789-4361-2377-08d9d0e06b21
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2022 06:47:33.7596 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cHEKnzoFvwD09XeVC0oUUk3phd++SAfvroTvXYeUTrPSWdqUuYCxth6/LnRtw6yVQB1SEW4xeeeDQ7sxiStWvsDhKygS1mQl1NY98rhuBwo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB6530
X-Proofpoint-GUID: h5e3Lsygg2uWh2Kf1J5bc_KliICcavY1
X-Proofpoint-ORIG-GUID: h5e3Lsygg2uWh2Kf1J5bc_KliICcavY1
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

From: David Hildenbrand <david@redhat.com>

Let's avoid having to manually copy all elements. Copy only the ones
necessary to close the hole and perform the operation in-place without
a second array.

Signed-off-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 subprojects/libvhost-user/libvhost-user.c | 30 +++++++++++------------
 1 file changed, 14 insertions(+), 16 deletions(-)

diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvho=
st-user/libvhost-user.c
index d61285e991..77ddc96ddf 100644
--- a/subprojects/libvhost-user/libvhost-user.c
+++ b/subprojects/libvhost-user/libvhost-user.c
@@ -802,10 +802,8 @@ static inline bool reg_equal(VuDevRegion *vudev_reg,
=20
 static bool
 vu_rem_mem_reg(VuDev *dev, VhostUserMsg *vmsg) {
-    int i, j;
-    bool found =3D false;
-    VuDevRegion shadow_regions[VHOST_USER_MAX_RAM_SLOTS] =3D {};
     VhostUserMemoryRegion m =3D vmsg->payload.memreg.region, *msg_region =
=3D &m;
+    int i;
=20
     if (vmsg->fd_num !=3D 1 ||
         vmsg->size !=3D sizeof(vmsg->payload.memreg)) {
@@ -823,28 +821,28 @@ vu_rem_mem_reg(VuDev *dev, VhostUserMsg *vmsg) {
     DPRINT("    mmap_offset      0x%016"PRIx64"\n",
            msg_region->mmap_offset);
=20
-    for (i =3D 0, j =3D 0; i < dev->nregions; i++) {
-        if (!reg_equal(&dev->regions[i], msg_region)) {
-            shadow_regions[j].gpa =3D dev->regions[i].gpa;
-            shadow_regions[j].size =3D dev->regions[i].size;
-            shadow_regions[j].qva =3D dev->regions[i].qva;
-            shadow_regions[j].mmap_addr =3D dev->regions[i].mmap_addr;
-            shadow_regions[j].mmap_offset =3D dev->regions[i].mmap_offset;
-            j++;
-        } else {
-            found =3D true;
+    for (i =3D 0; i < dev->nregions; i++) {
+        if (reg_equal(&dev->regions[i], msg_region)) {
             VuDevRegion *r =3D &dev->regions[i];
             void *m =3D (void *) (uintptr_t) r->mmap_addr;
=20
             if (m) {
                 munmap(m, r->size + r->mmap_offset);
             }
+
+            break;
         }
     }
=20
-    if (found) {
-        memcpy(dev->regions, shadow_regions,
-               sizeof(VuDevRegion) * VHOST_USER_MAX_RAM_SLOTS);
+    if (i < dev->nregions) {
+        /*
+         * Shift all affected entries by 1 to close the hole at index i an=
d
+         * zero out the last entry.
+         */
+        memmove(dev->regions + i, dev->regions + i + 1,
+               sizeof(VuDevRegion) * (dev->nregions - i - 1));
+        memset(dev->regions + dev->nregions - 1, 0,
+               sizeof(VuDevRegion));
         DPRINT("Successfully removed a region\n");
         dev->nregions--;
         vmsg_set_reply_u64(vmsg, 0);
--=20
2.20.1

