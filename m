Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA9A5ADC38
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 02:13:31 +0200 (CEST)
Received: from localhost ([::1]:46028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVMDa-0000h8-CR
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 20:13:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1oVM9V-00045O-P6
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 20:09:17 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:11254)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1oVM9T-0002JU-Ur
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 20:09:17 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 285MlqBw021059;
 Tue, 6 Sep 2022 00:09:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=E1wOHpGff2KwNKkukiv3iE6V1QsBdC3zTLNVdsjxZKY=;
 b=m89iJxo+nHVRFe5ed6DbTDFX+2DwXobGe61WQoMjXwOrdoR8UqIwFLeGnRCIEd2+9mZN
 xmN/BkTOT1eoo7cgVpVsmA2NmXpXwKI/Z7leYGj0e0v41t/w94Z1cZYTB+xHgTfF44Hg
 23rvepV5/x950Kcwbxszg2MWGWuiILxcwYXPJk9yH3hFlzgLLJFmfZyG0ipuS9EElA+/
 4R65fBZx6WPwW/UHHuQ1RKh8k7u5LkGlRlZgarxfA9Mrwdd1cA/V3Ikkmd92EXVhQThA
 SEO90d7LC72CDmf2C4p0WQoUejaNAUwe+ewCKNQnnuxOSTnts2AjGO4Wgaex0wsrAMtI HQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jdt7n1q83-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Sep 2022 00:09:12 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28601HuP005958;
 Tue, 6 Sep 2022 00:09:12 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jdt7n1q6q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Sep 2022 00:09:12 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28607GDv028674;
 Tue, 6 Sep 2022 00:09:09 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma01fra.de.ibm.com with ESMTP id 3jbxj8t770-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Sep 2022 00:09:09 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 286097Mm29950278
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 6 Sep 2022 00:09:07 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 22AAA11C04C;
 Tue,  6 Sep 2022 00:09:07 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BBA2311C050;
 Tue,  6 Sep 2022 00:09:06 +0000 (GMT)
Received: from heavy.lan (unknown [9.171.53.58])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  6 Sep 2022 00:09:06 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Taylor Simpson <tsimpson@quicinc.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v3 4/5] linux-user: Passthrough MADV_DONTNEED for certain file
 mappings
