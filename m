Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E62B96D7966
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 12:17:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pk0C6-0004J8-O7; Wed, 05 Apr 2023 06:16:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pk0C3-0004IS-Nc
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 06:16:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pk0C0-0007uF-4w
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 06:16:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680689799;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=nKchBrH3t6cS29aVeDHW0UJXN5/NT+lEOacFRaqsjbQ=;
 b=KkItBsP7Mf3ZdfxG4kEoUIwaB9LGZkMK/VVu1wOdrarT1ksT0XAC1XiazwzwKKbDLQBEpb
 tdxe2iy2/PoHRD7feFkZJikbYi0uboySgw9Vzor7eH34Km0LS9oqQ3ksl8Z1XSml3ecknv
 wvPFiDr0DnydbgRw0JE6bFu2J+Gj4jk=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-138-wpIQBjq6OQ-w5QsXqKo30g-1; Wed, 05 Apr 2023 06:16:37 -0400
X-MC-Unique: wpIQBjq6OQ-w5QsXqKo30g-1
Received: by mail-ed1-f69.google.com with SMTP id
 t26-20020a50d71a000000b005003c5087caso49011423edi.1
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 03:16:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680689796; x=1683281796;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nKchBrH3t6cS29aVeDHW0UJXN5/NT+lEOacFRaqsjbQ=;
 b=2bSq5D4r7VXv1upphammNQZEvo8hv1jbfReQF+yQsZ+lLTrfJOtf1l+h/Fr5einVR9
 dt+kfrwgUO4yZtOyHGdlTS9pUaFUgj+f7iKe2ojvI8nsveSiNwVjGWyUUtjpExH4hakq
 ZZbiV5t7g4s6gLiqMIK1lwcesEH5yKj2moWwgepAOD8h66wd4PrEgG4FpD8qAYUnO90T
 2IxB5RUZuby7rKmuy3OZkFoHb+IyDNJBwayPSu3YLSg9EfZWMwk06NzVEL0EW+t9exGV
 NmUrh264A4C5hfYWkUstEVwsNZ7EC+cPS9fY2cRLNaIkdZsFLymnqFi56aCIRnWpzIAS
 rQ1Q==
X-Gm-Message-State: AAQBX9cEPYC5B0WWNuipCAzTuSjc2Fmewu6Se30rm6zQWokjMXIiU3WC
 8klCTh4Z2Y06SCYtCxaDGyh/VgVQqSKi5781ChDU8xQpCSEhHAZv2ozxNvUFDJx7qkVIFSPzELU
 6ltEQPPsQR9RdDzy/R4U+VYKsFUuf4AM/p6mLQrCwK+P0bl3kc3lodlJi6jGe8+lZ56BoppNBkX
 M=
X-Received: by 2002:a17:907:6c17:b0:931:6f5b:d284 with SMTP id
 rl23-20020a1709076c1700b009316f5bd284mr2359323ejc.57.1680689796015; 
 Wed, 05 Apr 2023 03:16:36 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZlBJYWoZO9EJ79M451Los5cpxL9Ouc+osKEMG7nbLgyXGQivP52om6tPEuvw9Hl06gxBHlDA==
X-Received: by 2002:a17:907:6c17:b0:931:6f5b:d284 with SMTP id
 rl23-20020a1709076c1700b009316f5bd284mr2359314ejc.57.1680689795658; 
 Wed, 05 Apr 2023 03:16:35 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 b15-20020a17090636cf00b009332bb8b1f7sm7187137ejc.66.2023.04.05.03.16.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 03:16:35 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org,
	eblake@redhat.com
Subject: [PATCH] nbd: a BlockExport always has a BlockBackend
Date: Wed,  5 Apr 2023 12:16:34 +0200
Message-Id: <20230405101634.10537-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
index 4305d4f0edf3..cb41b56095ee 100644
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
2.39.2


