Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA241649F42
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 14:00:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4iPS-000152-JX; Mon, 12 Dec 2022 07:59:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p4iPP-00011w-NY
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 07:59:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p4iPO-0000cr-7e
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 07:59:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670849989;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=llzwygXVBbniiEaNBjy/u1gez32vAXcC9dHquqw9tLk=;
 b=Teyb2irZCbY4Oe8LRwuxxi2FrpTfNTfJUApZF2TlEqKce5wL8BR03EtCBhQtOlYyrjaxzZ
 sq89uf8Y5nOoCf/bQLTrKc9IoSqUbrN5Tl0AbZDyC8SqfZUEYSWo3paT/xQJ8fsHO66qlG
 EnW/lBSTcata1Kf3Cg6fl+xgh/NrVEE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-531-LnUEca8GNja5Mu7oxb4iPg-1; Mon, 12 Dec 2022 07:59:48 -0500
X-MC-Unique: LnUEca8GNja5Mu7oxb4iPg-1
Received: by mail-wr1-f72.google.com with SMTP id
 h10-20020adfaa8a000000b0024208cf285eso2243219wrc.22
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 04:59:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=llzwygXVBbniiEaNBjy/u1gez32vAXcC9dHquqw9tLk=;
 b=EtJ7tFxEkJBX4JsnHFXI2dA5J48yTsDe7ySqjKDL6AwWSGreGrVSNZfI23GeTS8E4a
 LX9ewE6Kv+2+08jUULD1LoxCfibhUfxHesFGBBRRLORx2uHSicvKzRYn/YQYMriPw6r9
 Y7qQZXIw6OfXxxLVx4V4arT79xc7Gag0vHaE8h9i8ghAyJ6rCzPxexhecvsmtcX2L7xX
 MOSqb8uZfiA21IApXkOFDdJOmTWKfA7Vx1uhe8dCDr8nFVNwLNl95UIXkrv1W8Sqzn4+
 M+xYapkBR+yigr5fmyrLMe0JHICGq9gL/NkHaQLugHixuX0YSRrxSDVF26thIShrJ9Yk
 gM2w==
X-Gm-Message-State: ANoB5pnE4ZgfVA12XYOYjlQgNjvnK0JLeUjZ7O5TQp5fX5XjhRvGy2ev
 CYQ1T1VBNlUPhXbhyBBxd28++x1h5SCEjiAqspaJ5lMPCEtQZn6aGpkH9QPGfAkO+KnYEcBvLWk
 jWj0CXXdn6OUY9AQjp5WG3b143YvVxehY71TQGA3oeIb22umxXEJyYwDHyc2Fz+9+PPQ=
X-Received: by 2002:a5d:4c43:0:b0:242:290c:34e8 with SMTP id
 n3-20020a5d4c43000000b00242290c34e8mr10801409wrt.31.1670849986749; 
 Mon, 12 Dec 2022 04:59:46 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6jycmQObNB8QUmj/WIQMGf5ThfU60Z7zejjRpz6kM52n9tqWtAzxgUAWXCpfyElSYi+Kn6kg==
X-Received: by 2002:a5d:4c43:0:b0:242:290c:34e8 with SMTP id
 n3-20020a5d4c43000000b00242290c34e8mr10801392wrt.31.1670849986459; 
 Mon, 12 Dec 2022 04:59:46 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 bu4-20020a056000078400b00236576c8eddsm8892663wrb.12.2022.12.12.04.59.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Dec 2022 04:59:46 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org,
	eesposit@redhat.com,
	kwolf@redhat.com
Subject: [PATCH 08/15] nbd: a BlockExport always has a BlockBackend
Date: Mon, 12 Dec 2022 13:59:13 +0100
Message-Id: <20221212125920.248567-9-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221212125920.248567-1-pbonzini@redhat.com>
References: <20221212125920.248567-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

exp->common.blk cannot be NULL, nbd_export_delete() is only called from
blk_exp_unref() and in turn that can only happen after blk_exp_add()
has asserted exp->blk != NULL.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 nbd/server.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/nbd/server.c b/nbd/server.c
index c53c39560e50..462ddb0e4adb 100644
--- a/nbd/server.c
+++ b/nbd/server.c
@@ -1848,15 +1848,13 @@ static void nbd_export_delete(BlockExport *blk_exp)
     g_free(exp->description);
     exp->description = NULL;
 
-    if (exp->common.blk) {
-        if (exp->eject_notifier_blk) {
-            notifier_remove(&exp->eject_notifier);
-            blk_unref(exp->eject_notifier_blk);
-        }
-        blk_remove_aio_context_notifier(exp->common.blk, blk_aio_attached,
-                                        blk_aio_detach, exp);
-        blk_set_disable_request_queuing(exp->common.blk, false);
+    if (exp->eject_notifier_blk) {
+        notifier_remove(&exp->eject_notifier);
+        blk_unref(exp->eject_notifier_blk);
     }
+    blk_remove_aio_context_notifier(exp->common.blk, blk_aio_attached,
+                                    blk_aio_detach, exp);
+    blk_set_disable_request_queuing(exp->common.blk, false);
 
     for (i = 0; i < exp->nr_export_bitmaps; i++) {
         bdrv_dirty_bitmap_set_busy(exp->export_bitmaps[i], false);
-- 
2.38.1


