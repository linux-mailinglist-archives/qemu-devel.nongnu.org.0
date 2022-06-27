Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 755A855BBF8
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 22:21:31 +0200 (CEST)
Received: from localhost ([::1]:58838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5vEf-0008EG-22
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 16:21:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=71779173e5=pdel@fb.com>)
 id 1o5upp-0004vp-5W
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 15:55:50 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:64036)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=71779173e5=pdel@fb.com>)
 id 1o5upj-0000hq-SX
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 15:55:48 -0400
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25RJ1THR007359
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 12:55:43 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=facebook;
 bh=P6wPdtex34xU2NYyYlYF1ogaXTdLwrQu8tAHQLTyyaw=;
 b=AFoGbq41ZRUm44diH0OtB2sAWEk1YKW3PY7cKvQX+9ef1CgNmwaiqF5V72WrYla8T+Mt
 TE0ALu9zc4CSDYfk9Xno6ZmqA33JpSNsZlyFQC2tyS4+OYEgl9jXnJ3lr57SEWgRJlBq
 pA0myTmaApES0IevwIafcA+G5jP38B//9t4= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3gyg0a9rtf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 12:55:43 -0700
Received: from twshared13579.04.prn5.facebook.com (2620:10d:c085:208::11) by
 mail.thefacebook.com (2620:10d:c085:11d::7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 27 Jun 2022 12:55:41 -0700
Received: by devvm9194.prn0.facebook.com (Postfix, from userid 385188)
 id 027B38D206F5; Mon, 27 Jun 2022 12:55:08 -0700 (PDT)
From: Peter Delevoryas <pdel@fb.com>
To: 
CC: <pdel@fb.com>, <zhdaniel@fb.com>, <clg@kaod.org>, <qemu-devel@nongnu.org>, 
 <qemu-arm@nongnu.org>, <komlodi@google.com>, <titusr@google.com>,
 <andrew@aj.id.au>, <joel@jms.id.au>
Subject: [PATCH 11/14] aspeed: Add oby35-cl machine
Date: Mon, 27 Jun 2022 12:55:03 -0700
Message-ID: <20220627195506.403715-12-pdel@fb.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220627195506.403715-1-pdel@fb.com>
References: <20220627195506.403715-1-pdel@fb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-FB-Internal: Safe
Content-Type: text/plain
X-Proofpoint-GUID: wE8x1kxEGUFW7oLKE_61LnsqpgD3fhAd
X-Proofpoint-ORIG-GUID: wE8x1kxEGUFW7oLKE_61LnsqpgD3fhAd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-27_06,2022-06-24_01,2022-06-22_01
Received-SPF: pass client-ip=67.231.153.30;
 envelope-from=prvs=71779173e5=pdel@fb.com; helo=mx0b-00082601.pphosted.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Signed-off-by: Peter Delevoryas <pdel@fb.com>
---
 hw/arm/aspeed.c | 40 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index a06f7c1b62..2b9c1600c6 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -1429,6 +1429,42 @@ static void aspeed_minibmc_machine_ast1030_evb_cla=
ss_init(ObjectClass *oc,
     amc->macs_mask =3D 0;
 }
=20
+static void oby35_cl_i2c_init(AspeedMachineState *bmc)
+{
+    AspeedSoCState *soc =3D &bmc->soc;
+    I2CBus *i2c[14];
+    I2CBus *ssd[8];
+    int i;
+
+    for (i =3D 0; i < 14; i++) {
+        i2c[i] =3D aspeed_i2c_get_bus(&soc->i2c, i);
+    }
+    get_pca9548_channels(i2c[1], 0x71, ssd);
+
+    i2c_slave_create_simple(i2c[0], "fby35-cpld", 0x21);
+    i2c_slave_create_simple(i2c[1], "tmp105", 0x48);
+    i2c_slave_create_simple(i2c[1], "tmp105", 0x49);
+    i2c_slave_create_simple(i2c[1], "tmp105", 0x4a);
+    i2c_slave_create_simple(i2c[1], "adm1272", 0x40);
+    i2c_slave_create_simple(i2c[1], "tmp421", 0x4c);
+    i2c_slave_create_simple(i2c[4], "isl69259", 0x76);
+    i2c_slave_create_simple(i2c[4], "isl69259", 0x62);
+    i2c_slave_create_simple(i2c[4], "isl69259", 0x60);
+
+    for (int i =3D 0; i < 8; i++) {
+        i2c_slave_create_simple(ssd[i], "tmp105", 0x6a);
+    }
+}
+
+static void aspeed_machine_oby35_cl_class_init(ObjectClass *oc, void *da=
ta)
+{
+    MachineClass *mc =3D MACHINE_CLASS(oc);
+    AspeedMachineClass *amc =3D ASPEED_MACHINE_CLASS(oc);
+
+    mc->desc =3D "Meta Platforms fby35 CraterLake BIC (Cortex-M4)";
+    amc->i2c_init =3D oby35_cl_i2c_init;
+}
+
 static const TypeInfo aspeed_machine_types[] =3D {
     {
         .name          =3D MACHINE_TYPE_NAME("palmetto-bmc"),
@@ -1494,6 +1530,10 @@ static const TypeInfo aspeed_machine_types[] =3D {
         .name           =3D MACHINE_TYPE_NAME("ast1030-evb"),
         .parent         =3D TYPE_ASPEED_MACHINE,
         .class_init     =3D aspeed_minibmc_machine_ast1030_evb_class_ini=
t,
+    }, {
+        .name          =3D MACHINE_TYPE_NAME("oby35-cl"),
+        .parent        =3D MACHINE_TYPE_NAME("ast1030-evb"),
+        .class_init    =3D aspeed_machine_oby35_cl_class_init,
     }, {
         .name          =3D TYPE_ASPEED_MACHINE,
         .parent        =3D TYPE_MACHINE,
--=20
2.30.2


