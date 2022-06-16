Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC4354DF13
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 12:28:07 +0200 (CEST)
Received: from localhost ([::1]:48318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1mjO-0007Kd-V8
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 06:28:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nikita.lapshin@openvz.org>)
 id 1o1mcD-0006vP-0b
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 06:20:42 -0400
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233]:41823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nikita.lapshin@openvz.org>)
 id 1o1mcB-0000WA-CS
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 06:20:40 -0400
Received: by mail-lj1-x233.google.com with SMTP id v8so976442ljj.8
 for <qemu-devel@nongnu.org>; Thu, 16 Jun 2022 03:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oK8v0UyddkjpSuECXSazJBzWB9ix/qZIBfYgHUOu/4I=;
 b=rCfEZ327dMhx8oWkONbU4XJoJgsLbPnFeNhV/yutpsj2gEinqpAlisMzDZ4c1wWb94
 CD/Gaaj1+GEgDTA+gxr8lhSXhiaTupVAVUozIA/w68ADIfPmLJ+YRxCoy57xlLF0Dy6w
 N2EyxGHph00L050ol1HnGtd4YnX205omJHXlAYsS4gkTKXqaa2hGmWQnIK5hxjjBgIMm
 9X/oO4gW5gigRwO29fCBqy5FHlKxvZ69BasBPeLZRlPPo6P4L3SY6bdI4UaAJwUTtyqM
 Kf4gOivevbReQJbbY2jTChtovSTFuIbkXDsedS86EaU7VCYrlATijQrmm8jlE95+lzVD
 6bTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oK8v0UyddkjpSuECXSazJBzWB9ix/qZIBfYgHUOu/4I=;
 b=sDi1MUBnleO157Ytr/imjH5i90IoLFrxznUSoeAg76+4pDylld/tNX/7wgvDxCu1M0
 opJ3GXEqF5ADS6mZqtjEJp2rlLs0xTdXWUd1kSkoDn2al4XDsX1msGG0ncjtAEfzmvUg
 5iZz9ZZwi4NYJsE3IKPxKJin+gQ4Ps9SCfimUMqZEzfPjy9la6Dc85xW3jg4T2g8b+Jt
 cjn8Q4fJMJTEoMQqsG83y1442nBK8n4pJmRrwUg6tg66ArjuXiLtSqVadS15cHTPM9Gc
 sguXGlPJCJ5nColo6o6E/CmHMugoXCIU1bIzzYxtq80IfsedBRTjcxuv+wxUJh673dab
 Az8w==
X-Gm-Message-State: AJIora9Kv4O6NERi4kXCDuagn6u6LcVr3/d90iaIgXRC4K8mP3V9F9BT
 lTtaZST7G1ibGfy6W90aZHL2DrXI+nMg9c9s
X-Google-Smtp-Source: AGRyM1vN+kN5Ulal7y4L1Hlshu1CbR2GJoTpIQAtYaX2wzj02btI/Ub8PTQ34CfTzY0hVmQiW7d1kw==
X-Received: by 2002:a2e:908b:0:b0:255:68b4:4085 with SMTP id
 l11-20020a2e908b000000b0025568b44085mr2067707ljg.369.1655374836856; 
 Thu, 16 Jun 2022 03:20:36 -0700 (PDT)
Received: from localhost.localdomain ([93.175.28.49])
 by smtp.gmail.com with ESMTPSA id
 q17-20020a05651232b100b0047255d21166sm179014lfe.149.2022.06.16.03.20.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 03:20:36 -0700 (PDT)
From: nikita.lapshin@openvz.org
To: qemu-devel@nongnu.org
Cc: den@virtuozzo.com, andrey.drobyshev@virtuozzo.com, quintela@redhat.com,
 dgilbert@redhat.com, nikita.lapshin@openvz.org
Subject: [PATCH 6/8] migration: Add RAM part of migration stream
Date: Thu, 16 Jun 2022 13:20:04 +0300
Message-Id: <20220616102006.218693-9-nikita.lapshin@openvz.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220616102006.218693-1-nikita.lapshin@openvz.org>
References: <20220616102006.218693-1-nikita.lapshin@openvz.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::233;
 envelope-from=nikita.lapshin@openvz.org; helo=mail-lj1-x233.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

From: Nikita Lapshin <nikita.lapshin@openvz.org>

'ram' parameter enable RAM sections in migration stream. If it
isn't specified it will be skipped.

Signed-off-by: Nikita Lapshin <nikita.lapshin@openvz.org>
---
 migration/migration.c | 17 ++++++++++++++++-
 migration/migration.h |  1 +
 migration/ram.c       |  6 ++++++
 3 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/migration/migration.c b/migration/migration.c
index d81f3c6891..6528b3ad41 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1339,7 +1339,8 @@ static bool check_stream_parts(strList *stream_list)
     for (; stream_list; stream_list = stream_list->next) {
         if (!strcmp(stream_list->value, "vmstate") ||
             !strcmp(stream_list->value, "dirty-bitmaps") ||
-            !strcmp(stream_list->value, "block")) {
+            !strcmp(stream_list->value, "block") ||
+            !strcmp(stream_list->value, "ram")) {
             continue;
         }
 
@@ -2653,6 +2654,20 @@ bool migrate_background_snapshot(void)
     return s->enabled_capabilities[MIGRATION_CAPABILITY_BACKGROUND_SNAPSHOT];
 }
 
+bool migrate_ram(void)
+{
+    MigrationState *s;
+
+    s = migrate_get_current();
+
+    /*
+     * By default RAM is enabled so if stream-content-list disabled
+     * RAM will be passed.
+     */
+    return !s->parameters.has_stream_content_list ||
+           migrate_find_stream_content("ram");
+}
+
 /* Checks if stream-content parameter has section_name in list */
 bool migrate_find_stream_content(const char *section_name)
 {
diff --git a/migration/migration.h b/migration/migration.h
index 411c58e919..5c43788a2b 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -395,6 +395,7 @@ int migrate_decompress_threads(void);
 bool migrate_use_events(void);
 bool migrate_postcopy_blocktime(void);
 bool migrate_background_snapshot(void);
+bool migrate_ram(void);
 
 bool migrate_find_stream_content(const char *section_name);
 
diff --git a/migration/ram.c b/migration/ram.c
index 170e522a1f..ddc7abd08a 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -4263,6 +4263,11 @@ static int ram_resume_prepare(MigrationState *s, void *opaque)
     return 0;
 }
 
+static bool is_ram_active(void *opaque)
+{
+    return migrate_ram();
+}
+
 static SaveVMHandlers savevm_ram_handlers = {
     .save_setup = ram_save_setup,
     .save_live_iterate = ram_save_iterate,
@@ -4275,6 +4280,7 @@ static SaveVMHandlers savevm_ram_handlers = {
     .load_setup = ram_load_setup,
     .load_cleanup = ram_load_cleanup,
     .resume_prepare = ram_resume_prepare,
+    .is_active = is_ram_active,
 };
 
 static void ram_mig_ram_block_resized(RAMBlockNotifier *n, void *host,
-- 
2.31.1


