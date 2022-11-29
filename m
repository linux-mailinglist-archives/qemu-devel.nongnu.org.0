Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA03F63B773
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Nov 2022 02:54:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozpod-0001gx-4z; Mon, 28 Nov 2022 20:53:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1ozpob-0001gg-Af; Mon, 28 Nov 2022 20:53:41 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1ozpoZ-00067r-LO; Mon, 28 Nov 2022 20:53:41 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AT0b1Av021362; Tue, 29 Nov 2022 01:53:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=69rlcx1s9PNF02bt8n5WA5gGKhuNgDcIjDInIyPTPlw=;
 b=SFwNr6GSUM83rdHarBLPuVqlYXBl0SFEpV8kAZYQIfOhUs6vVTBfe/SW7MIp/hXPbXPQ
 ChXWOJarRdqsuutK3JRVAfS3QN1xX72lnrlMbDQ0DijjsntO7q1UDjxhBueIiuSpUfMf
 TB5bpAbNC2AqFDEuEkXGT0O4Zj+MESZWb1Npv6M9vbjkcJWlVD8hjcso4KjSA22reJOm
 P4zLais/RniSUZykeT7I4Rb9e4RvCbK+bDnfDpiQeJ2iZdfbdOlTf3PdPBuh3bozv8xu
 IrlfmwmdOGBzjWlsiXYWW8BnsEXNou/TGc7R9l283wxEYxWhiT3WQypzPV3hp6Nv/JQ4 rQ== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m5303g4y8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Nov 2022 01:53:37 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AT1peLq021957;
 Tue, 29 Nov 2022 01:53:34 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma02fra.de.ibm.com with ESMTP id 3m3ae92df9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Nov 2022 01:53:34 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2AT1rW1j8127122
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 29 Nov 2022 01:53:32 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5F38011C04C;
 Tue, 29 Nov 2022 01:53:32 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1C32411C04A;
 Tue, 29 Nov 2022 01:53:32 +0000 (GMT)
Received: from heavy.ibmuc.com (unknown [9.171.30.50])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 29 Nov 2022 01:53:32 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH] tests/tcg/s390x: Add sam.S
Date: Tue, 29 Nov 2022 02:53:28 +0100
Message-Id: <20221129015328.55439-1-iii@linux.ibm.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221129014950.sjphj5ov2fcubuw3@heavy>
References: <20221129014950.sjphj5ov2fcubuw3@heavy>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: -5JRU54kjP7xBjYU91vZ2Kyx02_aHTmN
X-Proofpoint-GUID: -5JRU54kjP7xBjYU91vZ2Kyx02_aHTmN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-29_01,2022-11-28_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 impostorscore=0 phishscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=453 mlxscore=0 adultscore=0
 spamscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211290009
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Add a small test to prevent regressions.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 tests/tcg/s390x/Makefile.softmmu-target |  1 +
 tests/tcg/s390x/sam.S                   | 67 +++++++++++++++++++++++++
 2 files changed, 68 insertions(+)
 create mode 100644 tests/tcg/s390x/sam.S

diff --git a/tests/tcg/s390x/Makefile.softmmu-target b/tests/tcg/s390x/Makefile.softmmu-target
index a34fa68473e..738b04530fc 100644
--- a/tests/tcg/s390x/Makefile.softmmu-target
+++ b/tests/tcg/s390x/Makefile.softmmu-target
@@ -7,3 +7,4 @@ QEMU_OPTS=-action panic=exit-failure -kernel
 		-Wl,--build-id=none $< -o $@
 
 TESTS += unaligned-lowcore
+TESTS += sam
diff --git a/tests/tcg/s390x/sam.S b/tests/tcg/s390x/sam.S
new file mode 100644
index 00000000000..4cab2dd2007
--- /dev/null
+++ b/tests/tcg/s390x/sam.S
@@ -0,0 +1,67 @@
+/* DAT on, home-space mode, 64-bit mode */
+#define DAT_PSWM 0x400c00180000000
+#define VIRTUAL_BASE 0x123456789abcd000
+
+    .org 0x8e
+program_interruption_code:
+    .org 0x150
+program_old_psw:
+    .org 0x1d0                         /* program new PSW */
+    .quad 0,pgm_handler
+    .org 0x200                         /* lowcore padding */
+
+    .globl _start
+_start:
+    lctlg %c13,%c13,hasce
+    lpswe dat_psw
+start_dat:
+    sam24
+sam24_suppressed:
+    /* sam24 should fail */
+fail:
+    basr %r12,%r0
+    lpswe failure_psw-.(%r12)
+pgm_handler:
+    chhsi program_interruption_code,6  /* specification exception? */
+    jne fail
+    clc suppressed_psw(16),program_old_psw  /* correct location? */
+    jne fail
+    lpswe success_psw
+
+    .align 8
+dat_psw:
+    .quad DAT_PSWM,VIRTUAL_BASE+start_dat
+suppressed_psw:
+    .quad DAT_PSWM,VIRTUAL_BASE+sam24_suppressed
+success_psw:
+    .quad 0x2000000000000,0xfff        /* see is_special_wait_psw() */
+failure_psw:
+    .quad 0x2000000000000,0            /* disabled wait */
+hasce:
+    /* DT = 0b11 (region-first-table), TL = 3 (2k entries) */
+    .quad region_first_table + (3 << 2) + 3
+    .align 0x1000
+region_first_table:
+    .org region_first_table + ((VIRTUAL_BASE >> 53) & 0x7ff) * 8
+    /* TT = 0b11 (region-first-table), TL = 3 (2k entries) */
+    .quad region_second_table + (3 << 2) + 3
+    .org region_first_table + 0x800 * 8
+region_second_table:
+    .org region_second_table + ((VIRTUAL_BASE >> 42) & 0x7ff) * 8
+    /* TT = 0b10 (region-second-table), TL = 3 (2k entries) */
+    .quad region_third_table + (2 << 2) + 3
+    .org region_second_table + 0x800 * 8
+region_third_table:
+    .org region_third_table + ((VIRTUAL_BASE >> 31) & 0x7ff) * 8
+    /* TT = 0b01 (region-third-table), TL = 3 (2k entries) */
+    .quad segment_table + (1 << 2) + 3
+    .org region_third_table + 0x800 * 8
+segment_table:
+    .org segment_table + ((VIRTUAL_BASE >> 20) & 0x7ff) * 8
+    /* TT = 0b00 (segment-table) */
+    .quad page_table
+    .org segment_table + 0x800 * 8
+page_table:
+    .org page_table + ((VIRTUAL_BASE >> 12) & 0xff) * 8
+    .quad 0
+    .org page_table + 0x100 * 8
-- 
2.38.1


