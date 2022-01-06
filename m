Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 310464860CA
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 07:58:46 +0100 (CET)
Received: from localhost ([::1]:49606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5MjV-0004Yn-7d
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 01:58:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1n5MYn-0001HW-BR
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 01:47:41 -0500
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:47998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1n5MYi-0003Ul-0V
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 01:47:37 -0500
Received: from pps.filterd (m0127838.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 205N5oQF020173;
 Wed, 5 Jan 2022 22:47:33 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=Of0L9UWpNJycxFbG078adlk+uLZxh/IDEXkvRnBStbI=;
 b=T+um8xfG1q3IZKW3Y3adJLkWVSiWJ9hFMXMo4iTxxBf03zNSEXS0iIk42MzsoLpmrDyz
 F+s0zRDROUM7xqEIOuBpcdRQrOtlISzKQFNF29bJTYPkdd8bPtr+hLOdk6rYxFrWgQtc
 GuIpI4hcKT+ndXpAVuMFYTBoaMj9bKu4suG5QbAanEBdkn52vpk0nvI25DLe7NqiEzsU
 if4YGM+WqiLiHNY5A/ZrD6NNhMAzLZEhVmym/+pov3WlZ2oTRTNLA+ycbA3bZZssK+Em
 dRgKJzdt7N6DnIQZP3fQ8P5o3RxqgSmbr8GXHnYWkqMlkr+Y4g2UOIzTB9ZzKf6qW4sM KQ== 
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam08lp2049.outbound.protection.outlook.com [104.47.74.49])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3ddmpyrjmj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Jan 2022 22:47:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FcS7n1PFsiGodrwxEFCMHsCCwWx2izF1xAq+WOpjDcq2oZlTidSgcu+uXVcdomAj1ZZMSlwhlxX62FwChI706wjypWo5Z3g9h9BzY+YZlZpCIK6If8W2hqm+Z5JJz7A8SyvUKjZJuGRHmsI1KGNCqerONTL3cTCyZoPrOV8NBKfzVvQ7x4Y+GrET8A9JxaZr+HxYuBhuKZ8Kh1TCQgl1UJibeLf530X/4FpNZ19GqR4l5Oqq/SMWkqAU9A03Aj1+iVVH67FhrSRslpRsi/N7wou/Wi/0hykriViHu3jNrog4fo2w5ycw44xJEt+uKD1c7+GCpZJYg+xjl4WRusIsow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Of0L9UWpNJycxFbG078adlk+uLZxh/IDEXkvRnBStbI=;
 b=GtwfNpbO2kPPd2ficnJRU/XUnJaKtGr2MZDhrCpj6i/vHzSHgNA4ejLmb30u+jFQOXgCvtCWRLjN7wU3rMiBiUwI6xzMUuqwSjioLEWc3A4F6eATW7KitkhJpbegJEFZbZc1YruhSIpTGOjRG9+KRIZZ7NJwZyfiJTlergLOlFD39DiDy+7yxgTB7tSWE7YitkpkIS/ypgLMfAtZ6oJRmPtxOEKUCkWaTPsmR5c6ndkPn1euOanvAOcICE65lQ9p0BjMXRw6NFXaiatathG0UqPj4nM3g3OW/AvFvXv0QyzrjC+m56KS9qN5OHIaH4cix9V8pT26uIi5lg1TiZFZjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BL3PR02MB7938.namprd02.prod.outlook.com (2603:10b6:208:355::20)
 by BL0PR02MB6530.namprd02.prod.outlook.com (2603:10b6:208:1c1::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Thu, 6 Jan
 2022 06:47:32 +0000
Received: from BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::3c2f:b2dd:a0b5:74da]) by BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::3c2f:b2dd:a0b5:74da%6]) with mapi id 15.20.4867.009; Thu, 6 Jan 2022
 06:47:32 +0000
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: "stefanha@redhat.com" <stefanha@redhat.com>, "marcandre.lureau@redhat.com"
 <marcandre.lureau@redhat.com>, "mst@redhat.com" <mst@redhat.com>,
 "david@redhat.com" <david@redhat.com>
