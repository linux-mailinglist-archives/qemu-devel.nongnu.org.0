Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC8E693C7B
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 03:52:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pROwk-00028Z-Kp; Sun, 12 Feb 2023 21:52:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pROwi-00028J-DB
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 21:52:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pROwg-0006sG-Uf
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 21:52:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676256718;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JInKtzC6RF655Lncv3TKfNncp1aYsh6hnMBdswU/+NM=;
 b=IyYmJn2w8II9UyxgEKtW9e5ivHhJChMDh0oGLL+WgNdfOWaCAbVS90FXkHFG/Q4vloqsx2
 BoCmoCKh3NepRJADUf+LYoqKpdVLiqFZPgMQvAwvwLLutXuvz1HgeIVPHnHNcqrdvnjpqx
 TrgX1JppzwE7XkM9lUuTTG1GrpWlRsA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-393-2S6tOjLqM7KJkgRZvgKsNQ-1; Sun, 12 Feb 2023 21:51:56 -0500
X-MC-Unique: 2S6tOjLqM7KJkgRZvgKsNQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 k9-20020a05600c1c8900b003dc5dec2ac6so8391811wms.4
 for <qemu-devel@nongnu.org>; Sun, 12 Feb 2023 18:51:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JInKtzC6RF655Lncv3TKfNncp1aYsh6hnMBdswU/+NM=;
 b=zYVm4j2Y7bPX2gdLkxysUdu8jbB7AmmVKlVcIyesosa9fz86RtAolsY/0HYNqGKJqq
 1/xMw2V/hli6yseFYhswNuz2H+T0KRFwCDPni96IAe5AsyHTx5wRg9C93N6PgIikJwex
 s6/OQJuE6xo4+gLwgqKYfKOxemMLxNlPsz/Me+Dc6vkBVsIiw60dMCWhZneQvCPAwyFi
 NbMM+imSkmE5/rY2xLwpIP/sxLydabLOS1zmLU4JY0Ou+zyucDc20lldcxqpDfjlJ9ol
 pWfnkKcltn+PZgG+p9G2+MxTRbYumHSMKxbwxIzeKhuPkXlHTdFJyhF3J7EI4LfWsdz5
 CoTQ==
X-Gm-Message-State: AO0yUKWZlPkcoSAPAKmFwULbGkqdXzqoLaye4glRibsVhqD7vWSIT4gT
 5qtnRSTAgEbR3N6Md9U183cHdR/5CEl+VYvf433YFPwoUpI6LPBg8RqldF0LKvZ3fkm0htmOGR5
 X9p1OEwKxCYlwqJcyRDk+PaqwEz16xT+ll/ld+RAT5l4txQ4BxLRp5wkQIzXTy3x12LKERyAy
X-Received: by 2002:adf:e60c:0:b0:2c3:eaff:aaef with SMTP id
 p12-20020adfe60c000000b002c3eaffaaefmr19755198wrm.18.1676256715537; 
 Sun, 12 Feb 2023 18:51:55 -0800 (PST)
X-Google-Smtp-Source: AK7set+vbmy11F2J9n6YDP85+T3aaDiW+U7B0hYtIgECTAckwoUqEZISnP7TIWsV5ayWcY9imD7VdQ==
X-Received: by 2002:adf:e60c:0:b0:2c3:eaff:aaef with SMTP id
 p12-20020adfe60c000000b002c3eaffaaefmr19755184wrm.18.1676256715321; 
 Sun, 12 Feb 2023 18:51:55 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 e1-20020adfe381000000b002c54f39d34csm4746148wrm.111.2023.02.12.18.51.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Feb 2023 18:51:54 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Li Zhang <lizhang@suse.de>
Subject: [PULL 02/22] multifd: cleanup the function multifd_channel_connect
Date: Mon, 13 Feb 2023 03:51:30 +0100
Message-Id: <20230213025150.71537-3-quintela@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230213025150.71537-1-quintela@redhat.com>
References: <20230213025150.71537-1-quintela@redhat.com>
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


