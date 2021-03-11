Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC58336EEC
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 10:32:18 +0100 (CET)
Received: from localhost ([::1]:49890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKHg1-0006Wc-Vf
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 04:32:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lKBnr-0001PZ-Tr
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 22:15:59 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:38231)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lKBnq-0000iS-5H
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 22:15:59 -0500
Received: by mail-wr1-x429.google.com with SMTP id d15so173447wrv.5
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 19:15:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GUQOQZlP87K1Umn6k57INBvTpMzcL3buE5B+mmdtO9Q=;
 b=qnnorcA1HncUOUYdZJpiRMS4dcjf6RRTimVl6eTvQsxvgDM04hi/sFZqDe9MaXFbUB
 jPT+8hRlH7h3ejsPR/xcuC+G+YQHooc8pjB0URBGIF1xOGCR6OFsua4pqLdPAm9E7XKo
 cxgjoUUvOo0WC1GbBTx/uoLN26/RdV7Ha91Mec9+eBuSVkym4oubDjq/7jeXE7Jhz1Xe
 hyFq6M7lkS9VETvvy4227y5a2EYeE0bGmeqej4XtI4yXDxk25gSeiJUNyJA4M8WGEdEy
 9sEDQn8mG+fTnHOSDTdW/IZKXD10JOOBzyJ8jdSYizHyqdLmwIpz3FELXwFl/S841zNy
 KSew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GUQOQZlP87K1Umn6k57INBvTpMzcL3buE5B+mmdtO9Q=;
 b=fCW3jkgif5/pVaz3foSo0+0moRNsYBrMf+jQpOORq2+IdBLnDBdIqN3TSE8SfDanQF
 F7r1qV3fDedPhdmHJUgp32yJMuBizJPz16hDjHJNttJjeGPKGo/1g6kJah5Oa6wbOGZH
 +TPw00APPfe6DYr6uw5JjLeZq93ebro2YDM7lhRc2lyI/pPti0X83F5Ueb2Zlrvn66Mo
 MmJqI2Ni7P79SfAZa13ingJp0bdz/yytr4HTeD2W71zCJgcxOnmpcbkN4SBJeX97beQM
 ilKlhc62xkQhjsjECs104K78MZYUQyPXXCj3usDuSQGpNj2Y3WxspiqWNliMcjkI8dHs
 1F+g==
X-Gm-Message-State: AOAM531J2MPC4DrT3ysPIDIUSQt02sUO41R8rV7777sLcbsreExLeg1T
 uxOQ/2pLDOiM7Vnddih88tqBWEB0A+A7SMU42bA=
X-Google-Smtp-Source: ABdhPJw02TdJcauGe7gAXgJT1Z8mfk9jNMR0SmUtJyPOHQp3ox0URjWyb10kegogG4czGHVTUtlj0Q==
X-Received: by 2002:adf:9043:: with SMTP id h61mr6347681wrh.216.1615432556502; 
 Wed, 10 Mar 2021 19:15:56 -0800 (PST)
Received: from localhost.localdomain ([197.61.47.225])
 by smtp.googlemail.com with ESMTPSA id o188sm1450416wme.7.2021.03.10.19.15.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 19:15:56 -0800 (PST)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/9] migration: Replaced qemu_mutex_lock calls with
 QEMU_LOCK_GUARD
Date: Thu, 11 Mar 2021 05:15:35 +0200
Message-Id: <20210311031538.5325-7-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210311031538.5325-1-ma.mandourr@gmail.com>
References: <20210311031538.5325-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 11 Mar 2021 04:25:17 -0500
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
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replaced various qemu_mutex_lock calls and their respective
qemu_mutex_unlock calls with QEMU_LOCK_GUARD macro. This simplifies
the code by eliminating the respective qemu_mutex_unlock calls.

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
---
 migration/migration.c | 6 ++----
 migration/ram.c       | 6 ++----
 2 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index a5ddf43559..36768391b6 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -323,7 +323,7 @@ static int migrate_send_rp_message(MigrationIncomingState *mis,
     int ret = 0;
 
     trace_migrate_send_rp_message((int)message_type, len);
-    qemu_mutex_lock(&mis->rp_mutex);
+    QEMU_LOCK_GUARD(&mis->rp_mutex);
 
     /*
      * It's possible that the file handle got lost due to network
@@ -331,7 +331,7 @@ static int migrate_send_rp_message(MigrationIncomingState *mis,
      */
     if (!mis->to_src_file) {
         ret = -EIO;
-        goto error;
+        return ret;
     }
 
     qemu_put_be16(mis->to_src_file, (unsigned int)message_type);
@@ -342,8 +342,6 @@ static int migrate_send_rp_message(MigrationIncomingState *mis,
     /* It's possible that qemu file got error during sending */
     ret = qemu_file_get_error(mis->to_src_file);
 
-error:
-    qemu_mutex_unlock(&mis->rp_mutex);
     return ret;
 }
 
diff --git a/migration/ram.c b/migration/ram.c
index 72143da0ac..52537f14ac 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -819,7 +819,7 @@ static inline bool migration_bitmap_clear_dirty(RAMState *rs,
 {
     bool ret;
 
-    qemu_mutex_lock(&rs->bitmap_mutex);
+    QEMU_LOCK_GUARD(&rs->bitmap_mutex);
 
     /*
      * Clear dirty bitmap if needed.  This _must_ be called before we
@@ -852,7 +852,6 @@ static inline bool migration_bitmap_clear_dirty(RAMState *rs,
     if (ret) {
         rs->migration_dirty_pages--;
     }
-    qemu_mutex_unlock(&rs->bitmap_mutex);
 
     return ret;
 }
@@ -3275,7 +3274,7 @@ static void decompress_data_with_multi_threads(QEMUFile *f,
     int idx, thread_count;
 
     thread_count = migrate_decompress_threads();
-    qemu_mutex_lock(&decomp_done_lock);
+    QEMU_LOCK_GUARD(&decomp_done_lock);
     while (true) {
         for (idx = 0; idx < thread_count; idx++) {
             if (decomp_param[idx].done) {
@@ -3295,7 +3294,6 @@ static void decompress_data_with_multi_threads(QEMUFile *f,
             qemu_cond_wait(&decomp_done_cond, &decomp_done_lock);
         }
     }
-    qemu_mutex_unlock(&decomp_done_lock);
 }
 
  /*
-- 
2.25.1


