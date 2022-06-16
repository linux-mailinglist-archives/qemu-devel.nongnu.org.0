Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C604A54DF79
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 12:50:18 +0200 (CEST)
Received: from localhost ([::1]:55586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1n4r-0007Bq-PV
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 06:50:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nikita.lapshin@openvz.org>)
 id 1o1mjd-0001b6-OU
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 06:28:22 -0400
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e]:42589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nikita.lapshin@openvz.org>)
 id 1o1mjb-0001ss-Ld
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 06:28:21 -0400
Received: by mail-lf1-x12e.google.com with SMTP id h36so1515248lfv.9
 for <qemu-devel@nongnu.org>; Thu, 16 Jun 2022 03:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7IlllWalbol55jcjJ2c0idnBkF17iN1AJ6PBWM49+f8=;
 b=yyVhZy8bklF/2igjopLiG2+6KGpqYpafIqoFN6DUnPylZZT2MkvpVjhza1qzvytPjU
 8bSaI/jUJzuhgKho35egdnRTPTC09zdjwszZTYSEDg0MEC7LTZptWiZ7oOvaggtpySZr
 76RR1YompvtD0wtVG2nKiBw4hDoc0lsIOS/sLZnsWPA1bpgKuiYVzszJkkLxK4ewfAc1
 aXTHTv7QEtOcxtTvTTLvRfhWhJHJfzIKox17ApHK2jIwDVaWEFfrF+OOkx/tEETaAvuT
 vrPZ8AjvOTJBjRs9foM2X9RO9a+Dt+ViOHPtwFzgR8+A980BbdrmNOLo1gW/HNxid3xW
 vD2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7IlllWalbol55jcjJ2c0idnBkF17iN1AJ6PBWM49+f8=;
 b=Yix8aWIQ91WUmZD5oKMh5KXJIPjwhTTqtfvJsdoPU9iL+ZxuVavm0+12zVjlmeNfd2
 KGKSvyznbf7LoULvtV+PM9XOOaslIdq5FriLab5G9zFnA3WQJi0n2JtHd4SAmOWscE1q
 G1jHJqbGhPaVMn3fJA/Er3f+03h5CvU4mH06F8XgNSbLT4sYaiHIALOXxo5viStgfymc
 P6UMmcT7tyuz8QwZdSZY5Z0CiNhJTXFU/6PKqFen0/y+rYWDrqYQbQEyhVCSj/WC8Fc6
 9E7fUhHlo6o2P7bg4iMCV9AulrTUwHrgIVxfdQBaw7Harlj2/M/oi4MkXPnRt06nVzOh
 Jo/w==
X-Gm-Message-State: AJIora9p6nBLwRsZRxnBmwDPqZ9QKodwB/BzQgIkCfKJJ+qHvrjszNJ1
 zZuZ7OfcVUn043oq2m3XC0QbJbtw8G6BL15N
X-Google-Smtp-Source: AGRyM1ueFA/ATV8qMHUgFyV5Iv0lVDeGpSt1XIJkxYWCAsPLVSaQG8hnMwXmyZ94d75ND/7mXrgtTA==
X-Received: by 2002:a05:6512:3e24:b0:479:40e9:292a with SMTP id
 i36-20020a0565123e2400b0047940e9292amr2283186lfv.190.1655375297735; 
 Thu, 16 Jun 2022 03:28:17 -0700 (PDT)
Received: from localhost.localdomain ([93.175.28.49])
 by smtp.gmail.com with ESMTPSA id
 y24-20020a199158000000b0047255d21128sm182581lfj.87.2022.06.16.03.28.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 03:28:16 -0700 (PDT)
From: nikita.lapshin@openvz.org
To: qemu-devel@nongnu.org
Cc: den@virtuozzo.com, andrey.drobyshev@virtuozzo.com, quintela@redhat.com,
 dgilbert@redhat.com, nikita.lapshin@openvz.org
Subject: [PATCH v3 02/17] migration: should_skip() implemented
Date: Thu, 16 Jun 2022 13:27:56 +0300
Message-Id: <20220616102811.219007-3-nikita.lapshin@openvz.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220616102811.219007-1-nikita.lapshin@openvz.org>
References: <20220616102811.219007-1-nikita.lapshin@openvz.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12e;
 envelope-from=nikita.lapshin@openvz.org; helo=mail-lf1-x12e.google.com
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


