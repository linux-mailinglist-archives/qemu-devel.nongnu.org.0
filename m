Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41FF246BA76
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 12:54:35 +0100 (CET)
Received: from localhost ([::1]:55096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muZ3K-00057e-Bq
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 06:54:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1muYza-0005FC-FR
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 06:50:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1muYzY-0004mq-Jj
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 06:50:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638877839;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gr5NwmK4C6rrByv/piWEyyUxv3c8z1nDTJmNvLm7N4I=;
 b=O8L/fDBog8QeOhQZr6wOHYx5qAAs3/JIjZ32ig39E3173lxp/Jb46b1bdGSeUtR6EbS4kC
 c3RNO+vCiQWbDwiTT9Unn78SRI8vtlwK/93t3z26MnN1iA5adisnO55Mon6niqdRmvsCK6
 uBYTERflv+/pDAZEIZ3fStNDg08eKqE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-205-9xJepUNdO7aFGVTzhri_4g-1; Tue, 07 Dec 2021 06:50:39 -0500
X-MC-Unique: 9xJepUNdO7aFGVTzhri_4g-1
Received: by mail-wr1-f72.google.com with SMTP id
 d3-20020adfa343000000b0018ed6dd4629so2878261wrb.2
 for <qemu-devel@nongnu.org>; Tue, 07 Dec 2021 03:50:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Gr5NwmK4C6rrByv/piWEyyUxv3c8z1nDTJmNvLm7N4I=;
 b=ALO+LBkGkgJwL3gNwvXz1NjIeh+oPK1SinY90cBtGnOy3FCI4sJpIwcbgvr4sCNs3d
 5yjlzRAhc4b5Ox9kzCwbECXNBhxwdnxNY7A85m+AayRYoz2zNSzg5UpCI3FikPw4rQte
 KU1Lk/8c3JUWYeKrGKkLZX2xBmzEjjuOIKn2covFd8klCvKnaAqQ75XXH2jZzS2Naum0
 gjRkxf3e23sIcKQA2DkH/VaDqLGQ96NCfR4gLj0u4MiffDNGQBRvV1uf8u8gFjF3g0QP
 E+YQjrW9e+KduePvg9WYPFcnlCRhI4RwV02TPK132gPuLythbIZdqapmmjht7gmeSJL5
 NDlQ==
X-Gm-Message-State: AOAM533HJgITN7qDzSYJdc6sZkjSzxH/7rGjMIhrE1T6rj0AINM/vuZc
 rWomiCBv0msKwXqfFCfNXiQhc313IHx0W9fngPzz4egFWa2v2iAloUkYiLyfpBlh1ekag/7zZ9z
 xgUDJSp72OQDRPk0LLeNSTwkGMloRYJT0zCvrAORhYTDwtgrDJe2sgBHnTqXOJO/f
X-Received: by 2002:a5d:452b:: with SMTP id j11mr51359223wra.432.1638877837585; 
 Tue, 07 Dec 2021 03:50:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxDJElVsJEA477aKZQv6kVgu0cBBTzRCB+SSL3iwouV1C6z1F9VeSjbS7OvvDJj18KV+KhY7w==
X-Received: by 2002:a5d:452b:: with SMTP id j11mr51359195wra.432.1638877837322; 
 Tue, 07 Dec 2021 03:50:37 -0800 (PST)
Received: from localhost.localdomain ([85.203.46.177])
 by smtp.gmail.com with ESMTPSA id g18sm3023551wmq.4.2021.12.07.03.50.34
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 07 Dec 2021 03:50:36 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/7] migration: Do chunk page in
 postcopy_each_ram_send_discard()
Date: Tue,  7 Dec 2021 19:50:13 +0800
Message-Id: <20211207115016.73195-5-peterx@redhat.com>
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
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/ram.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index e3876181ab..ecc744d54d 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -2473,6 +2473,8 @@ static int postcopy_send_discard_bm_ram(MigrationState *ms, RAMBlock *block)
     return 0;
 }
 
+static void postcopy_chunk_hostpages_pass(MigrationState *ms, RAMBlock *block);
+
 /**
  * postcopy_each_ram_send_discard: discard all RAMBlocks
  *
@@ -2494,6 +2496,14 @@ static int postcopy_each_ram_send_discard(MigrationState *ms)
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
@@ -2594,7 +2604,6 @@ static void postcopy_chunk_hostpages_pass(MigrationState *ms, RAMBlock *block)
 int ram_postcopy_send_discard_bitmap(MigrationState *ms)
 {
     RAMState *rs = ram_state;
-    RAMBlock *block;
 
     RCU_READ_LOCK_GUARD();
 
@@ -2606,15 +2615,6 @@ int ram_postcopy_send_discard_bitmap(MigrationState *ms)
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


