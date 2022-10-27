Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC89610198
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 21:27:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo7j2-0007mM-Is; Thu, 27 Oct 2022 14:35:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oo7h7-0002Fj-LR
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:33:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oo7gh-0002ed-Nc
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:33:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666895587;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E6YL0HqL+IzGygsLGBD/LVjzRMmZEVoLPynCRNDGrfE=;
 b=MLsVy/D9x9/m7vl5es/ox6SrjgglDVe7dxxUVPQ8QhSQugRCPlzqaIA2C54zVZD9Clomvq
 Uzhr29Oz7jsgKnqO5a2g+QEgfwcNlFSDcKYWMaXfs8vQx5Gp4cEJg98F9jWuegDxgqtBzM
 1H4/f6Y+ommXj3cRyRfzZWT3Ep7+hYk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-34-KNYN65GdO4axGg4Q6uwlkA-1; Thu, 27 Oct 2022 14:33:05 -0400
X-MC-Unique: KNYN65GdO4axGg4Q6uwlkA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2F9773C0F674;
 Thu, 27 Oct 2022 18:33:05 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6FF7A1121320;
 Thu, 27 Oct 2022 18:33:04 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	stefanha@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 55/58] vhdx: switch to *_co_* functions
Date: Thu, 27 Oct 2022 20:31:43 +0200
Message-Id: <20221027183146.463129-56-kwolf@redhat.com>
In-Reply-To: <20221027183146.463129-1-kwolf@redhat.com>
References: <20221027183146.463129-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
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

From: Alberto Faria <afaria@redhat.com>

Signed-off-by: Alberto Faria <afaria@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20221013123711.620631-23-pbonzini@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/vhdx.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/block/vhdx.c b/block/vhdx.c
index ce1e75f5ec..a41db46294 100644
--- a/block/vhdx.c
+++ b/block/vhdx.c
@@ -2011,15 +2011,15 @@ static int coroutine_fn vhdx_co_create(BlockdevCreateOptions *opts,
     creator = g_utf8_to_utf16("QEMU v" QEMU_VERSION, -1, NULL,
                               &creator_items, NULL);
     signature = cpu_to_le64(VHDX_FILE_SIGNATURE);
-    ret = blk_pwrite(blk, VHDX_FILE_ID_OFFSET, sizeof(signature), &signature,
-                     0);
+    ret = blk_co_pwrite(blk, VHDX_FILE_ID_OFFSET, sizeof(signature), &signature,
+                        0);
     if (ret < 0) {
         error_setg_errno(errp, -ret, "Failed to write file signature");
         goto delete_and_exit;
     }
     if (creator) {
-        ret = blk_pwrite(blk, VHDX_FILE_ID_OFFSET + sizeof(signature),
-                         creator_items * sizeof(gunichar2), creator, 0);
+        ret = blk_co_pwrite(blk, VHDX_FILE_ID_OFFSET + sizeof(signature),
+                            creator_items * sizeof(gunichar2), creator, 0);
         if (ret < 0) {
             error_setg_errno(errp, -ret, "Failed to write creator field");
             goto delete_and_exit;
-- 
2.37.3


