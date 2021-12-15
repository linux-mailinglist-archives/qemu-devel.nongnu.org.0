Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 115054765FD
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 23:35:10 +0100 (CET)
Received: from localhost ([::1]:36196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxcrc-00029s-Go
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 17:35:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1mxcmb-0003BA-19
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 17:29:57 -0500
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:63560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1mxcmZ-0006Hq-Dl
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 17:29:56 -0500
Received: from pps.filterd (m0127843.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1BFGW9bW007586;
 Wed, 15 Dec 2021 14:29:54 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=qhcx8BoK9lmuw0eXEwdgVNzflU8yIUAE9P0MuTf2HwU=;
 b=MytN0SD0O61+snYS+6Gzhg7EifovgbfvmIt0Rh1sOHGHUX21GiP5WL17FqWsHsek2Nt8
 b96Bcr6wzhP0HX7hakkN1GYSMdZe899KbWhzE6PO2zLmyzvEwoc3CFRudH9XCExGqL0o
 Acjf6QA1f2MZq4GDLYhngNATsPwcjDNOiHUiqKG6lQ22mPdXB5+ui+lFV2fJpZI7i3C2
 YvXgENX/i9CvMhWF0ck/6dLYu/PvCT4fn1ADTUVK4jIoAZuYVVoNvq3ZzwRiLenITHUD
 7zRTQEfLvS7IS24vDM5P4ASpN+L+2ZF1Lkq4zSKCAA3MC1HQ1YHd81FgYJLJz5wJIKJx iA== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3cxxfekbwf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 14:29:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MkoIcGJOaYQG5st2hYqtcQZR3Dk6uDpipmvwTKQx6TYy1qSEs/Npl128TNBo3E1g16zHyitoNPSMbv1bgF66AW99WYuhZfsMwsw90PW4DbckJC2Q2L1VlB4m7NiUOdYeVDSn4Ez9MCX1Pk2qF6whyR2dMNYDhy9PanwI7Bl82tMtePIB8Zi2JnZzNvCZIfweWxZvinu/b690DrL8iVZj5TKyPvkkmfvsnHfbGpSb79XiZ5qke+k1D0avAhNVZxeZFIA6VJG8F5MRoEYPPr4SAJ6cJvL/6X7ZQ/y4Avr/gsO5yLkyIsbHupoA3TkTtgvZPax3voMwVm+KKhhn6KN+YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qhcx8BoK9lmuw0eXEwdgVNzflU8yIUAE9P0MuTf2HwU=;
 b=Ki3Mt2wrZ205mVKhqa/iDVYlk6RXKuBaMnaGa5vaff/WXwcn6ylcZnsnJ7KskTqpz/VUJf216Tu/SWfykMVwwOko8929+AISC6ieaKAmuUilg60b9S7AWjxLilr+L8EAmqu03peO0q6Hthqy+TRfiXS+z6DdwmvqJ9wOkFcwlyKP7B3hwF1hvyVaAQqkza0yRljc+LRPGjcyQ4fuUEeZUriQxqyR+6cqlYpUVsdhnGaS9lPj+XImpnx5VKZ/uZt2fWswO/0EoYRulkBiU2syidbLvK9AX6hnEfZ2n+mw+oJG41xNb9JnnX1CC5D6XjKbh43lwLeVmYGSW/Z/biORCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BL3PR02MB7938.namprd02.prod.outlook.com (2603:10b6:208:355::20)
 by BL0PR02MB5457.namprd02.prod.outlook.com (2603:10b6:208:87::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12; Wed, 15 Dec
 2021 22:29:52 +0000
Received: from BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::25f1:c1cf:5f90:35af]) by BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::25f1:c1cf:5f90:35af%8]) with mapi id 15.20.4778.016; Wed, 15 Dec 2021
 22:29:52 +0000
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: "stefanha@redhat.com" <stefanha@redhat.com>, "marcandre.lureau@redhat.com"
 <marcandre.lureau@redhat.com>, "mst@redhat.com" <mst@redhat.com>,
 "david@redhat.com" <david@redhat.com>
