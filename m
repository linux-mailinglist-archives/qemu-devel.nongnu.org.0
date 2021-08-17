Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE803EF163
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 20:07:53 +0200 (CEST)
Received: from localhost ([::1]:39510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mG3VA-0005Ks-Fb
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 14:07:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mG3Ty-0004ah-GY
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 14:06:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44032)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mG3Tv-0002A0-63
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 14:06:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629223593;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=054lt2XCEygtpPmb/0IAmNE75kxPjBxOQhSsJ7k3K1E=;
 b=eTkUwvJ58SLST7dgoeXE7QJmSQhHao8fKRu696R/Wq/Fv57qXdL5DrAF+99mAa0f8xXbFY
 EvYHuPhDrY8/sRReTo+Rb1OM+6s768u5i42JWJyQsAw4GF/LegXC3+La25oaAASY6NUa+i
 VA8RK9tstWMWceVtD9fXMVbDZhXurXs=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-511-o0X1p5pnPJWOQDx60LHBpA-1; Tue, 17 Aug 2021 14:06:32 -0400
X-MC-Unique: o0X1p5pnPJWOQDx60LHBpA-1
Received: by mail-qk1-f197.google.com with SMTP id
 k9-20020a05620a138900b003d59b580010so1528968qki.18
 for <qemu-devel@nongnu.org>; Tue, 17 Aug 2021 11:06:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=054lt2XCEygtpPmb/0IAmNE75kxPjBxOQhSsJ7k3K1E=;
 b=lPqs5BZWEK9TKB1y+FY8rJDo2DeWjm81eKEoHxan28+Ml9gLRCHH5zQ+oCWBbxRyJt
 Pvw0u0KL2RkR5BjUFgNQcvnFoJqU7zFRHKotCIXAlHndCy41VR5DA9tdLzZ+P0UTtwPj
 nbNW2tEQx9YImEEYW/zuot8Ucw/RTbNZkaALS5hgzCCtaIz75BP+nv4fOP4wsUF6Pca/
 pIq7pZQR5okfYPZrEk+DRj93x/mjSEJx6WrHg3vY87jLRdyK5fbECFruirKk4TNEJCmW
 9guYQJ4Rx6lXc9AIPMB+HPw8nhUZ1nZVjvWNHoieRsFqL2P7svL2tKWCkcLppygxrH3M
 JCiA==
X-Gm-Message-State: AOAM533GKi0bXj7bn6OhaFXNsZiP5XbhfENL0+ZcURzKS8+NYc9DUboZ
 R+nN7oB2Oajx1RSHvQrEmT1B9Ww9VEzLqmzTY4jqSbTCcUhl09bFoFgIybtTZKMcmbZdr9CHQlU
 laOBvqUr3U3nDEzSFa86blkNr6BeYAPSGCL2/nFPM0rc2rbV9mUOc2ITMbZG79iHH
X-Received: by 2002:a05:622a:1899:: with SMTP id
 v25mr4290831qtc.233.1629223591635; 
 Tue, 17 Aug 2021 11:06:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwf5YU5bIFev1lNEkXKJi/IcLkNCQ2dPDnM9qmZnCJiEDPiWUiIBxBJphS1PPyiFlUo1py0DQ==
X-Received: by 2002:a05:622a:1899:: with SMTP id
 v25mr4290785qtc.233.1629223591209; 
 Tue, 17 Aug 2021 11:06:31 -0700 (PDT)
Received: from t490s.redhat.com ([2607:fea8:56a3:500::d413])
 by smtp.gmail.com with ESMTPSA id g20sm1856205qki.73.2021.08.17.11.06.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 11:06:30 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] migration: Don't sync dirty bitmap when init
Date: Tue, 17 Aug 2021 14:06:29 -0400
Message-Id: <20210817180629.55126-1-peterx@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Drop migration_bitmap_sync_precopy() since dirty bitmap is initialized to all
ones anyways, so no need to sync at start.

Since at it, clean the locks up a bit:

  - RCU lock is only needed to walk the ramblocks, move it into
    ram_list_init_bitmaps().

  - The ram_list lock seems to be unnecessary now, drop it.

  - The bql should only be needed for memory_global_dirty_log_start(), move it
    to only protect that.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/ram.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 7a43bfd7af..189d6427ac 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -2651,6 +2651,7 @@ static void ram_list_init_bitmaps(void)
             shift = CLEAR_BITMAP_SHIFT_MIN;
         }
 
+        RCU_READ_LOCK_GUARD();
         RAMBLOCK_FOREACH_NOT_IGNORED(block) {
             pages = block->max_length >> TARGET_PAGE_BITS;
             /*
@@ -2672,20 +2673,14 @@ static void ram_list_init_bitmaps(void)
 
 static void ram_init_bitmaps(RAMState *rs)
 {
-    /* For memory_global_dirty_log_start below.  */
-    qemu_mutex_lock_iothread();
-    qemu_mutex_lock_ramlist();
+    ram_list_init_bitmaps();
 
-    WITH_RCU_READ_LOCK_GUARD() {
-        ram_list_init_bitmaps();
-        /* We don't use dirty log with background snapshots */
-        if (!migrate_background_snapshot()) {
-            memory_global_dirty_log_start();
-            migration_bitmap_sync_precopy(rs);
-        }
+    /* We don't use dirty log with background snapshots */
+    if (!migrate_background_snapshot()) {
+        qemu_mutex_lock_iothread();
+        memory_global_dirty_log_start();
+        qemu_mutex_unlock_iothread();
     }
-    qemu_mutex_unlock_ramlist();
-    qemu_mutex_unlock_iothread();
 }
 
 static int ram_init_all(RAMState **rsp)
-- 
2.31.1


