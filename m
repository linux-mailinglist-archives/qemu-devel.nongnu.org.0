Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3ED4E2EC7
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 18:07:44 +0100 (CET)
Received: from localhost ([::1]:51706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWLVP-0004cj-6t
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 13:07:43 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nWLRR-0001fx-JA
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 13:03:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60057)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nWLRP-000577-Vj
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 13:03:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647882215;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MDWxGrKktgNZQCh7l/xgAvK/yCM6gzCkGFWydMGt6mY=;
 b=fiYIEy9r2Ug38tb1/61lW/Pz9Qs1fyBabIOO9ZkdflB1Dq0fU5ZpLahY3TUUQZgFcvDIQv
 LGOR6j1XFpPEgeEUmzNeY9hpMVJ7hAT5CsoypvrZY2WizjnXgWUj/PFvirRetYIoH7TKSz
 A/HakPcAP0/MwKm6pGjF7CGbzth19uk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-456-n6I9OUvcOHqwH3bnRMEiwg-1; Mon, 21 Mar 2022 13:03:32 -0400
X-MC-Unique: n6I9OUvcOHqwH3bnRMEiwg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A447F899EC2;
 Mon, 21 Mar 2022 17:03:31 +0000 (UTC)
Received: from thuth.com (unknown [10.39.195.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B00AC40D2821;
 Mon, 21 Mar 2022 17:03:29 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 3/8] hw/audio/intel-hda: Do not ignore DMA overrun errors
Date: Mon, 21 Mar 2022 18:03:15 +0100
Message-Id: <20220321170320.282496-4-thuth@redhat.com>
In-Reply-To: <20220321170320.282496-1-thuth@redhat.com>
References: <20220321170320.282496-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: qemu-block@nongnu.org, Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alexander Bulekov <alxndr@bu.edu>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Per the "High Definition Audio Specification" manual (rev. 1.0a),
section "3.3.30 Offset 5Dh: RIRBSTS - RIRB Status":

  Response Overrun Interrupt Status (RIRBOIS):

  Hardware sets this bit to a 1 when an overrun occurs in the RIRB.
  An interrupt may be generated if the Response Overrun Interrupt
  Control bit is set.

  This bit will be set if the RIRB DMA engine is not able to write
  the incoming responses to memory before additional incoming
  responses overrun the internal FIFO.

  When hardware detects an overrun, it will drop the responses which
  overrun the buffer and set the RIRBOIS status bit to indicate the
  error condition. Optionally, if the RIRBOIC is set, the hardware
  will also generate an error to alert software to the problem.

QEMU emulates the DMA engine with the stl_le_pci_dma() calls. This
function returns a MemTxResult indicating whether the DMA access
was successful.
Handle any MemTxResult error as "DMA engine is not able to write the
incoming responses to memory" and raise the Overrun Interrupt flag
when this case occurs.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20211218160912.1591633-2-philmd@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/audio/intel-hda.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/hw/audio/intel-hda.c b/hw/audio/intel-hda.c
index 5f8a878f20..47a36acc71 100644
--- a/hw/audio/intel-hda.c
+++ b/hw/audio/intel-hda.c
@@ -350,6 +350,7 @@ static void intel_hda_response(HDACodecDevice *dev, bool solicited, uint32_t res
     IntelHDAState *d = container_of(bus, IntelHDAState, codecs);
     hwaddr addr;
     uint32_t wp, ex;
+    MemTxResult res = MEMTX_OK;
 
     if (d->ics & ICH6_IRS_BUSY) {
         dprint(d, 2, "%s: [irr] response 0x%x, cad 0x%x\n",
@@ -368,8 +369,12 @@ static void intel_hda_response(HDACodecDevice *dev, bool solicited, uint32_t res
     ex = (solicited ? 0 : (1 << 4)) | dev->cad;
     wp = (d->rirb_wp + 1) & 0xff;
     addr = intel_hda_addr(d->rirb_lbase, d->rirb_ubase);
-    stl_le_pci_dma(&d->pci, addr + 8 * wp, response, attrs);
-    stl_le_pci_dma(&d->pci, addr + 8 * wp + 4, ex, attrs);
+    res |= stl_le_pci_dma(&d->pci, addr + 8 * wp, response, attrs);
+    res |= stl_le_pci_dma(&d->pci, addr + 8 * wp + 4, ex, attrs);
+    if (res != MEMTX_OK && (d->rirb_ctl & ICH6_RBCTL_OVERRUN_EN)) {
+        d->rirb_sts |= ICH6_RBSTS_OVERRUN;
+        intel_hda_update_irq(d);
+    }
     d->rirb_wp = wp;
 
     dprint(d, 2, "%s: [wp 0x%x] response 0x%x, extra 0x%x\n",
-- 
2.27.0


