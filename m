Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB4A54DF12
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 12:28:06 +0200 (CEST)
Received: from localhost ([::1]:48276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1mjO-0007J0-1o
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 06:28:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nikita.lapshin@openvz.org>)
 id 1o1mc8-0006tJ-V0
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 06:20:40 -0400
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234]:40499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nikita.lapshin@openvz.org>)
 id 1o1mc6-0000V0-T4
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 06:20:36 -0400
Received: by mail-lj1-x234.google.com with SMTP id y29so982421ljd.7
 for <qemu-devel@nongnu.org>; Thu, 16 Jun 2022 03:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7IlllWalbol55jcjJ2c0idnBkF17iN1AJ6PBWM49+f8=;
 b=d1ueLu4vHjKhqc96du8l0lwkyW5A0nb7/Zx9VqTjux2/CzeDEKZRgCXvVP4TaLGUP9
 qXkF90Ugq4+l/YG1Gt6Sj7bXJW+NsiUnTT3sJX/HIKnIfSJFFTE5dMWTCXA8DAdLXKOt
 LAMNAUGbgY0iQINYD966Vkgvu8w3emm8dcORi1PGLQ60J94RvbE9fxHtdqYYwnkiy1pE
 aq0P1iyqAURjieobaA2NFmTEhW0E7n0kkZrGsjYONLJwMHcCRTU4V3oOShxMI3+JLduh
 ceoZj8aZ9A1mI5JC5O1hawyWTM/v6Q5mNA97uE+dqH3ePKmLevaoajFjt1ppEZbNr/8i
 4oAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7IlllWalbol55jcjJ2c0idnBkF17iN1AJ6PBWM49+f8=;
 b=Be4+XHvtcbtwZaHfHGOcdrN+n7PnfjgQVmpXO9qexerDIsYBWLDTsFPLQgFtQ01GiO
 5j29YEIwv3MFmdoK+dZWgLcF1wmjc3XGXkngdabbgJtOOzBBKZclmHd7mANZ8i/tbiiV
 wH8wQ5dWBUXDnZzn8ssIpUCrLRyfFyPty6dwD9HdsK9NvMU/Icjx/89f5CO+aL24C8/O
 Fm7xhFVc5cZG85KWssQv3CWUwT73ZvxiD+Psl1ZTjmORxbsTHcYec+GtRixbvs11TMzO
 oOfoMTYUCXCI3Pl1PwqjTIn2e7BuXUs/lKcqbQzk0HXfLjwsUvh0OalO6dBGIFa9Od0C
 qikQ==
X-Gm-Message-State: AJIora8hstHzaE/QMngZ849IOftnySMwXv28JGNFFLIE2YCYbqjVHCP+
 +OGHuolxpLCJcvKEeKGx8nB61PnQ3zSOAmQm
X-Google-Smtp-Source: AGRyM1vYWtExQ4i0WLxTDMIUrvqt6SfpDwnWW1E1Mw0d7qH01djkpzCdAbgKU4D/Godm2saL2LeJqA==
X-Received: by 2002:a2e:9e04:0:b0:255:a211:f440 with SMTP id
 e4-20020a2e9e04000000b00255a211f440mr2107701ljk.159.1655374830588; 
 Thu, 16 Jun 2022 03:20:30 -0700 (PDT)
Received: from localhost.localdomain ([93.175.28.49])
 by smtp.gmail.com with ESMTPSA id
 q17-20020a05651232b100b0047255d21166sm179014lfe.149.2022.06.16.03.20.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 03:20:30 -0700 (PDT)
From: nikita.lapshin@openvz.org
To: qemu-devel@nongnu.org
Cc: den@virtuozzo.com, andrey.drobyshev@virtuozzo.com, quintela@redhat.com,
 dgilbert@redhat.com, nikita.lapshin@openvz.org
Subject: [PATCH 2/8] migration: should_skip() implemented
Date: Thu, 16 Jun 2022 13:19:58 +0300
Message-Id: <20220616102006.218693-3-nikita.lapshin@openvz.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220616102006.218693-1-nikita.lapshin@openvz.org>
References: <20220616102006.218693-1-nikita.lapshin@openvz.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::234;
 envelope-from=nikita.lapshin@openvz.org; helo=mail-lj1-x234.google.com
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

For next changes it is convenient to make all decisions about
sections skipping in one function.

Signed-off-by: Nikita Lapshin <nikita.lapshin@openvz.org>
---
 migration/savevm.c | 54 ++++++++++++++++++++++++----------------------
 1 file changed, 28 insertions(+), 26 deletions(-)

