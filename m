Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0EA04860CB
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 07:58:58 +0100 (CET)
Received: from localhost ([::1]:50158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5Mjh-0004vH-Fc
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 01:58:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1n5MYs-0001IZ-H0
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 01:47:47 -0500
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:1098)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1n5MYn-0003Uw-2P
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 01:47:43 -0500
Received: from pps.filterd (m0127840.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 205N628a016432;
 Wed, 5 Jan 2022 22:47:36 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=MEZI3WWwaeRzhGLs5aY3IKOUbNaBKGQl8ojrvdWtvOA=;
 b=PS8dkQxDJWeUBfueYIFFN2rQSAmqyBAclzQGWQ0XoNZQ8bIVPx9txyT7rHjyER4v7Zul
 eHi0OO4yd1ANn68sDW1IHApTwEegU9f7UT+ParQbXNptTf0g8Axb53CF7tzBUOYR4VLi
 ZoTrCL/RQhdEp2JH/QZ5KL5yKp0MgUa1pHWtt51IMK0UemCM1X/DOZV+UayNcLnzn46D
 9N2x+RVbP1U8DmB5aG3nLQCjCLF7o74W69D9sauoggMMND1y5iVXKCIB4ZzWutV6JBCc
 8nYhvI8fgNXPQnHJdsme2QW4ee8ubwG7Wf+IlWPrX4DA4tLJM/V5+NnIhcaPLT6e6yyr sg== 
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam08lp2047.outbound.protection.outlook.com [104.47.74.47])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3ddmq0rjs8-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Jan 2022 22:47:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QI1dFhzhfJ8AMkMKKCrf2IyVIr9spDq6c9efxW0WeoV3vAhnjEKu6mzuJZ9xiPa4dp2rF4pcOyj6+dmRTAmYmKR0hX8vkzYh2ZfFL9IgSBe3BQ4OCPG9GYCjjCqCPn/pe6WW3HxzpS5f5xYaYYeSznnqbb9cKXAmZrRZ1dXvxCJkaGxsanKqB1uyNfhT18x34PFA7zV/4ZlZC+auu6ndeGhzPQ57GBFOSGq6K1csb49Ddjv+A6ExLR7tGW5oE+IhQBDyyWd2ja6GZ5xcs5Djn3X8SD5UbW5Jizf7TKm0B/5uyOvVKf0Xh2mGAU9/z4snoV2pJYZhjCVtAjvGi4QD3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MEZI3WWwaeRzhGLs5aY3IKOUbNaBKGQl8ojrvdWtvOA=;
 b=hiWTHFokE7MotXS9WXtyHIxJmFIDvSxOiqQXIjaOGmmR30DeuZ+jf4GZGHQe8yA7jviSfMkJi388Fue9RtfbdwkLIGM3LDXriEx6BQScYkVfuv2V28pMHT+6mlpmrGGhB+m4GQSCHFROn1yLq1NKJcNvjboBcz+mzZe+ZRjk67eTT8EonqwrCApWZmomV4iT1ox/Qk17//lDz1cjak+cV422HhtJpiiWEccuylNJ2KFcrVbgETbQzMUsuY6fIR5bG3g+jBiX1XbnYJiwE9+AghqySn8JVoSmIJMANh2nS41AHfPhPywBPYXmMy1hA185LH4st00IUs1eBReoEdV/MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BL3PR02MB7938.namprd02.prod.outlook.com (2603:10b6:208:355::20)
 by BL0PR02MB6530.namprd02.prod.outlook.com (2603:10b6:208:1c1::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Thu, 6 Jan
 2022 06:47:35 +0000
Received: from BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::3c2f:b2dd:a0b5:74da]) by BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::3c2f:b2dd:a0b5:74da%6]) with mapi id 15.20.4867.009; Thu, 6 Jan 2022
 06:47:35 +0000
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: "stefanha@redhat.com" <stefanha@redhat.com>, "marcandre.lureau@redhat.com"
 <marcandre.lureau@redhat.com>, "mst@redhat.com" <mst@redhat.com>,
 "david@redhat.com" <david@redhat.com>
