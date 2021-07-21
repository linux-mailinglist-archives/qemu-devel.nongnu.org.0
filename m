Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEFB03D0667
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 03:27:46 +0200 (CEST)
Received: from localhost ([::1]:54876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m611V-0003DX-RN
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 21:27:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m60vk-0003cS-F6
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 21:21:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m60vi-0003zy-P0
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 21:21:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626830506;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RunfLm70+JhZWuj0ksUad70prEh2b7muBQnrQ54Pkh0=;
 b=YtY3+Ps2Tf73BGfCLqZo5vECi18rpt2AAPuTr8+RfvREPiygfZ0ojh/RjA62XhmhQKX7bd
 TnFL/v+PG2/lDvEtPxYTBhzj55BriixBvpspItgtHMZzewMBhqSEk8x8gjDJZw7UnWSoM3
 hKtS0wRIMQV30nUu5EIHlUz0PDc733Q=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-bCJdjC7XMEGIhgSNv3yyaQ-1; Tue, 20 Jul 2021 21:21:45 -0400
X-MC-Unique: bCJdjC7XMEGIhgSNv3yyaQ-1
Received: by mail-qv1-f72.google.com with SMTP id
 cw12-20020ad44dcc0000b02902f1474ce8b7so342977qvb.20
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 18:21:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RunfLm70+JhZWuj0ksUad70prEh2b7muBQnrQ54Pkh0=;
 b=SzNlKEJLl8PT/Zlpef8P0zDHp4sdUz87zewigyF0mgLXiUM+rxDIihOImU24T4BRe8
 hkHL33bibn01MI8v2fcl7Gae3wwt9b5B3hXcVErq5YO9HuClAzx50nzjW4L6L5w6qNq+
 NVK60jABZl45n+JS+22XABm47kz/c8+fraRdBFRe4cEjrcY1bOFSemJTPq33Wsk3XANN
 vYa2lRaPBK5QgmviywmNBKQItubZdsbb6P01R5Uh8fJ/+RRLgYM7jL125UDh6fDTpGkA
 ENwz0J9WUl5jytPi1PnqXAQQaOk/R5EeEW9xjPVRxfeUmdhU5NZKD/F21Sjh/ltnIt/K
 cCZw==
X-Gm-Message-State: AOAM532DMUGQeg5t/oZHe19jWBzOcyRqAvFDk+MyT3V9N9YU4Z5SanG7
 yAqVl3HlaA6DOdY4Ur/66y8z6S07k5yQfDXrrX4djPmWtSMuqKdYykyD/hB+W4pd2E6KdYvlcIE
 yOBWaZoy/m25f+DJaKZIX1CAygYNSk3PiD6ir7OngWz1rzECN4Athgg7jDyPCbRGX
X-Received: by 2002:a0c:e849:: with SMTP id l9mr29909850qvo.41.1626830504353; 
 Tue, 20 Jul 2021 18:21:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyilzkPUB4IMN9gJqn3sVRZYY5Hq0XqnEuOl3hDX8I8Xw4xaF5EqD+tNbmvVsMMEsfbGxJfDg==
X-Received: by 2002:a0c:e849:: with SMTP id l9mr29909812qvo.41.1626830504092; 
 Tue, 20 Jul 2021 18:21:44 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id t26sm8399469qtc.44.2021.07.20.18.21.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 18:21:43 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/5] migration: Teach QEMUFile to be QIOChannel-aware
Date: Tue, 20 Jul 2021 21:21:33 -0400
Message-Id: <20210721012134.792845-5-peterx@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210721012134.792845-1-peterx@redhat.com>
References: <20210721012134.792845-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Lukas Straub <lukasstraub2@web.de>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

migration uses QIOChannel typed qemufiles.  In follow up patches, we'll need
the capability to identify this fact, so that we can get the backing QIOChannel
from a QEMUFile.

We can also define types for QEMUFile but so far since we only need to be able
to identify QIOChannel, introduce a boolean which is simpler.

No functional change.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/qemu-file-channel.c | 4 ++--
 migration/qemu-file.c         | 5 ++++-
 migration/qemu-file.h         | 2 +-
 migration/ram.c               | 2 +-
 migration/savevm.c            | 4 ++--
 5 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/migration/qemu-file-channel.c b/migration/qemu-file-channel.c
