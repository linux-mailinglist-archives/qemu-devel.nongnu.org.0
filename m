Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7AA4860D2
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 08:03:42 +0100 (CET)
Received: from localhost ([::1]:57118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5MoI-0001C5-24
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 02:03:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1n5MYs-0001IY-Hl
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 01:47:47 -0500
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:31656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1n5MYn-0003V1-PE
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 01:47:44 -0500
Received: from pps.filterd (m0127837.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 205N5d7l019176;
 Wed, 5 Jan 2022 22:47:38 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=ZrTQuP1eHTblEOoT+tEM5kuaqxctxCDHBQ9CDJqOh44=;
 b=PPJxCig71k7pdQmpum/fUWIAHxZ2ZjgZgqJfpcRGtcZQ8OWRtbxCB/T/1esAvCYY9o6C
 GwRfrowJMIFYS6YdVvE5NfxwX1Wb6GWuJ2PfPeZ2opScZOsw4N6fF95pddgCBkrSHVUJ
 /3FsKyHxI3x8iFMEK+sGdRYKSWZXa+n+j8RSpVO0O2vvJw2KOktAgEvjMtgjghltU2qv
 OUIg3onG4a73V0ulMfi5nRQM/atYK4iXHV6TnRTQsj2do/lK25ejdlLLNEG8GspGyE5X
 vqzozjgS5Dz+jKJ+zfzg2YmpftyoNzSL8Qlf7IKvIzjroAbuR6Lnfi78dIPQVCVFrBxI bw== 
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam08lp2045.outbound.protection.outlook.com [104.47.74.45])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3ddmq00jfr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Jan 2022 22:47:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q8aQQRyDnZd9STGQviU1Qrq87VPPVm4lad5dXmMFwJCbxXKLL+qTIM+87Iaw7JJNGGeAyl08NQ6BkbgqERqpRRkdQJQ+u2YcQvX+6B0GPdhLcwPNMowLesO22yx/F50uwm+DocD3JjCT4DUYzcAUsdKRmm8Yx0tU8Qp3vrFHpCHBTCqM3iLaG/xFu6EH/JebFQ2x5+U4XsKNCkfSfGQuu5JJXIXU3CZwKRlqY8tjtkzjXW+k51Vp+xwkdS90bU/kmhdi+ObQmBGCPAO47FRDRD87VmZD383Pj91ZLBT0tqH8RkOTq8MEcBUxarCdW4UuXOMbNEJPVjDSNJfgL8PrSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZrTQuP1eHTblEOoT+tEM5kuaqxctxCDHBQ9CDJqOh44=;
 b=QEFKi1qAagCwr8jJaSZuD7lZ9/70Ckweq+9uJbVMF4KSg3tVFMKxay7G5aHtgaUWHS39Evf/PalZHK+ndL1IX2hZuuwLUqBbeeJojn3tLQjjtaVxioDjHjQ/rvY/b9GhBdaobhdiTjnKSBk8dctVyO4AhCxgO4tSKjMnoNkd806OWhV5qGZQxAYQTJzlhUvCw1bNMEnNC/BbLdKi/8X4pCpkUkm5WO85dLBOJUeT6igaUFiK8BxkvK9F4gBGB7NDOA7BlCls8sHJTfwbp71QM+NxH1wwHr4SfUlWq5rwM5xDUk8WjRlK/cpe9euUrpsSs9bvkCw+1dZ1+C4JWatw8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BL3PR02MB7938.namprd02.prod.outlook.com (2603:10b6:208:355::20)
 by BL0PR02MB6530.namprd02.prod.outlook.com (2603:10b6:208:1c1::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Thu, 6 Jan
 2022 06:47:36 +0000
Received: from BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::3c2f:b2dd:a0b5:74da]) by BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::3c2f:b2dd:a0b5:74da%6]) with mapi id 15.20.4867.009; Thu, 6 Jan 2022
 06:47:36 +0000
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: "stefanha@redhat.com" <stefanha@redhat.com>, "marcandre.lureau@redhat.com"
 <marcandre.lureau@redhat.com>, "mst@redhat.com" <mst@redhat.com>,
 "david@redhat.com" <david@redhat.com>
