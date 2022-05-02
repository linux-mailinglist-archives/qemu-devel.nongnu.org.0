Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DCCE5174EA
	for <lists+qemu-devel@lfdr.de>; Mon,  2 May 2022 18:49:50 +0200 (CEST)
Received: from localhost ([::1]:48878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlZF6-0005y8-1W
	for lists+qemu-devel@lfdr.de; Mon, 02 May 2022 12:49:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1nlZE8-0005EF-W5; Mon, 02 May 2022 12:48:49 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:7658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1nlZE7-0004Rp-8m; Mon, 02 May 2022 12:48:48 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 242GUrIn018084;
 Mon, 2 May 2022 16:48:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=kviHt2lZePMGoC32Sf8FFf0W9khm/VJ/JV03eDPq6DU=;
 b=h0ua5E41cGhYb+5ozr3XmbQBeXnIWudh1mZW52G/2I1OgwMiesGM5ruPoba3dzWX/cw/
 AD69FmU+8X0kzsaJrG0PQajsK+XNVZYcEUCUtxIWo6DljxXfDbgtzCLqXzZKDIMLwHZn
 9TvqJtiDe41dPoIoug9dU8aOZ4/xUG9d/ZbCd5ci9jjGdGGA9UIYMEyJBdjGQ8OFcRTa
 2zOKiiI6KIxoy7ktgUGCZp1xZLvo60qd6rV1LzipoNUBJ8NvGw+WdkW23XHxJ96wFGX3
 90DkJxZ80fPQlBQAPhSF2+IYZj9flXlXba3pLnC+qQ8Cb+UcBUXO8QeRND3Mtnpouhdp Ag== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ftjvwrabk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 02 May 2022 16:48:37 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 242GV9fu019888;
 Mon, 2 May 2022 16:48:37 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ftjvwraay-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 02 May 2022 16:48:37 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 242GgNX5026472;
 Mon, 2 May 2022 16:48:35 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06ams.nl.ibm.com with ESMTP id 3frvcj2yft-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 02 May 2022 16:48:34 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 242GZG2851118504
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 2 May 2022 16:35:16 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B5026A404D;
 Mon,  2 May 2022 16:48:31 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4529DA4040;
 Mon,  2 May 2022 16:48:31 +0000 (GMT)
Received: from heavy.ibmuc.com (unknown [9.171.50.79])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  2 May 2022 16:48:31 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>
Subject: [PATCH] tests/tcg/s390x: Use a different PCRel32 notation in
 branch-relative-long.c
Date: Mon,  2 May 2022 18:48:30 +0200
Message-Id: <20220502164830.1622191-1-iii@linux.ibm.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: nmxxuW79OgWqpUJdIds_kQIVt6fJJtoc
X-Proofpoint-GUID: DAq6W0YQKDlvVA-Xf_RTVoMrmav5ow6L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-02_05,2022-05-02_03,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 mlxlogscore=999
 spamscore=0 adultscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205020126
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>, qemu-devel@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Binutils >=2.37 and Clang do not accept (. - 0x100000000) PCRel32
constants. While this looks like a bug that needs fixing, use a
different notation (-0x100000000) as a workaround.

Reported-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 tests/tcg/s390x/branch-relative-long.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/tcg/s390x/branch-relative-long.c b/tests/tcg/s390x/branch-relative-long.c
index 94219afcad..8ce9f1c2e5 100644
--- a/tests/tcg/s390x/branch-relative-long.c
+++ b/tests/tcg/s390x/branch-relative-long.c
@@ -13,8 +13,8 @@
         #_name "_end:\n");
 
 DEFINE_ASM(br_r14, "br %r14");
-DEFINE_ASM(brasl_r0, "brasl %r0,.-0x100000000");
-DEFINE_ASM(brcl_0xf, "brcl 0xf,.-0x100000000");
+DEFINE_ASM(brasl_r0, "brasl %r0,-0x100000000");
+DEFINE_ASM(brcl_0xf, "brcl 0xf,-0x100000000");
 
 struct test {
     const char *code;
-- 
2.35.1