index 867a5ed0c3..2f8b1fcd46 100644
--- a/migration/qemu-file-channel.c
+++ b/migration/qemu-file-channel.c
@@ -187,11 +187,11 @@ static const QEMUFileOps channel_output_ops = {
 QEMUFile *qemu_fopen_channel_input(QIOChannel *ioc)
 {
     object_ref(OBJECT(ioc));
-    return qemu_fopen_ops(ioc, &channel_input_ops);
+    return qemu_fopen_ops(ioc, &channel_input_ops, true);
 }
 
 QEMUFile *qemu_fopen_channel_output(QIOChannel *ioc)
 {
     object_ref(OBJECT(ioc));
-    return qemu_fopen_ops(ioc, &channel_output_ops);
+    return qemu_fopen_ops(ioc, &channel_output_ops, true);
 }
diff --git a/migration/qemu-file.c b/migration/qemu-file.c
index 1eacf9e831..ada58c94dd 100644
--- a/migration/qemu-file.c
+++ b/migration/qemu-file.c
@@ -55,6 +55,8 @@ struct QEMUFile {
     Error *last_error_obj;
     /* has the file has been shutdown */
     bool shutdown;
+    /* Whether opaque points to a QIOChannel */
+    bool has_ioc;
 };
 
 /*
@@ -101,7 +103,7 @@ bool qemu_file_mode_is_not_valid(const char *mode)
     return false;
 }
 
-QEMUFile *qemu_fopen_ops(void *opaque, const QEMUFileOps *ops)
+QEMUFile *qemu_fopen_ops(void *opaque, const QEMUFileOps *ops, bool has_ioc)
 {
     QEMUFile *f;
 
@@ -109,6 +111,7 @@ QEMUFile *qemu_fopen_ops(void *opaque, const QEMUFileOps *ops)
 
     f->opaque = opaque;
     f->ops = ops;
+    f->has_ioc = has_ioc;
     return f;
 }
 
diff --git a/migration/qemu-file.h b/migration/qemu-file.h
index a9b6d6ccb7..80d0e79fd1 100644
--- a/migration/qemu-file.h
+++ b/migration/qemu-file.h
@@ -119,7 +119,7 @@ typedef struct QEMUFileHooks {
     QEMURamSaveFunc *save_page;
 } QEMUFileHooks;
 
-QEMUFile *qemu_fopen_ops(void *opaque, const QEMUFileOps *ops);
+QEMUFile *qemu_fopen_ops(void *opaque, const QEMUFileOps *ops, bool has_ioc);
 void qemu_file_set_hooks(QEMUFile *f, const QEMUFileHooks *hooks);
 int qemu_get_fd(QEMUFile *f);
 int qemu_fclose(QEMUFile *f);
diff --git a/migration/ram.c b/migration/ram.c
index b5fc454b2f..f2a86f9971 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -550,7 +550,7 @@ static int compress_threads_save_setup(void)
         /* comp_param[i].file is just used as a dummy buffer to save data,
          * set its ops to empty.
          */
-        comp_param[i].file = qemu_fopen_ops(NULL, &empty_ops);
+        comp_param[i].file = qemu_fopen_ops(NULL, &empty_ops, false);
         comp_param[i].done = true;
         comp_param[i].quit = false;
         qemu_mutex_init(&comp_param[i].mutex);
diff --git a/migration/savevm.c b/migration/savevm.c
index 72848b946c..96b5e5d639 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -168,9 +168,9 @@ static const QEMUFileOps bdrv_write_ops = {
 static QEMUFile *qemu_fopen_bdrv(BlockDriverState *bs, int is_writable)
 {
     if (is_writable) {
-        return qemu_fopen_ops(bs, &bdrv_write_ops);
+        return qemu_fopen_ops(bs, &bdrv_write_ops, false);
     }
-    return qemu_fopen_ops(bs, &bdrv_read_ops);
+    return qemu_fopen_ops(bs, &bdrv_read_ops, false);
 }
 
 
-- 
2.31.1


