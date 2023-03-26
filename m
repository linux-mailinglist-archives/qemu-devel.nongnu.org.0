Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 505966C972E
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Mar 2023 19:27:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgU7z-0000ma-5z; Sun, 26 Mar 2023 13:25:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pgU7x-0000m8-4J
 for qemu-devel@nongnu.org; Sun, 26 Mar 2023 13:25:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pgU7v-0003lN-LP
 for qemu-devel@nongnu.org; Sun, 26 Mar 2023 13:25:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679851555;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xh7eEmislwaTzwJJMX7ge3+9CrgFY2oIgV/4JyeZCI4=;
 b=ceRbNAdn7e9Tpo9OoGdGOHbsVC30lCeYwTpvp+dDlB+JUAVMR9NiQ8Ys6J3UkNR4qoDVLE
 lyYuRXPD4xqzdPrfg+YneBWF2wnSJ18xAA/oTNGmOodthJUM+nm3yFrYMGec9SF7Oq4bh8
 lnKic7q+bUONs8dXAXw66LKOXKWICkI=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-587-AziBB51OPPyZAQEKbEDuYg-1; Sun, 26 Mar 2023 13:25:53 -0400
X-MC-Unique: AziBB51OPPyZAQEKbEDuYg-1
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-54574d6204aso65730487b3.15
 for <qemu-devel@nongnu.org>; Sun, 26 Mar 2023 10:25:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679851552;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xh7eEmislwaTzwJJMX7ge3+9CrgFY2oIgV/4JyeZCI4=;
 b=Vb+I10eiF+rqhNJnEm7uMepTh95nyk9WUQv8Qr5oI1F0zPl9K5vtiDo5gAIrOAgpLQ
 w92QzHj9HFtezt1iGjTQ8wVqo4KBVTPYIALzGV7GEAjlaxHwo6+X/GMJSviLeJ2WRO8j
 sQVtpSFJCUHcTdG0a9BwSAA1v6Z/66bSz+Sp2isHCaiZuuP0Oc+Hed0gutD7IadUqCpw
 nJxKDIug4rngcQ0RzvFVKU8x6Y/xcnhPd2TK4oFV8qOo71q7iORADc8u6axj/WeC3HFv
 as7JvccE13+oqqmwD8FqRajCZJWJU3GTpTQUZSxf949pP4oCx96cx1jwo3495hQqa64p
 bnDA==
X-Gm-Message-State: AAQBX9cC9T4bMWNlEsDL+vCrpVQQiVU7zclgcMVzvZikVA9IRvv1g+3e
 UkNC8kHu7AR0xYF3wWBhbvEEO803S2hvWq8Wnb/JxIj8lIQS4y6Fo+Qp2jO4nHAJU/JpPAdZq1G
 iFp6rNdK5YYhAhHOiJNYlAa6m/aP0+uJ39GsgOOvvve4wVu9MQNLgOiJ9DzdOhk3XiFr+xHTr
X-Received: by 2002:a81:5788:0:b0:544:b85e:ea9d with SMTP id
 l130-20020a815788000000b00544b85eea9dmr7820108ywb.1.1679851552000; 
 Sun, 26 Mar 2023 10:25:52 -0700 (PDT)
X-Google-Smtp-Source: AKy350YRW+cnbMT5UPUi2atpjJU032CAXQF6ENbVNUfQwmVYcyf6QWXPdkBO4i2nd/bpqWzaW10mYw==
X-Received: by 2002:a81:5788:0:b0:544:b85e:ea9d with SMTP id
 l130-20020a815788000000b00544b85eea9dmr7820090ywb.1.1679851551567; 
 Sun, 26 Mar 2023 10:25:51 -0700 (PDT)
Received: from x1n.redhat.com
 (bras-base-aurron9127w-grc-40-70-52-229-124.dsl.bell.ca. [70.52.229.124])
 by smtp.gmail.com with ESMTPSA id
 d8-20020a818d08000000b00545a0818501sm1529454ywg.145.2023.03.26.10.25.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Mar 2023 10:25:49 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Juan Quintela <quintela@redhat.com>
Subject: [PATCH for-8.0 3/3] migration: Recover behavior of preempt channel
 creation for pre-7.2
Date: Sun, 26 Mar 2023 13:25:40 -0400
Message-Id: <20230326172540.2571110-4-peterx@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230326172540.2571110-1-peterx@redhat.com>
References: <20230326172540.2571110-1-peterx@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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

In 8.0 devel window we reworked preempt channel creation, so that there'll
be no race condition when the migration channel and preempt channel got
established in the wrong order in commit 5655aab079.

However no one noticed that the change will also be not compatible with
older qemus, majorly 7.1/7.2 versions where preempt mode started to be
supported.

Leverage the same pre-7.2 flag introduced in the previous patch to recover
the behavior hopefully before 8.0 releases, so we don't break migration
when we migrate from 8.0 to older qemu binaries.

Fixes: 5655aab079 ("migration: Postpone postcopy preempt channel to be after main")
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/migration.c    |  9 +++++++++
 migration/migration.h    |  7 +++++++
 migration/postcopy-ram.c | 10 ++++++++--
 3 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 37fc4fb3e2..bda4789193 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -4388,6 +4388,15 @@ void migrate_fd_connect(MigrationState *s, Error *error_in)
         }
     }
 
+    /*
+     * This needs to be done before resuming a postcopy.  Note: for newer
+     * QEMUs we will delay the channel creation until postcopy_start(), to
+     * avoid disorder of channel creations.
+     */
+    if (migrate_postcopy_preempt() && s->preempt_pre_7_2) {
+        postcopy_preempt_setup(s);
+    }
+
     if (resume) {
         /* Wakeup the main migration thread to do the recovery */
         migrate_set_state(&s->state, MIGRATION_STATUS_POSTCOPY_PAUSED,
diff --git a/migration/migration.h b/migration/migration.h
index 67baba2184..310ae8901b 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -384,12 +384,19 @@ struct MigrationState {
      * - postcopy preempt src QEMU instance will generate an EOS message at
      *   the end of migration to shut the preempt channel on dest side.
      *
+     * - postcopy preempt channel will be created at the setup phase on src
+         QEMU.
+     *
      * When clear:
      *
      * - postcopy preempt src QEMU instance will _not_ generate an EOS
      *   message at the end of migration, the dest qemu will shutdown the
      *   channel itself.
      *
+     * - postcopy preempt channel will be created at the switching phase
+     *   from precopy -> postcopy (to avoid race condtion of misordered
+     *   creation of channels).
+     *
      * NOTE: See message-id <ZBoShWArKDPpX/D7@work-vm> on qemu-devel
      * mailing list for more information on the possible race.  Everyone
      * should probably just keep this value untouched after set by the
diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
index 263bab75ec..93f39f8e06 100644
--- a/migration/postcopy-ram.c
+++ b/migration/postcopy-ram.c
@@ -1630,8 +1630,14 @@ int postcopy_preempt_establish_channel(MigrationState *s)
         return 0;
     }
 
-    /* Kick off async task to establish preempt channel */
-    postcopy_preempt_setup(s);
+    /*
+     * Kick off async task to establish preempt channel.  Only do so with
+     * 8.0+ machines, because 7.1/7.2 require the channel to be created in
+     * setup phase of migration (even if racy in an unreliable network).
+     */
+    if (!s->preempt_pre_7_2) {
+        postcopy_preempt_setup(s);
+    }
 
     /*
      * We need the postcopy preempt channel to be established before
-- 
2.39.1


