Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2627550FC3
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 07:46:07 +0200 (CEST)
Received: from localhost ([::1]:58966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3AEg-0000pW-D6
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 01:46:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1o3A97-0006sW-Oi
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 01:40:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1o3A96-00020r-25
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 01:40:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655703619;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=589Y4+IyEVMJNkPFIscZrdM6xrEV5umRGCJxERT4tvQ=;
 b=DOfANsKXO3hcxw+duHJpUSEpxH8Htb42lKfw+Kaf5p+cUVCXby/AsLJ3Jxw8GWvET81QoC
 Hvsgv5TKgBjBZe8wHOyZDdJkuQ37NLdSXfupk2OjgFocu8NYO4UVzUB6rWhKiTzbv6KNhF
 IXAXyccrCBa0vNVuHU6h9Rhhgws/log=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-41-Vl8zP0ASM-iOcyFSg6My6g-1; Mon, 20 Jun 2022 01:40:16 -0400
X-MC-Unique: Vl8zP0ASM-iOcyFSg6My6g-1
Received: by mail-oi1-f199.google.com with SMTP id
 bd1-20020a056808220100b0032ed33d656cso5705036oib.21
 for <qemu-devel@nongnu.org>; Sun, 19 Jun 2022 22:40:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=589Y4+IyEVMJNkPFIscZrdM6xrEV5umRGCJxERT4tvQ=;
 b=zAMns5RmZoeLdBSO0us6i6M4DwlFowlXk/76qKancLYMfgXDHlVFTPBvjUBW9vRDF/
 Qg9rk1eL9QvJtrqV0PQa1Iy22MzVo4x1he1Pw1nzymPsZXpKoYnzwPgA17X9xyJKil7s
 Zx3UkjbFaU2PN4uDOW1mSm0OXjfN2jJReR7hlO+uoiJmoKnHrprqoq0QEE+qu9D9MidW
 rvn/PZpk3810Z28BPNFcZIb6lGcmnn3FF5rP9szPYs+Y9TZi+k0OxZKBgN/m4dnbL82+
 yB6Xfdfj7h588ZOzJASGSGLL5in+thERmQgRdmN/Nl8qKkZsR6cGl9RwPKOGVfPfqna5
 bkuA==
X-Gm-Message-State: AJIora+xqHP/E2RtELAaHt6PL211Unlj5kgFvZZzA8C5WsOX/2d/Qzza
 /ufK66keI79WvYQBWmHzt9DihdQVXxTo8FYtw0hTk5DMzWehadlzI1BEPg3m6FFEGgq31gzYmyG
 Q3AtdgchHaqKb07U=
X-Received: by 2002:a05:6870:ac27:b0:101:a6aa:ba21 with SMTP id
 kw39-20020a056870ac2700b00101a6aaba21mr8091099oab.223.1655703615787; 
 Sun, 19 Jun 2022 22:40:15 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sGoInrhNTNwH9nK9bAPTwxHy1meO9laJGUIplYOpRNAFwyZtNyxcp66YTwp5T+6QOSfTZaUw==
X-Received: by 2002:a05:6870:ac27:b0:101:a6aa:ba21 with SMTP id
 kw39-20020a056870ac2700b00101a6aaba21mr8091089oab.223.1655703615598; 
 Sun, 19 Jun 2022 22:40:15 -0700 (PDT)
Received: from localhost.localdomain ([2804:431:c7f0:d933:8f52:267a:639c:b4c0])
 by smtp.gmail.com with ESMTPSA id
 e94-20020a9d2ae7000000b0060c2845c175sm7021463otb.8.2022.06.19.22.40.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Jun 2022 22:40:15 -0700 (PDT)
From: Leonardo Bras <leobras@redhat.com>
To: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?=E5=BE=90=E9=97=AF?= <xuchuangxclwt@bytedance.com>
Cc: Leonardo Bras <leobras@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v4 3/4] migration: zero-copy flush only at the end of bitmap
 scanning
Date: Mon, 20 Jun 2022 02:39:44 -0300
Message-Id: <20220620053944.257547-4-leobras@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220620053944.257547-1-leobras@redhat.com>
References: <20220620053944.257547-1-leobras@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=leobras@redhat.com;
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

When sending memory pages with MSG_ZEROCOPY, it's necessary to flush
to make sure all dirty pages are sent before a future version of them
happens to be sent.

Currently, the flush happens every time at the end of ram_save_iterate(),
which usually happens around 20x per second, due to a timeout.

