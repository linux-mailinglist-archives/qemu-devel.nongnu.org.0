Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6192CF752
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Dec 2020 00:09:50 +0100 (CET)
Received: from localhost ([::1]:34120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klKCz-0003jI-8G
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 18:09:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbuono@linux.vnet.ibm.com>)
 id 1klKA3-0002Qm-3c
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 18:06:52 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:3224)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbuono@linux.vnet.ibm.com>)
 id 1klKA1-0004Rs-6s
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 18:06:46 -0500
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B4N3QSf092534
 for <qemu-devel@nongnu.org>; Fri, 4 Dec 2020 18:06:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=lH1vjam/uAwj77DuuJwX4duoeCbG9KbpZcBIQApIcck=;
 b=N7wx4X1VESrDnzKbUeu7TyPtqMQVc+/ZPgiJyIR7vPrwyqAOcx5PeNnKQ5e/uiVtE+h1
 WCSIfttrIVNCuM62qtaHjhpx98o0NSC5pEMes6dn8yDKEEINjhfu2w8j+PbIseIMEcyw
 xpWybOC56eu0stbdUIdOCQIhv2jVpoVpT9p6SLSh6AQbuRUssER1rq3oTP+6DUs99ZFq
 KssQR6DLWzv1gjFw4sH+72JBA91bzDPx897NS5VHwYdZbnvMETUDXuRJV1zXsTtAfOzx
 E3OVjOB+rXTUo3d7qHgaIxvTn135G9fvnLHpaaQT56+FQ+m9tvSR3bGC+L0bwv+AWIlw fg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 357uq6m4we-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Fri, 04 Dec 2020 18:06:43 -0500
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0B4N3di6093942
 for <qemu-devel@nongnu.org>; Fri, 4 Dec 2020 18:06:43 -0500
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 357uq6m4w4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Dec 2020 18:06:43 -0500
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B4N1eXP017499;
 Fri, 4 Dec 2020 23:06:42 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma01dal.us.ibm.com with ESMTP id 355rf8a0bn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Dec 2020 23:06:42 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B4N6fwk7275138
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 4 Dec 2020 23:06:41 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3E62E6A04D;
 Fri,  4 Dec 2020 23:06:41 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 966BC6A047;
 Fri,  4 Dec 2020 23:06:40 +0000 (GMT)
Received: from Buonos-Thinkpad-X1.ibm.com (unknown [9.160.122.174])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri,  4 Dec 2020 23:06:40 +0000 (GMT)
From: Daniele Buono <dbuono@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 3/5] check-block: enable iotests with cfi-icall
Date: Fri,  4 Dec 2020 18:06:13 -0500
Message-Id: <20201204230615.2392-4-dbuono@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201204230615.2392-1-dbuono@linux.vnet.ibm.com>
References: <20201204230615.2392-1-dbuono@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-12-04_13:2020-12-04,
 2020-12-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=1 phishscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 mlxscore=0
 priorityscore=1501 adultscore=0 mlxlogscore=605 bulkscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012040132
Received-SPF: none client-ip=148.163.156.1;
 envelope-from=dbuono@linux.vnet.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Daniele Buono <dbuono@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

cfi-icall is a form of Control-Flow Integrity for indirect function
calls implemented by llvm. It is enabled with a -fsanitize flag.

iotests are currently disabled when -fsanitize options is used, with the
exception of SafeStack.

This patch implements a generic filtering mechanism to allow iotests
with a set of known-to-be-safe -fsanitize option. Then marks SafeStack
and the new options used for cfi-icall safe for iotests

Signed-off-by: Daniele Buono <dbuono@linux.vnet.ibm.com>
---
 tests/check-block.sh | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/tests/check-block.sh b/tests/check-block.sh
index f6b1bda7b9..fb4c1baae9 100755
--- a/tests/check-block.sh
+++ b/tests/check-block.sh
@@ -21,14 +21,18 @@ if grep -q "CONFIG_GPROF=y" config-host.mak 2>/dev/null ; then
     exit 0
 fi
 
-# Disable tests with any sanitizer except for SafeStack
-CFLAGS=$( grep "CFLAGS.*-fsanitize" config-host.mak 2>/dev/null )
-SANITIZE_FLAGS=""
-#Remove all occurrencies of -fsanitize=safe-stack
-for i in ${CFLAGS}; do
-        if [ "${i}" != "-fsanitize=safe-stack" ]; then
-                SANITIZE_FLAGS="${SANITIZE_FLAGS} ${i}"
+# Disable tests with any sanitizer except for specific ones
+SANITIZE_FLAGS=$( grep "CFLAGS.*-fsanitize" config-host.mak 2>/dev/null )
+ALLOWED_SANITIZE_FLAGS="safe-stack cfi-icall"
+#Remove all occurrencies of allowed Sanitize flags
+for j in ${ALLOWED_SANITIZE_FLAGS}; do
+    TMP_FLAGS=${SANITIZE_FLAGS}
+    SANITIZE_FLAGS=""
+    for i in ${TMP_FLAGS}; do
+        if ! echo ${i} | grep -q "${j}" 2>/dev/null; then
+            SANITIZE_FLAGS="${SANITIZE_FLAGS} ${i}"
         fi
+    done
 done
 if echo ${SANITIZE_FLAGS} | grep -q "\-fsanitize" 2>/dev/null; then
     # Have a sanitize flag that is not allowed, stop
-- 
2.17.1


