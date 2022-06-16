Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB1054DF3F
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 12:38:37 +0200 (CEST)
Received: from localhost ([::1]:37358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1mtY-0002lp-5y
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 06:38:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nikita.lapshin@openvz.org>)
 id 1o1mjg-0001da-Nz
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 06:28:25 -0400
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233]:34730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nikita.lapshin@openvz.org>)
 id 1o1mje-0001tJ-MZ
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 06:28:24 -0400
Received: by mail-lj1-x233.google.com with SMTP id e4so1018897ljl.1
 for <qemu-devel@nongnu.org>; Thu, 16 Jun 2022 03:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lUdRuVSrMtGHmkbRHa9MrI5I5UiON+MjCIoGMZGrKdw=;
 b=ZtRLxkre0IdttOeRRe3ScTnCThUurNZt+ZKaEcppASu7/9JFwbjePtdg2pecDxsDAy
 Xv3G6+QR2NZCoCcy780U7qRIR2mPWibY0Y8I4vrHZo6oO8+MOENRjOWjm6fK29it1+Im
 OKQvdVjhZNpjK76HQSOpSuUhBV+uhLuDJM2e8uaMmCdrgot3LGVt3usCs+YTuZLHEYCf
 QomIEjVeJMlJv1AmYArWbmxnGPgUw1+P1doQtY83QzFQ+yvkhkMAW3V17kUKe7cRC/c8
 6XYhf0VscLYH64sP4TJ139VwPUZABluSIVD23p6WwTMSaMq+d5xN9cMRfgRXxpcOcPp7
 s5fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lUdRuVSrMtGHmkbRHa9MrI5I5UiON+MjCIoGMZGrKdw=;
 b=iMmA6BXtgCqae+KWKW5StvU7A9hmtfYcgB3O9qo9mg6VxO0wALhtJXavcYtt1cAAHJ
 f09k0s/xC/mNveZbMXEWBKyQ+mPmrYD2MvIcZaBXfQBCCHKKJrdQWuTuDzXjcb62UB4j
 kgjLvYQuduezjF1U8Q62uoWajJuhClQvg2Qsr4f8/1zCHBmngfW9KdxAT36zBVLdztWr
 axCnLX6AN0FWrLZ598ae77uobJW5llJf4JDRhVw97dMP5Gt9v3oOpwyMVt27I1MvNuBG
 fhgTZxeeDKT96PdXdYIY6T5nM9tDEPTrsHQumCJTrfpGTUYON8eHbw7xTiGU0jhBaY/T
 tPHg==
X-Gm-Message-State: AJIora870tKBNcPdpbB+wJpzyQXBioBil21YiuL8qm1jfy8ZCSBkq7A9
 olvoxu8SD6Rxuqw4ntQ4NHmzW00J2sReIZ3C
X-Google-Smtp-Source: AGRyM1vuflsq3TwUyYqRcyrI6k0R7AaWGwXM0HTv1Vbk7HGcq7dYqCsoYWnb35xqcuoWn86cBQgDDA==
X-Received: by 2002:a05:651c:19a2:b0:255:9fc6:c12 with SMTP id
 bx34-20020a05651c19a200b002559fc60c12mr2040433ljb.457.1655375300634; 
 Thu, 16 Jun 2022 03:28:20 -0700 (PDT)
Received: from localhost.localdomain ([93.175.28.49])
 by smtp.gmail.com with ESMTPSA id
 y24-20020a199158000000b0047255d21128sm182581lfj.87.2022.06.16.03.28.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 03:28:19 -0700 (PDT)
From: nikita.lapshin@openvz.org
To: qemu-devel@nongnu.org
Cc: den@virtuozzo.com, andrey.drobyshev@virtuozzo.com, quintela@redhat.com,
 dgilbert@redhat.com, nikita.lapshin@openvz.org
Subject: [PATCH v3 04/17] migration: Add dirty-bitmaps part of migration stream
Date: Thu, 16 Jun 2022 13:27:58 +0300
Message-Id: <20220616102811.219007-5-nikita.lapshin@openvz.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220616102811.219007-1-nikita.lapshin@openvz.org>
References: <20220616102811.219007-1-nikita.lapshin@openvz.org>
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

This patch enables and disable dirty-bitmaps in migration stream.

Signed-off-by: Nikita Lapshin <nikita.lapshin@openvz.org>
---
 migration/migration.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index bbf9b6aad1..ad789915ce 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1337,7 +1337,8 @@ void qmp_migrate_set_capabilities(MigrationCapabilityStatusList *params,
 static bool check_stream_parts(strList *stream_list)
 {
     for (; stream_list; stream_list = stream_list->next) {
-        if (!strcmp(stream_list->value, "vmstate")) {
+        if (!strcmp(stream_list->value, "vmstate") ||
+            !strcmp(stream_list->value, "dirty-bitmaps")) {
             continue;
         }
 
@@ -2501,7 +2502,8 @@ bool migrate_dirty_bitmaps(void)
 
     s = migrate_get_current();
 
-    return s->enabled_capabilities[MIGRATION_CAPABILITY_DIRTY_BITMAPS];
+    return s->enabled_capabilities[MIGRATION_CAPABILITY_DIRTY_BITMAPS] ||
+           migrate_find_stream_content("dirty-bitmaps");
 }
 
 bool migrate_ignore_shared(void)
-- 
2.31.1