Change so it flushes only after a whole scanning of the dirty bimap,
so it never sends a newer version of a page before an older one, while
avoiding unnecessary overhead.

Signed-off-by: Leonardo Bras <leobras@redhat.com>
---
 migration/multifd.h |  1 +
 migration/multifd.c | 58 ++++++++++++++++++++++++++-------------------
 migration/ram.c     |  7 ++++++
 3 files changed, 41 insertions(+), 25 deletions(-)

diff --git a/migration/multifd.h b/migration/multifd.h
index 4d8d89e5e5..e7cbdf1fb4 100644
--- a/migration/multifd.h
+++ b/migration/multifd.h
@@ -22,6 +22,7 @@ bool multifd_recv_new_channel(QIOChannel *ioc, Error **errp);
 void multifd_recv_sync_main(void);
 int multifd_send_sync_main(QEMUFile *f);
 int multifd_queue_page(QEMUFile *f, RAMBlock *block, ram_addr_t offset);
+int multifd_zero_copy_flush(void);
 
 /* Multifd Compression flags */
 #define MULTIFD_FLAG_SYNC (1 << 0)
diff --git a/migration/multifd.c b/migration/multifd.c
index 9282ab6aa4..ce4220a97d 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -566,10 +566,42 @@ void multifd_save_cleanup(void)
     multifd_send_state = NULL;
 }
 
+/*
+ * Set zero_copy_flush = true for every multifd channel
+ *
+ * When using zero-copy, it's necessary to flush the pages before any of
+ * the pages can be sent again, so we'll make sure the new version of the
+ * pages will always arrive _later_ than the old pages.
+ *
+ * Should be called only after we finished one whole scanning of
+ * all the dirty bitmaps.
+ */
+int multifd_zero_copy_flush(void)
+{
+    int i;
+    Error *local_err = NULL;
+
+    if (!migrate_use_multifd()) {
+        return 0;
+    }
+
+    for (i = 0; i < migrate_multifd_channels(); i++) {
+        MultiFDSendParams *p = &multifd_send_state->params[i];
+        int ret;
+
+        ret = qio_channel_flush(p->c, &local_err);
+        if (ret < 0) {
+            error_report_err(local_err);
+            return ret;
+        }
+    }
+
+    return 0;
+}
+
 int multifd_send_sync_main(QEMUFile *f)
 {
     int i;
-    bool flush_zero_copy;
 
     if (!migrate_use_multifd()) {
         return 0;
@@ -581,19 +613,6 @@ int multifd_send_sync_main(QEMUFile *f)
         }
     }
 
-    /*
-     * When using zero-copy, it's necessary to flush the pages before any of
-     * the pages can be sent again, so we'll make sure the new version of the
-     * pages will always arrive _later_ than the old pages.
-     *
-     * Currently we achieve this by flushing the zero-page requested writes
-     * per ram iteration, but in the future we could potentially optimize it
-     * to be less frequent, e.g. only after we finished one whole scanning of
-     * all the dirty bitmaps.
-     */
-
-    flush_zero_copy = migrate_use_zero_copy_send();
-
     for (i = 0; i < migrate_multifd_channels(); i++) {
         MultiFDSendParams *p = &multifd_send_state->params[i];
 
@@ -615,17 +634,6 @@ int multifd_send_sync_main(QEMUFile *f)
         ram_counters.transferred += p->packet_len;
         qemu_mutex_unlock(&p->mutex);
         qemu_sem_post(&p->sem);
-
-        if (flush_zero_copy && p->c) {
-            int ret;
-            Error *err = NULL;
-
-            ret = qio_channel_flush(p->c, &err);
-            if (ret < 0) {
-                error_report_err(err);
-                return -1;
-            }
-        }
     }
     for (i = 0; i < migrate_multifd_channels(); i++) {
         MultiFDSendParams *p = &multifd_send_state->params[i];
diff --git a/migration/ram.c b/migration/ram.c
index 5f5e37f64d..514584e44f 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -2288,6 +2288,13 @@ static int ram_find_and_save_block(RAMState *rs)
     rs->last_seen_block = pss.block;
     rs->last_page = pss.page;
 
+    if (pss.complete_round && migrate_use_zero_copy_send()) {
+        int ret = multifd_zero_copy_flush();
+        if (ret < 0) {
+            return ret;
+        }
+    }
+
     return pages;
 }
 
-- 
2.36.1


