Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5F355BC59
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 00:42:37 +0200 (CEST)
Received: from localhost ([::1]:49960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5xRD-0001Aw-AZ
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 18:42:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=71779173e5=pdel@fb.com>)
 id 1o5xHR-0003Iu-8B
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 18:32:31 -0400
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:62060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=71779173e5=pdel@fb.com>)
 id 1o5xHD-0006Td-3C
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 18:32:25 -0400
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25RKtdch031558
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 15:32:13 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=facebook;
 bh=Bw7XoG6awIMmvJr5R9bCVLNrhcgYvu83aW4B8DXh7oY=;
 b=WEkwCru5UZrL2qlBjeSCubvp8fByg2jdkKc2bgknPSIdiv9efu8DFksl2ONEjC8T+qoU
 8WMZ9UaT102qJXERJ2Lewn4Fe6P1CmavmBvYKcEDCGZUZn6f85W6jGV9/qwUzDLccceB
 +OYa7EIjLTm4Q0kgG/Fe49fcia89EMuamM0= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3gym128jbn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 15:32:13 -0700
Received: from twshared6447.05.prn5.facebook.com (2620:10d:c085:108::4) by
 mail.thefacebook.com (2620:10d:c085:11d::4) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 27 Jun 2022 15:32:12 -0700
Received: by devvm9194.prn0.facebook.com (Postfix, from userid 385188)
 id 586E28D319DE; Mon, 27 Jun 2022 15:32:07 -0700 (PDT)
From: Peter Delevoryas <pdel@fb.com>
To: 
CC: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, Peter Delevoryas
 <pdel@fb.com>
Subject: [PATCH 13/14] aspeed: Add intel-me on i2c6 instead of BMC
Date: Mon, 27 Jun 2022 15:27:36 -0700
Message-ID: <20220627222737.1011989-2-pdel@fb.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220627222737.1011989-1-pdel@fb.com>
References: <20220627195506.403715-1-pdel@fb.com>
 <20220627222737.1011989-1-pdel@fb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-FB-Internal: Safe
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: w4DHMCGuqZaPwJn2d9TyvwovUtrj_R_9
X-Proofpoint-GUID: w4DHMCGuqZaPwJn2d9TyvwovUtrj_R_9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-27_06,2022-06-24_01,2022-06-22_01
Received-SPF: pass client-ip=67.231.145.42;
 envelope-from=prvs=71779173e5=pdel@fb.com; helo=mx0a-00082601.pphosted.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
 hw/arm/aspeed.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 88e9a47dc2..375d87e6c7 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -1448,6 +1448,7 @@ static void oby35_cl_i2c_init(AspeedMachineState *b=
mc)
     i2c_slave_create_simple(i2c[1], "adm1272", 0x40);
     i2c_slave_create_simple(i2c[1], "tmp421", 0x4c);
     i2c_slave_create_simple(i2c[2], "intel-me", 0x16);
+    i2c_slave_create_simple(i2c[6], "intel-me", 0x10);
     i2c_slave_create_simple(i2c[4], "isl69259", 0x76);
     i2c_slave_create_simple(i2c[4], "isl69259", 0x62);
     i2c_slave_create_simple(i2c[4], "isl69259", 0x60);
--=20
2.30.2


