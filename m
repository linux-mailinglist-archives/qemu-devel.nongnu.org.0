Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA0E693C50
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 03:31:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pROb5-0001Ya-Bd; Sun, 12 Feb 2023 21:29:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pROb1-0001Xt-UO
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 21:29:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pROaz-00034T-W7
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 21:29:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676255373;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PZlebtb52gHEYf4LdFiVz+W2gRdaAlvhDiXn8io+x3s=;
 b=ByDP8yVc6HnWPj4LBjES9k6j8F/6QaZpwkwXKejqBvJrW4NilUPE0oj+aZm8h6hWe77/wD
 sarFEllEiYvCisFQ+1y+4Syd0qKmHOxoL/YSE82iWIfd9jzB5AFuW+fD6imEVwsL4nrkAb
 viT3uXUAJmzt2l8jzj6n/qlV19yPOCo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-509-7L6fRShaOK-aJ7V4XyCaCg-1; Sun, 12 Feb 2023 21:29:31 -0500
X-MC-Unique: 7L6fRShaOK-aJ7V4XyCaCg-1
Received: by mail-wm1-f70.google.com with SMTP id
 n7-20020a05600c3b8700b003dc55dcb298so6033052wms.8
 for <qemu-devel@nongnu.org>; Sun, 12 Feb 2023 18:29:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PZlebtb52gHEYf4LdFiVz+W2gRdaAlvhDiXn8io+x3s=;
 b=Dh4tRNEwh+VnFcbgvqNXHWr/dXF/MkRmdcmJMjcP+R9hkXI5avrmnFiHTSlK5E569S
 MRbUr51UgsvaxEhS14vuXJEqoCePAwTJXxoUQF6HhZEV8rEPzDBAVzd/qFC8VQA1Rog9
 mTv6ziXdAdS8Xru29i4amjcXmIFPyT6Y6daKqORvNdL9cD9bh9VoZQfHyFFqOzJ6h9vV
 IU3VLaFrY85Z5iRduBoPsvoayA/PIgGJpjqxBwbq2Vv8ennWKczVdCLNxGhdGBNNbKZo
 E3tT9xP+0c8eMuCD7KGQzPa5yTc4AL57mztIfoExgLtNx7smjOooviiG1sf9cpSC7nZB
 2zOA==
X-Gm-Message-State: AO0yUKX/uG9y4PMZWSDOKp4j8ET6eVb32HevshRdRY7WsUSnL1XjXyWI
 Bgw5AKVsWrjAIKfokG0XUFehAKa6Fvo3XY3gcA4td3J7Uzey9jRqC57N6LyqHRdjocBg/iSZjys
 sCNp/dOwZ1+jCD7mUoE8q7NN/2FrngLN3dNcWellzssq5wCESadv6h+++eazdzCdTXQKywBR0
X-Received: by 2002:a5d:5088:0:b0:2c5:4c7c:6aad with SMTP id
 a8-20020a5d5088000000b002c54c7c6aadmr6289449wrt.8.1676255370139; 
 Sun, 12 Feb 2023 18:29:30 -0800 (PST)
X-Google-Smtp-Source: AK7set8/GQc1nte9GQy9mwEksu9qfWqfwiFlIzARDdce28uDL0iyRZPoyWc9DPV4HT3Wb6MpMnVIhw==
X-Received: by 2002:a5d:5088:0:b0:2c5:4c7c:6aad with SMTP id
 a8-20020a5d5088000000b002c54c7c6aadmr6289433wrt.8.1676255369924; 
 Sun, 12 Feb 2023 18:29:29 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 bi5-20020a05600c3d8500b003d9aa76dc6asm16368498wmb.0.2023.02.12.18.29.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Feb 2023 18:29:29 -0800 (PST)
From: Xxx Xx <quintela@redhat.com>
X-Google-Original-From: Xxx Xx <xxx.xx@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL 10/22] migration: Make ram_save_target_page() a pointer
Date: Mon, 13 Feb 2023 03:28:59 +0100
Message-Id: <20230213022911.68490-11-xxx.xx@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230213022911.68490-1-xxx.xx@gmail.com>
References: <20230213022911.68490-1-xxx.xx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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

From: Juan Quintela <quintela@redhat.com>

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


