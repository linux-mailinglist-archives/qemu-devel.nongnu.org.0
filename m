Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE1647B0CA
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 17:01:28 +0100 (CET)
Received: from localhost ([::1]:40710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzL6N-0003qA-ET
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 11:01:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mzKQR-0001xt-6R
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 10:18:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48170)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mzKQ5-0006II-GQ
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 10:18:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640013456;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyB9NjacjlViYjX38NHa/38VGrRySbWUkQ8f+Gv2qv8=;
 b=Baff0i1QVwE77syejy8jgw6+/SIhKVOALCdNbff8L8QuGYVXIIcoZR2yiNm71JHBGzaIm4
 c4sOSDoMuQN/PG5uxw6eFzV+OWW89Gw5rboSlLtuRIZUutwgERarS35dT52gRp333Qh3y2
 /fSgFf1y2vakgZ9c0zjoujcjOVd3H70=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-314-mucASLFFNLO79QeLlXWkWg-1; Mon, 20 Dec 2021 03:54:27 -0500
X-MC-Unique: mucASLFFNLO79QeLlXWkWg-1
Received: by mail-wm1-f69.google.com with SMTP id
 z200-20020a1c7ed1000000b0034574ef8356so1683554wmc.5
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 00:54:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cyB9NjacjlViYjX38NHa/38VGrRySbWUkQ8f+Gv2qv8=;
 b=JEoWTATSeRqxeRHTOiuChpDDrfqG6EACQ5EXHcDYJR1HFNel/oLm27dqVbAD7VbXE/
 9dtiHPJ/JFLkcTcQAgnxeWPY69rfZEZD+b7cMcID1lPuqo7PhF1e9cY6uI6yg2oyoLmV
 PkGnpHl7JsMVEKOYQASiMQE6XCqit9UG0h5InQbNHPcx+QUFMmHJGQ0wnm054qhe5J40
 KA6WOLoMcRpae5gnP10Rbx/nWQOi3WA6pqqKF8uP7lNDLC/WFSCusqYe5/PjCrQA4QzG
 EyxF7LEaCS2BM303OJ/uiQ2h9/s3k2u2sa2qSz0yU07a+Jr1EEFUc0NHsSAipXran+Lh
 ZHJQ==
X-Gm-Message-State: AOAM531/lN0ttY4/yAMc17NcAWd90u+Ef98wBBl1sUwNvCEkibAsuOx+
 VOe349I/ad6pB+SKPp44BcOAFKW2WlCKNl15828ytTZayk8y73Fi1e4dkDz96kRfxdWUCjMW/eU
 /I9l0pH4rlNWz2Su/a3+2daMOrJO0kEF5/1hBTf7evY6NhIYn7cnbF/af9gl1H3cg
X-Received: by 2002:adf:dbd2:: with SMTP id e18mr12391595wrj.478.1639990466096; 
 Mon, 20 Dec 2021 00:54:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxpxh8lWor6VLVjc4x5sg9UIBWowjNAnarBmWJnGJKKg3dSg7YZEBl81EBFH59caGOKvxFkhA==
X-Received: by 2002:adf:dbd2:: with SMTP id e18mr12391574wrj.478.1639990465818; 
 Mon, 20 Dec 2021 00:54:25 -0800 (PST)
Received: from localhost.localdomain ([85.203.46.164])
 by smtp.gmail.com with ESMTPSA id h2sm14439713wrz.23.2021.12.20.00.54.17
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Dec 2021 00:54:25 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/8] migration: Do chunk page in
 postcopy_each_ram_send_discard()
Date: Mon, 20 Dec 2021 16:53:51 +0800
Message-Id: <20211220085355.2284-5-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211220085355.2284-1-peterx@redhat.com>
References: <20211220085355.2284-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) DKIMWL_WL_HIGH=-0.209, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Right now we loop ramblocks for twice, the 1st time chunk the dirty bits with
huge page information; the 2nd time we send the discard ranges.  That's not
necessary - we can do them in a single loop.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/ram.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index b22c9e7432..e7107b9790 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -2468,6 +2468,8 @@ static int postcopy_send_discard_bm_ram(MigrationState *ms, RAMBlock *block)
     return 0;
 }
 
+static void postcopy_chunk_hostpages_pass(MigrationState *ms, RAMBlock *block);
+
 /**
  * postcopy_each_ram_send_discard: discard all RAMBlocks
  *
@@ -2489,6 +2491,14 @@ static int postcopy_each_ram_send_discard(MigrationState *ms)
     RAMBLOCK_FOREACH_NOT_IGNORED(block) {
         postcopy_discard_send_init(ms, block->idstr);
 
+        /*
+         * Deal with TPS != HPS and huge pages.  It discard any partially sent
+         * host-page size chunks, mark any partially dirty host-page size
+         * chunks as all dirty.  In this case the host-page is the host-page
+         * for the particular RAMBlock, i.e. it might be a huge page.
+         */
+        postcopy_chunk_hostpages_pass(ms, block);
+
         /*
          * Postcopy sends chunks of bitmap over the wire, but it
          * just needs indexes at this point, avoids it having
@@ -2589,7 +2599,6 @@ static void postcopy_chunk_hostpages_pass(MigrationState *ms, RAMBlock *block)
 int ram_postcopy_send_discard_bitmap(MigrationState *ms)
 {
     RAMState *rs = ram_state;
-    RAMBlock *block;
 
     RCU_READ_LOCK_GUARD();
 
@@ -2601,15 +2610,6 @@ int ram_postcopy_send_discard_bitmap(MigrationState *ms)
     rs->last_sent_block = NULL;
     rs->last_page = 0;
 
-    RAMBLOCK_FOREACH_NOT_IGNORED(block) {
-        /*
-         * Deal with TPS != HPS and huge pages.  It discard any partially sent
-         * host-page size chunks, mark any partially dirty host-page size
-         * chunks as all dirty.  In this case the host-page is the host-page
-         * for the particular RAMBlock, i.e. it might be a huge page.
-         */
-        postcopy_chunk_hostpages_pass(ms, block);
-    }
     trace_ram_postcopy_send_discard_bitmap();
 
     return postcopy_each_ram_send_discard(ms);
-- 
2.32.0


