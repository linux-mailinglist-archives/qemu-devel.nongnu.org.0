Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DBCF4EDCC2
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 17:26:33 +0200 (CEST)
Received: from localhost ([::1]:60434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZwgy-0004S2-3a
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 11:26:32 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nZwRJ-0004hz-PT
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 11:10:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45160)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nZwRI-0001fF-3f
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 11:10:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648739419;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2+PDhrpWKbHP/PkTW5UAcTW+ZMb1mT4D36GE2ydAWcc=;
 b=C8EuhXjeGIocQDurpR+uo8372ok1N70lf6Y8fQgch11VPcXA4J1I6PKkEDMNTnaSGN0hd8
 5b/n6gMHOYVCtBU0kQPbHPzy/qlnXRr8wFyLbKCcvSVOB1VMxICxHR0eMBu7Hw2YzGL82i
 9wnNqaFvfh4EwuM1sc6IBrhyUSekvf0=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-625-1QgCgfWFPUmufmUJW0DMFw-1; Thu, 31 Mar 2022 11:09:02 -0400
X-MC-Unique: 1QgCgfWFPUmufmUJW0DMFw-1
Received: by mail-qv1-f72.google.com with SMTP id
 k20-20020ad44714000000b00440fd2c4a0aso18747435qvz.20
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 08:09:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2+PDhrpWKbHP/PkTW5UAcTW+ZMb1mT4D36GE2ydAWcc=;
 b=n1XGte17SW29mARGRa5txzOBiFIJK3F52ekCN6f79BNh6LKZhRVNhocdWzugUVplZO
 tzPwtozRnIVFBPwrvWh/+Bk+p5ztWYR/RsGKRXhFUnxYeqVke4Fw7xUEsUNKlG2UN3px
 YbXO914j5R5hBP7uyd9WAvv704laMaAVXkkrk+eTlqyST1P9xpRotPUbde8f8n47YWfg
 cXRm/5yafahSuxd4ttqDk2fIaeCZnO//gyShueSLCHiO6L2Bbccx0+XcvYGWkZPRqQ1R
 Ka9j6GZFFfUBQW2jIydW6onYHCXqIu2pIjwp3nCJiEE7l5IjwaieRGte/s89BiqPhj77
 BkTw==
X-Gm-Message-State: AOAM530k3zqvNrHmKmV792npRoGLb4i+HNh3hc/IWbLmY7ATlbDt7s6w
 XxkDerWbrfHqQjrXe4ixVUKXgucHzLevC0WQeRSB2bZeE0+2HFNavTIyrv64lICe7IntAZukuYh
 U2VnlGdpptX4jx9aBRG305/OkvUUOQRrOl8SZLlQ1Fk4PmtpRrfyzIoxKKOVa+wcA
X-Received: by 2002:a0c:d688:0:b0:42c:3cb0:3923 with SMTP id
 k8-20020a0cd688000000b0042c3cb03923mr4158600qvi.69.1648739341252; 
 Thu, 31 Mar 2022 08:09:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw1paY5f6hELjrpmSwCSUeZxd0dfSp9Soy7kG6/nElhBBkExk7d1ej/nOvMAKACcaQrBnRc4w==
X-Received: by 2002:a0c:d688:0:b0:42c:3cb0:3923 with SMTP id
 k8-20020a0cd688000000b0042c3cb03923mr4158553qvi.69.1648739340851; 
 Thu, 31 Mar 2022 08:09:00 -0700 (PDT)
Received: from localhost.localdomain
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 21-20020ac85715000000b002e1ce9605ffsm20246871qtw.65.2022.03.31.08.08.59
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 31 Mar 2022 08:09:00 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 02/19] migration: Drop multifd tls_hostname cache
Date: Thu, 31 Mar 2022 11:08:40 -0400
Message-Id: <20220331150857.74406-3-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220331150857.74406-1-peterx@redhat.com>
References: <20220331150857.74406-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The hostname is cached N times, N equals to the multifd channels.

Drop that cache because after previous patch we've got s->hostname
being alive for the whole lifecycle of migration procedure.

Cc: Juan Quintela <quintela@redhat.com>
Cc: Daniel P. Berrange <berrange@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
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
2.32.0


