Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B52F6101D4
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 21:39:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo7io-0007Sy-1r; Thu, 27 Oct 2022 14:35:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oo7gb-0001xc-Q1
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:33:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oo7gW-0002ZZ-I1
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:33:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666895576;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HYnVEFR5AHHoMXJooSuU8oPb2vlXz2txxUvwXASWXxs=;
 b=YG7EsTsLo+b40CnMZPZZswfMEooRjuFSIBDYKMGDTFmc9ff1mzW/rBsjk7nx7qUz5hQ1nE
 LsoSK19xI1TyUq3G03lBioLh/gwqATwN5DqLV4P/8av22NjIrR3YLby+vnPONUljV7xBzT
 Z88qApls+5dIm7JzmheCqsHjl/qSIxU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-186-BoZQ-0X1ODeAwoyhO8fOpQ-1; Thu, 27 Oct 2022 14:32:52 -0400
X-MC-Unique: BoZQ-0X1ODeAwoyhO8fOpQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 76899811E75;
 Thu, 27 Oct 2022 18:32:52 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B5D531121320;
 Thu, 27 Oct 2022 18:32:51 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	stefanha@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 42/58] qcow2: add coroutine_fn annotation for indirect-called
 functions
Date: Thu, 27 Oct 2022 20:31:30 +0200
Message-Id: <20221027183146.463129-43-kwolf@redhat.com>
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

From: Alberto Faria <afaria@redhat.com>

Signed-off-by: Alberto Faria <afaria@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20221013123711.620631-10-pbonzini@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/qcow2.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/block/qcow2.c b/block/qcow2.c
index b47016cf61..a8bb7135a5 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -5287,8 +5287,8 @@ static int64_t qcow2_check_vmstate_request(BlockDriverState *bs,
     return pos;
 }
 
-static int qcow2_save_vmstate(BlockDriverState *bs, QEMUIOVector *qiov,
-                              int64_t pos)
+static coroutine_fn int qcow2_save_vmstate(BlockDriverState *bs,
+                                           QEMUIOVector *qiov, int64_t pos)
 {
     int64_t offset = qcow2_check_vmstate_request(bs, qiov, pos);
     if (offset < 0) {
@@ -5299,8 +5299,8 @@ static int qcow2_save_vmstate(BlockDriverState *bs, QEMUIOVector *qiov,
     return bs->drv->bdrv_co_pwritev_part(bs, offset, qiov->size, qiov, 0, 0);
 }
 
-static int qcow2_load_vmstate(BlockDriverState *bs, QEMUIOVector *qiov,
-                              int64_t pos)
+static coroutine_fn int qcow2_load_vmstate(BlockDriverState *bs,
+                                           QEMUIOVector *qiov, int64_t pos)
 {
     int64_t offset = qcow2_check_vmstate_request(bs, qiov, pos);
     if (offset < 0) {
-- 
2.37.3


