Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB55693C82
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 03:53:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pROwy-0002Cs-Ii; Sun, 12 Feb 2023 21:52:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pROww-0002CO-Em
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 21:52:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pROwu-0006uN-Va
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 21:52:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676256732;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J1PvApjmhG7oH9VG9BIS8wCFWPQBXA149/Jod5H/WXU=;
 b=ei9Aisyf/YHFysCqeb2SlRvEpeK8KgXu8dLCZkvYTHtiunTKbgh8bc5o/7lDIX6r6taIq5
 xVO/gqv1hfBv0dVy30Qu5jqBvVGLeok0TxeauMjAYJKd2Y1DopmaWvD5xymCBgny0fHLOV
 9BogUduAu6ifO2bVoJhpb9hwDGxQqxI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-442-YvSnK5zJNQOvOYBe5PNQfw-1; Sun, 12 Feb 2023 21:52:10 -0500
X-MC-Unique: YvSnK5zJNQOvOYBe5PNQfw-1
Received: by mail-wm1-f72.google.com with SMTP id
 d18-20020a05600c34d200b003df901ab982so5441773wmq.4
 for <qemu-devel@nongnu.org>; Sun, 12 Feb 2023 18:52:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J1PvApjmhG7oH9VG9BIS8wCFWPQBXA149/Jod5H/WXU=;
 b=BmVdJ96RwFzwcbQrYvNH6fbNEmfejEI3nhVUqjJLjxFqJUI2OGzLT5D39Cnn97w4XD
 MxV3AHLdbb34inEERSdihGJrwVIONolJNugmR1NqqNzDJKJ3Q6G58whfS/leYzpVE08c
 cuSmEWTw4DCmh1O8CG/gfU0iFW+ZuG9BUrOpWaX7471Lyn2tYIdZUVRFC3stX3ogt3r6
 +pI4hL0MM9bgpkfZcBvFWx2svHJxg37NXCY57GPN0XuigfyjpuRCqjNG59rrJqvE9kc8
 bL1Jp/74+mag/1Q2xp9ORZcJpFmgoGK9Mc+ZbB76YG22Q/etxuqWHrQVrCxYw7VyIyPh
 oXpA==
X-Gm-Message-State: AO0yUKXelPV/VDuQZajXdArAjiP3N61C+uMD5lutrquwySQSSSlqkcZl
 XhtWtPdSXV974HrV2+1ccpqkqgHV+BgSfUqHyzESQ8j0vjG5pCAtYBJfSW979PXkT7h892ayOjj
 z/yxcrsvhcuv2mFnypNnLiipZSzOE6a3hO6IVrgRxVLTrDCN5klKtfutvU6RuPx6LVXGBcF9M
X-Received: by 2002:a05:600c:4b1c:b0:3df:eb5d:c583 with SMTP id
 i28-20020a05600c4b1c00b003dfeb5dc583mr17722592wmp.17.1676256729465; 
 Sun, 12 Feb 2023 18:52:09 -0800 (PST)
X-Google-Smtp-Source: AK7set80qYH099JdKFySD+5GaT3LkHTvatWgrRV2CSsU+tF2I5QJyqKHD1sZPkB+q5ZeqkpW3CZSsw==
X-Received: by 2002:a05:600c:4b1c:b0:3df:eb5d:c583 with SMTP id
 i28-20020a05600c4b1c00b003dfeb5dc583mr17722579wmp.17.1676256729240; 
 Sun, 12 Feb 2023 18:52:09 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 r14-20020a05600c35ce00b003dc4ecfc4d7sm13314982wmq.29.2023.02.12.18.52.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Feb 2023 18:52:08 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Subject: [PULL 10/22] migration: Make ram_save_target_page() a pointer
Date: Mon, 13 Feb 2023 03:51:38 +0100
Message-Id: <20230213025150.71537-11-quintela@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230213025150.71537-1-quintela@redhat.com>
References: <20230213025150.71537-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

We are going to create a new function for multifd latest in the series.

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/ram.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 6abfe075f2..0890816a30 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -452,6 +452,13 @@ void dirty_sync_missed_zero_copy(void)
     ram_counters.dirty_sync_missed_zero_copy++;
 }
 
+struct MigrationOps {
+    int (*ram_save_target_page)(RAMState *rs, PageSearchStatus *pss);
+};
+typedef struct MigrationOps MigrationOps;
+
+MigrationOps *migration_ops;
+
 CompressionStats compression_counters;
 
 struct CompressParam {
@@ -2295,14 +2302,14 @@ static bool save_compress_page(RAMState *rs, PageSearchStatus *pss,
 }
 
 /**
- * ram_save_target_page: save one target page
+ * ram_save_target_page_legacy: save one target page
  *
  * Returns the number of pages written
  *
  * @rs: current RAM state
  * @pss: data about the page we want to send
  */
-static int ram_save_target_page(RAMState *rs, PageSearchStatus *pss)
+static int ram_save_target_page_legacy(RAMState *rs, PageSearchStatus *pss)
 {
     RAMBlock *block = pss->block;
     ram_addr_t offset = ((ram_addr_t)pss->page) << TARGET_PAGE_BITS;
@@ -2428,7 +2435,7 @@ static int ram_save_host_page_urgent(PageSearchStatus *pss)
 
         if (page_dirty) {
             /* Be strict to return code; it must be 1, or what else? */
-            if (ram_save_target_page(rs, pss) != 1) {
+            if (migration_ops->ram_save_target_page(rs, pss) != 1) {
                 error_report_once("%s: ram_save_target_page failed", __func__);
                 ret = -1;
                 goto out;
@@ -2497,7 +2504,7 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss)
             if (preempt_active) {
                 qemu_mutex_unlock(&rs->bitmap_mutex);
             }
-            tmppages = ram_save_target_page(rs, pss);
+            tmppages = migration_ops->ram_save_target_page(rs, pss);
             if (tmppages >= 0) {
                 pages += tmppages;
                 /*
@@ -2697,6 +2704,8 @@ static void ram_save_cleanup(void *opaque)
     xbzrle_cleanup();
     compress_threads_save_cleanup();
     ram_state_cleanup(rsp);
+    g_free(migration_ops);
+    migration_ops = NULL;
 }
 
 static void ram_state_reset(RAMState *rs)
@@ -3252,6 +3261,8 @@ static int ram_save_setup(QEMUFile *f, void *opaque)
     ram_control_before_iterate(f, RAM_CONTROL_SETUP);
     ram_control_after_iterate(f, RAM_CONTROL_SETUP);
 
+    migration_ops = g_malloc0(sizeof(MigrationOps));
+    migration_ops->ram_save_target_page = ram_save_target_page_legacy;
     ret =  multifd_send_sync_main(f);
     if (ret < 0) {
         return ret;
-- 
2.39.1


