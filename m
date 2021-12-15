Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDCAF4765F6
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 23:33:06 +0100 (CET)
Received: from localhost ([::1]:57996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxcpd-0006C1-Sh
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 17:33:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1mxcmp-0003M2-Cw
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 17:30:11 -0500
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:11932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1mxcmc-0006Ie-JU
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 17:30:03 -0500
Received: from pps.filterd (m0127843.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1BFGW9bX007586;
 Wed, 15 Dec 2021 14:29:57 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=T65VD3UfjuYQXE+Opa0TFYmDscjGWwVbqXvUdg822Fc=;
 b=d6W2ylYCHMUkaBW77Ur/9CPmsjI4sKKm2Zw2uKj1R1K7v88lGBK6Ba+o5iYr2GTXwWet
 vlgx0L1IA0yRD9r5iDAhmjX78mpJdJiW+o1DNrNkDDOOJqy2Ae08ub9ic/xUW36cLIQU
 E64Wzg1ewZ7f203wf0lnwHHmInBJQDxasZbslxWOyhAr4wO7Il8Jfd+Nbyo1IhVU42Dc
 x7v3dXwdXJhiPdHAUL613SATOJDn6rtjNpysFNMaxLWaa+TUoO+tb1IAoEAzbdc03x/2
 lauBxWd7b1W0AOSJrfwmAUqoJt6XhuOE7rXpry3RJJymBS6Atf8NZS7++7v9ChPw80Q1 wA== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3cxxfekbwk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 14:29:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kanRburXAy7jbcXWpzNyp36Q7EUk0iz2b5QQTDnTwZrBk82RwJXKb+hGtTYwGgARD4zlyoIYI0h5VC9Kt+feUJbTwjdYNZ3FRS4NwvDkVMKoubPMEIvUNf6lGMJXiRl55RKRyXRgVDm41epn3HGtfRLijPF0XplDjO+C9xj1gl5B9vZrRPY9DdnrDVNHHQ1upMrNlI8DI6btTilwTcg0mnKYpgbB/voX/PrWlZTJw2NH0HmrP+WOGTmPlw1RHZUUYpKeKsOPsWEiw9QUP/6s5SixPx2wpD7JA8/FbbpcpyI7iSqYoDb0HQxqDqtU+/Xh1kHmw6Ar3vH1kJo+JSl0wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T65VD3UfjuYQXE+Opa0TFYmDscjGWwVbqXvUdg822Fc=;
 b=RdVv56PFiEWOAUucjKjMiPHHLQRlHfxQFrP8MhH21dBkcweznJVIyixBZGBGOX8CCJY4ZqJ7nR423NdeBl7f1ogCTlEqMgkft7ita927K+nlBsMiItYde42CT5ef5WNWwt28sqWsaOOivq3KGDZY1sE2vdHfJApYNAnDfciIE8Mmu400s5c9Ew9b8WENCUJQoajkY689+37JhIuNK/DCo0c9UIgLOLeqrYSf5ElAdk1N/DXyDmKSoz7hGkEhKaIYwSNnJ9q9dhI8ty0TO8luageK2z2lbRx0D4mKsMHn1gs1utkOekFMXrF8udjMdFzmRYgBd2EEtuq5RJvBX8pj8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BL3PR02MB7938.namprd02.prod.outlook.com (2603:10b6:208:355::20)
 by BL0PR02MB5457.namprd02.prod.outlook.com (2603:10b6:208:87::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12; Wed, 15 Dec
 2021 22:29:56 +0000
Received: from BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::25f1:c1cf:5f90:35af]) by BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::25f1:c1cf:5f90:35af%8]) with mapi id 15.20.4778.016; Wed, 15 Dec 2021
 22:29:56 +0000
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: "stefanha@redhat.com" <stefanha@redhat.com>, "marcandre.lureau@redhat.com"
 <marcandre.lureau@redhat.com>, "mst@redhat.com" <mst@redhat.com>,
 "david@redhat.com" <david@redhat.com>