Subject: [RFC 3/5] libvhost-user: Simplify VHOST_USER_REM_MEM_REG
Thread-Topic: [RFC 3/5] libvhost-user: Simplify VHOST_USER_REM_MEM_REG
Thread-Index: AQHX8gNHlUw1xJAqnEqojXP1AFe1/A==
Date: Wed, 15 Dec 2021 22:29:52 +0000
Message-ID: <20211215222939.24738-4-raphael.norwitz@nutanix.com>
References: <20211215222939.24738-1-raphael.norwitz@nutanix.com>
In-Reply-To: <20211215222939.24738-1-raphael.norwitz@nutanix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.20.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: da4bfda7-fcec-4a23-bbbc-08d9c01a69fe
x-ms-traffictypediagnostic: BL0PR02MB5457:EE_
x-microsoft-antispam-prvs: <BL0PR02MB54571DEA72ED89F958E76AA7EA769@BL0PR02MB5457.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xSi5OmN/BxwWb2qtxznO/dXCNiNF7t43eMYY2cUGhC4gJSyccG3GzOwQPvJYtKpP1x42j+zJVh/HzhOAEOv2lzAYsEJGtuY6aDkfyrkYsL/N5WkMK7xDGo53m7uOAK5Vb9y7psGfbGzfS7kIOj7xG9Hdo/YdxRyxrAVJNmGkxWoCVVfkhk/1TgWgZaRcJA48tZN/HsBi8hMMLwv9ygw+vDwb83MC48O1ZJL86ELhNZXwj/n3hgUfLajKo+B+QAZT5o/d8OUWQHcr+vLRtKdYLFhOxOkiZTQRG6sjTdUYgsgbzbFbFz5kIxVrKU9EORAKhT8zLLVVdtmw7nwVcq/ytMeR4oRhs8XGxn9jbRqn6thOl2vGe+POvEB8Yj1dtYBbDuIsCjTDgVZqCzNxRTCMKu07ctYKOiy+PXwhCthUzIRWftUmctorUwVS2h7/oNEB3RzTl1XQJmOwvnYu//2jJAb6m6QhSUdnufO5AnJl8aj3Wg+AR5aZjwcLZ8vWny1Py7IqxH5mxGrL3Q1bzG8hAjXhsQbIGHYraK4bkO+fquDrcXcFQOzL0NrQ57MKsSo4EKA2zXv5udh+mbUhbsrUU7U8tUuAxLO6xrMGVN/MFBmZZNm9+1ClX+t8Evfx/97QsSqSyhi9jlcVuW45WoRcWzjErwYfpfhOd66re/mCtWSTlGdh8blWH8qUfByIfZPzuJkzSZiS9VWQ0oq+dSL7hw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR02MB7938.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(83380400001)(2906002)(8936002)(6506007)(8676002)(26005)(1076003)(107886003)(2616005)(316002)(110136005)(122000001)(54906003)(5660300002)(38100700002)(86362001)(38070700005)(66946007)(186003)(44832011)(36756003)(66446008)(4326008)(64756008)(66476007)(76116006)(91956017)(6512007)(66556008)(71200400001)(6486002)(508600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?3seUGljoppGcpYEijANYw2vj8FXUQ5C0t6ZIk2i+mgXVzEos+i4NPStMUG?=
 =?iso-8859-1?Q?ktwUFnM23QRWcvzZQ8wsmFJmTIcNa4tDrbS/qGAG5JY+S+JSqsK4sJ00WB?=
 =?iso-8859-1?Q?Zmhg/Qg4g2cC4rHKgKzHwUrp11bm37IHRyOzsKyksqIMoJuGZlrwhs9PIc?=
 =?iso-8859-1?Q?Cs6x08FwnsW94IHDkt3WMLHPVQE8yo3H29vTxlwtz9xvkVR9nju3v4AeHi?=
 =?iso-8859-1?Q?k1uDB0DUxPc2r2GdeFOyBhlBaIfebaG8xa2KwToUZu295POoPc+bMsLvL9?=
 =?iso-8859-1?Q?1OmpPu7jbH2ubOAnqSqNGJiDA8/SmPFLileGjfrcmLw8JI6BygsmdiQI9u?=
 =?iso-8859-1?Q?biU6Q/LOsGL53R8/zvQIdnc8sYwK+KfkOds5dY/hYiBA6JhnWl+Ol5N4ky?=
 =?iso-8859-1?Q?keZyf4kmSClLkvjM1fUDF+bADCrvsE6PpdT91x/RXrSy1Jiy/6hx3Giwk+?=
 =?iso-8859-1?Q?fGD9Gfmn8SR0tBaf3oF5e5A7wmVLrYFkM+fXBOjM7I0HyMh8JRZ1SuOiYy?=
 =?iso-8859-1?Q?CfufGhj59xlNuL4mW5UXqCW2R9FATjZ1JcTxkwBFQoKiFGqdQMEmfiyuS9?=
 =?iso-8859-1?Q?720QxUZRfakPUXtViFQLPEEdyo2n525f+qbs6BEsZy/EJvVC2xMsB9QjmW?=
 =?iso-8859-1?Q?rlP3e0LEAN+4DStVfid8hyuR1m6TIaFzWGKkIyVoex4vQNJiTThmmNqwVT?=
 =?iso-8859-1?Q?N6hlRMs2ssVfZg2Njj5Xtzfp4RNb9151jVTDV4WerE+VbNxgIGL5oaEHGr?=
 =?iso-8859-1?Q?jApxdrmMrLeH0bxDsHUdRxP+N8N5djFxNHBoPq5zUEnuD2+YqwDuWdq7NK?=
 =?iso-8859-1?Q?hULPg8X9RoZJmeFecCCY+5DaN6zHNVyVtYPRY4lYP6od3cVMwGpLU7PGC7?=
 =?iso-8859-1?Q?ejCFK7F5C/pN5hgigQEzDwpFJspxl0cxt/cJJMJzz6uDhTPyovdYGQRWbm?=
 =?iso-8859-1?Q?zNVxIuFfHP6Ritj/Q9BzSL2LngRT3jvVDIwLUYZMf2TmaCFViLg6loNIMB?=
 =?iso-8859-1?Q?bhXuoyEzCFJshJNHCcWk/7nB11qQUIWDnzuNuUyZsI8rUp9ny79maXyCER?=
 =?iso-8859-1?Q?uuFFQFOgPOZpVRNEYKZpbjOPOkRDO2MM/jTQlP6zN3qJHqXcG68BVHbZGS?=
 =?iso-8859-1?Q?Qftj0flL+T2HdynYoosxFPB+Sio5F7tDdTgN37SZwWcLUpBwIpAqft6tKw?=
 =?iso-8859-1?Q?HKz2nCiA0dOrd+fz6E+JS5Y5VSasdAWzYakTz6+JQ5pqVkw7xMmVU7ziex?=
 =?iso-8859-1?Q?Q2kbqub8M2vkOIUBJHbdXKWM10fYde6YK/bXW9MXayYzxShs8G0wIasM4O?=
 =?iso-8859-1?Q?0WjW1RRZfM9l2K+ialL2fn9oTziv78cbCpxdZulG0kPeJ7155q4UqWl2nU?=
 =?iso-8859-1?Q?jMrd2x1hmIiZyL7aLYdILRRtc5X9h5tacRSxQPQxNWAX05NheWEPuEPMmz?=
 =?iso-8859-1?Q?vlSohzfRQfJubj6fmCvxcpQGcyDPhcVEgLSWM22obzTWEcq4gEo4CWiykh?=
 =?iso-8859-1?Q?Qv5uq2X3c9kurp5YU/l6DPQFPlUyGEdk0xZqz0bf7Jy8UkFSsz4r2giXZm?=
 =?iso-8859-1?Q?esmXW7yJAeja17cf2doIuY1O7ByTNGfNvnspGQSc9w/UEi6Ih0yx2r5T2A?=
 =?iso-8859-1?Q?Yy7f431CsXPKmDcWHKmIOGvQsgLToRP/WnqnEh4V2A/Tt3HnUxLNw/+GDk?=
 =?iso-8859-1?Q?iQrRNEbzDiBcJoNtwXNdXQFW+zrP/DCmqto2R3ay5863tatg8lpT6T3Ift?=
 =?iso-8859-1?Q?5tdy2ckm/pHh8sblpEBOvlXHw=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR02MB7938.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da4bfda7-fcec-4a23-bbbc-08d9c01a69fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2021 22:29:52.8565 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IyO1p+lM9KGaIrAactav0kyJEfjRfKCKM3OAi6Au4QedklyDu7W8YJLh3r5wG/dplnWc8nG3gl896Q+BdZllzocKAe1O69C4NT1bFfOAIVI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB5457
X-Proofpoint-GUID: 3YuagzchPUe1_2DxoQVc6aCVXex2Cf7L
X-Proofpoint-ORIG-GUID: 3YuagzchPUe1_2DxoQVc6aCVXex2Cf7L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-15_13,2021-12-14_01,2021-12-02_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=raphael.norwitz@nutanix.com; helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
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
---
 subprojects/libvhost-user/libvhost-user.c | 30 +++++++++++------------
 1 file changed, 14 insertions(+), 16 deletions(-)

diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvho=
st-user/libvhost-user.c
index 80ef335254..714cc7e08b 100644
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

