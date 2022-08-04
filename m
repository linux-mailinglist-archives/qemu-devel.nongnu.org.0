Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1451558A0D4
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 20:50:56 +0200 (CEST)
Received: from localhost ([::1]:54974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJfvr-0000f8-2D
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 14:50:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1oJfWE-0007rL-PY; Thu, 04 Aug 2022 14:24:30 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:47166)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1oJfWB-0002NP-M3; Thu, 04 Aug 2022 14:24:26 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 274ICDVV014436;
 Thu, 4 Aug 2022 18:24:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=KxfbJ3EzVkwLUvNVsw3iZ9/Tak/DHkZlr/bFzpTRW/4=;
 b=PHkdJ2bxeiySzbfLxJcKHOkg5yv4FEJpV8is3xb/PR/qZg79nGi8bQLH0YnZ4aU2OAOt
 +Kc+PzFV2cWfT0yew0qW7O/Mu/Xek0ggpl+soC2f6aIuOhtvsf9WS9wXJwbdLCKPSPde
 cS3PLiOeyrkvI4bTVOroPyrMThrHdgk5I44aM4guV5AJjY0IawV1NuxojfGiHSJCcl8n
 M2nfRFkDvaEUSQr0L6P/ntQFYdhz1kmn+1/GgE/yGLIRQTyG5VoaGDVfmF6EtdzDK6H9
 Y417/DGv7Xg6BR7lYT45GK822mITMcBpgbiREbhs8JcHdQVp4mIziDoC86pICYGD2r9d ew== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hrk658avj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Aug 2022 18:24:09 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 274IED7w031486;
 Thu, 4 Aug 2022 18:24:08 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hrk658auf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Aug 2022 18:24:08 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 274IMKxR009166;
 Thu, 4 Aug 2022 18:24:05 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma01fra.de.ibm.com with ESMTP id 3hrf2188dr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Aug 2022 18:24:05 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 274IO2pP22544732
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 4 Aug 2022 18:24:02 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2203B5204E;
 Thu,  4 Aug 2022 18:24:02 +0000 (GMT)
Received: from heavy.lan (unknown [9.171.2.232])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 8FDBD52050;
 Thu,  4 Aug 2022 18:24:01 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Laurent Vivier <laurent@vivier.eu>, Eduardo Habkost <eduardo@habkost.net>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH 1/2] linux-user: Fix siginfo_t contents when jumping to
 non-readable pages
Date: Thu,  4 Aug 2022 20:23:58 +0200
Message-Id: <20220804182359.830058-2-iii@linux.ibm.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220804182359.830058-1-iii@linux.ibm.com>
References: <20220804182359.830058-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: tIGd8rS9RfGSK-sf5ZnTaTPpy19kzEAl
X-Proofpoint-GUID: M4047UbIBCsYmNdqKwYu3PWPonqDN1ym
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-04_03,2022-08-04_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 suspectscore=0 mlxlogscore=999 clxscore=1015 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2208040077
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

When the first instruction of a translation block is located in a
non-readable page, qemu-user fills siginfo_t correctly. For the other
instructions the result is as if it were the first instruction, which
is not correct.

The reason is that the current logic expects translate_insn() hook to
stop at the page boundary. This way only the first instruction can
cause a SEGV. However, this is quite difficult to properly implement
when the problematic instruction crosses a page boundary, and indeed
the actual implementations do not do this. Note that this can also
break self-modifying code detection when only bytes on the second page
are modified, but this is outside of the scope of this patch.

Instead of chaning all the translators, do a much simpler thing: when
such a situation is detected, start from scratch and stop right before
the problematic instruction.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 accel/tcg/translate-all.c | 16 +++++++++++-----
 accel/tcg/translator.c    | 25 +++++++++++++++++++++++++
 include/hw/core/cpu.h     |  2 ++
 linux-user/signal.c       |  5 +++++
 4 files changed, 43 insertions(+), 5 deletions(-)

diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index ef62a199c7..b4766f4661 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -2295,12 +2295,18 @@ void page_set_flags(target_ulong start, target_ulong end, int flags)
          len != 0;
          len -= TARGET_PAGE_SIZE, addr += TARGET_PAGE_SIZE) {
         PageDesc *p = page_find_alloc(addr >> TARGET_PAGE_BITS, 1);
+        bool invalidate;
 
-        /* If the write protection bit is set, then we invalidate
-           the code inside.  */
-        if (!(p->flags & PAGE_WRITE) &&
-            (flags & PAGE_WRITE) &&
-            p->first_tb) {
+        /*
+         * If the write protection bit is set, then we invalidate the code
+         * inside.  For qemu-user, we need to do this when PAGE_READ is cleared
+         * as well, in order to force a SEGV when trying to run this code.
+         */
+        invalidate = !(p->flags & PAGE_WRITE) && (flags & PAGE_WRITE);
+#ifdef CONFIG_USER_ONLY
+        invalidate |= (p->flags & PAGE_READ) && !(flags & PAGE_READ);
+#endif
+        if (invalidate && p->first_tb) {
             tb_invalidate_phys_page(addr, 0);
         }
         if (reset_target_data) {
diff --git a/accel/tcg/translator.c b/accel/tcg/translator.c
index fe7af9b943..e444c17515 100644
--- a/accel/tcg/translator.c
+++ b/accel/tcg/translator.c
@@ -57,6 +57,18 @@ void translator_loop(const TranslatorOps *ops, DisasContextBase *db,
     uint32_t cflags = tb_cflags(tb);
     bool plugin_enabled;
 
+    /*
+     * In case translate_insn hook touched an unreadable page, redo the
+     * translation until the problematic instruction.  We cannot just throw
+     * away the trailing ops, because the hook could have changed DisasContext.
+     */
+    tcg_debug_assert(!cpu->translator_jmp);
+    if (sigsetjmp(cpu->translator_jmp_env, 1) != 0) {
+        cpu->translator_jmp = false;
+        tcg_remove_ops_after(NULL);
+        max_insns = db->num_insns - 1;
+    }
+
     /* Initialize DisasContext */
     db->tb = tb;
     db->pc_first = tb->pc;
@@ -122,8 +134,21 @@ void translator_loop(const TranslatorOps *ops, DisasContextBase *db,
             db->is_jmp = DISAS_TOO_MANY;
             break;
         }
+
+        /*
+         * Propagate SEGVs from the first instruction to the guest and handle
+         * the rest. This way guest's siginfo_t gets accurate pc and si_addr.
+         */
+        cpu->translator_jmp = true;
     }
 
+    /*
+     * Clear translator_jmp on all ways out of this function, otherwise
+     * instructions that fetch code as part of their operation will be
+     * confused.
+     */
+    cpu->translator_jmp = false;
+
     /* Emit code to exit the TB, as indicated by db->is_jmp.  */
     ops->tb_stop(db, cpu);
     gen_tb_end(db->tb, db->num_insns);
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 500503da13..6c1829b7f5 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -349,6 +349,8 @@ struct CPUState {
     int64_t icount_extra;
     uint64_t random_seed;
     sigjmp_buf jmp_env;
+    bool translator_jmp;
+    sigjmp_buf translator_jmp_env;
 
     QemuMutex work_mutex;
     QSIMPLEQ_HEAD(, qemu_work_item) work_list;
diff --git a/linux-user/signal.c b/linux-user/signal.c
index 8d29bfaa6b..f7e77c8d2e 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -833,6 +833,11 @@ static void host_signal_handler(int host_sig, siginfo_t *info, void *puc)
         abi_ptr guest_addr;
         bool is_write;
 
+        /* Translator wants to handle this. */
+        if (helper_retaddr == 1 && cpu->translator_jmp) {
+            siglongjmp(cpu->translator_jmp_env, 1);
+        }
+
         host_addr = (uintptr_t)info->si_addr;
 
         /*
-- 
2.35.3