Subject: [RFC 5/5] libvhost-user: handle removal of identical regions
Thread-Topic: [RFC 5/5] libvhost-user: handle removal of identical regions
Thread-Index: AQHX8gNJEQPpKFdBa0aQg0lnFIf3ow==
Date: Wed, 15 Dec 2021 22:29:55 +0000
Message-ID: <20211215222939.24738-6-raphael.norwitz@nutanix.com>
References: <20211215222939.24738-1-raphael.norwitz@nutanix.com>
In-Reply-To: <20211215222939.24738-1-raphael.norwitz@nutanix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.20.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6b0d60b8-66e3-40b0-f75b-08d9c01a6be3
x-ms-traffictypediagnostic: BL0PR02MB5457:EE_
x-microsoft-antispam-prvs: <BL0PR02MB54573DC1D028B85995F5557FEA769@BL0PR02MB5457.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aXJ2hdDtST1rR1kjvWtR7Jo27L7TvubUrMn72YWlJ9fTY1nk9upCrS7MGfB06yF2su/THbmv9UZC92uC4CIeSdBFTKP/TreTk9DeVkTKS9SD9H/UuxVvwTItNw66MQ5YqYGg5N7sOY5a8S179cUPf+qV9ABIoMPyfkxW/CfpvYIFY5Vz7uKJ/Ej1HVUufUpC64Ittk16JeOJip0BMfe/h8grK+V77mBRJxWCTHh2vZWSxrHuRQl6fat/U8k9nLz3ERibKYciDujHJKGvHseI8tJ4ERo0jMIoUxOYjHpegPafklL1WcYJsZKsNVJfDydTuZOPgaXAM3yEGfCojnoxE5m1fJ7X9YkD0fAkKH95InGe/XiLB5NYNGsPMbhkbzHFsnlIUE6zE6z6psPswhtNJmheXa1yVWQtnbjSiJ5k+iID8aYFUqkZHIOFErL3dubwE5g1FWRVGJuR9IdlywkTf+qVQxu8VvmVvPFkpaPvYvXIH+Auh0D6F6Yf3f8Sso8IvKqekAjEy+VUtkNhSopQrr/lStxqvvK7Ymmy4AiQ+H5f4q0PbSBn2ReAbmXw8AvJebdzD5/6ykx513UMWUFHLWgIW9wMc58M88DK64mJ7fMF4oLjzWDA16p1xGWPfowZFqa+KtjcfMsvzg4H+WquToNy3kW4cmP6EYci+xEnxrITWK6/gZnvodjsNJw/85muYSyym1pF+JXpuhUBJnovtg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR02MB7938.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(83380400001)(2906002)(8936002)(6506007)(8676002)(26005)(1076003)(107886003)(2616005)(316002)(110136005)(122000001)(54906003)(5660300002)(38100700002)(86362001)(38070700005)(66946007)(186003)(44832011)(36756003)(66446008)(4326008)(64756008)(66476007)(76116006)(91956017)(6512007)(66556008)(71200400001)(6486002)(508600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?NHvAiFxP1O7r6a7i7B3FooNPMwSWA21GFLEn2dMggx7TBjpyYajqC1LK/h?=
 =?iso-8859-1?Q?u6tDGL04Mb1bWTn9N0m+4KAEsPpY1X+uJINy3uKiYJ5EPtloOAAXAppABU?=
 =?iso-8859-1?Q?3MTWfU+tFK4Wnu11p9stbQimL3u1AowEwEvSzWIAsTe2jjn+BOjnMYZdX9?=
 =?iso-8859-1?Q?OLyMLL8YcmN2VDQUH+F/nX0pAyjDLrfMTCdkQcxSPbga9kUpZOfEOi8AOv?=
 =?iso-8859-1?Q?1dJCYK0cG/9xmYkBK2LtdGVjWcu1+yy+AN0Vg0/NHd8wM3bEGz9K9+HP97?=
 =?iso-8859-1?Q?BISf9Rhm4w5U91iOO6hQ91vG7QBrqlz7NhJPb/XyBXSmfRDFZLDwVRMNWt?=
 =?iso-8859-1?Q?geiOeS6Q0CYb7oEbSf6yi7X8AEePpAmkLKssFKwgQLg4WKCzqXGFeeuy6J?=
 =?iso-8859-1?Q?SMWmxC+Znf0IEO8PCFvgC19F6vyPtniX3OAxABH4muy3o6n3R+7wx3TvsL?=
 =?iso-8859-1?Q?8SyYqGA6voM2Mc9ZHf69tW/9hvY9pXhiwRWouTCFGllNukXaqBaTuENKHB?=
 =?iso-8859-1?Q?Ar1o8hq5Q1vJnq392+C7KpmcWC3c2BToqOQPXqS5cpBCjJhKl73MvHKYNo?=
 =?iso-8859-1?Q?7GIKHC/NuUhZMY5KvTwTXXbwd34XTkocfpRRlDCyDLBuU9z/gvytOtDENb?=
 =?iso-8859-1?Q?dt/dm1sWZ/6BouB+6Tr9QVLQfpnTtqa0OPPwqCV9hxV6Ql0prhhp0sUo5l?=
 =?iso-8859-1?Q?K+PudKWiyN6XQlPIeR02MMrSfEMUXZ9BgYlIjnL3Hey/R86jpn2MBraE89?=
 =?iso-8859-1?Q?lF90GNVOu4WuGKN1cWrkMRyHD2BbVOwocbOwjoCywP87Y84j1KwCQwNsgE?=
 =?iso-8859-1?Q?3jP4HngjC+iwZ3sCU2SXm4sEJrjgX3wFlRpiY6HLzyVHCmoaL7T30Oo1Lt?=
 =?iso-8859-1?Q?KDBSm3z1i5xh2gj2zMY5sA2dZ+bmTHnEDF007Lrvyil/co8tbJIeJOUreG?=
 =?iso-8859-1?Q?6zBr9qZ30/UVIfRKyy8GpLBpYY6fbamFDxoA8Q7WVqd6srtaXovisu/shG?=
 =?iso-8859-1?Q?R8jRU14+uRZBBG8CUFxmmJkmDv6kViEiWnOw4hv1I4OBuIQ3TuSLFIhkGH?=
 =?iso-8859-1?Q?0XO4x4DTTKh5PjaHhDZJR82yp6bDSGreD/Tbo8gfliIb5Y8Hm4zL6Kb/C4?=
 =?iso-8859-1?Q?247jLw8UAteaWuqiOPu5mg+2iLoONx5FOuhued/zUPzMj2e4juWUks3z7h?=
 =?iso-8859-1?Q?P2JvOoUYB7yjE76ADHP2HviKdVYsc8VaEskmqhtjMWqQm02yfxgrNUHxsd?=
 =?iso-8859-1?Q?x2CxpGrioKnvG4EMdJWsNuL45SQPrviMXsaOtVqouh68ww2YtDMAjsgvFW?=
 =?iso-8859-1?Q?WUekJQ+DZVi7nSxpJu9c5pPAS13OHZB3OMn2NJZUS11djfQTW8W89wSO19?=
 =?iso-8859-1?Q?ocgOHSLwjdzU7hQNCx04J7RtaVZwU1C4EkKdKEs/vsTmDqo1RODCYjN1Y0?=
 =?iso-8859-1?Q?n3lu+0ET7ygVaZbH1XXz27ieks5k/dJJJe24kkXedWwnd8IpBXLTEC3qs5?=
 =?iso-8859-1?Q?5cZ5DodSwIBINM66AFhSfA0kXvUBUjaK3n0xTU7SXVJ/0GEAoq1F+lilLQ?=
 =?iso-8859-1?Q?iax2g3V2VLp3TXp5EthYDvT6G0VwlPByFZDIMDfJQycyU03BScrCScCdoQ?=
 =?iso-8859-1?Q?MqUrdtWzc6kP0Pk1VxoL63j7DMD5F7Q+baFEJkk9RLhFw1nw8uGCWIddAk?=
 =?iso-8859-1?Q?BWk7Oy+BLJt6+8iFaznSijM5+VabO0nGOMRfd9LXJ4fqYWlMrkK8dW/Rhr?=
 =?iso-8859-1?Q?FuPplnOdUzWfQTgDmStqtPuBE=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR02MB7938.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b0d60b8-66e3-40b0-f75b-08d9c01a6be3
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2021 22:29:56.0285 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dx4u/BS+qt03vOJSNuYtEtHjdj8KTFgj24aRDm0bvFusmzDBfNRmU0DUB6Jp3lO9Y55Gyi4/sWj7Sniq19H+Z6SqO10pYf3OvAo4kmKYrpA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB5457
X-Proofpoint-GUID: IKZK1-cG_8KgWlEWiSi0WZ2eA-_48-g7
X-Proofpoint-ORIG-GUID: IKZK1-cG_8KgWlEWiSi0WZ2eA-_48-g7
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

Today if QEMU (or any other VMM) has sent multiple copies of the same
region to a libvhost-user based backend and then attempts to remove the
region, only one instance of the region will be removed, leaving stale
copies of the region in dev->regions[].

This change resolves this by having vu_rem_mem_reg() iterate through all
regions in dev->regions[] and delete all matching regions.

Suggested-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
---
 subprojects/libvhost-user/libvhost-user.c | 27 ++++++++++++-----------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvho=
st-user/libvhost-user.c
index 74a9980194..2f465a4f0e 100644
--- a/subprojects/libvhost-user/libvhost-user.c
+++ b/subprojects/libvhost-user/libvhost-user.c
@@ -809,6 +809,7 @@ static bool
 vu_rem_mem_reg(VuDev *dev, VhostUserMsg *vmsg) {
     VhostUserMemoryRegion m =3D vmsg->payload.memreg.region, *msg_region =
=3D &m;
     int i;
+    bool found =3D false;
=20
     if (vmsg->fd_num !=3D 1 ||
         vmsg->size !=3D sizeof(vmsg->payload.memreg)) {
@@ -831,25 +832,25 @@ vu_rem_mem_reg(VuDev *dev, VhostUserMsg *vmsg) {
             VuDevRegion *r =3D &dev->regions[i];
             void *m =3D (void *) (uintptr_t) r->mmap_addr;
=20
-            if (m) {
+            if (m && !found) {
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
+
+            found =3D true;
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

