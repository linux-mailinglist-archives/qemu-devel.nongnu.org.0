Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F41986417FC
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Dec 2022 18:08:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p1Vys-0006rn-AC; Sat, 03 Dec 2022 12:07:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1p1Vyp-0006rD-7i
 for qemu-devel@nongnu.org; Sat, 03 Dec 2022 12:07:11 -0500
Received: from prt-mail.chinatelecom.cn ([42.123.76.219] helo=chinatelecom.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1p1Vym-0005j0-FB
 for qemu-devel@nongnu.org; Sat, 03 Dec 2022 12:07:10 -0500
HMM_SOURCE_IP: 172.18.0.218:57700.972657945
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-125.69.43.82 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id 8015D2800B4;
 Sun,  4 Dec 2022 01:07:01 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([125.69.43.82])
 by app0025 with ESMTP id 4f56b1536f1d4bcfab1f161b65a43ce4 for
 qemu-devel@nongnu.org; Sun, 04 Dec 2022 01:07:04 CST
X-Transaction-ID: 4f56b1536f1d4bcfab1f161b65a43ce4
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 125.69.43.82
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: qemu-devel <qemu-devel@nongnu.org>
Cc: Peter Xu <peterx@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Eric Blake <eblake@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Hyman=20Huang=28=E9=BB=84=E5=8B=87=29?= <huangy81@chinatelecom.cn>
Subject: [PATCH v3 01/10] dirtylimit: Fix overflow when computing MB
Date: Sun,  4 Dec 2022 01:06:43 +0800
Message-Id: <97fedfc5bac8ca91a15e7c73340c8bbbbce9b1fc.1670085207.git.huangy81@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1670085207.git.huangy81@chinatelecom.cn>
References: <cover.1670085207.git.huangy81@chinatelecom.cn>
In-Reply-To: <cover.1670085207.git.huangy81@chinatelecom.cn>
References: <cover.1670085207.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.219;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>

Coverity points out a overflow problem when computing MB,
dirty_ring_size and TARGET_PAGE_SIZE are both 32 bits,
multiplication will be done as a 32-bit operation, which
could overflow. Simplify the formula.

Meanwhile, fix spelling mistake of variable name.

Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
Reviewed-by: Peter Xu <peterx@redhat.com>
---
 softmmu/dirtylimit.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/softmmu/dirtylimit.c b/softmmu/dirtylimit.c
index 1266855..940d238 100644
--- a/softmmu/dirtylimit.c
+++ b/softmmu/dirtylimit.c
@@ -236,14 +236,14 @@ static inline int64_t dirtylimit_dirty_ring_full_time(uint64_t dirtyrate)
 {
     static uint64_t max_dirtyrate;
     uint32_t dirty_ring_size = kvm_dirty_ring_size();
-    uint64_t dirty_ring_size_meory_MB =
-        dirty_ring_size * TARGET_PAGE_SIZE >> 20;
+    uint32_t dirty_ring_size_memory_MB =
+        dirty_ring_size >> (20 - TARGET_PAGE_BITS);
 
     if (max_dirtyrate < dirtyrate) {
         max_dirtyrate = dirtyrate;
     }
 
-    return dirty_ring_size_meory_MB * 1000000 / max_dirtyrate;
+    return dirty_ring_size_memory_MB * 1000000ULL / max_dirtyrate;
 }
 
 static inline bool dirtylimit_done(uint64_t quota,
-- 
1.8.3.1


