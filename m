Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B65560C2C7
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 06:51:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onBsS-0005gY-MK; Tue, 25 Oct 2022 00:49:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1onBsP-0005g6-NI
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 00:49:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1onBsN-0002tg-4p
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 00:49:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666673358;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=voAYcUr5pMqpaT7c3wMSt6rgcPe6U+ek+ImZMgGYY2E=;
 b=WoaVnlDopyR0FQP90VnytFo7u2c55+NKPJKn/cJteUyp/2K3/t9ZH35P3DnheqGpfEXYCK
 xz6e8TSBCapk7urKvjiseZ8ar3uPQx09Xjbu1Ju+JkPFFmJFvF1vYYCzbOWBslorBiUYEF
 2QP0Kwbatwt7u1AWLCAWOfRc6SPfEXs=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-94-vsjwTvffOEeVJzC_qQotCQ-1; Tue, 25 Oct 2022 00:47:52 -0400
X-MC-Unique: vsjwTvffOEeVJzC_qQotCQ-1
Received: by mail-qv1-f69.google.com with SMTP id
 jn13-20020ad45ded000000b004b1d055fbc7so6361649qvb.2
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 21:47:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=voAYcUr5pMqpaT7c3wMSt6rgcPe6U+ek+ImZMgGYY2E=;
 b=364A56aLZuDZi4oBCp4/nFDfJIoDgkIgUdBNjb2vvIFiwli4oQ6eM894REPK29yxZj
 p7G3x+Dip7fe6uhaNpIjTDsgKat69VRubxW/8C3wp6w7xGCz+qR1hWsDzKakqcmlE/b4
 3K9++qc4qREs3E5vbaa8B4i2gr5HQF2ekTb5evXDDm97OK8cFKdSw1npvqCJJSXTamVj
 t32vBCQSoZvHBuzGII4FsW859mGmERNoka7Bynjok7ZNx7cnEeCeCbLhKBiVQgU9iO21
 FUE6OaxSzf5Qaccdt+lYkkR4XQFhGPiArnZZOYZahuWqpFfTnld4jBx4qwNs8UBEFg82
 21Nw==
X-Gm-Message-State: ACrzQf1qRr/8s5hVluNQPhS5ucLO1pP4HxecTNVqZtu5B7wO27LXy9UA
 fFFu8XVrTKeijO6JyWWm6XFyMM7wk/vkLrl6YqhId9Xu7N2L9YSAATKYH0GCKm7eAhGCHjZytEG
 k+2UZfJjZ56jdg5M=
X-Received: by 2002:a0c:b295:0:b0:4ba:b9b4:5159 with SMTP id
 r21-20020a0cb295000000b004bab9b45159mr17596102qve.19.1666673271556; 
 Mon, 24 Oct 2022 21:47:51 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6ek3+fDYVl7qUMeg3dhrr83RDNn0rO/xQjI4hpj3KSP4JujHVsqMdB1YbU1p9+NIAV5Awoyg==
X-Received: by 2002:a0c:b295:0:b0:4ba:b9b4:5159 with SMTP id
 r21-20020a0cb295000000b004bab9b45159mr17596096qve.19.1666673271393; 
 Mon, 24 Oct 2022 21:47:51 -0700 (PDT)
Received: from LeoBras.redhat.com ([2804:1b3:a801:de5e:6447:4a67:eb7c:b690])
 by smtp.gmail.com with ESMTPSA id
 d23-20020a05620a141700b006cbcdc6efedsm1350968qkj.41.2022.10.24.21.47.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 21:47:51 -0700 (PDT)
From: Leonardo Bras <leobras@redhat.com>
To: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Xu <peterx@redhat.com>
Cc: Leonardo Bras <leobras@redhat.com>,
	qemu-devel@nongnu.org
Subject: [RFC PATCH 1/4] migration/multifd/zero-copy: Create helper function
 for flushing
Date: Tue, 25 Oct 2022 01:47:28 -0300
Message-Id: <20221025044730.319941-2-leobras@redhat.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221025044730.319941-1-leobras@redhat.com>
References: <20221025044730.319941-1-leobras@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=leobras@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.503,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Move flushing code from multifd_send_sync_main() to a new helper, and call
it in multifd_send_sync_main().

Signed-off-by: Leonardo Bras <leobras@redhat.com>
---
 migration/multifd.c | 30 +++++++++++++++++++-----------
 1 file changed, 19 insertions(+), 11 deletions(-)

diff --git a/migration/multifd.c b/migration/multifd.c
index 586ddc9d65..509bbbe3bf 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -566,6 +566,23 @@ void multifd_save_cleanup(void)
     multifd_send_state = NULL;
 }
 
+static int multifd_zero_copy_flush(QIOChannel *c)
+{
+    int ret;
+    Error *err = NULL;
+
+    ret = qio_channel_flush(c, &err);
+    if (ret < 0) {
+        error_report_err(err);
+        return -1;
+    }
+    if (ret == 1) {
+        dirty_sync_missed_zero_copy();
+    }
+
+    return ret;
+}
+
 int multifd_send_sync_main(QEMUFile *f)
 {
     int i;
@@ -616,17 +633,8 @@ int multifd_send_sync_main(QEMUFile *f)
         qemu_mutex_unlock(&p->mutex);
         qemu_sem_post(&p->sem);
 
-        if (flush_zero_copy && p->c) {
-            int ret;
-            Error *err = NULL;
-
-            ret = qio_channel_flush(p->c, &err);
-            if (ret < 0) {
-                error_report_err(err);
-                return -1;
-            } else if (ret == 1) {
-                dirty_sync_missed_zero_copy();
-            }
+        if (flush_zero_copy && p->c && (multifd_zero_copy_flush(p->c) < 0)) {
+            return -1;
         }
     }
     for (i = 0; i < migrate_multifd_channels(); i++) {
-- 
2.38.0


