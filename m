Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0E5590F93
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Aug 2022 12:39:24 +0200 (CEST)
Received: from localhost ([::1]:59454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMS4Z-0004HN-D1
	for lists+qemu-devel@lfdr.de; Fri, 12 Aug 2022 06:39:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oMRzS-0000B1-0e
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 06:34:06 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:37161)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oMRzP-0007Y8-05
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 06:34:05 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MMp08-1o3ofp30xI-00IlIN; Fri, 12
 Aug 2022 12:33:57 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Vitaly Buka <vitalybuka@google.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 1/1] linux-user/aarch64: Reset target data on MADV_DONTNEED
Date: Fri, 12 Aug 2022 12:33:53 +0200
Message-Id: <20220812103353.2631628-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220812103353.2631628-1-laurent@vivier.eu>
References: <20220812103353.2631628-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:qemosotl/vQR/RgmTxG8jakQupwMvYXwYdK07y5kUVfVFvz1CMw
 2BALWrAD6pOsGgRg+aHIN2/3lF/98pdiVJQmBWJ+GrDygeOk6aE7mXwTMxjIhX2jYSxyBRy
 pZmqRDiCvlep/SlnDnROT+Za2OBF0ZI0JWI5hkBgd/JbSkIS0odzuy8HW5CDpGRyw2pCaXl
 IFUgPrNQ5AYlemq/7jYYw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:xfB96JctVG8=:wS8W+/qYivXZ6rGCUEHtVv
 oeLBeELt/uP3I4cP23TBQK7pw2GGv2/TAtvIZCYVni3zZVeI/mc2Yw32VQscD2L8jLzhr1vu5
 PVNbbbGWVjAHtzPffjLFEOrFZb0hPcRGB8RRuAFn9adMFAHVcMZs+jSOV9PIeK2t7PwlirBBE
 IXuYQDdvprG8HJdi54tFNBeDoO3nitrsN4WANSe9sNj2yHGt1Um81NQO3DrOlmTNL5jrhgI9j
 U3MzKLhmYZvAkbZCmYZqemIhjz/p7j51cjRGx0WxmTy4cBAM3pA1NQnvegsvN89+UcNKZB5dR
 FwgyFTGGxLhLLGP5ydhR0VyyH+7ggzcm+UVfEnkBOZ9say25ph4M+GKlyDBZPKIIDJrD1TKfX
 n/g7R0f5wiA/FoGiiV/NXeVqGnYZOlJoGBzJHSOkA/y6rjbF9Wdk7npSpHR0duSmOdTMkUYU2
 Av/Hl3PNn6ukPqYp93U5KpG3JNuDTwNdozXPLL8TuydoR6iddQQ+jp1qY/WUH3KcZMwRbEujT
 XWmYQKa/b3euzvFbh/cChD5tU3Q+BIFkYm9Z7u8Aql8qkyR04cQkX+2lc0eHtzDQgeZvQh2Hn
 ySz5nTQEePa1Z+tHflbB2bdb386yWsuuH2stQ/TUhQtvoZxbXMexIJXGN24UCv6+ZAqTQudKH
 D66oyMsaEhbzuo7FthvtDRsvAApxRnJhWiuUGSSxBDye15rFriZHkiNxmHU9tHYd2q0BHuOki
 13RH5Qxp1kcqIC4sqgmshyy/sCa3p/kHceY+5w==
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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

From: Vitaly Buka <vitalybuka@google.com>

aarch64 stores MTE tags in target_date, and they should be reset by
MADV_DONTNEED.

Signed-off-by: Vitaly Buka <vitalybuka@google.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220711220028.2467290-1-vitalybuka@google.com>
[lv: fix code style issues]
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 accel/tcg/translate-all.c | 26 ++++++++++++++++++++++++++
 include/exec/cpu-all.h    |  1 +
 linux-user/mmap.c         |  3 +++
 3 files changed, 30 insertions(+)

diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index ef62a199c7db..b83161a08190 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -2314,6 +2314,32 @@ void page_set_flags(target_ulong start, target_ulong end, int flags)
     }
 }
 
+void page_reset_target_data(target_ulong start, target_ulong end)
+{
+    target_ulong addr, len;
+
+    /*
+     * This function should never be called with addresses outside the
+     * guest address space.  If this assert fires, it probably indicates
+     * a missing call to h2g_valid.
+     */
+    assert(end - 1 <= GUEST_ADDR_MAX);
+    assert(start < end);
+    assert_memory_lock();
+
+    start = start & TARGET_PAGE_MASK;
+    end = TARGET_PAGE_ALIGN(end);
+
+    for (addr = start, len = end - start;
+         len != 0;
+         len -= TARGET_PAGE_SIZE, addr += TARGET_PAGE_SIZE) {
+        PageDesc *p = page_find_alloc(addr >> TARGET_PAGE_BITS, 1);
+
+        g_free(p->target_data);
+        p->target_data = NULL;
+    }
+}
+
 void *page_get_target_data(target_ulong address)
 {
     PageDesc *p = page_find(address >> TARGET_PAGE_BITS);
diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index f5bda2c3caa7..491629b9ba7a 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -271,6 +271,7 @@ int walk_memory_regions(void *, walk_memory_regions_fn);
 
 int page_get_flags(target_ulong address);
 void page_set_flags(target_ulong start, target_ulong end, int flags);
+void page_reset_target_data(target_ulong start, target_ulong end);
 int page_check_range(target_ulong start, target_ulong len, int flags);
 
 /**
diff --git a/linux-user/mmap.c b/linux-user/mmap.c
index edceaca4a8e1..048c4135af14 100644
--- a/linux-user/mmap.c
+++ b/linux-user/mmap.c
@@ -894,6 +894,9 @@ abi_long target_madvise(abi_ulong start, abi_ulong len_in, int advice)
     if (advice == MADV_DONTNEED &&
         can_passthrough_madv_dontneed(start, end)) {
         ret = get_errno(madvise(g2h_untagged(start), len, MADV_DONTNEED));
+        if (ret == 0) {
+            page_reset_target_data(start, start + len);
+        }
     }
     mmap_unlock();
 
-- 
2.37.1


