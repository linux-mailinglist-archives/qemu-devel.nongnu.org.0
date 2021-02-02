Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F345330C6E2
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 18:04:10 +0100 (CET)
Received: from localhost ([::1]:40270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6z61-0007c9-Ug
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 12:04:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l6yYN-0005WN-IW
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 11:29:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53410)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l6yYL-0000KK-M7
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 11:29:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612283360;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OoOffmGlZF5H1YU4xyF1XXxLlysz1yc5d5doEDU1ClM=;
 b=CFHfjnbXfY3nqCT0EEsN3e7C6NdOgY/SMZ03q/8FeNLPfHkJJ4B/l7xSNeyumMPZsGmShi
 16Y/zHvwYbU7XD5fQFdR+CbbBDJKDErK5Df/HXMiPVt5FsC0TXbJHyH5+zkYiS+5SXm1+P
 d46jfZRFlqOby8EXghcgniqPlZbOhsc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-480-g0Zgy1JwPKmykmnsq3CBkw-1; Tue, 02 Feb 2021 11:29:17 -0500
X-MC-Unique: g0Zgy1JwPKmykmnsq3CBkw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 989D356B38;
 Tue,  2 Feb 2021 16:29:16 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-112-19.ams2.redhat.com [10.36.112.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F41DB5D763;
 Tue,  2 Feb 2021 16:29:13 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL v2 09/10] block/nvme: Trace NVMe spec version supported by the
 controller
Date: Tue,  2 Feb 2021 17:28:33 +0100
Message-Id: <20210202162834.269789-10-kwolf@redhat.com>
In-Reply-To: <20210202162834.269789-1-kwolf@redhat.com>
References: <20210202162834.269789-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

NVMe controllers implement different versions of the spec,
and different features of it. It is useful to gather this
information when debugging.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210127212137.3482291-3-philmd@redhat.com>
Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/nvme.c       | 6 ++++++
 block/trace-events | 1 +
 2 files changed, 7 insertions(+)

diff --git a/block/nvme.c b/block/nvme.c
index 80c4318d8f..2b5421e7aa 100644
--- a/block/nvme.c
+++ b/block/nvme.c
@@ -708,6 +708,7 @@ static int nvme_init(BlockDriverState *bs, const char *device, int namespace,
     AioContext *aio_context = bdrv_get_aio_context(bs);
     int ret;
     uint64_t cap;
+    uint32_t ver;
     uint64_t timeout_ms;
     uint64_t deadline, now;
     volatile NvmeBar *regs = NULL;
@@ -764,6 +765,11 @@ static int nvme_init(BlockDriverState *bs, const char *device, int namespace,
     bs->bl.request_alignment = s->page_size;
     timeout_ms = MIN(500 * NVME_CAP_TO(cap), 30000);
 
+    ver = le32_to_cpu(regs->vs);
+    trace_nvme_controller_spec_version(extract32(ver, 16, 16),
+                                       extract32(ver, 8, 8),
+                                       extract32(ver, 0, 8));
+
     /* Reset device to get a clean state. */
     regs->cc = cpu_to_le32(le32_to_cpu(regs->cc) & 0xFE);
     /* Wait for CSTS.RDY = 0. */
diff --git a/block/trace-events b/block/trace-events
index 8368f4acb0..ecbc32a80a 100644
--- a/block/trace-events
+++ b/block/trace-events
@@ -136,6 +136,7 @@ qed_aio_write_main(void *s, void *acb, int ret, uint64_t offset, size_t len) "s
 # nvme.c
 nvme_controller_capability_raw(uint64_t value) "0x%08"PRIx64
 nvme_controller_capability(const char *desc, uint64_t value) "%s: %"PRIu64
+nvme_controller_spec_version(uint32_t mjr, uint32_t mnr, uint32_t ter) "Specification supported: %u.%u.%u"
 nvme_kick(void *s, unsigned q_index) "s %p q #%u"
 nvme_dma_flush_queue_wait(void *s) "s %p"
 nvme_error(int cmd_specific, int sq_head, int sqid, int cid, int status) "cmd_specific %d sq_head %d sqid %d cid %d status 0x%x"
-- 
2.29.2


