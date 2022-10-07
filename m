Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A4A15F773E
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 13:15:21 +0200 (CEST)
Received: from localhost ([::1]:48628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oglK4-0001Rr-1U
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 07:15:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ogktl-0005Os-4v
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 06:48:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59193)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ogktj-00035G-KE
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 06:48:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665139687;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DYQmifpXabA4X2AnkNxjTfP5E8KXDHOPRVp/pQZDFrw=;
 b=E2YZBxuqnkERdzpaPk5xAu3iiVr2S08/x7+6OBKUWKKeoBbQd4e4/Zsfr+aTtg6qUUcvTZ
 R4UlmOUSfgueYVSJosMGemWJZ9xkQQledVEgOEf/QkoSgUWGJTm23nDeDlKPzKv3fjid29
 s6wUOPBSavjgfd5EvO+u/JFTAmnamh8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-590-pS0qCCEmPrCBeqPd68IfKA-1; Fri, 07 Oct 2022 06:48:05 -0400
X-MC-Unique: pS0qCCEmPrCBeqPd68IfKA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 96FEF101A528;
 Fri,  7 Oct 2022 10:48:05 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.192.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D4A322024CBB;
 Fri,  7 Oct 2022 10:48:04 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	stefanha@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 05/50] qcow2: remove incorrect coroutine_fn annotations
Date: Fri,  7 Oct 2022 12:47:07 +0200
Message-Id: <20221007104752.141361-6-kwolf@redhat.com>
In-Reply-To: <20221007104752.141361-1-kwolf@redhat.com>
References: <20221007104752.141361-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Paolo Bonzini <pbonzini@redhat.com>

This is incorrect because qcow2_mark_clean() calls qcow2_flush_caches().
qcow2_mark_clean() is called from non-coroutine context in
qcow2_inactivate() and qcow2_amend_options().

Reviewed-by: Alberto Faria <afaria@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20220922084924.201610-4-pbonzini@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/qcow2.h          | 4 ++--
 block/qcow2-refcount.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/block/qcow2.h b/block/qcow2.h
index ba436a8d0d..c8d9e8ea79 100644
--- a/block/qcow2.h
+++ b/block/qcow2.h
@@ -874,8 +874,8 @@ void qcow2_free_any_cluster(BlockDriverState *bs, uint64_t l2_entry,
 int qcow2_update_snapshot_refcount(BlockDriverState *bs,
     int64_t l1_table_offset, int l1_size, int addend);
 
-int coroutine_fn qcow2_flush_caches(BlockDriverState *bs);
-int coroutine_fn qcow2_write_caches(BlockDriverState *bs);
+int qcow2_flush_caches(BlockDriverState *bs);
+int qcow2_write_caches(BlockDriverState *bs);
 int qcow2_check_refcounts(BlockDriverState *bs, BdrvCheckResult *res,
                           BdrvCheckMode fix);
 
diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
index c4d99817b6..1a6277c783 100644
--- a/block/qcow2-refcount.c
+++ b/block/qcow2-refcount.c
@@ -1206,7 +1206,7 @@ void qcow2_free_any_cluster(BlockDriverState *bs, uint64_t l2_entry,
     }
 }
 
-int coroutine_fn qcow2_write_caches(BlockDriverState *bs)
+int qcow2_write_caches(BlockDriverState *bs)
 {
     BDRVQcow2State *s = bs->opaque;
     int ret;
@@ -1226,7 +1226,7 @@ int coroutine_fn qcow2_write_caches(BlockDriverState *bs)
     return 0;
 }
 
-int coroutine_fn qcow2_flush_caches(BlockDriverState *bs)
+int qcow2_flush_caches(BlockDriverState *bs)
 {
     int ret = qcow2_write_caches(bs);
     if (ret < 0) {
-- 
2.37.3


