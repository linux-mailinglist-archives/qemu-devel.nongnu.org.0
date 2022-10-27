Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DBE06100A3
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 20:50:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo7id-0006gh-Rk; Thu, 27 Oct 2022 14:35:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oo7gb-0001xf-Uf
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:33:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oo7gZ-0002bS-LN
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:33:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666895579;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sWKdHCxKdNE2FQHVLpNbmUCqft1tLHbY885kKkGJQKA=;
 b=WO8fJl9v2Fh8sKFmnWx2Ms8k5T/Y8bjAW4PfDdaQ4dq8+d/f1jAI9LtmFfI90NRJ2rltYl
 VmTs52VGuJH5a6zTgsJveo6pCbP5bUJFsaVgTTVi8efBsmVwMvapY4QJWka+xptACsejSc
 iUQJXHn++JKt0gFrEJIaopX8+m7i+XY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-399-SMPyWlWIOLuoTewuKu2TSA-1; Thu, 27 Oct 2022 14:32:55 -0400
X-MC-Unique: SMPyWlWIOLuoTewuKu2TSA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6F4903C0F66F;
 Thu, 27 Oct 2022 18:32:54 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AF6BB1121320;
 Thu, 27 Oct 2022 18:32:53 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	stefanha@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 44/58] qcow: manually add more coroutine_fn annotations
Date: Thu, 27 Oct 2022 20:31:32 +0200
Message-Id: <20221027183146.463129-45-kwolf@redhat.com>
In-Reply-To: <20221027183146.463129-1-kwolf@redhat.com>
References: <20221027183146.463129-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Paolo Bonzini <pbonzini@redhat.com>

get_cluster_offset() and decompress_cluster() are only called from
the read and write paths.

The validity of these was double-checked with Alberto Faria's static analyzer.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20221013123711.620631-12-pbonzini@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/qcow.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/block/qcow.c b/block/qcow.c
index 72ed4c3321..46bbabd2e3 100644
--- a/block/qcow.c
+++ b/block/qcow.c
@@ -92,7 +92,8 @@ typedef struct BDRVQcowState {
 
 static QemuOptsList qcow_create_opts;
 
-static int decompress_cluster(BlockDriverState *bs, uint64_t cluster_offset);
+static int coroutine_fn decompress_cluster(BlockDriverState *bs,
+                                           uint64_t cluster_offset);
 
 static int qcow_probe(const uint8_t *buf, int buf_size, const char *filename)
 {
@@ -349,10 +350,11 @@ static int qcow_reopen_prepare(BDRVReopenState *state,
  * return 0 if not allocated, 1 if *result is assigned, and negative
  * errno on failure.
  */
-static int get_cluster_offset(BlockDriverState *bs,
-                              uint64_t offset, int allocate,
-                              int compressed_size,
-                              int n_start, int n_end, uint64_t *result)
+static int coroutine_fn get_cluster_offset(BlockDriverState *bs,
+                                           uint64_t offset, int allocate,
+                                           int compressed_size,
+                                           int n_start, int n_end,
+                                           uint64_t *result)
 {
     BDRVQcowState *s = bs->opaque;
     int min_index, i, j, l1_index, l2_index, ret;
@@ -583,7 +585,8 @@ static int decompress_buffer(uint8_t *out_buf, int out_buf_size,
     return 0;
 }
 
-static int decompress_cluster(BlockDriverState *bs, uint64_t cluster_offset)
+static int coroutine_fn decompress_cluster(BlockDriverState *bs,
+                                           uint64_t cluster_offset)
 {
     BDRVQcowState *s = bs->opaque;
     int ret, csize;
-- 
2.37.3


