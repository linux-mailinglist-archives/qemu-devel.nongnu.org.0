Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACAA9642664
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Dec 2022 11:09:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p28ES-00058s-V4; Mon, 05 Dec 2022 04:57:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1p28E9-0004xU-W3
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 04:57:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1p28E4-0007v0-DV
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 04:57:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670234246;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MyOOzG/IByBPCSi/RuF6EO6mdBGoKRDsMNpVGRjYHyo=;
 b=Cs+p304/d5+FpMKoVf3NuSFCwrAu3YS9HwhuQCvmQGPE4DvEkWOQFf3/C10TSvlQWUizym
 TzTiY36kAHTVzmEhd3cWvcdvDy/3DPZ8vjDj4xA4IgwS990eF6PFJIwF/21nMf2vIkh8M5
 S7q2VsFtKaSWRYCOQiwqJbvYjiAICjM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-454-mDjzPx4ePvSGdoy5QNK39A-1; Mon, 05 Dec 2022 04:57:23 -0500
X-MC-Unique: mDjzPx4ePvSGdoy5QNK39A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 11A17299E755;
 Mon,  5 Dec 2022 09:57:22 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.135])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8E45D2166B29;
 Mon,  5 Dec 2022 09:57:14 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <huth@tuxfamily.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Kevin Wolf <kwolf@redhat.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Eric Blake <eblake@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Juan Quintela <quintela@redhat.com>,
 virtio-fs@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, qemu-block@nongnu.org,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, Thomas Huth <thuth@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Eduardo Habkost <eduardo@habkost.net>, Gerd Hoffmann <kraxel@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Eric Farman <farman@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Jason Wang <jasowang@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Song Gao <gaosong@loongson.cn>, qemu-s390x@nongnu.org,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Klaus Jensen <its@irrelevant.dk>, John Snow <jsnow@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Keith Busch <kbusch@kernel.org>, David Hildenbrand <david@redhat.com>,
 qemu-trivial@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Peter Xu <peterx@redhat.com>
Subject: [PATCH v2 36/51] migration: Remove RAMState.f references in
 compression code
Date: Mon,  5 Dec 2022 10:52:13 +0100
Message-Id: <20221205095228.1314-37-quintela@redhat.com>
In-Reply-To: <20221205095228.1314-1-quintela@redhat.com>
References: <20221205095228.1314-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

From: Peter Xu <peterx@redhat.com>

Removing referencing to RAMState.f in compress_page_with_multi_thread() and
flush_compressed_data().

Compression code by default isn't compatible with having >1 channels (or it
won't currently know which channel to flush the compressed data), so to
make it simple we always flush on the default to_dst_file port until
someone wants to add >1 ports support, as rs->f right now can really
change (after postcopy preempt is introduced).

There should be no functional change at all after patch applied, since as
long as rs->f referenced in compression code, it must be to_dst_file.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 41475431fc..6e3dc845c5 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1461,6 +1461,7 @@ static bool save_page_use_compression(RAMState *rs);
 
 static void flush_compressed_data(RAMState *rs)
 {
+    MigrationState *ms = migrate_get_current();
     int idx, len, thread_count;
 
     if (!save_page_use_compression(rs)) {
@@ -1479,7 +1480,7 @@ static void flush_compressed_data(RAMState *rs)
     for (idx = 0; idx < thread_count; idx++) {
         qemu_mutex_lock(&comp_param[idx].mutex);
         if (!comp_param[idx].quit) {
-            len = qemu_put_qemu_file(rs->f, comp_param[idx].file);
+            len = qemu_put_qemu_file(ms->to_dst_file, comp_param[idx].file);
             /*
              * it's safe to fetch zero_page without holding comp_done_lock
              * as there is no further request submitted to the thread,
@@ -1498,11 +1499,11 @@ static inline void set_compress_params(CompressParam *param, RAMBlock *block,
     param->offset = offset;
 }
 
-static int compress_page_with_multi_thread(RAMState *rs, RAMBlock *block,
-                                           ram_addr_t offset)
+static int compress_page_with_multi_thread(RAMBlock *block, ram_addr_t offset)
 {
     int idx, thread_count, bytes_xmit = -1, pages = -1;
     bool wait = migrate_compress_wait_thread();
+    MigrationState *ms = migrate_get_current();
 
     thread_count = migrate_compress_threads();
     qemu_mutex_lock(&comp_done_lock);
@@ -1510,7 +1511,8 @@ retry:
     for (idx = 0; idx < thread_count; idx++) {
         if (comp_param[idx].done) {
             comp_param[idx].done = false;
-            bytes_xmit = qemu_put_qemu_file(rs->f, comp_param[idx].file);
+            bytes_xmit = qemu_put_qemu_file(ms->to_dst_file,
+                                            comp_param[idx].file);
             qemu_mutex_lock(&comp_param[idx].mutex);
             set_compress_params(&comp_param[idx], block, offset);
             qemu_cond_signal(&comp_param[idx].cond);
@@ -2263,7 +2265,7 @@ static bool save_compress_page(RAMState *rs, RAMBlock *block, ram_addr_t offset)
         return false;
     }
 
-    if (compress_page_with_multi_thread(rs, block, offset) > 0) {
+    if (compress_page_with_multi_thread(block, offset) > 0) {
         return true;
     }
 
-- 
2.38.1


