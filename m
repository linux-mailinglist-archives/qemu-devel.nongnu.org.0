Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C83158530D
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jul 2022 17:46:01 +0200 (CEST)
Received: from localhost ([::1]:53252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHSBc-0005Jv-4X
	for lists+qemu-devel@lfdr.de; Fri, 29 Jul 2022 11:46:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1oHS9E-0003gw-E5
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 11:43:32 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.222]:41793
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1oHS99-0006mk-Vy
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 11:43:32 -0400
HMM_SOURCE_IP: 172.18.0.218:35118.1172650779
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-125.69.43.72 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id CB64F2800B9;
 Fri, 29 Jul 2022 23:43:11 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([172.18.0.218])
 by app0025 with ESMTP id 29b20f0023dd42269242379c37c5552b for
 qemu-devel@nongnu.org; Fri, 29 Jul 2022 23:43:14 CST
X-Transaction-ID: 29b20f0023dd42269242379c37c5552b
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.218
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: qemu-devel <qemu-devel@nongnu.org>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, leobras@redhat.com,
 quintela@redhat.com, Richard Henderson <richard.henderson@linaro.org>,
 berrange@redhat.com, iii@linux.ibm.com, peterx@redhat.com,
 =?UTF-8?q?Hyman=20Huang=28=E9=BB=84=E5=8B=87=29?= <huangy81@chinatelecom.cn>
Subject: [PATCH v1] dirtylimit: Fix overflow when computing MB
Date: Fri, 29 Jul 2022 23:42:59 +0800
Message-Id: <d130a175731cc2191d7dd018f0bea198a966fdab.1659109292.git.huangy81@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.222;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
---
 softmmu/dirtylimit.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/softmmu/dirtylimit.c b/softmmu/dirtylimit.c
index 8d98cb7..1423225 100644
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


