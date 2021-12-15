Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F674765F2
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 23:33:01 +0100 (CET)
Received: from localhost ([::1]:57600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxcpX-0005sR-OT
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 17:32:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1mxcmZ-0003Au-HZ
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 17:29:55 -0500
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:24610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1mxcmX-0006GU-EL
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 17:29:54 -0500
Received: from pps.filterd (m0127844.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1BFJxfxs001564;
 Wed, 15 Dec 2021 14:29:50 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=nuSsZrALwAsYsylkfcJhbLBPgLPDA6grM0nZdedhyd4=;
 b=ZE0TdU70Ru7yivNfH09ZGelOewQByWNz4X8SJsP89MahOKk4ka82PoDsaoDkrXoRIe48
 3hLaDF+7+XpL3PhBsp9SSGsren6rvGNU9RKy996cuL5LlKTRWoUDTrkFuIJeRVBi5HlN
 TRp2xKPgCVly+6dR+RK2SBgy7i6lxSsmnfB99eztuBn8zOlACsfp9xLTCq7Uzgmf6iYo
 vsPVl8DozSrPaJS6ur0m7stkDFA2ucYk138Tom4kEkSDYwIY96D2Wbqh69s5v35cLgOA
 nZrRkAb0RUB8cwcg+UivEgW05XztoIFNVzjWhl5bJEtMlkFdtM1eNSyVh+UGOxzh2Jnx fQ== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2175.outbound.protection.outlook.com [104.47.59.175])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3cy9rghyng-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 14:29:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iyvV1inZk75kSAwcDaVLlKfzJT2/rL5BlFxNTL3S4TxD+UtVzTz6Vn8MhvVSt9S3phwEizSienMEISFDy7Xhu6lBoOPN6TIeQf41Ufzp9HHKqMZAXW+I+IdbM2f71WVZU8Mrq3AXUORCAKpWDWMkKhBra/N5t1I2Eqc2/+rnGoMgSYEiY8Kz3IaLe6kEkED5OQ9rN81zdexo3nWxtRLqXgnjPEW9mR5wy8bQEmHOfVzFOKSEOiwqiJbSdM9V/4QqITKxpKAXq4vw0x+HSmO/KVu4xdYZStAcmlCLOdLdUSFIg+n8+80AbhVuRm4zAN2tvUTlV/904i1GfMaHQ2teGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nuSsZrALwAsYsylkfcJhbLBPgLPDA6grM0nZdedhyd4=;
 b=UEVhmSOMdm+l4gwe7resW/6Zpq/3YUrcAyz6AycQkbfrxGwYamEgg55S5krDQFIYZztK2s7ZejU6nNXZsXySWDnQscZkTxa1Aq+1Y9cFrNyic1sVusX5L7+EK3fhQoq9jSbsLhv/8nr6BERaGN7cJ+Bn/jZui2CvTpPhakw1ooRR6v7nK9Z7wAYWShzrm44qYrQAgi4wd1TkzEldwS88RdfGOoHFBUdY4Shv0No8ib2s1gttswWL24haVEvrlHxpTnGeYidzAw+RsFdK/UX4DtpD/jOfZs4biErLEIyafSh9GKgyEqFL/jqJ4T+8eNRA0nOMdulUwltopOdiwctyuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BL3PR02MB7938.namprd02.prod.outlook.com (2603:10b6:208:355::20)
 by BL0PR02MB5457.namprd02.prod.outlook.com (2603:10b6:208:87::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12; Wed, 15 Dec
 2021 22:29:49 +0000
Received: from BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::25f1:c1cf:5f90:35af]) by BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::25f1:c1cf:5f90:35af%8]) with mapi id 15.20.4778.016; Wed, 15 Dec 2021
 22:29:49 +0000
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: "stefanha@redhat.com" <stefanha@redhat.com>, "marcandre.lureau@redhat.com"
 <marcandre.lureau@redhat.com>, "mst@redhat.com" <mst@redhat.com>,
 "david@redhat.com" <david@redhat.com>
