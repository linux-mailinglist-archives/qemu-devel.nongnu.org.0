Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70DE1691891
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 07:37:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQN1n-00008z-JK; Fri, 10 Feb 2023 01:36:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1pQN1i-00008M-MW
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 01:36:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1pQN1h-0008R4-4N
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 01:36:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676011012;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5UwJ9b39de3kWLNGDPpuJ2S7kcq/Gr53SpasXFfxTJA=;
 b=jU+sTCRded7ZXWFu7qc0vrVrdlzc83vbXoLytkiQXzAIlmXZFMDD4ZIc3k+ujOpJO4UGGo
 609kDPq2S40Q0U0SwDxGUYhHjXQCFeZUi1hgNaIo2CY2inl8+pqYMUOJdjPwTNp05NDjWQ
 9gppwbumKecRaqJRjRNwzFOH+m3h7hs=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-375-4OxZW_KjMCebqu5-Wxhfbg-1; Fri, 10 Feb 2023 01:36:50 -0500
X-MC-Unique: 4OxZW_KjMCebqu5-Wxhfbg-1
Received: by mail-oo1-f71.google.com with SMTP id
 r21-20020a4a83d5000000b0051a1b4e72a5so1813434oog.4
 for <qemu-devel@nongnu.org>; Thu, 09 Feb 2023 22:36:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5UwJ9b39de3kWLNGDPpuJ2S7kcq/Gr53SpasXFfxTJA=;
 b=ymtD400wJOO06FpIAvN28ViRFd5H7PKsrmZ6QKHm0uihHNr9ZdJFD22VMtdefQwjaP
 obaQsmXem6F6zhZhibX505unIF5OwBw3jWesA/TCsKWN5KW8bw1ujHX2pqy5mUHsY6iG
 I8d6tOFEwmMkynpo2Ai8YfhULaqI3wseBP+1nHXPAvHoBTLGeRlQEkt8c6QIeer1es0o
 zYhiouAca9eN8Wmw6Q+vR8dEammStATcXTY8vB2TE6j3L/CA9C8QPphcgYDviidG3lZY
 Xcf3qnYl3QoR4rVWMVptRDLgIJEpPdGJtnxtZoHJ8WyO7VMdHkqw6GZX7wn2dYpMLR3s
 76Tg==
X-Gm-Message-State: AO0yUKWBglIhiKKFSIMCEL9P1rSGtDBZW1JXsb/E2TRJuIa5dB3Ka0kL
 ihrDYENwZPeKnqpuSpHdXJrxiryOHlhAEl5rSAJxsdYvwHYVDeO+qJe75mmQRHe/X6TJuOSPB3a
 OR6PncG28AvCjXMw=
X-Received: by 2002:a9d:4797:0:b0:68d:a0e5:d31f with SMTP id
 b23-20020a9d4797000000b0068da0e5d31fmr7648534otf.3.1676011009603; 
 Thu, 09 Feb 2023 22:36:49 -0800 (PST)
X-Google-Smtp-Source: AK7set92UP0XPpmJlT2QJEOtU1HHmgtxLkDDrXQYhtAnndKiXHRwLnWjgxb+QN/aK3Z/3zhDHr29gA==
X-Received: by 2002:a9d:4797:0:b0:68d:a0e5:d31f with SMTP id
 b23-20020a9d4797000000b0068da0e5d31fmr7648528otf.3.1676011009357; 
 Thu, 09 Feb 2023 22:36:49 -0800 (PST)
Received: from LeoBras.redhat.com ([2804:1b3:a800:9aa9:fdcb:7dec:9680:8417])
 by smtp.gmail.com with ESMTPSA id
 d8-20020a05683018e800b00670679748f9sm1705285otf.49.2023.02.09.22.36.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Feb 2023 22:36:48 -0800 (PST)
From: Leonardo Bras <leobras@redhat.com>
To: Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Xu <peterx@redhat.com>
Cc: Leonardo Bras <leobras@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v1 4/4] migration/multifd: Move load_cleanup inside
 incoming_state_destroy
Date: Fri, 10 Feb 2023 03:36:31 -0300
Message-Id: <20230210063630.532185-4-leobras@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230210063630.532185-1-leobras@redhat.com>
References: <20230210063630.532185-1-leobras@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=leobras@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Signed-off-by: Leonardo Bras <leobras@redhat.com>
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


