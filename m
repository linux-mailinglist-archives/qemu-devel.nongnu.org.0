Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8DB44E1FB1
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 05:59:38 +0100 (CET)
Received: from localhost ([::1]:48340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWA8l-0008Ay-TM
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 00:59:36 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wucy11@chinatelecom.cn>)
 id 1nW8ie-0003GA-M8
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 23:28:33 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.228]:40895
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <wucy11@chinatelecom.cn>) id 1nW8ic-00011w-Eu
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 23:28:32 -0400
HMM_SOURCE_IP: 172.18.0.48:58182.1398798744
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-36.111.64.85 (unknown [172.18.0.48])
 by chinatelecom.cn (HERMES) with SMTP id 623BD280126;
 Mon, 21 Mar 2022 11:12:41 +0800 (CST)
X-189-SAVE-TO-SEND: wucy11@chinatelecom.cn
Received: from  ([172.18.0.48])
 by app0024 with ESMTP id cef6c5c2e03143fa8cd9a09d2b252c43 for
 kvm@vger.kernel.org; Mon, 21 Mar 2022 11:12:46 CST
X-Transaction-ID: cef6c5c2e03143fa8cd9a09d2b252c43
X-Real-From: wucy11@chinatelecom.cn
X-Receive-IP: 172.18.0.48
X-MEDUSA-Status: 0
Message-ID: <78ba5059-5da0-8750-7663-d8e78e786523@chinatelecom.cn>
Date: Mon, 21 Mar 2022 11:12:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
From: Chongyun Wu <wucy11@chinatelecom.cn>
Subject: [PATCH 1/5] kvm, memory: Optimize dirty page collection for dirty ring
To: kvm@vger.kernel.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=42.123.76.228;
 envelope-from=wucy11@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 21 Mar 2022 00:52:38 -0400
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
Cc: "ligh10@chinatelecom.cn" <ligh10@chinatelecom.cn>,
 David Hildenbrand <david@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 yubin1@chinatelecom.cn, zhengwenm@chinatelecom.cn,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
index 678dc62..30d7281 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -2184,6 +2184,12 @@ static void memory_region_sync_dirty_bitmap(MemoryRegion *mr)
               */
              listener->log_sync_global(listener);
              trace_memory_region_sync_dirty(mr ? mr->name : "(all)", 
listener->name, 1);
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

-- 
Best Regard,
Chongyun Wu

