Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 862594CFCB1
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 12:24:30 +0100 (CET)
Received: from localhost ([::1]:38554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRBTZ-0002XD-Jg
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 06:24:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nRAik-0004qW-1X
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:36:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37364)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nRAif-0008Ak-BS
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:36:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646649359;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zyzMSfiX7pajlFfucM4PYRwFoqpUxu9qOOW0sl86x+U=;
 b=TbMYz6u9PsGxsFslGuImII22D/sZAeDUq0muX8pUugiWgz0nM6FTpcifOw/Fv8PIxIVmDi
 gPVHxJANN0Fz4xKqOqSh83b7+jY04jnLqLTLsF5WQEm8wGeJCBoHVMh8mNZr3maFYd5N3i
 ZgSmEWCDf/yjTIEmkhlSLZV7GMYP4HU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-96-Hiw8I8ixO3OCMPXOhN7yaw-1; Mon, 07 Mar 2022 05:35:58 -0500
X-MC-Unique: Hiw8I8ixO3OCMPXOhN7yaw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2E13351F0;
 Mon,  7 Mar 2022 10:35:57 +0000 (UTC)
Received: from localhost (unknown [10.39.194.98])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 96FD37BB65;
 Mon,  7 Mar 2022 10:35:53 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 01/23] ide: Increment BB in-flight counter for TRIM BH
Date: Mon,  7 Mar 2022 11:35:27 +0100
Message-Id: <20220307103549.808809-2-hreitz@redhat.com>
In-Reply-To: <20220307103549.808809-1-hreitz@redhat.com>
References: <20220307103549.808809-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When we still have an AIOCB registered for DMA operations, we try to
settle the respective operation by draining the BlockBackend associated
with the IDE device.

However, this assumes that every DMA operation is associated with an
increment of the BlockBackend’s in-flight counter (e.g. through some
ongoing I/O operation), so that draining the BB until its in-flight
counter reaches 0 will settle all DMA operations.  That is not the case:
For TRIM, the guest can issue a zero-length operation that will not
result in any I/O operation forwarded to the BlockBackend, and also not
increment the in-flight counter in any other way.  In such a case,
blk_drain() will be a no-op if no other operations are in flight.

It is clear that if blk_drain() is a no-op, the value of
s->bus->dma->aiocb will not change between checking it in the `if`
condition and asserting that it is NULL after blk_drain().

The particular problem is that ide_issue_trim() creates a BH
(ide_trim_bh_cb()) to settle the TRIM request: iocb->common.cb() is
ide_dma_cb(), which will either create a new request, or find the
transfer to be done and call ide_set_inactive(), which clears
s->bus->dma->aiocb.  Therefore, the blk_drain() must wait for
ide_trim_bh_cb() to run, which currently it will not always do.

To fix this issue, we increment the BlockBackend's in-flight counter
when the TRIM operation begins (in ide_issue_trim(), when the
ide_trim_bh_cb() BH is created) and decrement it when ide_trim_bh_cb()
is done.

Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=2029980
Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20220120142259.120189-1-hreitz@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: John Snow <jsnow@redhat.com>
Tested-by: John Snow <jsnow@redhat.com>
---
 hw/ide/core.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/ide/core.c b/hw/ide/core.c
index 33463d9b8f..d667d0b55e 100644
--- a/hw/ide/core.c
+++ b/hw/ide/core.c
@@ -434,12 +434,16 @@ static const AIOCBInfo trim_aiocb_info = {
 static void ide_trim_bh_cb(void *opaque)
 {
     TrimAIOCB *iocb = opaque;
+    BlockBackend *blk = iocb->s->blk;
 
     iocb->common.cb(iocb->common.opaque, iocb->ret);
 
     qemu_bh_delete(iocb->bh);
     iocb->bh = NULL;
     qemu_aio_unref(iocb);
+
+    /* Paired with an increment in ide_issue_trim() */
+    blk_dec_in_flight(blk);
 }
 
 static void ide_issue_trim_cb(void *opaque, int ret)
@@ -509,6 +513,9 @@ BlockAIOCB *ide_issue_trim(
     IDEState *s = opaque;
     TrimAIOCB *iocb;
 
+    /* Paired with a decrement in ide_trim_bh_cb() */
+    blk_inc_in_flight(s->blk);
+
     iocb = blk_aio_get(&trim_aiocb_info, s->blk, cb, cb_opaque);
     iocb->s = s;
     iocb->bh = qemu_bh_new(ide_trim_bh_cb, iocb);
-- 
2.34.1


