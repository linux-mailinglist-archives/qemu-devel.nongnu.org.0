Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E9D6EA71B
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 11:36:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppn9S-0008WT-6G; Fri, 21 Apr 2023 05:33:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ppn9P-0008UW-Md
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 05:33:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ppn9N-00035B-EI
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 05:33:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682069630;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=okad+PcFVQMByyo2KeLFQxi04FPrrcM5w65u5q8ERwU=;
 b=N7EqmnxOOF8q54cQWTjQpCLrBz0vAw7GQJXCrWGLe4jzeM0vLtRSm2OhSL04czYw0Uqb2m
 Wn1mI8Nz7G7QGEZ5bBIsMjn0fw8jiXRaJRjR7rxbzqrjQDy29YIsybMQPzeTgLm1iXvTRS
 GpMLxGYFcKgYi4bTe1WlYVQx4niq8bY=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-643-3c76D2ArPrKW-uN5X6moMg-1; Fri, 21 Apr 2023 05:33:48 -0400
X-MC-Unique: 3c76D2ArPrKW-uN5X6moMg-1
Received: by mail-ed1-f70.google.com with SMTP id
 4fb4d7f45d1cf-506a455ee4cso1360640a12.3
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 02:33:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682069627; x=1684661627;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=okad+PcFVQMByyo2KeLFQxi04FPrrcM5w65u5q8ERwU=;
 b=l+3CynzxvGVscIWz0HaAnRTAQtORNIBNzk0u2oLbZ/iypsi9D/lzlizBMpWNQJiXHd
 OMvNcDBTemAwKzQ+KF8X2vWBAV7irsv5mo+aeLGwidTpiIyfnhpwKxfWJMLk13BgZxRf
 kAJwutsczT3D4uDCfKwtAtKzEW11jqEAnYKeZ7lZFsSUwGpai27cXay8v5Ikepb3Mxpz
 8MiB2m7rD201ttKrtOYFY93R7MnCqfd38ivp2/3wbhXGer1ZsGJP/mkkd7jcyzwIfu0E
 GHOAUNKXgsezySCw59hNk0O7hApxDgvmfvD6NNLGnXd8zh8GfM2XMVpKRJmGww5agarb
 m2LQ==
X-Gm-Message-State: AAQBX9eWCyH07AlmsRtP3FQTa4SUx1LpX5prnabyYjjnSK7y7+BpB8NR
 zxMKqETvq/MQjYweYh3s41o3wh4dDQAnhUI9Mw3ZIZuoILfNlnSe4zIhvQB8U0ULcb9X0Nvcb7U
 KrgNtyWkXhRT9Emk8PZtbrG9X5a8UOqUcYqBd16IIv7C/XBcapAwHBlcK+CsxUXOGkc7d1hUEuS
 aZRQ==
X-Received: by 2002:a17:907:1003:b0:94f:49a2:619a with SMTP id
 ox3-20020a170907100300b0094f49a2619amr1705963ejb.11.1682069627241; 
 Fri, 21 Apr 2023 02:33:47 -0700 (PDT)
X-Google-Smtp-Source: AKy350Z0+ZSQQubXyXi7UGvvd0FDTZC94HOULxEPikGy5XeY1+tnnz2HKJnbQaUw8OWAZT5avzKskg==
X-Received: by 2002:a17:907:1003:b0:94f:49a2:619a with SMTP id
 ox3-20020a170907100300b0094f49a2619amr1705949ejb.11.1682069626891; 
 Fri, 21 Apr 2023 02:33:46 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 w2-20020a1709067c8200b0094f2d38896esm1834463ejo.65.2023.04.21.02.33.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Apr 2023 02:33:46 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>
Subject: [PULL 21/25] nbd: a BlockExport always has a BlockBackend
Date: Fri, 21 Apr 2023 11:33:12 +0200
Message-Id: <20230421093316.17941-22-pbonzini@redhat.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230421093316.17941-1-pbonzini@redhat.com>
References: <20230421093316.17941-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

exp->common.blk cannot be NULL, nbd_export_delete() is only called (through
a bottom half) from blk_exp_unref() and in turn that can only happen
after blk_exp_add() has asserted exp->blk != NULL.

Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 nbd/server.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/nbd/server.c b/nbd/server.c
index 3d8d0d81df22..4f5c42f84d9e 100644
--- a/nbd/server.c
+++ b/nbd/server.c
@@ -1847,15 +1847,13 @@ static void nbd_export_delete(BlockExport *blk_exp)
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
2.40.0


