Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E246350EB58
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 23:54:57 +0200 (CEST)
Received: from localhost ([::1]:52486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nj6fZ-00015r-14
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 17:54:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1nj6ce-0005ha-L8
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 17:51:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1nj6cc-00016C-TH
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 17:51:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650923514;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RQFjS0vcfoRuqRYCfaPRvlIl2V4fbZjAVowp1pGheKU=;
 b=ilXo0Hc0FXrl5Hcvy6YdrU9X6fOt5a5UfajPDRsDnQRLn40JdvS0ZDsd41ZyAOMoCzmgbo
 9CTrDZJ+tiYs64Yhm8zq9uVtHjiXcvn51aSiYQWAuXY2MQ4/95bJbbU33SbXsLHvOkmv1v
 QANMU2wGX6YGcH5Wjm49nL+SjZsKTDU=
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com
 [209.85.160.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-126-me_ZPjp_NomF3ZYkJH1CeA-1; Mon, 25 Apr 2022 17:51:52 -0400
X-MC-Unique: me_ZPjp_NomF3ZYkJH1CeA-1
Received: by mail-oa1-f69.google.com with SMTP id
 586e51a60fabf-e630d5d6easo5522481fac.10
 for <qemu-devel@nongnu.org>; Mon, 25 Apr 2022 14:51:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RQFjS0vcfoRuqRYCfaPRvlIl2V4fbZjAVowp1pGheKU=;
 b=TcyK9+dzdBGo+lZwv6ofN3F1/e46RhcaK09HeJCs+IgsTQ4H49E0iyrJmy1cG9G/wN
 LuDgiSeUT0Bx8zYggDLA8BiLft9QGlX6+9vB/eiFdNWyXxAdV4ljvONcbPDgLWqLaFKw
 vtxJcb+qtw0F+ikxKAhOlP3MQgBbg4g2ZJhIcEIGIzmit4n5FpyHABCcnApM8fmbJdje
 qw4o+yQJbaKmMDYNmoj1qHyR18Kd1C4u7bbuO5fRHxmJFkn4dYGbZdELgYFjoMjCjzhi
 Ua7m8Yye7LwJ3O0FGazh9MSvmwAiejZvDoYIU08XcSgX1WuI9iPyx0Zr/P9mccm8fGFM
 j2cw==
X-Gm-Message-State: AOAM533HFrzQMdO5z4560f7qWvlDZS/v7doJhD7kjsbiAz1KLgi7zbUU
 cbGqKA//ZKQYVNG0kt4lAr7XV8JpPLzGaTLrZwllJIZDzo40FFVGAaZeOwMiffpXajdX5LYNM0J
 ZBSDp+abUKzQ/C5I=
X-Received: by 2002:a05:6870:ec8c:b0:e9:365:7a53 with SMTP id
 eo12-20020a056870ec8c00b000e903657a53mr7220150oab.269.1650923512052; 
 Mon, 25 Apr 2022 14:51:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJynrdD0HIc9Um81wGUkYntFadtCDhfO3FDO9RX4lDB16UBDyNwMoZhhmJk8UEc1pab7wAz9bQ==
X-Received: by 2002:a05:6870:ec8c:b0:e9:365:7a53 with SMTP id
 eo12-20020a056870ec8c00b000e903657a53mr7220138oab.269.1650923511814; 
 Mon, 25 Apr 2022 14:51:51 -0700 (PDT)
Received: from LeoBras.redhat.com ([2804:431:c7f0:2ba0:92e8:26c9:ce7e:f03e])
 by smtp.gmail.com with ESMTPSA id
 q7-20020a056870e60700b000e686d13878sm156807oag.18.2022.04.25.14.51.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Apr 2022 14:51:51 -0700 (PDT)
From: Leonardo Bras <leobras@redhat.com>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Fam Zheng <fam@euphon.net>, Peter Xu <peterx@redhat.com>
Subject: [PATCH v9 5/7] multifd: multifd_send_sync_main now returns negative
 on error
Date: Mon, 25 Apr 2022 18:50:54 -0300
Message-Id: <20220425215055.611825-6-leobras@redhat.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220425215055.611825-1-leobras@redhat.com>
References: <20220425215055.611825-1-leobras@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=leobras@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Leonardo Bras <leobras@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Even though multifd_send_sync_main() currently emits error_reports, it's
callers don't really check it before continuing.

Change multifd_send_sync_main() to return -1 on error and 0 on success.
Also change all it's callers to make use of this change and possibly fail
earlier.

(This change is important to next patch on  multifd zero copy
implementation, to make it sure an error in zero-copy flush does not go
unnoticed.

Signed-off-by: Leonardo Bras <leobras@redhat.com>
---
 migration/multifd.h |  2 +-
 migration/multifd.c | 10 ++++++----
 migration/ram.c     | 29 ++++++++++++++++++++++-------
 3 files changed, 29 insertions(+), 12 deletions(-)

diff --git a/migration/multifd.h b/migration/multifd.h
index 7d0effcb03..bcf5992945 100644
--- a/migration/multifd.h
+++ b/migration/multifd.h
@@ -20,7 +20,7 @@ int multifd_load_cleanup(Error **errp);
 bool multifd_recv_all_channels_created(void);
 bool multifd_recv_new_channel(QIOChannel *ioc, Error **errp);
 void multifd_recv_sync_main(void);
-void multifd_send_sync_main(QEMUFile *f);
+int multifd_send_sync_main(QEMUFile *f);
 int multifd_queue_page(QEMUFile *f, RAMBlock *block, ram_addr_t offset);
 
 /* Multifd Compression flags */
diff --git a/migration/multifd.c b/migration/multifd.c
index 2a8c8570c3..15fb668e64 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -566,17 +566,17 @@ void multifd_save_cleanup(void)
     multifd_send_state = NULL;
 }
 
-void multifd_send_sync_main(QEMUFile *f)
+int multifd_send_sync_main(QEMUFile *f)
 {
     int i;
 
     if (!migrate_use_multifd()) {
-        return;
+        return 0;
     }
     if (multifd_send_state->pages->num) {
         if (multifd_send_pages(f) < 0) {
             error_report("%s: multifd_send_pages fail", __func__);
-            return;
+            return -1;
         }
     }
     for (i = 0; i < migrate_multifd_channels(); i++) {
@@ -589,7 +589,7 @@ void multifd_send_sync_main(QEMUFile *f)
         if (p->quit) {
             error_report("%s: channel %d has already quit", __func__, i);
             qemu_mutex_unlock(&p->mutex);
-            return;
+            return -1;
         }
 
         p->packet_num = multifd_send_state->packet_num++;
@@ -608,6 +608,8 @@ void multifd_send_sync_main(QEMUFile *f)
         qemu_sem_wait(&p->sem_sync);
     }
     trace_multifd_send_sync_main(multifd_send_state->packet_num);
+
+    return 0;
 }
 
 static void *multifd_send_thread(void *opaque)
diff --git a/migration/ram.c b/migration/ram.c
index a2489a2699..5f5e37f64d 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -2909,6 +2909,7 @@ static int ram_save_setup(QEMUFile *f, void *opaque)
 {
     RAMState **rsp = opaque;
     RAMBlock *block;
+    int ret;
 
     if (compress_threads_save_setup()) {
         return -1;
@@ -2943,7 +2944,11 @@ static int ram_save_setup(QEMUFile *f, void *opaque)
     ram_control_before_iterate(f, RAM_CONTROL_SETUP);
     ram_control_after_iterate(f, RAM_CONTROL_SETUP);
 
-    multifd_send_sync_main(f);
+    ret =  multifd_send_sync_main(f);
+    if (ret < 0) {
+        return ret;
+    }
+
     qemu_put_be64(f, RAM_SAVE_FLAG_EOS);
     qemu_fflush(f);
 
@@ -3052,7 +3057,11 @@ static int ram_save_iterate(QEMUFile *f, void *opaque)
 out:
     if (ret >= 0
         && migration_is_setup_or_active(migrate_get_current()->state)) {
-        multifd_send_sync_main(rs->f);
+        ret = multifd_send_sync_main(rs->f);
+        if (ret < 0) {
+            return ret;
+        }
+
         qemu_put_be64(f, RAM_SAVE_FLAG_EOS);
         qemu_fflush(f);
         ram_transferred_add(8);
@@ -3112,13 +3121,19 @@ static int ram_save_complete(QEMUFile *f, void *opaque)
         ram_control_after_iterate(f, RAM_CONTROL_FINISH);
     }
 
-    if (ret >= 0) {
-        multifd_send_sync_main(rs->f);
-        qemu_put_be64(f, RAM_SAVE_FLAG_EOS);
-        qemu_fflush(f);
+    if (ret < 0) {
+        return ret;
     }
 
-    return ret;
+    ret = multifd_send_sync_main(rs->f);
+    if (ret < 0) {
+        return ret;
+    }
+
+    qemu_put_be64(f, RAM_SAVE_FLAG_EOS);
+    qemu_fflush(f);
+
+    return 0;
 }
 
 static void ram_save_pending(QEMUFile *f, void *opaque, uint64_t max_size,
-- 
2.36.0