Subject: [RFC 1/5] libvhost-user: Add vu_rem_mem_reg input validation
Thread-Topic: [RFC 1/5] libvhost-user: Add vu_rem_mem_reg input validation
Thread-Index: AQHX8gNFcX5r9V9SQEi2GWHMy1c9eg==
Date: Wed, 15 Dec 2021 22:29:48 +0000
Message-ID: <20211215222939.24738-2-raphael.norwitz@nutanix.com>
References: <20211215222939.24738-1-raphael.norwitz@nutanix.com>
In-Reply-To: <20211215222939.24738-1-raphael.norwitz@nutanix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.20.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a6e175b5-7f4d-4968-007a-08d9c01a67a3
x-ms-traffictypediagnostic: BL0PR02MB5457:EE_
x-microsoft-antispam-prvs: <BL0PR02MB54575C5A9833F767B33490D9EA769@BL0PR02MB5457.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:346;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: x1u8cfWtNb3YE6nM5NwXxW6aQ0wBL/O6zLsHfXlMq74D8p2INrF4qBKTkuHVH/iRN9gv/Zfwhj14fz1fTn0UjaFoNPCgxiZNjJnTnDZv5yuqDWtZ8qj3Tgtok9DMjzLoiDznNoP7+hMp9T0T0+5r6qkRNiRMiVKKwnMg1ygAXrxDoGDfmnHxyMuRj/YWCda2Jj/uzK4qvsLL703SafHmKSxOBpe0hxq9TkZ6YEJnqcP7lUtrRMMG705+965N3X5ynHPelrInM1jUdTfcjkBd8/o0FFhDnbSL5pZlOHoSULU+lxl4nmslt9cpWYtEBgL0MRc7nCCBqU3jT8uBEDBUiZP2akrFR1Z29+Lf9zXEytfDQG0YT+pai4aBxmzul0m/kKTt7mD0m2ADUHhpk8OWEboCDC9aQbCREXjQ3enwmLKg96ZPOD3896gTEEjftcCb7tSDJBVlYjjWV5dRe6HoMClabJfcwWIjd1IXAmVOlkydRFiLFXx4O+BAPPRI2xQ/k/vBqqxQT1E77iGimcFmHaTjN8qRU2SroJGeB4NGFaBJPqn3ybvx7qYGlMdmt1PZPqJXxgLLlFIKCFz/BG8i/w3Pbw98/nMvgo1Ee+hXML1/TdNs5pgBMzm60Isf35v8nxhAZ6ZrF7md68SBbAZh+VXyyndaynmTGqB8vLZ27wASE42hbqH5Zqpq582RQ1uPTiaC2ifMPGWfpTKc9zBDPA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR02MB7938.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(2906002)(8936002)(6506007)(8676002)(26005)(1076003)(107886003)(2616005)(316002)(110136005)(122000001)(54906003)(5660300002)(38100700002)(86362001)(38070700005)(66946007)(186003)(4744005)(44832011)(36756003)(66446008)(4326008)(64756008)(66476007)(76116006)(91956017)(6512007)(66556008)(71200400001)(6486002)(508600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?Ao/6giGFOO/NRQIG7N/3am+2f5EsgdeEtqX8fZGdmdgjMeRQyyTlu0pury?=
 =?iso-8859-1?Q?SE/cb97wGmQzC32hqJvHju3p4Fz0iTx5gdvQKwu8h0b85oTlFQ6w/3sZ9I?=
 =?iso-8859-1?Q?HMsGCGovRaNgPjMDgrRzRnS08yDsy04sfcZcYRLvOOjMRdL4llSrawDV2d?=
 =?iso-8859-1?Q?AjL3hxMwgexXrZndw5EBHE7mX2j7yKE1Hiz2p1brO4X65TrhcxB6ILmSPJ?=
 =?iso-8859-1?Q?39yWSrFERP+7AsEQYSIHrgJ3PnWOpDK4tLo9ovozB36m7WLzxxn/2QXYJb?=
 =?iso-8859-1?Q?66cZKhI7hEzVFT3/28Iw+ZrIq2UjhHkwZbCo5Jbl24QA6Toju1QRyMNJQs?=
 =?iso-8859-1?Q?cSHF8EZVNFQOC1i/HKgaIxkTr4lyvTi3VGIBjuYbh6MbhZrvFHuRvYX9DC?=
 =?iso-8859-1?Q?8eFun+ScXO9SDfoAQvCJH7RGoVRzs6Vs3i9mLs81zL6ffb6dG462MfVNpv?=
 =?iso-8859-1?Q?9cnArdAiKYblmNqhmq7DGJbVFdcYluf4MJI+RolIa5eTQosjlIkqzY7P2z?=
 =?iso-8859-1?Q?/snrXMkmPBm2yLcpiABACQWlpuLEgLA8HG/A6Gp9jewT9o4avoYnQos3YE?=
 =?iso-8859-1?Q?/iN6vCnQtnMBeTqgMrAZ6+GRP7Vqbl8I9Lg+Ceol7hSMPdFe5TnqLtav1v?=
 =?iso-8859-1?Q?WlF8Un2FtiszL36DvqRNbmciIaI5gYCEbpFcxkClPi208DkWkwRm2N8t+l?=
 =?iso-8859-1?Q?05V2+jzqfayo0Z2RmAllv2BfwQZSUpc5b0xzeFhLZOOyt1zMbAbYV9Fgh7?=
 =?iso-8859-1?Q?k3e36BSyEcEcD2EcP8gXOHM0gLJqmg2WndKHtBzlhG2uTCjPOQof4AzI3q?=
 =?iso-8859-1?Q?XEEV/WUuJuMqTMdXWERO1FXJ5dVjdCehgCcjAYr0F8ceOQ9zPFq64qBFc2?=
 =?iso-8859-1?Q?TvEGBnle1grEaAX4t5gvs1nGvMjue024w7u45x4l+QgVsKzOunz4MLTSwK?=
 =?iso-8859-1?Q?4HtVvFNjeB8B6lf/Gab6GeuibqHSYzqoC1ia9XgnoyBcS9KM/N4y74DbNV?=
 =?iso-8859-1?Q?L12iShcut2Tu1kwT36omnSQL3MNpPgkOMLa9xctctFLZkKe4RMuc6GFHAs?=
 =?iso-8859-1?Q?QJ2VT7qb6QCatOnAtfBkI9ibm0kRYCbcViQ8JO9mFEuTh3mYQENFFuoFuC?=
 =?iso-8859-1?Q?S+vQzUwgrC6I2C6FuMCKBNq8dTWcEPJxJJzeNBK4hEyik+Xc2lpoBZJax6?=
 =?iso-8859-1?Q?5E/MFaY+YbJVGoiO/rdZbk36xNiEWWfmzaia8iQN+P70w2Bg/P9NQs4aOE?=
 =?iso-8859-1?Q?jN+joik+BOZPlFD8z15B3Nb6z1I18nanxNse2BkZ2/iRrVoIkd38mU0P7Y?=
 =?iso-8859-1?Q?OPo8LHqMgUWdhe8LByM7R4LqcpLTmmAiUjbYF1JA4cdaUZrEpNwl25qqoK?=
 =?iso-8859-1?Q?gNIaicpX+tOCRZNs/y1IJo35h6PFFzUQXe9EOAEicGBKeNQFokl0OHYh61?=
 =?iso-8859-1?Q?NEBLQKvq6Vewn4b1ONHlw3uxJBTJyAkZBKhHkbqtxVtArWK1q4dkLmtWOG?=
 =?iso-8859-1?Q?kF7MXORg1ViSbM4tWQpVJVZf0YYJObs2BQAnfBeyN5L1ndPyfMJXJAQSw6?=
 =?iso-8859-1?Q?E48JMD6WE//ivFuB416i1JLnBzSk+IeB0HqcHTUduU4JNZatHqeG/oD76I?=
 =?iso-8859-1?Q?uI3dman4r83qJbF4Btp545gnt545P1e8cs+AuLCDC+UfFzBrkZMqkIstKp?=
 =?iso-8859-1?Q?zrDw4GWhr4NGjOUM28w8+tFGO+QXPFDW1c5pSUhMJNuZJDNPVpUjGQIrVQ?=
 =?iso-8859-1?Q?5xqoDowZQpX1cz7jBdcoSAtP0=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR02MB7938.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6e175b5-7f4d-4968-007a-08d9c01a67a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2021 22:29:48.8272 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mW+GRqA6yX5AVPhDMBXgsNJyz2+42knZ7gSly10mAkfcWIayRPdT4zghOYpPVAbbfTl9j3ThRwBMgcNzcUxCFNDUjCXlDoCrmBxMWJNhnLo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB5457
X-Proofpoint-ORIG-GUID: 9Qxs6JXegM89ZDS5xH5wGP4OERtka4cB
X-Proofpoint-GUID: 9Qxs6JXegM89ZDS5xH5wGP4OERtka4cB
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

Signed-off-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
---
 subprojects/libvhost-user/libvhost-user.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvho=
st-user/libvhost-user.c
index 787f4d2d4f..573212a83b 100644
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
+        return true;
+    }
+
     DPRINT("Removing region:\n");
     DPRINT("    guest_phys_addr: 0x%016"PRIx64"\n",
            msg_region->guest_phys_addr);
--=20
2.20.1