diff --git a/migration/savevm.c b/migration/savevm.c
index 02ed94c180..c68f187ef7 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -943,6 +943,15 @@ static int vmstate_save(QEMUFile *f, SaveStateEntry *se,
     return vmstate_save_state(f, se->vmsd, se->opaque, vmdesc);
 }
 
+static bool should_skip(SaveStateEntry *se)
+{
+    if (se->ops && se->ops->is_active && !se->ops->is_active(se->opaque)) {
+        return true;
+    }
+
+    return false;
+}
+
 /*
  * Write the header for device section (QEMU_VM_SECTION START/END/PART/FULL)
  */
@@ -1207,10 +1216,8 @@ void qemu_savevm_state_setup(QEMUFile *f)
         if (!se->ops || !se->ops->save_setup) {
             continue;
         }
-        if (se->ops->is_active) {
-            if (!se->ops->is_active(se->opaque)) {
-                continue;
-            }
+        if (should_skip(se)) {
+            continue;
         }
         save_section_header(f, se, QEMU_VM_SECTION_START);
 
@@ -1238,10 +1245,8 @@ int qemu_savevm_state_resume_prepare(MigrationState *s)
         if (!se->ops || !se->ops->resume_prepare) {
             continue;
         }
-        if (se->ops->is_active) {
-            if (!se->ops->is_active(se->opaque)) {
-                continue;
-            }
+        if (should_skip(se)) {
+            continue;
         }
         ret = se->ops->resume_prepare(s, se->opaque);
         if (ret < 0) {
@@ -1268,8 +1273,7 @@ int qemu_savevm_state_iterate(QEMUFile *f, bool postcopy)
         if (!se->ops || !se->ops->save_live_iterate) {
             continue;
         }
-        if (se->ops->is_active &&
-            !se->ops->is_active(se->opaque)) {
+        if (should_skip(se)) {
             continue;
         }
         if (se->ops->is_active_iterate &&
@@ -1337,10 +1341,8 @@ void qemu_savevm_state_complete_postcopy(QEMUFile *f)
         if (!se->ops || !se->ops->save_live_complete_postcopy) {
             continue;
         }
-        if (se->ops->is_active) {
-            if (!se->ops->is_active(se->opaque)) {
-                continue;
-            }
+        if (should_skip(se)) {
+            continue;
         }
         trace_savevm_section_start(se->idstr, se->section_id);
         /* Section type */
@@ -1374,10 +1376,8 @@ int qemu_savevm_state_complete_precopy_iterable(QEMUFile *f, bool in_postcopy)
             continue;
         }
 
-        if (se->ops->is_active) {
-            if (!se->ops->is_active(se->opaque)) {
-                continue;
-            }
+        if (should_skip(se)) {
+            continue;
         }
         trace_savevm_section_start(se->idstr, se->section_id);
 
@@ -1417,6 +1417,9 @@ int qemu_savevm_state_complete_precopy_non_iterable(QEMUFile *f,
             trace_savevm_section_skip(se->idstr, se->section_id);
             continue;
         }
+        if (should_skip(se)) {
+            continue;
+        }
 
         trace_savevm_section_start(se->idstr, se->section_id);
 
@@ -1522,10 +1525,8 @@ void qemu_savevm_state_pending(QEMUFile *f, uint64_t threshold_size,
         if (!se->ops || !se->ops->save_live_pending) {
             continue;
         }
-        if (se->ops->is_active) {
-            if (!se->ops->is_active(se->opaque)) {
-                continue;
-            }
+        if (should_skip(se)) {
+            continue;
         }
         se->ops->save_live_pending(f, se->opaque, threshold_size,
                                    res_precopy_only, res_compatible,
@@ -1635,6 +1636,9 @@ int qemu_save_device_state(QEMUFile *f)
         if (se->vmsd && !vmstate_save_needed(se->vmsd, se->opaque)) {
             continue;
         }
+        if (should_skip(se)) {
+            continue;
+        }
 
         save_section_header(f, se, QEMU_VM_SECTION_FULL);
 
@@ -2542,10 +2546,8 @@ static int qemu_loadvm_state_setup(QEMUFile *f)
         if (!se->ops || !se->ops->load_setup) {
             continue;
         }
-        if (se->ops->is_active) {
-            if (!se->ops->is_active(se->opaque)) {
-                continue;
-            }
+        if (should_skip(se)) {
+            continue;
         }
 
         ret = se->ops->load_setup(f, se->opaque);
-- 
2.31.1


