Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C20509096
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 21:41:18 +0200 (CEST)
Received: from localhost ([::1]:58940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhGCT-0003Dx-3l
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 15:41:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1nhFaF-0001Lc-4K
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 15:01:47 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:34134)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1nhFaD-0000uS-Fu
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 15:01:46 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23KIPDRG011805
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 19:01:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=R/M7pE8RLty8Mv8c9GY+hugwslRbqNDP29SynqlJzq0=;
 b=Oz6D6Ne2bba3slsdIc5gcKBC17E/5y1qqmI64bzuj4Jup2f6h9RyDtZO4Qp+tkXSLKko
 JJAEzpVpuIGFfOz0FjSPAxzvhuwU1ZIFKLpopLI9nVX/a27CqQpmxojYrjO5ySIk5B0s
 I7urtN24eSJeLnzwiWOu0op0Q/l0CggSiRKmMoQCz3jlvusm6Uh4BDQHhmsyXb2Dj74o
 ja3wycBuVlOSO4UUGzrPKX3AB3OFAulsGgau8/tcgIsDfR6NQ3MylypJCXrs8dgtafnj
 T6NG30w4rQ4XHJKwwSSQ6wsOL4RJT8HX+KWWI9HkUSaB2OEAFhaoVO0XLQ2gAuxwLVEY 8w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3fjdn3xqx8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 19:01:35 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 23KIwJJ7022161
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 19:01:35 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3fjdn3xqwn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Apr 2022 19:01:35 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 23KIx7lh014060;
 Wed, 20 Apr 2022 19:01:33 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma02wdc.us.ibm.com with ESMTP id 3fg2xw2yxy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Apr 2022 19:01:33 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 23KJ1Xnk24904074
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 Apr 2022 19:01:33 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 610C8112064;
 Wed, 20 Apr 2022 19:01:33 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 35896112061;
 Wed, 20 Apr 2022 19:01:33 +0000 (GMT)
Received: from amdrome3.watson.ibm.com (unknown [9.2.130.16])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 20 Apr 2022 19:01:33 +0000 (GMT)
From: Dov Murik <dovmurik@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] qapi: Fix version of cpu0-id field
Date: Wed, 20 Apr 2022 19:01:29 +0000
Message-Id: <20220420190129.3532623-1-dovmurik@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: EMi2Xby2t_KRug0FY1JSXPUgd85rGlNC
X-Proofpoint-GUID: bnxVPhcdCYnFZL3lYLv9bJzaLI0zcMIj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-20_05,2022-04-20_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 mlxlogscore=999 phishscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204200113
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Dov Murik <dovmurik@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 811b4ec7f8eb ("qapi, target/i386/sev: Add cpu0-id to
query-sev-capabilities") wrongly stated that the new field is available
since version 7.0.

Fix the QAPI documentation to state that the cpu0-id field is included
since 7.1.

Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
---
 qapi/misc-target.json | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qapi/misc-target.json b/qapi/misc-target.json
index bc9355b595..ed4a468aab 100644
--- a/qapi/misc-target.json
+++ b/qapi/misc-target.json
@@ -144,7 +144,7 @@
 #
 # @cert-chain:  PDH certificate chain (base64 encoded)
 #
-# @cpu0-id: Unique ID of CPU0 (base64 encoded) (since 7.0)
+# @cpu0-id: Unique ID of CPU0 (base64 encoded) (since 7.1)
 #
 # @cbitpos: C-bit location in page table entry
 #
-- 
2.25.1


