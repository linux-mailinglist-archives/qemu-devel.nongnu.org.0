Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA38442336
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 23:14:10 +0100 (CET)
Received: from localhost ([::1]:50796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhfZB-0003SY-8x
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 18:14:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mhfUh-0006z1-Js
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 18:09:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46154)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mhfUe-0000bR-0i
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 18:09:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635804567;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GGo9WanuJU04tuhhnw4peEWGOBw6c3WDbeGbMBl0UrM=;
 b=CxE49QFwEnLn5ozH0njoOjqV0y/Y9CbD0DHU97jOrCpeiZ73tHyjt2KFCAkRCrotaFm8PT
 IOP4IFxlq+NBRFVWHQC+dynHM0bhn+EQJe3r+cRU1Sr4oouxMZaZK6gT+ZwT4lBt5cvNBf
 w9Cl+GmwmkIY40c9fqDupbx4Sf43htg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-555-A7Lf1V65O1utxFTq16AZBg-1; Mon, 01 Nov 2021 18:09:26 -0400
X-MC-Unique: A7Lf1V65O1utxFTq16AZBg-1
Received: by mail-wr1-f71.google.com with SMTP id
 d13-20020adf9b8d000000b00160a94c235aso6776681wrc.2
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 15:09:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GGo9WanuJU04tuhhnw4peEWGOBw6c3WDbeGbMBl0UrM=;
 b=PT+HPlDEatkqE3TpDhQHObxbwuxNGa6AeEoA241YA1hUO+OGRjHGgs/zHPsqnNRuYu
 zxDG6A2P/zH9a9rdpw7St7yTWh9pMd3WBG35BkSRwZLP7GlHxuQVe7GGc/0FD9mzx2KN
 lJO25rxLBdx3PKCd4h4TNQLj3G/7Q8ZY1uxG3+TUHnbl1OnqO5V5rZPYvq/TZRDijU/H
 9ewuZqHYojw9HLDGBkuRbk+8jsy8c/u6wU3QstlO5ItX7Y8w9eBm5mFy1mkpoK8fzKVp
 PWz28JqUGlAdvhWJQxvEXvMs9tIyo69Sry3efgVZURi7+TFwdnDSOMgUM9Eq9+66kSxb
 YIUg==
X-Gm-Message-State: AOAM533XQHASeZ82QeeFhDojr1wxUNAUe5VBRldUW+6kQz3ajwBS8h1d
 E7yXnonqJNVxYFAjtU8XjFDDqnQUXaNzqVL4ERyP410LDR6jfnNojXfb9YeZuy5l+976/ZKrQuG
 38mac5jqY8mSW5jrgptEbQkuSbFv4kwFWis56jqQHjB69kUEUE4YW/Z8qSburzq6uFOs=
X-Received: by 2002:a1c:7e41:: with SMTP id z62mr1955963wmc.9.1635804565211;
 Mon, 01 Nov 2021 15:09:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwpSY2086+CnGB9WPrHW5bo96aeVOpNDlLfr+WAapyjvAt6zv6pqshWIvxGHLts1sX02fyU2g==
X-Received: by 2002:a1c:7e41:: with SMTP id z62mr1955923wmc.9.1635804564942;
 Mon, 01 Nov 2021 15:09:24 -0700 (PDT)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id o17sm685487wmq.11.2021.11.01.15.09.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 15:09:24 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/20] migration: Make migration blocker work for snapshots too
Date: Mon,  1 Nov 2021 23:09:00 +0100
Message-Id: <20211101220912.10039-9-quintela@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211101220912.10039-1-quintela@redhat.com>
References: <20211101220912.10039-1-quintela@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Paul Durrant <paul@xen.org>, Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Xu <peterx@redhat.com>

save_snapshot() checks migration blocker, which looks sane.  At the meantime we
should also teach the blocker add helper to fail if during a snapshot, just
like for migrations.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/migration.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 9172686b89..e81e473f5a 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2058,15 +2058,16 @@ int migrate_add_blocker(Error *reason, Error **errp)
         return -EACCES;
     }
 
-    if (migration_is_idle()) {
-        migration_blockers = g_slist_prepend(migration_blockers, reason);
-        return 0;
+    /* Snapshots are similar to migrations, so check RUN_STATE_SAVE_VM too. */
+    if (runstate_check(RUN_STATE_SAVE_VM) || !migration_is_idle()) {
+        error_propagate_prepend(errp, error_copy(reason),
+                                "disallowing migration blocker "
+                                "(migration/snapshot in progress) for: ");
+        return -EBUSY;
     }
 
-    error_propagate_prepend(errp, error_copy(reason),
-                            "disallowing migration blocker "
-                            "(migration in progress) for: ");
-    return -EBUSY;
+    migration_blockers = g_slist_prepend(migration_blockers, reason);
+    return 0;
 }
 
 void migrate_del_blocker(Error *reason)
-- 
2.33.1


