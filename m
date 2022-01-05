Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C5464851B0
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 12:17:04 +0100 (CET)
Received: from localhost ([::1]:60760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n54Hv-0006GR-9U
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 06:17:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1n54Er-0005Ov-1x
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 06:13:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1n54Em-0005FO-LT
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 06:13:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641381222;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=PcV4/z31xpxd3CmU1VA/AMmHnn6Enevn7v709S61UNo=;
 b=Pb5HsyTMe+5B1688HcPJKEMElgs3kyVYHDh5SGI2lFGf75ibGbAlEFEmRSWFiiWjYdBMew
 kDJv8h7dtf7+ZgLbSOhOAGJRcxxrS2CT7hVg2uFt+B0bHJ0INCZDFzDEIV/OB+yjW4sNei
 d1tZhkRGlZRqzQRg3xlbsCRufRHLBKo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-134-dAQKbIURPgqvdxL6kFEbcQ-1; Wed, 05 Jan 2022 06:13:41 -0500
X-MC-Unique: dAQKbIURPgqvdxL6kFEbcQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3ABA8100C660;
 Wed,  5 Jan 2022 11:13:40 +0000 (UTC)
Received: from localhost (unknown [10.39.194.35])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BDA9D1036B4B;
 Wed,  5 Jan 2022 11:13:39 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH] ide: Explicitly poll for BHs on cancel
Date: Wed,  5 Jan 2022 12:13:37 +0100
Message-Id: <20220105111337.10366-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Hanna Reitz <hreitz@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When we still have an AIOCB registered for DMA operations, we try to
settle the respective operation by draining the BlockBackend associated
with the IDE device.

However, this assumes that every DMA operation is associated with some
I/O operation on the BlockBackend, and so settling the latter will
settle the former.  That is not the case; for example, the guest is free
to issue a zero-length TRIM operation that will not result in any I/O
operation forwarded to the BlockBackend.  In such a case, blk_drain()
will be a no-op if no other operations are in flight.

It is clear that if blk_drain() is a no-op, the value of
s->bus->dma->aiocb will not change between checking it in the `if`
condition and asserting that it is NULL after blk_drain().

To settle the DMA operation, we will thus need to explicitly invoke
aio_poll() ourselves, which will run any outstanding BHs (like
ide_trim_bh_cb()), until s->bus->dma->aiocb is NULL.  To stop this from
being an infinite loop, assert that we made progress with every
aio_poll() call (i.e., invoked some BH).

Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=2029980
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
Perhaps for a lack of being aware of all the kinds of tests we have, I
found it impossible to write a reproducer in any of our current test
frameworks: From how I understand the issue, to reproduce it, you need
to issue a TRIM request and immediately cancel it, before
ide_trim_bh_cb() (scheduled as a BH) can run.

I wanted to do this via qtest, but that does not work, because every
port I/O operation is done via a qtest command, and QEMU will happily
poll the main context between each qtest command, which means that you
cannot cancel an ongoing IDE request before a BH scheduled by it is run.

Therefore, I wrote an x86 boot sector that sets up a no-op TRIM request
(i.e. one where all TRIM ranges have length 0) and immediately cancels
it by setting SRST.  It is attached to the BZ linked above, and can be
tested as follows:

$ TEST_BIN=test.bin
$ (sleep 1; echo 'info registers'; echo quit) \
    | ./qemu-system-x86_64 \
        -drive if=ide,file=$TEST_BIN,format=raw \
        -monitor stdio \
    | grep EIP= \
    | sed -e 's/ EFL.*//'

The result should be:
EIP=00007c72

Not:
qemu-system-x86_64: ../hw/ide/core.c:734: ide_cancel_dma_sync: Assertion
`s->bus->dma->aiocb == NULL' failed.
---
 hw/ide/core.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/hw/ide/core.c b/hw/ide/core.c
index e28f8aad61..c7f7a1016c 100644
--- a/hw/ide/core.c
+++ b/hw/ide/core.c
@@ -731,7 +731,17 @@ void ide_cancel_dma_sync(IDEState *s)
     if (s->bus->dma->aiocb) {
         trace_ide_cancel_dma_sync_remaining();
         blk_drain(s->blk);
-        assert(s->bus->dma->aiocb == NULL);
+
+        /*
+         * Wait for potentially still-scheduled BHs, like ide_trim_bh_cb()
+         * (blk_drain() will only poll if there are in-flight requests on the
+         * BlockBackend, which there may not necessarily be, e.g. when the
+         * guest has issued a zero-length TRIM request)
+         */
+        while (s->bus->dma->aiocb) {
+            bool progress = aio_poll(qemu_get_aio_context(), true);
+            assert(progress);
+        }
     }
 }
 
-- 
2.33.1


