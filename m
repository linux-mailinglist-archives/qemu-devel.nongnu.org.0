Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 642BC52AC71
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 22:06:27 +0200 (CEST)
Received: from localhost ([::1]:50382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nr3SW-0000LE-DP
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 16:06:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nr3KO-0003FS-4E
 for qemu-devel@nongnu.org; Tue, 17 May 2022 15:57:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nr3KL-0002Li-E1
 for qemu-devel@nongnu.org; Tue, 17 May 2022 15:57:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652817468;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EL8zGmGLlZpMSSs9tiKlVFtD4tFyNinjJ/Ss8SlMY7A=;
 b=GCfzJ8et6Sy3s7QqKuTyO33WaxQ151zmXtG1spkO8Eo3sAE/i4l7q2+DS8nzcAuSqh3dJp
 esoANBljr5m3TwDsOeLRym59blzx+jihw7pgSGV2pJRsthKcNfwVpgxsutok+8s7LQDPVb
 YluxDk98ax75k3pDqbQNjDiQ4rIkuDc=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-190-5KjO7IUxMC6g42DjRvtS5g-1; Tue, 17 May 2022 15:57:47 -0400
X-MC-Unique: 5KjO7IUxMC6g42DjRvtS5g-1
Received: by mail-io1-f69.google.com with SMTP id
 ay38-20020a5d9da6000000b0065adc1f932bso13092198iob.11
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 12:57:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EL8zGmGLlZpMSSs9tiKlVFtD4tFyNinjJ/Ss8SlMY7A=;
 b=iRiAPwicciiUp6u4wOLG/izufyYeSw1jFmML9e/b5Y63mr1tC7NcBfA9f9XwFaP9qG
 QouTovx9lgbwXyVoAQjdpbqe8xhcL5WwDqluvmMdm//3M05JYdbO5LpTsyKUpUHdHS+R
 9WVGnanKrwc9QL1HxBTSQDV6alKcruhJy63OvnMB63u470jN1R5z2NK7105Zy3butT0v
 0uc6536usa16hQjT0WgeqD6ao7DfSbNhoVua+r3pZEx2OPwDUDrr5+nlkPTx94oyFfIU
 M5Lt7hovH1Fe8WjkEMo6jPAHCPQ0LLo6ltAiFlQbVcKwMLFm0Qb9e2ONC8Trssn+Lcsq
 tgEA==
X-Gm-Message-State: AOAM533v50Py8h6wd41Fz7yUO+ndzI/wbZFzTz4jxmY/qyl3bi/AP9UG
 koxD+s2gMFdbAV/0KBEhR82Ig81moSuLmQQnTZhYp84QOMhveb05dd0MoNEExqyg38XxpcNUmLl
 S5DZXd6/A/7hResJ/Rvurtr1Q8cUCeHwkdZzGjXyNTzY2tfoksLWMVnERP10YRKjV
X-Received: by 2002:a05:6602:2e10:b0:65a:9ddd:e424 with SMTP id
 o16-20020a0566022e1000b0065a9ddde424mr10755800iow.133.1652817466412; 
 Tue, 17 May 2022 12:57:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzjqva9cvvjpYMKKMQzi04Yl1tt+ZmlsUNK9oFpNgXIHosz4uVV5YtIOqueEgAoxyhtuUrTxg==
X-Received: by 2002:a05:6602:2e10:b0:65a:9ddd:e424 with SMTP id
 o16-20020a0566022e1000b0065a9ddde424mr10755781iow.133.1652817465841; 
 Tue, 17 May 2022 12:57:45 -0700 (PDT)
Received: from localhost.localdomain
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 f15-20020a056e020b4f00b002d125725709sm59575ilu.28.2022.05.17.12.57.44
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 17 May 2022 12:57:45 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: peterx@redhat.com, Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Manish Mishra <manish.mishra@nutanix.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>
Subject: [PATCH v6 07/13] migration: Add helpers to detect TLS capability
Date: Tue, 17 May 2022 15:57:24 -0400
Message-Id: <20220517195730.32312-8-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220517195730.32312-1-peterx@redhat.com>
References: <20220517195730.32312-1-peterx@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add migrate_channel_requires_tls() to detect whether the specific channel
requires TLS, leveraging the recently introduced migrate_use_tls().  No
functional change intended.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/channel.c   | 9 ++-------
 migration/migration.c | 1 +
 migration/multifd.c   | 4 +---
 migration/tls.c       | 9 +++++++++
 migration/tls.h       | 4 ++++
 5 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/migration/channel.c b/migration/channel.c
index a162d00fea..36e59eaeec 100644
--- a/migration/channel.c
+++ b/migration/channel.c
@@ -38,9 +38,7 @@ void migration_channel_process_incoming(QIOChannel *ioc)
     trace_migration_set_incoming_channel(
         ioc, object_get_typename(OBJECT(ioc)));
 
-    if (migrate_use_tls() &&
-        !object_dynamic_cast(OBJECT(ioc),
-                             TYPE_QIO_CHANNEL_TLS)) {
+    if (migrate_channel_requires_tls(ioc)) {
         migration_tls_channel_process_incoming(s, ioc, &local_err);
     } else {
         migration_ioc_register_yank(ioc);
@@ -70,10 +68,7 @@ void migration_channel_connect(MigrationState *s,
         ioc, object_get_typename(OBJECT(ioc)), hostname, error);
 
     if (!error) {
-        if (s->parameters.tls_creds &&
-            *s->parameters.tls_creds &&
-            !object_dynamic_cast(OBJECT(ioc),
-                                 TYPE_QIO_CHANNEL_TLS)) {
+        if (migrate_channel_requires_tls(ioc)) {
             migration_tls_channel_connect(s, ioc, hostname, &error);
 
             if (!error) {
diff --git a/migration/migration.c b/migration/migration.c
index f5f7a0f91f..d17f435d08 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -49,6 +49,7 @@
 #include "trace.h"
 #include "exec/target_page.h"
 #include "io/channel-buffer.h"
+#include "io/channel-tls.h"
 #include "migration/colo.h"
 #include "hw/boards.h"
 #include "hw/qdev-properties.h"
diff --git a/migration/multifd.c b/migration/multifd.c
index 9282ab6aa4..849c116ce4 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -831,9 +831,7 @@ static bool multifd_channel_connect(MultiFDSendParams *p,
         migrate_get_current()->hostname, error);
 
     if (!error) {
-        if (migrate_use_tls() &&
-            !object_dynamic_cast(OBJECT(ioc),
-                                 TYPE_QIO_CHANNEL_TLS)) {
+        if (migrate_channel_requires_tls(ioc)) {
             multifd_tls_channel_connect(p, ioc, &error);
             if (!error) {
                 /*
diff --git a/migration/tls.c b/migration/tls.c
index 32c384a8b6..1baa662489 100644
--- a/migration/tls.c
+++ b/migration/tls.c
@@ -166,3 +166,12 @@ void migration_tls_channel_connect(MigrationState *s,
                               NULL,
                               NULL);
 }
+
+bool migrate_channel_requires_tls(QIOChannel *ioc)
+{
+    if (!migrate_use_tls()) {
+        return false;
+    }
+
+    return !object_dynamic_cast(OBJECT(ioc), TYPE_QIO_CHANNEL_TLS);
+}
diff --git a/migration/tls.h b/migration/tls.h
index de4fe2cafd..a54c1dcec7 100644
--- a/migration/tls.h
+++ b/migration/tls.h
@@ -37,4 +37,8 @@ void migration_tls_channel_connect(MigrationState *s,
                                    QIOChannel *ioc,
                                    const char *hostname,
                                    Error **errp);
+
+/* Whether the QIO channel requires further TLS handshake? */
+bool migrate_channel_requires_tls(QIOChannel *ioc);
+
 #endif
-- 
2.32.0