Date: Tue,  6 Sep 2022 02:08:38 +0200
Message-Id: <20220906000839.1672934-5-iii@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220906000839.1672934-1-iii@linux.ibm.com>
References: <20220906000839.1672934-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: o8ZKVPkhQcBbaRiDbBmFRCmWn89RpjS3
X-Proofpoint-ORIG-GUID: WU7uQdtl3bMTUd4AnOHlkYzZ7uBtD3dF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-05_16,2022-09-05_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxlogscore=999 malwarescore=0
 suspectscore=0 impostorscore=0 clxscore=1015 mlxscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209050118
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a follow-up for commit 892a4f6a750a ("linux-user: Add partial
support for MADV_DONTNEED"), which added passthrough for anonymous
mappings. File mappings can be handled in a similar manner.

In order to do that, mark pages, for which mmap() was passed through,
with PAGE_PASSTHROUGH, and then allow madvise() passthrough for these
pages. Drop the explicit PAGE_ANON check, since anonymous mappings are
expected to have PAGE_PASSTHROUGH anyway.

Add PAGE_PASSTHROUGH to PAGE_STICKY in order to keep it on mprotect().

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Message-Id: <20220725125043.43048-1-iii@linux.ibm.com>
---
 accel/tcg/translate-all.c |  2 +-
 include/exec/cpu-all.h    |  6 ++++++
 linux-user/mmap.c         | 27 ++++++++++++++++++++++-----
 3 files changed, 29 insertions(+), 6 deletions(-)

diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index b83161a081..a47cf38e38 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -2263,7 +2263,7 @@ int page_get_flags(target_ulong address)
 #ifndef PAGE_TARGET_STICKY
 #define PAGE_TARGET_STICKY  0
 #endif
-#define PAGE_STICKY  (PAGE_ANON | PAGE_TARGET_STICKY)
+#define PAGE_STICKY  (PAGE_ANON | PAGE_PASSTHROUGH | PAGE_TARGET_STICKY)
 
 /* Modify the flags of a page and invalidate the code if necessary.
    The flag PAGE_WRITE_ORG is positioned automatically depending
diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index 491629b9ba..16b7df41bf 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -262,6 +262,12 @@ extern const TargetPageBits target_page;
 #define PAGE_TARGET_1  0x0200
 #define PAGE_TARGET_2  0x0400
 
+/*
+ * For linux-user, indicates that the page is mapped with the same semantics
+ * in both guest and host.
+ */
+#define PAGE_PASSTHROUGH 0x0800
+
 #if defined(CONFIG_USER_ONLY)
 void page_dump(FILE *f);
 
diff --git a/linux-user/mmap.c b/linux-user/mmap.c
index a5f1ab129c..3a0f67619a 100644
--- a/linux-user/mmap.c
+++ b/linux-user/mmap.c
@@ -425,7 +425,8 @@ abi_ulong mmap_find_vma(abi_ulong start, abi_ulong size, abi_ulong align)
 abi_long target_mmap(abi_ulong start, abi_ulong len, int target_prot,
                      int flags, int fd, abi_ulong offset)
 {
-    abi_ulong ret, end, real_start, real_end, retaddr, host_offset, host_len;
+    abi_ulong ret, end, real_start, real_end, retaddr, host_offset, host_len,
+              passthrough_start = -1, passthrough_end = -1;
     int page_flags, host_prot;
 
     mmap_lock();
@@ -538,6 +539,8 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int target_prot,
             host_start += offset - host_offset;
         }
         start = h2g(host_start);
+        passthrough_start = start;
+        passthrough_end = start + len;
     } else {
         if (start & ~TARGET_PAGE_MASK) {
             errno = EINVAL;
@@ -620,6 +623,8 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int target_prot,
                      host_prot, flags, fd, offset1);
             if (p == MAP_FAILED)
                 goto fail;
+            passthrough_start = real_start;
+            passthrough_end = real_end;
         }
     }
  the_end1:
@@ -627,7 +632,18 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int target_prot,
         page_flags |= PAGE_ANON;
     }
     page_flags |= PAGE_RESET;
-    page_set_flags(start, start + len, page_flags);
+    if (passthrough_start == passthrough_end) {
+        page_set_flags(start, start + len, page_flags);
+    } else {
+        if (start < passthrough_start) {
+            page_set_flags(start, passthrough_start, page_flags);
+        }
+        page_set_flags(passthrough_start, passthrough_end,
+                       page_flags | PAGE_PASSTHROUGH);
+        if (passthrough_end < start + len) {
+            page_set_flags(passthrough_end, start + len, page_flags);
+        }
+    }
  the_end:
     trace_target_mmap_complete(start);
     if (qemu_loglevel_mask(CPU_LOG_PAGE)) {
@@ -846,7 +862,7 @@ static bool can_passthrough_madv_dontneed(abi_ulong start, abi_ulong end)
     }
 
     for (addr = start; addr < end; addr += TARGET_PAGE_SIZE) {
-        if (!(page_get_flags(addr) & PAGE_ANON)) {
+        if (!(page_get_flags(addr) & PAGE_PASSTHROUGH)) {
             return false;
         }
     }
@@ -888,8 +904,9 @@ abi_long target_madvise(abi_ulong start, abi_ulong len_in, int advice)
      * This is a hint, so ignoring and returning success is ok.
      *
      * This breaks MADV_DONTNEED, completely implementing which is quite
-     * complicated. However, there is one low-hanging fruit: host-page-aligned
-     * anonymous mappings. In this case passthrough is safe, so do it.
+     * complicated. However, there is one low-hanging fruit: mappings that are
+     * known to have the same semantics in the host and the guest. In this case
+     * passthrough is safe, so do it.
      */
     mmap_lock();
     if (advice == TARGET_MADV_DONTNEED &&
-- 
2.37.2


