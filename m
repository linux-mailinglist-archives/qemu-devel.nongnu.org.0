Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE5240AD6B
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 14:19:10 +0200 (CEST)
Received: from localhost ([::1]:34688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ7P3-00069D-PP
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 08:19:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <konstantin@daynix.com>)
 id 1mQ7Ke-00017p-At
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 08:14:38 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:46803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <konstantin@daynix.com>)
 id 1mQ7Kc-00069f-Lf
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 08:14:36 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 d207-20020a1c1dd8000000b00307e2d1ec1aso2353281wmd.5
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 05:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cmdjvZojVD2HzfNmJstg7wSctTZbk5toKnW3LsMCZdk=;
 b=COYOMrqtbIpx6gFcdwu0FvvILYkC7jJNfWnr00W86fEGQfXrydYkWGI7Pnl5cQ/kP6
 T6Ux0JIYopkjSQAY+gc8rgaNo+rVrqYxnvYfz3GUppVsIIPe4Xb9DXWLAh/UFZUevt+w
 BwUdFGQXWxwZGqFe40OCHmadrAFNh0N9e0alt+HruuWGO9v5W9qNvhDz+UPg0Wjxy8w+
 zRb4DmBh99WWbWmQt2AdYuVSGmr7Pnca6c2KafwmVu9fHGuMo2wTHNXHTPIqvF5Hk7Ut
 ho+U4U9qTMH0RDhcnsBZ44O0z+8n3XRBKkcJD8q9hLdUVYh4irVviQUEW5Bnk4CoHgIK
 u+AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cmdjvZojVD2HzfNmJstg7wSctTZbk5toKnW3LsMCZdk=;
 b=yp0WrJDchPbNtPuZb6VJC5MQPyQrkuX0dC1qxD9gSJ2XbXDyHPZuZC+dzCjKlDuT0S
 g4UwUtoJmwqSK8h3amnEJ6zOQm6buTumPvTmEcYxoB+6L4xZrIy2fTrdUVjscCSV67+a
 raS510jgvOTqOhBA6PYo/GXf9m8jjNtCxlTa5BUrnWpMZH2+HXSCHBgc5hmxuINqgahk
 Lw4UghtS4JeE6QJuVbMOkaS2vRb3I/03np6tq/bZ8abWCPG1pgUKHbNu8f3FLkn9m65f
 mt2zyFtgHtnSrcugdKrSj12GporAmDZt4k6vYBhukGhR2KcnYQ2QG7NgYa57+zNLceXu
 6siA==
X-Gm-Message-State: AOAM533f263+Zts7xM60Zo5GpYTxyEyQMFfU49z1B+cTWMudcrHCPbD4
 BvXhZAUhRelLy/YpiMrUN9OclcKnholuvj8Q
X-Google-Smtp-Source: ABdhPJz2cXJirlwEVTHMxHOe2Jiu4QqAf3Aej5A9KH/6PwUStq2jpH5FTlbEKPDmsWoOhs2Hy+k7dw==
X-Received: by 2002:a1c:cc05:: with SMTP id h5mr1842925wmb.5.1631621671626;
 Tue, 14 Sep 2021 05:14:31 -0700 (PDT)
Received: from localhost.localdomain ([185.213.234.105])
 by smtp.gmail.com with ESMTPSA id m2sm998792wmm.3.2021.09.14.05.14.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Sep 2021 05:14:31 -0700 (PDT)
From: Kostiantyn Kostiuk <konstantin@daynix.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] qga-win: Detect OS based on Windows 10 by first build
 number
Date: Tue, 14 Sep 2021 15:14:19 +0300
Message-Id: <20210914121420.183499-1-konstantin@daynix.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::335;
 envelope-from=konstantin@daynix.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Yan Vugenfirer <yan@daynix.com>, Michael Roth <michael.roth@amd.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Windows Server 2016, 2019, 2022 are based on Windows 10 and
have the same major and minor versions. So, the only way to
detect the proper version is to use the build number.

Before this commit, the guest agent use the last build number
for each OS, but it causes problems when new OS releases.
There are few preview versions before release, and we
can't update this list.

After this commit, the guest agent will use the first build
number. For each new preview version or release version,
Microsoft increases the build number, so we can add the number
of the first preview build and this will work until the new
OS release.

Signed-off-by: Kostiantyn Kostiuk <konstantin@daynix.com>
---
 qga/commands-win32.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/qga/commands-win32.c b/qga/commands-win32.c
index 4e84afd83b..a8e9d40b31 100644
--- a/qga/commands-win32.c
+++ b/qga/commands-win32.c
@@ -2162,7 +2162,7 @@ static ga_matrix_lookup_t const WIN_VERSION_MATRIX[2][8] = {
 };
 
 typedef struct _ga_win_10_0_server_t {
-    int final_build;
+    int first_build;
     char const *version;
     char const *version_id;
 } ga_win_10_0_server_t;
@@ -2202,18 +2202,22 @@ static char *ga_get_win_name(OSVERSIONINFOEXW const *os_version, bool id)
     int tbl_idx = (os_version->wProductType != VER_NT_WORKSTATION);
     ga_matrix_lookup_t const *table = WIN_VERSION_MATRIX[tbl_idx];
     ga_win_10_0_server_t const *win_10_0_table = WIN_10_0_SERVER_VERSION_MATRIX;
+    ga_win_10_0_server_t const *win_10_0_version = NULL;
     while (table->version != NULL) {
         if (major == 10 && minor == 0 && tbl_idx) {
             while (win_10_0_table->version != NULL) {
-                if (build <= win_10_0_table->final_build) {
-                    if (id) {
-                        return g_strdup(win_10_0_table->version_id);
-                    } else {
-                        return g_strdup(win_10_0_table->version);
-                    }
+                if (build >= win_10_0_table->first_build) {
+                    win_10_0_version = win_10_0_table;
                 }
                 win_10_0_table++;
             }
+            if (win_10_0_table) {
+                if (id) {
+                    return g_strdup(win_10_0_version->version_id);
+                } else {
+                    return g_strdup(win_10_0_version->version);
+                }
+            }
         } else if (major == table->major && minor == table->minor) {
             if (id) {
                 return g_strdup(table->version_id);
-- 
2.33.0


