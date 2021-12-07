Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9084746BA6A
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 12:52:14 +0100 (CET)
Received: from localhost ([::1]:46468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muZ13-0007of-3m
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 06:52:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1muYzV-0005AJ-12
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 06:50:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1muYzR-0004lo-Mp
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 06:50:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638877830;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MUtpeLYHKQgrc9BMfv66tyCzYEZUrgpReG7BcJQeSaM=;
 b=JmrRTD+erR9/oWFC9Y28TKxIKyJbukrDSPStI3V5m0t/egXW8xztqDv1KTfJ9KguZGYHeC
 fksNwiYYmrNblT4MJ4a+rezK4RnqPCh4wFaX1dJF7ZtWRfAsORURgK+maT8TcnBk4kuJnN
 i9gsM3+d+OwT818NrN/Vtfyyxd+Qqqw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-8-vkIhEvJCNReeLO0E3lD6MA-1; Tue, 07 Dec 2021 06:50:29 -0500
X-MC-Unique: vkIhEvJCNReeLO0E3lD6MA-1
Received: by mail-wr1-f71.google.com with SMTP id
 q5-20020a5d5745000000b00178abb72486so2859855wrw.9
 for <qemu-devel@nongnu.org>; Tue, 07 Dec 2021 03:50:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MUtpeLYHKQgrc9BMfv66tyCzYEZUrgpReG7BcJQeSaM=;
 b=kQ0ctXJym2e/jI+O8//9n6yg1Oyp4Fa2sP5x7VR4PpMkzGXHUPePAHGS/++8vEQok8
 325MFkY21fjOObLcIjWvf9Kr71+CIZLSVy0odvWCU7JXh/jttn/A2bEMseffzgbVkaJe
 2RVGarLyMRr47QoSa3PjqcAQv8biBt+bz13sPid20+kf2bUh2wS8PdGFGZYa0wcvX4Gd
 0BCVFbNkzea2Ab0NNji2nxpetzFqHSLsT3t8MtuE1k+SZ4occcKcjUcUt4FQWf/sCmLB
 aBhJ8CVQhGYU1u9jXsXjANRrQpC/y1fmtuIhm529yryY5H0HJDhFsAEMkQEOmolCNNmk
 BlMQ==
X-Gm-Message-State: AOAM530O17Gk79DafzF0O8DVkInWKj5cucCTjs5FhAEzydJQdO7lT3xJ
 6xP5Z7ZToRfpvvTbBppmVK3Nyo3mTWnNU/ejc26Dn5poZA3UAk0dCxQB+CJlEop63pTXMoE7vau
 asF0hOp/J8t12Uf9oHt7R4tM6ZQgLFVtTkVyvb5gu+NX7kj5lNvMgFHpVQKzf1gvA
X-Received: by 2002:a5d:6da2:: with SMTP id u2mr50037461wrs.273.1638877828175; 
 Tue, 07 Dec 2021 03:50:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJykVUBKt1FImbcPb2AgwarC7z0aRwGenSfhkK4TfDmrZGKnp6W74UfH2MLAGrkGF3J3qOI73w==
X-Received: by 2002:a5d:6da2:: with SMTP id u2mr50037428wrs.273.1638877827888; 
 Tue, 07 Dec 2021 03:50:27 -0800 (PST)
Received: from localhost.localdomain ([85.203.46.177])
 by smtp.gmail.com with ESMTPSA id g18sm3023551wmq.4.2021.12.07.03.50.25
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 07 Dec 2021 03:50:27 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/7] migration: Drop dead code of ram_debug_dump_bitmap()
Date: Tue,  7 Dec 2021 19:50:10 +0800
Message-Id: <20211207115016.73195-2-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211207115016.73195-1-peterx@redhat.com>
References: <20211207115016.73195-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I planned to add "#ifdef DEBUG_POSTCOPY" around the function too because
otherwise it'll be compiled into qemu binary even if it'll never be used.  Then
I found that maybe it's easier to just drop it for good..

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/ram.c | 39 ---------------------------------------
 migration/ram.h |  2 --
 2 files changed, 41 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 863035d235..756ac800a7 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -2413,40 +2413,6 @@ static void ram_state_reset(RAMState *rs)
 
 #define MAX_WAIT 50 /* ms, half buffered_file limit */
 
-/*
- * 'expected' is the value you expect the bitmap mostly to be full
- * of; it won't bother printing lines that are all this value.
- * If 'todump' is null the migration bitmap is dumped.
- */
-void ram_debug_dump_bitmap(unsigned long *todump, bool expected,
-                           unsigned long pages)
-{
-    int64_t cur;
-    int64_t linelen = 128;
-    char linebuf[129];
-
-    for (cur = 0; cur < pages; cur += linelen) {
-        int64_t curb;
-        bool found = false;
-        /*
-         * Last line; catch the case where the line length
-         * is longer than remaining ram
-         */
-        if (cur + linelen > pages) {
-            linelen = pages - cur;
-        }
-        for (curb = 0; curb < linelen; curb++) {
-            bool thisbit = test_bit(cur + curb, todump);
-            linebuf[curb] = thisbit ? '1' : '.';
-            found = found || (thisbit != expected);
-        }
-        if (found) {
-            linebuf[curb] = '\0';
-            fprintf(stderr,  "0x%08" PRIx64 " : %s\n", cur, linebuf);
-        }
-    }
-}
-
 /* **** functions for postcopy ***** */
 
 void ram_postcopy_migrated_memory_release(MigrationState *ms)
@@ -2674,11 +2640,6 @@ int ram_postcopy_send_discard_bitmap(MigrationState *ms)
         if (ret) {
             return ret;
         }
-
-#ifdef DEBUG_POSTCOPY
-        ram_debug_dump_bitmap(block->bmap, true,
-                              block->used_length >> TARGET_PAGE_BITS);
-#endif
     }
     trace_ram_postcopy_send_discard_bitmap();
 
diff --git a/migration/ram.h b/migration/ram.h
index c515396a9a..f543e25765 100644
--- a/migration/ram.h
+++ b/migration/ram.h
@@ -55,8 +55,6 @@ void mig_throttle_counter_reset(void);
 uint64_t ram_pagesize_summary(void);
 int ram_save_queue_pages(const char *rbname, ram_addr_t start, ram_addr_t len);
 void acct_update_position(QEMUFile *f, size_t size, bool zero);
-void ram_debug_dump_bitmap(unsigned long *todump, bool expected,
-                           unsigned long pages);
 void ram_postcopy_migrated_memory_release(MigrationState *ms);
 /* For outgoing discard bitmap */
 int ram_postcopy_send_discard_bitmap(MigrationState *ms);
-- 
2.32.0


