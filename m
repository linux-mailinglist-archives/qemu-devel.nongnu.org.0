Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2114C4E4B60
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 04:21:37 +0100 (CET)
Received: from localhost ([::1]:48466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWrZ2-0004bJ-6o
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 23:21:36 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wucy11@chinatelecom.cn>)
 id 1nWrWY-0002Xn-PJ
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 23:19:02 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.222]:48492
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <wucy11@chinatelecom.cn>) id 1nWrWV-0006fv-Te
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 23:19:02 -0400
HMM_SOURCE_IP: 172.18.0.218:52666.2058481772
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-36.111.64.85 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id 5B1D7280460;
 Wed, 23 Mar 2022 11:18:48 +0800 (CST)
X-189-SAVE-TO-SEND: +wucy11@chinatelecom.cn
Received: from  ([172.18.0.218])
 by app0025 with ESMTP id 68aa4aa3754d4b0a86228c144d2b23a8 for
 qemu-devel@nongnu.org; Wed, 23 Mar 2022 11:18:55 CST
X-Transaction-ID: 68aa4aa3754d4b0a86228c144d2b23a8
X-Real-From: wucy11@chinatelecom.cn
X-Receive-IP: 172.18.0.218
X-MEDUSA-Status: 0
From: wucy11@chinatelecom.cn
To: qemu-devel@nongnu.org
Subject: [PATCH v1 1/5] kvm,
 memory: Optimize dirty page collection for dirty ring
Date: Wed, 23 Mar 2022 11:18:34 +0800
Message-Id: <1c2c18ab43ec43959c3464d216e6a3144b802a53.1648002360.git.wucy11@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1648002359.git.wucy11@chinatelecom.cn>
References: <cover.1648002359.git.wucy11@chinatelecom.cn>
In-Reply-To: <cover.1648002359.git.wucy11@chinatelecom.cn>
References: <cover.1648002359.git.wucy11@chinatelecom.cn>
Received-SPF: pass client-ip=42.123.76.222;
 envelope-from=wucy11@chinatelecom.cn; helo=chinatelecom.cn
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
Cc: baiyw2@chinatelecom.cn, yuanmh12@chinatelecom.cn, tugy@chinatelecom.cn,
 David Hildenbrand <david@redhat.com>, huangy81@chinatelecom.cn,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 yubin1@chinatelecom.cn, dengpc12@chinatelecom.cn,
 Paolo Bonzini <pbonzini@redhat.com>, wucy11@chinatelecom.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Chongyun Wu <wucy11@chinatelecom.cn>

When log_sync_global of dirty ring is called, it will collect
dirty pages on all cpus, including all dirty pages on memslot,
so when memory_region_sync_dirty_bitmap collects dirty pages
from KVM, this interface needs to be called once, instead of
traversing every dirty page. Each memslot is called once,
which is meaningless and time-consuming. So only need to call
log_sync_global once in memory_region_sync_dirty_bitmap.

Signed-off-by: Chongyun Wu <wucy11@chinatelecom.cn>
---
 softmmu/memory.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/softmmu/memory.c b/softmmu/memory.c
index 8060c6d..46c3ff9 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -2184,6 +2184,12 @@ static void memory_region_sync_dirty_bitmap(MemoryRegion *mr)
              */
             listener->log_sync_global(listener);
             trace_memory_region_sync_dirty(mr ? mr->name : "(all)", listener->name, 1);
+            /*
+             * The log_sync_global of the dirty ring will collect the dirty
+             * pages of all memslots at one time, so there is no need to
+             * call log_sync_global once when traversing each memslot.
+             */
+            break;
         }
     }
 }
-- 
1.8.3.1


