Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E8950A84E
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 20:43:48 +0200 (CEST)
Received: from localhost ([::1]:37400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhbmN-0004Zh-5p
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 14:43:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nhbju-0001fW-HJ
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 14:41:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nhbjs-0005zr-RY
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 14:41:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650566471;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UsAgmkYn4qnFiwWvE7fgO6WgOldiJGWTCZEXrnCrgMQ=;
 b=BDOZjMKDe5fLGPrBcm7XZtz1vtzRfDbVk1e05lw9RrGkgALoerKcPKB6sU0cbkgV0qaJtS
 ulXuzmzLdQInjvy6PfXt/i+TB6gqoTKdlwyILgX87i+71mxVE8poBvX9NZfjcPeUMC8ZAX
 hAQ0RLQCKsk0/jE/dxFXiDKMARlivgw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-245-uoqqCc5ANS-i58QS9lGtrQ-1; Thu, 21 Apr 2022 14:41:10 -0400
X-MC-Unique: uoqqCc5ANS-i58QS9lGtrQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6B4FA3C1618B
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 18:41:10 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.39.195.39])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A71BB4047D3E;
 Thu, 21 Apr 2022 18:41:09 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org,
	peterx@redhat.com,
	berrange@redhat.com
Subject: [PULL 11/18] migration: Drop multifd tls_hostname cache
Date: Thu, 21 Apr 2022 19:40:45 +0100
Message-Id: <20220421184052.306581-12-dgilbert@redhat.com>
In-Reply-To: <20220421184052.306581-1-dgilbert@redhat.com>
References: <20220421184052.306581-1-dgilbert@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Xu <peterx@redhat.com>

The hostname is cached N times, N equals to the multifd channels.

Drop that cache because after previous patch we've got s->hostname
being alive for the whole lifecycle of migration procedure.

Cc: Juan Quintela <quintela@redhat.com>
Cc: Daniel P. Berrange <berrange@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
Message-Id: <20220331150857.74406-3-peterx@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/multifd.c | 10 +++-------
 migration/multifd.h |  2 --
 2 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/migration/multifd.c b/migration/multifd.c
index 76b57a7177..1be4ab5d17 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -542,8 +542,6 @@ void multifd_save_cleanup(void)
         qemu_sem_destroy(&p->sem_sync);
         g_free(p->name);
         p->name = NULL;
-        g_free(p->tls_hostname);
-        p->tls_hostname = NULL;
         multifd_pages_clear(p->pages);
         p->pages = NULL;
         p->packet_len = 0;
@@ -763,7 +761,7 @@ static void multifd_tls_channel_connect(MultiFDSendParams *p,
                                         Error **errp)
 {
     MigrationState *s = migrate_get_current();
-    const char *hostname = p->tls_hostname;
+    const char *hostname = s->hostname;
     QIOChannelTLS *tioc;
 
     tioc = migration_tls_client_create(s, ioc, hostname, errp);
@@ -787,7 +785,8 @@ static bool multifd_channel_connect(MultiFDSendParams *p,
     MigrationState *s = migrate_get_current();
 
     trace_multifd_set_outgoing_channel(
-        ioc, object_get_typename(OBJECT(ioc)), p->tls_hostname, error);
+        ioc, object_get_typename(OBJECT(ioc)),
+        migrate_get_current()->hostname, error);
 
     if (!error) {
         if (s->parameters.tls_creds &&
@@ -874,7 +873,6 @@ int multifd_save_setup(Error **errp)
     int thread_count;
     uint32_t page_count = MULTIFD_PACKET_SIZE / qemu_target_page_size();
     uint8_t i;
-    MigrationState *s;
 
     if (!migrate_use_multifd()) {
         return 0;
@@ -884,7 +882,6 @@ int multifd_save_setup(Error **errp)
         return -1;
     }
 
-    s = migrate_get_current();
     thread_count = migrate_multifd_channels();
     multifd_send_state = g_malloc0(sizeof(*multifd_send_state));
     multifd_send_state->params = g_new0(MultiFDSendParams, thread_count);
@@ -909,7 +906,6 @@ int multifd_save_setup(Error **errp)
         p->packet->magic = cpu_to_be32(MULTIFD_MAGIC);
         p->packet->version = cpu_to_be32(MULTIFD_VERSION);
         p->name = g_strdup_printf("multifdsend_%d", i);
-        p->tls_hostname = g_strdup(s->hostname);
         /* We need one extra place for the packet header */
         p->iov = g_new0(struct iovec, page_count + 1);
         p->normal = g_new0(ram_addr_t, page_count);
diff --git a/migration/multifd.h b/migration/multifd.h
index 4dda900a0b..3d577b98b7 100644
--- a/migration/multifd.h
+++ b/migration/multifd.h
@@ -72,8 +72,6 @@ typedef struct {
     uint8_t id;
     /* channel thread name */
     char *name;
-    /* tls hostname */
-    char *tls_hostname;
     /* channel thread id */
     QemuThread thread;
     /* communication channel */
-- 
2.35.1