Subject: [PATCH v2 2/5] libvhost-user: Add vu_add_mem_reg input validation
Thread-Topic: [PATCH v2 2/5] libvhost-user: Add vu_add_mem_reg input validation
Thread-Index: AQHYAslH9uxqbChK6kiVnTDL8kYa4A==
Date: Thu, 6 Jan 2022 06:47:32 +0000
Message-ID: <20220106064717.7477-3-raphael.norwitz@nutanix.com>
References: <20220106064717.7477-1-raphael.norwitz@nutanix.com>
In-Reply-To: <20220106064717.7477-1-raphael.norwitz@nutanix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.20.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 520d4760-94ef-43d6-71ac-08d9d0e06a26
x-ms-traffictypediagnostic: BL0PR02MB6530:EE_
x-microsoft-antispam-prvs: <BL0PR02MB6530E7CD9B6787B6D5432393EA4C9@BL0PR02MB6530.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:2803;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HdZdbeF6aAv51vgd79dk9fQeb8sWQfUZ2t4jbskdCFcBbthrL45/AanFLxqFrStYE3krTkCcuxRuCC3RmODoKF/suao05gu/r3aC6sAx2WEJ+7qhvF3UFAI0EIiEuZmVBUzVFlgvzZX8xJ6hN34JoPPKERNQiR8Yw78om7xMcgkISZyJPB/4bFqMeNgbh6PEhorHfa6mpccziVudXXZLzCBZmrnTZkbo//djhTkuDlJypfMScnJzxa7uUg2j0yRqUmzlfq2mBnECySy2cBPKm6vYiUFlvcAOsLdGK5m1Z3QtpWBfLrr67YkCEeKWBO50HqipbIg5qJaqvCKDFxlUpLEP1dcrj8mhN81DbqBiWkGale19JHp8zM/o2mvMpuqOBatLLl6lj6XpJCs7c1+mmrCtPrANAWzSrZCLKqihhh4M1JbnMzfcmI8A/j3KzOYkolc/bx0qxHp8NjsSAobLaQLff5I9UEvBLDDo/5GG/k3rKPyLI/B0vFgXje9kceL4ZbphuoHM3P1sFKCBHR4jPLgC0uqYEbUSDeX8FAHlgnf5ft0pZtRM/8kz+c3BUAF6GlIp0cyWFxbsKnC3P2cqx0hrbMZvYnbTz2n/xZlirpiZXdTfngVWLcLzhNU8ofGv5hvQAUqf9fHBTXC3ahxraorLtorXK0/X1oVhPA2cSy0zTjLgOQ7Cd6LKt+He8Kh9NXNuvWmIr8PQmd5ZXDJcog==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR02MB7938.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6506007)(508600001)(66446008)(4326008)(76116006)(186003)(2906002)(316002)(4744005)(122000001)(6512007)(66476007)(71200400001)(66556008)(66946007)(5660300002)(91956017)(64756008)(54906003)(6486002)(38070700005)(110136005)(44832011)(36756003)(1076003)(2616005)(38100700002)(86362001)(107886003)(8676002)(26005)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?TAznErh1kOCifxRWReSTMBJjec0q7R4gx6mnfCq1bSWH9tETpNogzDhzuB?=
 =?iso-8859-1?Q?2V/oWObCaMtf1ZpuzD2SLwXXmvYYTppoUh12CnqZ75J7uRM4ng4D4M+sxt?=
 =?iso-8859-1?Q?3bTOD/as9PF8Ankg/yCN296KacvbThbc6DujKFBX3UyR/bJXPeCk+Acdyr?=
 =?iso-8859-1?Q?o7DntDbvmS6EcR8Sc9hWZgBZhMHPz5jsJ7WQ0EOmch6zgyILo1ptukt169?=
 =?iso-8859-1?Q?emaYPHySqDdOduEI8T6aKX+K66qoeYYUi1FMAndZhmKDdKjKbpwo8pPkKL?=
 =?iso-8859-1?Q?ttcxOf8D9UzhCnTAkqJz3VmXakw40S0ZN1myErDlVC6ONX6RC+jWawnBaW?=
 =?iso-8859-1?Q?+qBV5iF273Cw6mpnOlIPgS2kOWDD2In5TSqQTC/RsvA7UW6kDaJfGRscgz?=
 =?iso-8859-1?Q?uyItAq5aoMdm7RIPsToYJ9cXAOyedTIngbhMi7ccDLbp1Hfr5l0IkjsbGl?=
 =?iso-8859-1?Q?F38dTmZOdedUgGEiI9D0oSb3+rM8dv6HTTxgIYzu2hHNQbORk3TUbqHxmB?=
 =?iso-8859-1?Q?ejvPARjQTxHL+5oeMrg7IaRnWaN/rdVMY4n6+ZgJSJc+FqswcPpHHjVQ3u?=
 =?iso-8859-1?Q?6nzOWcqs+YlG0OaG88bYomqShiDmXrepq2LkszXPA12VkxNGGHX0lk3A94?=
 =?iso-8859-1?Q?sEjHDwnqzex1n2eXRyyJ32szNOCe3EsGgn9fcfO0j8Grb92PikvcWP6Rkt?=
 =?iso-8859-1?Q?x3R9hT+Na+nQxLBirt2/WJx3gC5ETqdQAbC/+I7rer8p08YcFN/YGl7VAJ?=
 =?iso-8859-1?Q?a2NzLr2Fb0JBeNb6yPKFX7xqi5OF68tdSLo8zfVpI816GI4waxd+tTPTFp?=
 =?iso-8859-1?Q?l17Zg7GuN/GLeiB72M2y1EaMhAVHsEonwBNki89HYg3djee9ovC8Vxf9Dj?=
 =?iso-8859-1?Q?1FCrznrIJzEYMjY4/iUm57Fkv1apPWnjgu79GMUugaedAE1jDkzaKwILBZ?=
 =?iso-8859-1?Q?xktTRi07TT/OW+PN8xFX+vWHkqynt1IMYU6Ivspd6OKsRT7NLqXosvxsT4?=
 =?iso-8859-1?Q?CHn/1qV0coahkIfErcMkOYz5DH7fDF7lOVZ+bMRZLLwLKJfCF4IGNogw3S?=
 =?iso-8859-1?Q?X53VAqCj9N5fIwMbDsf7axdkJcPwcpAUW+1ghKdqOBHXwhL/aB9JW6mAiC?=
 =?iso-8859-1?Q?wYEE1NJKn8uUpcPdjkLjSqZYdlhobqb2fTNOCKJDZ4hh9U8OneUhPp303R?=
 =?iso-8859-1?Q?t9zZGCI9yFuWrzkWj5r40VTso2RbeR0MgdgpWtyB+1PT3iHGdNgEtaJee1?=
 =?iso-8859-1?Q?tX3WSlqtjVX8nBWe9clBPUYzc/9eSTmCDPXSnLNXOq9bie2TTJz94uj4JV?=
 =?iso-8859-1?Q?qws8yw87KFu45w401fk8xO1Mtm0qU+kPgdhJbJuhUIlUf7qSAZMUFn5cM9?=
 =?iso-8859-1?Q?ubiv9n3t05af6XR8YxT/jS3FLKNoNiBbHfei5apN4Ub8HrKeU4DSNCMons?=
 =?iso-8859-1?Q?h7Yy/dwfqnBIuS1qYPWsRKZAbCdiM4zxeYq4E1lZAmxMoslEygx+549pyB?=
 =?iso-8859-1?Q?GSkqnS/VdAm/54DliGuVa1VMLbuRHyVZuG9p19wA/5eSArp4mFBTAwNUZx?=
 =?iso-8859-1?Q?UJnCaJsMWvqSIKWoYoxOufHrsieVQVVssIIevP2VNz17ukJPSyU9L+c/3Z?=
 =?iso-8859-1?Q?vAFLBCjeaJFXQKCh0ZVi+5ShJI+4kFGiRLmBlmPFZoEgAo8poLKH8hGuAM?=
 =?iso-8859-1?Q?RoF1JQSFuPvU8oqpwy0UoI8Vt9Ae8FjQcViks13DaG/QrxHYirLyfBRayv?=
 =?iso-8859-1?Q?HrvkcSczUbS52q0xVncgQP0ZI=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR02MB7938.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 520d4760-94ef-43d6-71ac-08d9d0e06a26
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2022 06:47:32.1479 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lki6QXtIaDJv350jqlLqRu2n0qoAVgXqjcKCB5PJ7rBLcIGs01jlPpP6obJ1Jmrt63FE+TfHjS4ISaO5agq8jsiZbckNCEmDDxYU50TtQ0s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB6530
X-Proofpoint-ORIG-GUID: eK3POZApj5LLiZV34XxQDx3Y8eHXQwTb
X-Proofpoint-GUID: eK3POZApj5LLiZV34XxQDx3Y8eHXQwTb
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
index a6dadeb637..d61285e991 100644
--- a/subprojects/libvhost-user/libvhost-user.c
+++ b/subprojects/libvhost-user/libvhost-user.c
@@ -690,6 +690,12 @@ vu_add_mem_reg(VuDev *dev, VhostUserMsg *vmsg) {
     VuDevRegion *dev_region =3D &dev->regions[dev->nregions];
     void *mmap_addr;
=20
+    if (vmsg->fd_num !=3D 1 ||
+        vmsg->size !=3D sizeof(vmsg->payload.memreg)) {
+        vu_panic(dev, "VHOST_USER_REM_MEM_REG received multiple regions");
+        return false;
+    }
+
     /*
      * If we are in postcopy mode and we receive a u64 payload with a 0 va=
lue
      * we know all the postcopy client bases have been received, and we
--=20
2.20.1

