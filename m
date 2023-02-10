Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D45691889
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 07:33:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQMxC-00058V-8B; Fri, 10 Feb 2023 01:32:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras.c@gmail.com>)
 id 1pQMxA-00058H-Pm
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 01:32:12 -0500
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leobras.c@gmail.com>)
 id 1pQMx9-0007go-0m
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 01:32:12 -0500
Received: by mail-ot1-x332.google.com with SMTP id
 e12-20020a0568301e4c00b0068bc93e7e34so1284872otj.4
 for <qemu-devel@nongnu.org>; Thu, 09 Feb 2023 22:32:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mXEp5jWBg4NiAYsAQR30zI95FNc3mrLr6WgCN46h/78=;
 b=YhobdxKQs/yyvcWhJrjjme6xD2zCnHikhySoRJ9gtuqgjuWQ5NLY/zE/mMl72wKjMX
 Fl4STzqg1pzGZtGy8Eb0yO2stPAwFBgdnzXuJPmx0quQ5jWU5Zr4agVuBHfoVi/Jr6OB
 4TsxUGZBy7rF3u3p29GzboI9IfsbVh/IWznl8G44rMdEb2TX9VuCH7yMe8kIUEhw+vgT
 aLU2eDjFunEb80SwV3r48Lou1LNE5i8csGbZtWHxGDdoUzrEmZf6Lbuor7OORpzbDPtw
 LEmn88tEqABhw4hMfL0kfelr3mujqmuWEKgTh8jJxChoxUGuuWBEuKr2sWdmGfUEmIxR
 cNGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mXEp5jWBg4NiAYsAQR30zI95FNc3mrLr6WgCN46h/78=;
 b=PbjvYWjsxFBF53HOp4lzXHjjsP6fwFfz8y3cHtSzpGkTffpipCiISKZclQQyzWwzmJ
 Nzjt2wkdVa3wPovUM+S+0Jx8oiKSqzy4GeTUvUykpHiEaJOpLJfXCpuh12zyahzZ7bQD
 UHcG/NEb10md22Y0eJaziIpr3Jzb+1EbOqLVyjez0klx3LeWpJqtkVbzpTZu8CHBFpvq
 3+FLQbBc88kHSzK7XKJdehsgCLx+rhBRst44w8eokYDgT9ycAOeAxVUVnwJcHofrRSbV
 RylDrCUoaNMjXPdZztRK/xRodt0yY8NsJDe9m0up7OOh58A/VWlI9f9LUERpM4vwbN86
 Q4Xg==
X-Gm-Message-State: AO0yUKVHrVWpOyPuj3Y9hf22FKAbe+QLnRrfOuBD8wi4wd53KofApe4k
 yb9p2Bb9cMx8JYBUHNFdiMR8aOwEm+8=
X-Google-Smtp-Source: AK7set9b0GSrCeSUddSCpjoh5mps/6pDUqzA3AgP4/uYxxuKLJLT68PFmzQ9OD4cMfKNSyad35j5mQ==
X-Received: by 2002:a9d:7654:0:b0:68d:72c8:10a9 with SMTP id
 o20-20020a9d7654000000b0068d72c810a9mr7885023otl.9.1676010729969; 
 Thu, 09 Feb 2023 22:32:09 -0800 (PST)
Received: from LeoBras.redhat.com ([2804:1b3:a800:9aa9:fdcb:7dec:9680:8417])
 by smtp.gmail.com with ESMTPSA id
 h18-20020a9d6a52000000b00688449397d3sm1686285otn.15.2023.02.09.22.32.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Feb 2023 22:32:09 -0800 (PST)
From: Leonardo Bras <leobras.c@gmail.com>
To: Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Xu <peterx@redhat.com>
Cc: Leonardo Bras <leobras.c@gmail.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v1 4/4] migration/multifd: Move load_cleanup inside
 incoming_state_destroy
Date: Fri, 10 Feb 2023 03:31:45 -0300
Message-Id: <20230210063145.530952-4-leobras.c@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230210063145.530952-1-leobras.c@gmail.com>
References: <20230210063145.530952-1-leobras.c@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::332;
 envelope-from=leobras.c@gmail.com; helo=mail-ot1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Currently running migration_incoming_state_destroy() without first running
multifd_load_cleanup() will cause a yank error:

qemu-system-x86_64: ../util/yank.c:107: yank_unregister_instance:
Assertion `QLIST_EMPTY(&entry->yankfns)' failed.
(core dumped)

The above error happens in the target host, when multifd is being used
for precopy, and then postcopy is triggered and the migration finishes.
This will crash the VM in the target host.

To avoid that, move multifd_load_cleanup() inside
migration_incoming_state_destroy(), so that the load cleanup becomes part
of the incoming state destroying process.

Running multifd_load_cleanup() twice can become an issue, though, but the
only scenario it could be ran twice is on process_incoming_migration_bh().
So removing this extra call is necessary.

On the other hand, this multifd_load_cleanup() call happens way before the
migration_incoming_state_destroy() and having this happening before
dirty_bitmap_mig_before_vm_start() and vm_start() may be a need.

So introduce a new function multifd_load_shutdown() that will mainly stop
all multifd threads and close their QIOChannels. Then use this function
instead of multifd_load_cleanup() to make sure nothing else is received
before dirty_bitmap_mig_before_vm_start().

Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
---
 migration/multifd.h   | 1 +
 migration/migration.c | 4 +++-
 migration/multifd.c   | 7 +++++++
 3 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/migration/multifd.h b/migration/multifd.h
index 9a7e1a8826..7cfc265148 100644
--- a/migration/multifd.h
+++ b/migration/multifd.h
@@ -17,6 +17,7 @@ int multifd_save_setup(Error **errp);
 void multifd_save_cleanup(void);
 int multifd_load_setup(Error **errp);
 void multifd_load_cleanup(void);
+void multifd_load_shutdown(void);
 bool multifd_recv_all_channels_created(void);
 void multifd_recv_new_channel(QIOChannel *ioc, Error **errp);
 void multifd_recv_sync_main(void);
diff --git a/migration/migration.c b/migration/migration.c
index ce962ea577..9f69447320 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -302,6 +302,8 @@ void migration_incoming_state_destroy(void)
 {
     struct MigrationIncomingState *mis = migration_incoming_get_current();
 
+    multifd_load_cleanup();
+
     if (mis->to_src_file) {
         /* Tell source that we are done */
         migrate_send_rp_shut(mis, qemu_file_get_error(mis->from_src_file) != 0);
@@ -543,7 +545,7 @@ static void process_incoming_migration_bh(void *opaque)
      */
     qemu_announce_self(&mis->announce_timer, migrate_announce_params());
 
-    multifd_load_cleanup();
+    multifd_load_shutdown();
 
     dirty_bitmap_mig_before_vm_start();
 
diff --git a/migration/multifd.c b/migration/multifd.c
index 7e37a459ed..9302c9f6cf 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -1022,6 +1022,13 @@ static void multifd_recv_terminate_threads(Error *err)
     }
 }
 
+void multifd_load_shutdown(void)
+{
+    if (migrate_use_multifd() && migrate_multi_channels_is_allowed()) {
+        multifd_recv_terminate_threads(NULL);
+    }
+}
+
 void multifd_load_cleanup(void)
 {
     int i;
-- 
2.39.1


