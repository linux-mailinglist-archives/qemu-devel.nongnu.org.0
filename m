Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 503366F6A94
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 13:59:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puXbS-0003EE-5U; Thu, 04 May 2023 07:58:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1puXb5-00035b-TP
 for qemu-devel@nongnu.org; Thu, 04 May 2023 07:58:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1puXb4-0004BC-Cs
 for qemu-devel@nongnu.org; Thu, 04 May 2023 07:58:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683201485;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dZ+h7ase581NGdpvJuAaYn+E0GOZEbMPKQhKKqG4uQ0=;
 b=KL0zGv3WrXpgDabU9FdTu5dvsesrhjtCDIstljVBWub4VDAxyoTYkcTZp9STsLOrKW8rCo
 Z17MnxjrxowJNW3AeYB4hATdkYRezPI392K9cfs3BCda+JylGB7bwJ8eUfFJyk+bXNHNmh
 8Sc4cPCGr11TdDX1+4zbfbXI0ELsShE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-606-AATEeXqcOT20ST50ZR0vOw-1; Thu, 04 May 2023 07:58:04 -0400
X-MC-Unique: AATEeXqcOT20ST50ZR0vOw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F2C311C07594;
 Thu,  4 May 2023 11:58:03 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.194.84])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E0999C15BAD;
 Thu,  4 May 2023 11:58:02 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com, stefanha@redhat.com, eblake@redhat.com,
 eesposit@redhat.com, pbonzini@redhat.com, qemu-devel@nongnu.org
Subject: [PATCH v2 04/20] block: Don't call no_coroutine_fns in
 qmp_block_resize()
Date: Thu,  4 May 2023 13:57:34 +0200
Message-Id: <20230504115750.54437-5-kwolf@redhat.com>
In-Reply-To: <20230504115750.54437-1-kwolf@redhat.com>
References: <20230504115750.54437-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
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

This QMP handler runs in a coroutine, so it must use the corresponding
no_co_wrappers instead.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 blockdev.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/blockdev.c b/blockdev.c
index 2c1752a403..e464daea58 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -2440,7 +2440,7 @@ void coroutine_fn qmp_block_resize(const char *device, const char *node_name,
         return;
     }
 
-    blk = blk_new_with_bs(bs, BLK_PERM_RESIZE, BLK_PERM_ALL, errp);
+    blk = blk_co_new_with_bs(bs, BLK_PERM_RESIZE, BLK_PERM_ALL, errp);
     if (!blk) {
         return;
     }
@@ -2455,7 +2455,7 @@ void coroutine_fn qmp_block_resize(const char *device, const char *node_name,
 
     bdrv_co_lock(bs);
     bdrv_drained_end(bs);
-    blk_unref(blk);
+    blk_co_unref(blk);
     bdrv_co_unlock(bs);
 }
 
-- 
2.40.1