Subject: [PATCH v2 4/5] libvhost-user: prevent over-running max RAM slots
Thread-Topic: [PATCH v2 4/5] libvhost-user: prevent over-running max RAM slots
Thread-Index: AQHYAslJrasaFPyjv0K0XNFW9OKltQ==
Date: Thu, 6 Jan 2022 06:47:35 +0000
Message-ID: <20220106064717.7477-5-raphael.norwitz@nutanix.com>
References: <20220106064717.7477-1-raphael.norwitz@nutanix.com>
In-Reply-To: <20220106064717.7477-1-raphael.norwitz@nutanix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.20.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ba1ae7a6-2685-4aa4-a0af-08d9d0e06c03
x-ms-traffictypediagnostic: BL0PR02MB6530:EE_
x-microsoft-antispam-prvs: <BL0PR02MB653021A24A0E9AA394DFC1B2EA4C9@BL0PR02MB6530.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:2733;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RzC4y1ognNOu+iS9MJRSZDZ3Cv3zXwqZ1KjaCu/SiMs3h9fuqFmTb60a/gDV0PTDoAUKv+F/QDJqxqSEh4BHpdAcLhrMgBkMBPJH8MmvgqeGbr0XtDD1Q1UGV7Bns5KIWBOLdsPsk0sNaYtH6zDbytw6ncOA/j5iJ97LvJuKgOJXjalMQwQVQdbvvq36TXw1Km2KpX+zRkhj/zW14BL+2vaujhEMwneRp9YiIrX4jF0e9ncHnBt6lygNBhG2HpTHjrOFKW6gRokYC2tfeK5ILT4Y4bL9ib0x5e22qyAghHZOACLWURBV6gUOq3Cmt39kWkMlppp3Hv2srXZfLr2nHDmOx+XWWjBzLyk1YBZyRw3y0owNHIz/s0H4sx8hVaeHIC4Dv39hKacNJiuV4qfHiBwpBlqUOqAKqYEXbd5uPRTDhseNJTv8bP1MKA1TSjVH37hsZMktb/MxeJyFCGdxjE5MTahHtclWRSPAxAtlHWYSn3XRoJoHbDfTZibOhLRu6ioL3TcUSQQD7kk39f1h3iA5E0KXNEhk35+JVlrIJ1YZidsEt4WS92IlfS7gs+pkLLqMyquWruIwaNZM3GRzKG5uLXj06PV/Zd4ZMFiXQgAtNsVRpfP7fUuxEJ+caKCCa+uhM+YpiS39G3DHTqFGEf0WjfJXSh+3qrM6rqlaTV/EgZlmK9iPnu7sJKcJ5vVIwecFKaiUzOkIEooIbxkkMQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR02MB7938.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6506007)(508600001)(66446008)(4326008)(76116006)(186003)(2906002)(316002)(122000001)(6512007)(66476007)(71200400001)(66556008)(66946007)(5660300002)(91956017)(64756008)(54906003)(6486002)(38070700005)(110136005)(44832011)(36756003)(83380400001)(1076003)(2616005)(38100700002)(86362001)(107886003)(8676002)(26005)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?k8vm5GNXAv/JcUAV2SJVS5UEJBqxiFrpqBKsdXom+YsqjeNP4A4zWo6cx+?=
 =?iso-8859-1?Q?E9eXU9h3UUwvB7ohCcg/pXato9ISOEukM1xyAq3c+aPoHZ4qGPYhzqx3Y/?=
 =?iso-8859-1?Q?XyXP26FSHOOgZQOSmxw7ER1HT6/MI8uNAfd3ICY2bbxAi0yG8G3oUmMAq8?=
 =?iso-8859-1?Q?RSagTE6ZzVRdyemV5QQA4NWB1r+VrJIFcev/M08BDyP4CPVHiE0q32NImQ?=
 =?iso-8859-1?Q?fVZaIj9LpDxGjunOWTB8Yx/Xg4tnTcy1QHaaNeNnyjfY7d4LNzJulp3Awn?=
 =?iso-8859-1?Q?opHjV9eMqahUE83cj3ZJnblxTFMan0hgQujzXbuAznyqmpw0/gGELW8FzV?=
 =?iso-8859-1?Q?PZQDW+z/pJA5lrwTuhk/oQdqKW4DD4DkUmDzXCsYQK0uo3rcRNN0b62MEB?=
 =?iso-8859-1?Q?TZrgmEYNjcFga+MzHk1GKETk0CfKS3zbMH9fAuTXS+FhV+MTfkUXAzxvKy?=
 =?iso-8859-1?Q?zBGCbhGmj55272W143Xn0pN9G2pQL4uaKr+NrXtKL3YXWU0nOST+MbWlCy?=
 =?iso-8859-1?Q?TOOYKZpn+oyGI+Yi+Q3Dv7C7WaxMGGtHkkHc84SUlDovvTE7Kb4kvVom2n?=
 =?iso-8859-1?Q?gXZURul+JdqJa/MlhN40v+UUJUYSdX2zOydW10TGKfVPbz+GSBnwvVWxti?=
 =?iso-8859-1?Q?yx2PIDNVRyaOepFENR4C5gaZ7Cszz9ThP/oZuhPlVHgxOo2VW1L/Yx6xON?=
 =?iso-8859-1?Q?96U9+kzIEqS6djUHLb2QqkfLfyNVXol77ziVJQs9w92UmE04GY9RGg7naZ?=
 =?iso-8859-1?Q?Vl9zD6raQ4nniE9JYB3Y2RhjUSVmugvdPCe60SoDyrYa5IfzrDLiyZRars?=
 =?iso-8859-1?Q?tFGG+8a0MAL+v2f2jRWtieyNM1+w3xhXsJoHdjJ005a0E5LvMqa/2he2IK?=
 =?iso-8859-1?Q?p3HaQP5oMTGQ7N/kWdR9MonATviDRFAYh8rRg17bLu5IxnqLlZ8ZzaU5Th?=
 =?iso-8859-1?Q?fwAKQrc+xSXtRCR7kpWlRHwC5gf283pr/xx/HPajdwFXTPAwkHWRhi4rud?=
 =?iso-8859-1?Q?aOtkiZxlvBrW1NvzIxnvX6Dq5XHeATtQt+9sUV1/q0pYbDyTGYHx/mhN+3?=
 =?iso-8859-1?Q?MXtW4tY4nJ8Cr3VfhIyfotHOvLyxXsqMGnNzrLylcZ7yo6ppGg7aAjhFiN?=
 =?iso-8859-1?Q?jhgyJcaiNJgfupl6YJXLTYUYXjj0QYWkijFaIDkEsyRPuvu4eadNp8bEg7?=
 =?iso-8859-1?Q?VrMTZn4d0PIMVDAvlJHu6DeOMuRnxTR/Y1q5Ic8g30wF/eGOT0m+lWtv2u?=
 =?iso-8859-1?Q?DQMPOa257Dv8UycJT5tYJ1LK/N3OhNl3lwFPe128VOIs7+yjy/bQIaC1vQ?=
 =?iso-8859-1?Q?0DSjD55U4o7SJB1+KrZiC69VYEXJPMmtIlJbSwqBr5+ANs6DWKFQlzcCLN?=
 =?iso-8859-1?Q?zhBspcbXjJt1z5GD7+omN3nTOP1hAQe6dA539Xjj6i8nqy6zpILksdRE0W?=
 =?iso-8859-1?Q?qNeY04UhzTgvw5+ieeZXWUxUc5RTIN1I/CPW6GnHCmhnFumRBMbUg4yLtm?=
 =?iso-8859-1?Q?JhjgbwesOp3r/PMqU67P/2XNQD+rn9FED34M+w1f8pbCBqdUs2nGWP/Hoe?=
 =?iso-8859-1?Q?Sog16dcUj1Gp9QB9pKqD3yqNWjkONS88YbjvMEiaxIfQuv5O0kZfTq4iV3?=
 =?iso-8859-1?Q?UFEEURLy8+34bwk/XXmoEI6/aug2eaqsqTTYuYTV6QFCCfgwL+Qx6lEPOW?=
 =?iso-8859-1?Q?Zw/zACTAK1k6NLBhFsHVNaEW8Mi7QoP3Fhfe03kaVFsxLMgdvTfOz+Izib?=
 =?iso-8859-1?Q?o8jL9qn4YnGf7+eyKtq8Wy6dc=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR02MB7938.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba1ae7a6-2685-4aa4-a0af-08d9d0e06c03
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2022 06:47:35.2284 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Uz+jsgBm3WytbvA59QJMb2VLGcFNzifcZgtTiLmlFEjMqvUhMSijqpwcu8AxXVYPHWPN32QHLsU5ZDQZQgzVOl1kXQz/zcCddvTIwS9zmKI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB6530
X-Proofpoint-GUID: N4uW55kKUwVJOOv5Hg74LTrYFJw63MDG
X-Proofpoint-ORIG-GUID: N4uW55kKUwVJOOv5Hg74LTrYFJw63MDG
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

When VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS support was added to
libvhost-user, no guardrails were added to protect against QEMU
attempting to hot-add too many RAM slots to a VM with a libvhost-user
based backed attached.

This change adds the missing error handling by introducing a check on
the number of RAM slots the device has available before proceeding to
process the VHOST_USER_ADD_MEM_REG message.

Suggested-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
---
 subprojects/libvhost-user/libvhost-user.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvho=
st-user/libvhost-user.c
index 77ddc96ddf..0fe3aa155b 100644
--- a/subprojects/libvhost-user/libvhost-user.c
+++ b/subprojects/libvhost-user/libvhost-user.c
@@ -690,6 +690,11 @@ vu_add_mem_reg(VuDev *dev, VhostUserMsg *vmsg) {
     VuDevRegion *dev_region =3D &dev->regions[dev->nregions];
     void *mmap_addr;
=20
+    if (dev->nregions =3D=3D VHOST_USER_MAX_RAM_SLOTS) {
+        vu_panic(dev, "No free ram slots available");
+        return false;
+    }
+
     if (vmsg->fd_num !=3D 1 ||
         vmsg->size !=3D sizeof(vmsg->payload.memreg)) {
         vu_panic(dev, "VHOST_USER_REM_MEM_REG received multiple regions");
--=20
2.20.1