Subject: [PATCH v2 5/5] libvhost-user: handle removal of identical regions
Thread-Topic: [PATCH v2 5/5] libvhost-user: handle removal of identical regions
Thread-Index: AQHYAslKMYrBF8S8f06BB/viZEFlKA==
Date: Thu, 6 Jan 2022 06:47:36 +0000
Message-ID: <20220106064717.7477-6-raphael.norwitz@nutanix.com>
References: <20220106064717.7477-1-raphael.norwitz@nutanix.com>
In-Reply-To: <20220106064717.7477-1-raphael.norwitz@nutanix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.20.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 03b978db-8063-40c0-7a50-08d9d0e06cc2
x-ms-traffictypediagnostic: BL0PR02MB6530:EE_
x-microsoft-antispam-prvs: <BL0PR02MB653044090EFF18CF4F247D3EEA4C9@BL0PR02MB6530.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Pw5pouep6/AOUedVSglUWzaVqpS+Ed6kMsxGeBh+uMJMyMpCZhenBrNp3w9eEUE4JbjbTWrchlrxo+KgUUVg1sEOGpFuJXNttuD27pRYETpNtyiLAkVvF2PpzKkOeV98D4gIsQpUXM++QOjnHO8M3x4oHMaerIi5yxZpWdgwP3XR3WhHZkNyUFHZYX5PDciBsOeWFNGR8IeYLlmmGP9URvNEkFmR31fR27FTx1Xwe3Sr06zP6647jPgOtn7A1+dmYb2xweUhgZNuVwyPqa+UGJjQyF6hmUGN49CXGlcMfgLoJ8fVWSsgPA/S2vDvHYCMGhw+BrqRMfwbagQPm1W9IezxVHVde7BesedlMaYcz8Oehm5DRORhegN3yRXVwmhmclJ5mcVAfkJ69AzCnXuogZ4Ussltievn0dY18cf34NMXveAraiNWssYw0vopi71SdK9GDa3p1HjuFhVXGrYzIKUc1sMiRWiSPGPKrevULDsiTu/aJyDY/SSo0PX/gNd930JA0C96xblm7Rv7z5eqV1elIv+Apto2pJypYamJwMMur1K4PWWQ5QJCsq3feokuh6GnHzXxhlHkn6m8oHY0d9P5MoVR5zT75GWk0H8b38Wp0Rti6ZMMIV9yxE88OygW4wdpZmr451wHKDv5ioVjVsZ/3PIkp8WMU1thrdTQGm/OvmQG1rZ+ekVRCysKLohGqnaEzDHPnCg3Nn/3XiveFA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR02MB7938.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6506007)(508600001)(66446008)(4326008)(76116006)(186003)(2906002)(316002)(122000001)(6512007)(66476007)(71200400001)(66556008)(66946007)(5660300002)(91956017)(64756008)(54906003)(6486002)(38070700005)(110136005)(44832011)(36756003)(83380400001)(1076003)(2616005)(38100700002)(86362001)(107886003)(8676002)(26005)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?fXUa9lvxLIUS/TFyyWskE1tODQEshw1n3W8DyLf/9nj7An3yx38ujyO04r?=
 =?iso-8859-1?Q?z+/YaYXbR9KHdvzPiu2qQseT8RR4geepgCcEXL2NPmKoRoqoCB3GrGlNo/?=
 =?iso-8859-1?Q?MVAY8dWTRvxUoJdbwjerkowZAsT63QWvD53Lar9gQkq0t//LUosIzeSCca?=
 =?iso-8859-1?Q?pegcOX5JGF1IyTAz2C0MESUm4yDCsDqWf3nfQ97P16IylbwLBjAfWiVnFQ?=
 =?iso-8859-1?Q?z7KCxIGrj4Vu3ogiFmaiNbIgXonumSwJZsyOBOS6/boc53tks72owRFXE1?=
 =?iso-8859-1?Q?2OP+GwWSasm8ZUErHoAXoGy8immSpkt92kNNza8+jwtoOtXb5QjvI1eEFx?=
 =?iso-8859-1?Q?0/sc6fG82RpKvcG/QqTW8SSycGRdhMGzMhcE2h3wz0jI+NQctlRhmWS6Kl?=
 =?iso-8859-1?Q?0J5hN8+qjw2ogKeEdcBL+SdQskr1wv59N8s3csa7ED+AX1ekR0v+kpDAhK?=
 =?iso-8859-1?Q?LHnzTbmP27N4p7s4hHajn3G6NhdTsbW0AFhA2Vid5hnjJW22bs+vpe1Sa2?=
 =?iso-8859-1?Q?NC9PBK/Dl1JCNEqDnsADnIah1f+659nyKDKcswOcFww30iTNWKRQtW93BH?=
 =?iso-8859-1?Q?nyNtuCVRJr9KaSWothvCbFsotj9FiETZC5jeXemYdGOJkXhTxD6jyAjPOY?=
 =?iso-8859-1?Q?IuCG/iiumuxrsLLCapZwvhKilDY9hsOd+uLF8UewPD91m8UlJLuaLg31RS?=
 =?iso-8859-1?Q?T04a9wfNh5zHvB18bCulEmvqObL0NmaAe5t6T9T/JYQbrJsidvNcVviiNw?=
 =?iso-8859-1?Q?danxwz+Z6awChbdIUNPwDmGC8QsCl5WD5XKW7XWeRq9yz/9IHsy6NrmN3S?=
 =?iso-8859-1?Q?tA8k94eHvvSLvr4++enQOvlulxwMefy5dyBnd6WtyNavP4Z8Fs0RYxOuFQ?=
 =?iso-8859-1?Q?8W8EHXnh21aGPw74j0vOZWb73JE7i51ZL3XeQ4o0SxEv9WpJDSpa5OFC7L?=
 =?iso-8859-1?Q?W2kf235QDc5XUIhh+p/Mf7oSAxw4moOG6PSYrVP/6a8j9EwbaBHyaqFKJB?=
 =?iso-8859-1?Q?Q5Ndjjp/5sJn0lWES8V1UHiRXWICrJVqoTk4z11WhQa1K69JisAs6DDcaq?=
 =?iso-8859-1?Q?9SLGoZw99LSQUMX7w+b7VgodsAUEQrc9B060dPCD9Rx7xMLJ5csRD6wddr?=
 =?iso-8859-1?Q?l5eyU3i5PTxHjM2yHkZA2obbeJz8X4sfqSS5LnLZ5wHt22Y77FkyvhJ69F?=
 =?iso-8859-1?Q?+WuOB1Ey1ZpAlZRAcv+HQ/n63Rpyj2F6u/dMtD2mJLA0fiKM0M6Cq07OZV?=
 =?iso-8859-1?Q?/mXTipORxjK53zjJ0YESFnMDsi0DbuGMrE7//vx+SL/3u7+ueCVtvuljem?=
 =?iso-8859-1?Q?giDSRfRjwckd7AAM3EP6AsD13nw+lEPUvQXGW4nQufb8YMkU7p9s52tuoi?=
 =?iso-8859-1?Q?vUCLteBoRDqoSJqtHV9HAy4++8X1igXh3wyizmMk0kIKIMEGz4n3sIOty9?=
 =?iso-8859-1?Q?CaepnW6ihfq6avvMHGvfauEdFbd/2jk88EuaRHAuTu4lB+2uAjFl6GngYh?=
 =?iso-8859-1?Q?jlVFfmtSr1kl0VNHur79h4fO4ipXn1HE2g5eGfkuEQl9KULkZqcDdqJVix?=
 =?iso-8859-1?Q?MonIp9OlEMtgjpG9Fw6QFZUw9aRFP/NchRAGdUfDweYbcykRThexZ3wy2b?=
 =?iso-8859-1?Q?NOsKgxxsyN+N2jh+zU3V6O8yj2ohxdY2fC9RD3h13WbNNDa/Qjor4H4wdM?=
 =?iso-8859-1?Q?r1tZspTIIaiEKYFQJBoOmuB9PdWQAMd7yY4G1cJdqHao+HwvIKjHJVhemn?=
 =?iso-8859-1?Q?qrbkbaJGdr01WFmiV2TQeHANk=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR02MB7938.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03b978db-8063-40c0-7a50-08d9d0e06cc2
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2022 06:47:36.4947 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tHMYcmLKnxLV8fDNZPRrTza7mm0WkOs8pcLIiXFsBCL//6CzlDptRCtNxTC3CM5j4O0pGuEJP3V9P4kRxGE8g5a2OgC4XZW9AwyxBV+cfgs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB6530
X-Proofpoint-GUID: nS8F8BA3yL98RDbFgxyETmujc271kkmj
X-Proofpoint-ORIG-GUID: nS8F8BA3yL98RDbFgxyETmujc271kkmj
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

Today if QEMU (or any other VMM) has sent multiple copies of the same
region to a libvhost-user based backend and then attempts to remove the
region, only one instance of the region will be removed, leaving stale
copies of the region in dev->regions[].

This change resolves this by having vu_rem_mem_reg() iterate through all
regions in dev->regions[] and delete all matching regions.

Suggested-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
---
 subprojects/libvhost-user/libvhost-user.c | 26 ++++++++++++-----------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvho=
st-user/libvhost-user.c
index 0fe3aa155b..14482484d3 100644
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
@@ -835,21 +836,22 @@ vu_rem_mem_reg(VuDev *dev, VhostUserMsg *vmsg) {
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

