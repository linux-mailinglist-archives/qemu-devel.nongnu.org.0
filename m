Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F8554DF16
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 12:28:42 +0200 (CEST)
Received: from localhost ([::1]:49872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1mjw-0008Ph-PP
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 06:28:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nikita.lapshin@openvz.org>)
 id 1o1mc8-0006tF-U8
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 06:20:40 -0400
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131]:41786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nikita.lapshin@openvz.org>)
 id 1o1mc6-0000VU-UW
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 06:20:36 -0400
Received: by mail-lf1-x131.google.com with SMTP id 20so1493969lfz.8
 for <qemu-devel@nongnu.org>; Thu, 16 Jun 2022 03:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lUdRuVSrMtGHmkbRHa9MrI5I5UiON+MjCIoGMZGrKdw=;
 b=EuTLRdxWUbZwQHZSNa5oqd1VXdYE/l8H+o9hsgBgjp3LIb7IdBaglr++9f1azNTDeg
 cGx2ObGfK7zrxLO+290O+n++Ma4Pwv/2D9/zGY6eOqnIW2yeBA+zXBqdKuyygGvd3n3V
 9dx7+IpixrolAp5va3Lcck0mdi9KTX1tkbiidPbetuIeLlqZ1a6d4+2MSDuQodlmYoR/
 /PVXj0+4PVDEDZkoj0ghxE02Q0maZFu1UXHn3cEi4CncftVwWfZzf88yDzf71MK91IlY
 ddZeerabJpAyoWNn9Y+hWAgYu2Tf+cwuFeflOowbxBxyOu9XzZJPJffK+hHHqgI15Wr4
 PzgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lUdRuVSrMtGHmkbRHa9MrI5I5UiON+MjCIoGMZGrKdw=;
 b=4jyf0G23MsnJAliwaIUkddWeYMQ7wiq7Bpa5ZsXE6vVk0+lp+pc1SdjX/zKZIl6My6
 T7f3EEpJNomjI0aobK+oCIQTetKlKLaSnIQxtZVx5K7jyrnbraNm8jVrJ1xhh+1LHHFW
 QpX7C8+McCgso7Iy6tlDOHwkU0HM6kShNUb576Xm5qUiEnzNOxpDZPP24lv37r+kY4KM
 m/P/XXQ5VQwSwmP/BugKQ3cJMI78WIyduqQzUNKRaCZLujXSxBxONLzCSTU0aMlI7011
 7TfhPUA10hExtFeXiJ/ustKLc2zLq1fU7N6ecFlGi9pRcILLHMxuW1ATWuf6VL6k6kRV
 Y4Zg==
X-Gm-Message-State: AJIora8mKqg+TqEAlfKoCZoJxoN3FIXI3Gag5AQl19vMixoW8GTGSNGV
 l5EM9zmJYSFq02ZGS0laFtuy5ogElXNrvsSM
X-Google-Smtp-Source: AGRyM1vo1GBrABTuvuAfBRiIDb1izIANN6wSW9jvRGv0GqYLPdITbecmX9qCIbzx3HTMh7RM3pDr/Q==
X-Received: by 2002:ac2:4c04:0:b0:479:6ee1:8992 with SMTP id
 t4-20020ac24c04000000b004796ee18992mr2238388lfq.35.1655374832563; 
 Thu, 16 Jun 2022 03:20:32 -0700 (PDT)
Received: from localhost.localdomain ([93.175.28.49])
 by smtp.gmail.com with ESMTPSA id
 q17-20020a05651232b100b0047255d21166sm179014lfe.149.2022.06.16.03.20.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 03:20:32 -0700 (PDT)
From: nikita.lapshin@openvz.org
To: qemu-devel@nongnu.org
Cc: den@virtuozzo.com, andrey.drobyshev@virtuozzo.com, quintela@redhat.com,
 dgilbert@redhat.com, nikita.lapshin@openvz.org
Subject: [PATCH 4/8] igration: Add dirty-bitmaps part of migration stream
Date: Thu, 16 Jun 2022 13:20:00 +0300
Message-Id: <20220616102006.218693-5-nikita.lapshin@openvz.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220616102006.218693-1-nikita.lapshin@openvz.org>
References: <20220616102006.218693-1-nikita.lapshin@openvz.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::131;
 envelope-from=nikita.lapshin@openvz.org; helo=mail-lf1-x131.google.com
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


