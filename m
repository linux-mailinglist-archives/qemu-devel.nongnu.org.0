Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6246254DF91
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 12:55:09 +0200 (CEST)
Received: from localhost ([::1]:34590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1n9Y-00043v-Eu
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 06:55:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nikita.lapshin@openvz.org>)
 id 1o1mjh-0001gQ-Vu
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 06:28:26 -0400
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230]:35525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nikita.lapshin@openvz.org>)
 id 1o1mjg-0001tc-4u
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 06:28:25 -0400
Received: by mail-lj1-x230.google.com with SMTP id r24so1014353ljn.2
 for <qemu-devel@nongnu.org>; Thu, 16 Jun 2022 03:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oK8v0UyddkjpSuECXSazJBzWB9ix/qZIBfYgHUOu/4I=;
 b=sTJuRmkp5sXbFB48qA2bSxSO6moOwRYIoiwJk/aW+SNdRQ2W2waPh/X1Zb4cL7NLjW
 R2n73sqYHMXXVgmOyWSaB6RISyoHk8GwL16rRkP2vqoBrjPpovmUnnv0LXJo7TB7erx0
 WuMPb9y/z2pAtbzwwpBJWSsIP3S4jNt3bS4fP6LO5H+EVad5Hst39swJgF/0vugeOA9o
 NMmabQLFwUwyCzJxp+PPm62GyWnwBxdRUdx7GkT5T7C1fR0KColSPP7ODfC9I1sp88Jb
 BrPpSJ/Q5wSurKA1w2GDaVahyc+ihcDloSrM+3bnn92ivacOoqCm9uhr2ZT9HJK5vpRC
 wbhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oK8v0UyddkjpSuECXSazJBzWB9ix/qZIBfYgHUOu/4I=;
 b=KJ5cHYzFZsG570MAkGBWFETJsK4UJ+UJzgiDY9G6juNJWuI4BUfSskZBHibW8eKwC2
 NC2OdvsiaGavNMf+R/SSLqUlir45IyAoTp5O5AC/wpp4nKsYNCtp0CDD+jXC50CoRwoE
 mGlUyq+a3Od+qPJoXhV0WHKYtiPoFY6R/QAyDTNUm2KKGE6q4dvKD0Wb3l++zsoMK0Vx
 6WeQe4uicm/79jw/NIPWwPbgnKbT9ePdxsMfkCqE3R6UWlpXdavvaUplkT0uvH5YbCm0
 9j5zb7KFWOPBUfQ1CXeqsmKwgUKDHsCg13RyE6WhPRzStHEwPh8fCqhyW2YinXRq4joZ
 FqUA==
X-Gm-Message-State: AJIora8hYKqrCXvI+rl/VibsiqhfT1okJiuGdiRXHO6YEHVLM7xk1xJc
 EkmlzVoBqkXYCWGx0UoOqwoZULFsa9J4WB8f
X-Google-Smtp-Source: AGRyM1saB8BylyeIopcZnAmtrgggK9IF8p2+ukxRSBj9Lp8gcmwMb8McfeZRgBXirO2n/6MBJcwPYw==
X-Received: by 2002:a2e:80d8:0:b0:255:8307:1c87 with SMTP id
 r24-20020a2e80d8000000b0025583071c87mr2166655ljg.169.1655375302511; 
 Thu, 16 Jun 2022 03:28:22 -0700 (PDT)
Received: from localhost.localdomain ([93.175.28.49])
 by smtp.gmail.com with ESMTPSA id
 y24-20020a199158000000b0047255d21128sm182581lfj.87.2022.06.16.03.28.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 03:28:22 -0700 (PDT)
From: nikita.lapshin@openvz.org
To: qemu-devel@nongnu.org
Cc: den@virtuozzo.com, andrey.drobyshev@virtuozzo.com, quintela@redhat.com,
 dgilbert@redhat.com, nikita.lapshin@openvz.org
Subject: [PATCH v3 06/17] migration: Add RAM part of migration stream
Date: Thu, 16 Jun 2022 13:28:00 +0300
Message-Id: <20220616102811.219007-7-nikita.lapshin@openvz.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220616102811.219007-1-nikita.lapshin@openvz.org>
References: <20220616102811.219007-1-nikita.lapshin@openvz.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::230;
 envelope-from=nikita.lapshin@openvz.org; helo=mail-lj1-x230.google.com
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


