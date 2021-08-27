Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 435CE3FA196
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Aug 2021 00:40:54 +0200 (CEST)
Received: from localhost ([::1]:45316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJkWm-0001AL-As
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 18:40:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=78736a82b9=pdel@fb.com>)
 id 1mJj3V-0006bu-UT
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 17:06:29 -0400
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:12546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=78736a82b9=pdel@fb.com>)
 id 1mJj3U-0003Gm-8q
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 17:06:29 -0400
Received: from pps.filterd (m0109333.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17RL6KMQ032729
 for <qemu-devel@nongnu.org>; Fri, 27 Aug 2021 14:06:25 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=facebook;
 bh=baVaM5oAeT5wbbluKIUOp2U+U+kJSN8uINGpCSKUl4Q=;
 b=hzIv3WBKOscI//uNb74njzOG4z6jEPbq0+vGYmlQEaBBXY+GPNDnJ3rJ+dXCYj0FqSAj
 dMxXOt//+nF/SWYcCtF21MklAzWCUC4S02d3SOpR8osbVf1EBlLzxg6O3heho6g8V0Gk
 3Pu95ITonAXUn0Yh4XJ4RuTqFJa4O9Yli7E= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com with ESMTP id 3apfpfrk0a-16
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-devel@nongnu.org>; Fri, 27 Aug 2021 14:06:25 -0700
Received: from intmgw002.48.prn1.facebook.com (2620:10d:c085:108::4) by
 mail.thefacebook.com (2620:10d:c085:21d::5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 27 Aug 2021 14:06:20 -0700
Received: by devvm660.prn0.facebook.com (Postfix, from userid 385188)
 id 73F5CE74C1F; Fri, 27 Aug 2021 14:06:15 -0700 (PDT)
From: <pdel@fb.com>
To: 
CC: <clg@kaod.org>, <joel@jms.id.au>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>, Peter Delevoryas <pdel@fb.com>
Subject: [PATCH 4/5] hw/arm/aspeed: Fix AST2600_CLK_SEL3 address
Date: Fri, 27 Aug 2021 14:04:16 -0700
Message-ID: <20210827210417.4022054-5-pdel@fb.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210827210417.4022054-1-pdel@fb.com>
References: <20210827210417.4022054-1-pdel@fb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-FB-Internal: Safe
Content-Type: text/plain
X-FB-Source: Intern
X-Proofpoint-ORIG-GUID: Skr6pYlcLnfd0Ics1zbaybi4xjipe9lI
X-Proofpoint-GUID: Skr6pYlcLnfd0Ics1zbaybi4xjipe9lI
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-27_06:2021-08-27,
 2021-08-27 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 phishscore=0
 suspectscore=0 clxscore=1015 bulkscore=0 mlxlogscore=556
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 mlxscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2107140000 definitions=main-2108270125
X-FB-Internal: deliver
Received-SPF: pass client-ip=67.231.145.42;
 envelope-from=prvs=78736a82b9=pdel@fb.com; helo=mx0a-00082601.pphosted.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 27 Aug 2021 18:37:43 -0400
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

From: Peter Delevoryas <pdel@fb.com>

This register address is not actually used anywhere, and the datasheet
specifies that it's zero-initialized by default anyways, but the address
is incorrect. This just corrects the address.

Fixes: e09cf36321f6 ("hw: aspeed_scu: Add AST2600 support")
Signed-off-by: Peter Delevoryas <pdel@fb.com>
---
 hw/misc/aspeed_scu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
index 40a38ebd85..c373e678f0 100644
--- a/hw/misc/aspeed_scu.c
+++ b/hw/misc/aspeed_scu.c
@@ -108,7 +108,7 @@
 #define AST2600_EPLL_EXT          TO_REG(0x244)
 #define AST2600_CLK_SEL           TO_REG(0x300)
 #define AST2600_CLK_SEL2          TO_REG(0x304)
-#define AST2600_CLK_SEL3          TO_REG(0x310)
+#define AST2600_CLK_SEL3          TO_REG(0x308)
 #define AST2600_HW_STRAP1         TO_REG(0x500)
 #define AST2600_HW_STRAP1_CLR     TO_REG(0x504)
 #define AST2600_HW_STRAP1_PROT    TO_REG(0x508)
--=20
2.30.2


