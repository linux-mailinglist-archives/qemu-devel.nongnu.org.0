Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE62693CA2
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 03:54:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pROwn-00029y-Ib; Sun, 12 Feb 2023 21:52:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pROwk-00028h-JC
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 21:52:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pROwj-0006sg-2P
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 21:52:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676256720;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fijRSvjFkArAa0ryGscnf/miuX0tMpTEdiQbyj+yK9k=;
 b=aYmS1CPsBJCD9UTn1QGyB6ZaArgjNkYAjO4HyK9ZGyZ5KeQE/y2v35ide/20l1U+QHCfzK
 6Z2usl8k38QV/JuMahw7/Ht81zacPFa1ZL5Ix1dvlw45/yTfLV4GzRMmxH0an917Ng43q6
 Bp/B0stp+/OXo/xnTqFwvflUQ+ll59w=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-453-2JH8DBNWMb-oJWpMYkeZtA-1; Sun, 12 Feb 2023 21:51:58 -0500
X-MC-Unique: 2JH8DBNWMb-oJWpMYkeZtA-1
Received: by mail-wm1-f72.google.com with SMTP id
 s11-20020a05600c384b00b003dffc7343c3so5451177wmr.0
 for <qemu-devel@nongnu.org>; Sun, 12 Feb 2023 18:51:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fijRSvjFkArAa0ryGscnf/miuX0tMpTEdiQbyj+yK9k=;
 b=IoeNULicO6OMP+8OW5RqCjd77X+fvRu6sJ+EgLtQXHkQNhucNr/EHswl86pBfVpswb
 BmkNpggr1XJcVTL0WWeaPEHWkfEdekPt4Jb/WP2meXguomXt75TykRoCyPwaYliG8RgI
 E/mhzrOnwgToc8mOPNAcXx35eV22u9rX4yKuqptoOXR1KA3oiw5rx1SzKdQcZeFrzusp
 UaxxZxk8mNCKyMWEz4uB7RJqYS57GLTcRf+lznwpGd5GVEUECCbYHturXM28+NmnwhH7
 bSMuZoJRQdgdtG75a38mgpTbVCMrIAICPCv1oWyQnOaCFpVGjIRnBM2ZxAJJSdZxHsky
 bMjg==
X-Gm-Message-State: AO0yUKUXX83nLLD3+pQ5qxawJ/m6lJRzQuW/rWLnpYMiDVbJtHsyLSal
 7DkVEzRcRx96agx+kmTczVYq/KvZY2T0Au+iPSnntYVlCPLWv3v3bwD1W/nu9xP5bqzVvMVGQJI
 8Mw/0KEunbCmuamu57ofGIvFk9Tb3TSj413ZRMlPh2tLnbdDAetr15gaO0sd9sJsQLM6pEUBx
X-Received: by 2002:a5d:4385:0:b0:2c5:4e12:3849 with SMTP id
 i5-20020a5d4385000000b002c54e123849mr4293395wrq.61.1676256717211; 
 Sun, 12 Feb 2023 18:51:57 -0800 (PST)
X-Google-Smtp-Source: AK7set+/my6h3mPqrmWiAHdxsUOCoxyNa7Ib5UwDQpLIRYv0xscLvxfhNCM0IH4W6XpkL2zna4Xtdw==
X-Received: by 2002:a5d:4385:0:b0:2c5:4e12:3849 with SMTP id
 i5-20020a5d4385000000b002c54e123849mr4293380wrq.61.1676256716977; 
 Sun, 12 Feb 2023 18:51:56 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 a28-20020a5d457c000000b002bdda9856b5sm9466395wrc.50.2023.02.12.18.51.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Feb 2023 18:51:56 -0800 (PST)
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
Subject: [PULL 03/22] multifd: Remove some redundant code
Date: Mon, 13 Feb 2023 03:51:31 +0100
Message-Id: <20230213025150.71537-4-quintela@redhat.com>
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

Clean up some unnecessary code

Signed-off-by: Li Zhang <lizhang@suse.de>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/multifd.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/migration/multifd.c b/migration/multifd.c
index c8132ab7e8..7aa030fb19 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -892,19 +892,15 @@ static void multifd_new_send_channel_async(QIOTask *task, gpointer opaque)
     Error *local_err = NULL;
 
     trace_multifd_new_send_channel_async(p->id);
-    if (qio_task_propagate_error(task, &local_err)) {
-        goto cleanup;
-    } else {
+    if (!qio_task_propagate_error(task, &local_err)) {
         p->c = QIO_CHANNEL(sioc);
         qio_channel_set_delay(p->c, false);
         p->running = true;
-        if (!multifd_channel_connect(p, sioc, local_err)) {
-            goto cleanup;
+        if (multifd_channel_connect(p, sioc, local_err)) {
+            return;
         }
-        return;
     }
 
-cleanup:
     multifd_new_send_channel_cleanup(p, sioc, local_err);
 }
 
@@ -1115,10 +1111,7 @@ static void *multifd_recv_thread(void *opaque)
 
         ret = qio_channel_read_all_eof(p->c, (void *)p->packet,
                                        p->packet_len, &local_err);
-        if (ret == 0) {   /* EOF */
-            break;
-        }
-        if (ret == -1) {   /* Error */
+        if (ret == 0 || ret == -1) {   /* 0: EOF  -1: Error */
             break;
         }
 
-- 
2.39.1


