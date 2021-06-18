Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C287D3ACEF6
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 17:29:45 +0200 (CEST)
Received: from localhost ([::1]:54212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luGRE-0001HT-Pn
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 11:29:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1luGPu-0006fq-7t
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 11:28:22 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.223]:34128
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1luGPs-0008GU-D8
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 11:28:22 -0400
HMM_SOURCE_IP: 172.18.0.218:58570.1979376666
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-202.80.192.39?logid-c4a34c2761364744ac7f6e25c2e48997
 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id 02CB9280079;
 Fri, 18 Jun 2021 23:28:19 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([172.18.0.218])
 by app0025 with ESMTP id a112cb8b32cf4d20b1d39c3b3cafb5f8 for
 qemu-devel@nongnu.org; Fri Jun 18 23:28:19 2021
X-Transaction-ID: a112cb8b32cf4d20b1d39c3b3cafb5f8
X-filter-score: filter<0>
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.218
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: qemu-devel@nongnu.org
Subject: [PATCH v8 4/6] migration/dirtyrate: adjust order of registering thread
Date: Fri, 18 Jun 2021 23:32:05 +0800
Message-Id: <18d75b9dcaba5b566d7576572a9090768acb9251.1624028590.git.huangy81@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1624028590.git.huangy81@chinatelecom.cn>
References: <cover.1624028590.git.huangy81@chinatelecom.cn>
In-Reply-To: <cover.1624028590.git.huangy81@chinatelecom.cn>
References: <cover.1624028590.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.223;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Hyman <huangy81@chinatelecom.cn>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Chuan Zheng <zhengchuan@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>

registering get_dirtyrate thread in advance so that both
page-sampling and dirty-ring mode can be covered.

Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
---
 migration/dirtyrate.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
index e0a27a9..a9bdd60 100644
--- a/migration/dirtyrate.c
+++ b/migration/dirtyrate.c
@@ -352,7 +352,6 @@ static void calculate_dirtyrate(struct DirtyRateConfig config)
     int64_t msec = 0;
     int64_t initial_time;
 
-    rcu_register_thread();
     rcu_read_lock();
     initial_time = qemu_clock_get_ms(QEMU_CLOCK_REALTIME);
     if (!record_ramblock_hash_info(&block_dinfo, config, &block_count)) {
@@ -375,7 +374,6 @@ static void calculate_dirtyrate(struct DirtyRateConfig config)
 out:
     rcu_read_unlock();
     free_ramblock_dirty_info(block_dinfo, block_count);
-    rcu_unregister_thread();
 }
 
 void *get_dirtyrate_thread(void *arg)
@@ -383,6 +381,7 @@ void *get_dirtyrate_thread(void *arg)
     struct DirtyRateConfig config = *(struct DirtyRateConfig *)arg;
     int ret;
     int64_t start_time;
+    rcu_register_thread();
 
     ret = dirtyrate_set_state(&CalculatingState, DIRTY_RATE_STATUS_UNSTARTED,
                               DIRTY_RATE_STATUS_MEASURING);
@@ -401,6 +400,8 @@ void *get_dirtyrate_thread(void *arg)
     if (ret == -1) {
         error_report("change dirtyrate state failed.");
     }
+
+    rcu_unregister_thread();
     return NULL;
 }
 
-- 
1.8.3.1


