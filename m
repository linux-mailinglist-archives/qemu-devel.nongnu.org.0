Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3807B693C3B
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 03:30:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pROao-0001UE-N2; Sun, 12 Feb 2023 21:29:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pROam-0001TU-TX
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 21:29:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pROal-00032G-GE
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 21:29:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676255358;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JInKtzC6RF655Lncv3TKfNncp1aYsh6hnMBdswU/+NM=;
 b=jV5nXhFlb4rvHKZ5LkrnX3zo7rI8kFuHv/D2g8zHZc5vCe7DQbZI9ohQDQLhQLlnlutksV
 aR+SJBGK3I7HX9aoszySPEyBkq4YcJe0jBlv9kXm3lg25JnvhE1kx8Fjz2OJMF4PWfg3jb
 LKtzpp1foW1381O/EPAml0Ton5mfvZg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-119-AYznwXpSOr65IHnYObNK8g-1; Sun, 12 Feb 2023 21:29:17 -0500
X-MC-Unique: AYznwXpSOr65IHnYObNK8g-1
Received: by mail-wm1-f69.google.com with SMTP id
 b19-20020a05600c4e1300b003e10d3e1c23so8016844wmq.1
 for <qemu-devel@nongnu.org>; Sun, 12 Feb 2023 18:29:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JInKtzC6RF655Lncv3TKfNncp1aYsh6hnMBdswU/+NM=;
 b=slo70bOeOyJOGiQqEEZFPpFQ8ycJ+PcUoFuExcETsPujl5hcrEdV5AbuvBge0YO9Bl
 0hXO01O7SYl2VtIJr3ejDF6MCuc2p/4MapEhwrTvxB8azDZFbhieurDUUQg6izYHzoUv
 qQDyBTRYntgdP61P89FX0U5ZPfPWxs+ATTCljyMQqZ6O+nh5D78Fd3KpdgtaD0iuW2if
 Lfh0y2Le4othgaNFrYhFSSO4RC4k8u6i6MQwxs7szTeKTufPmgFhM3ceFq+iS9IMrhfv
 G8Ub+NzoibQAY7725crd/UTS6Jwxh6Xhj9q6n4NPmvsWfZ6e1+wVZCUr7e+TFXmrXRci
 OCPA==
X-Gm-Message-State: AO0yUKXTLDbsGDmS0G1BQDFaHc6exMlj8iQFO2xppaZweYY6zsmMhfzg
 hGCvL7zSWG183OW8UkXj7HgiGzltnVFnzMJtpdtPp1e8YUm4ePITx2jLOC4HRZIKtB+3UmUJVrN
 7ehCQBEFLTzmw07PZec757A8bLR6wBZ1mqwp15OycgGuUj59lGjwadiriGsR3Bo1kA7JWRej1
X-Received: by 2002:a05:600c:43c7:b0:3dc:5d34:dbe5 with SMTP id
 f7-20020a05600c43c700b003dc5d34dbe5mr17913186wmn.28.1676255356009; 
 Sun, 12 Feb 2023 18:29:16 -0800 (PST)
X-Google-Smtp-Source: AK7set/rjwBb1Vl5Kn13Q3fwIW6CDKguDIQoZ6LxM9T832naRAaIwrS7qzrpAyVC0aeKaOSZ6J7vtw==
X-Received: by 2002:a05:600c:43c7:b0:3dc:5d34:dbe5 with SMTP id
 f7-20020a05600c43c700b003dc5d34dbe5mr17913169wmn.28.1676255355752; 
 Sun, 12 Feb 2023 18:29:15 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 h8-20020a05600c314800b003e11ad0750csm11591970wmo.47.2023.02.12.18.29.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Feb 2023 18:29:15 -0800 (PST)
From: Xxx Xx <quintela@redhat.com>
X-Google-Original-From: Xxx Xx <xxx.xx@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Li Zhang <lizhang@suse.de>
Subject: [PULL 02/22] multifd: cleanup the function multifd_channel_connect
Date: Mon, 13 Feb 2023 03:28:51 +0100
Message-Id: <20230213022911.68490-3-xxx.xx@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230213022911.68490-1-xxx.xx@gmail.com>
References: <20230213022911.68490-1-xxx.xx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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

From: Li Zhang <lizhang@suse.de>

Cleanup multifd_channel_connect

Signed-off-by: Li Zhang <lizhang@suse.de>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/multifd.c | 43 +++++++++++++++++++++----------------------
 1 file changed, 21 insertions(+), 22 deletions(-)

diff --git a/migration/multifd.c b/migration/multifd.c
index b7ad7002e0..c8132ab7e8 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -843,30 +843,29 @@ static bool multifd_channel_connect(MultiFDSendParams *p,
         ioc, object_get_typename(OBJECT(ioc)),
         migrate_get_current()->hostname, error);
 
-    if (!error) {
-        if (migrate_channel_requires_tls_upgrade(ioc)) {
-            multifd_tls_channel_connect(p, ioc, &error);
-            if (!error) {
-                /*
-                 * tls_channel_connect will call back to this
-                 * function after the TLS handshake,
-                 * so we mustn't call multifd_send_thread until then
-                 */
-                return true;
-            } else {
-                return false;
-            }
+    if (error) {
+        return false;
+    }
+    if (migrate_channel_requires_tls_upgrade(ioc)) {
+        multifd_tls_channel_connect(p, ioc, &error);
+        if (!error) {
+            /*
+             * tls_channel_connect will call back to this
+             * function after the TLS handshake,
+             * so we mustn't call multifd_send_thread until then
+             */
+            return true;
         } else {
-            migration_ioc_register_yank(ioc);
-            p->registered_yank = true;
-            p->c = ioc;
-            qemu_thread_create(&p->thread, p->name, multifd_send_thread, p,
-                                   QEMU_THREAD_JOINABLE);
-       }
-       return true;
+            return false;
+        }
+    } else {
+        migration_ioc_register_yank(ioc);
+        p->registered_yank = true;
+        p->c = ioc;
+        qemu_thread_create(&p->thread, p->name, multifd_send_thread, p,
+                           QEMU_THREAD_JOINABLE);
     }
-
-    return false;
+    return true;
 }
 
 static void multifd_new_send_channel_cleanup(MultiFDSendParams *p,
-- 
2.39.1


