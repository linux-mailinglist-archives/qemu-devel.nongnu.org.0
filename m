Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA60C31BBE8
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 16:10:34 +0100 (CET)
Received: from localhost ([::1]:54024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBfWD-0005BF-Ph
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 10:10:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lBfNG-0005QG-4m
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 10:01:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lBfNE-0000hp-1a
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 10:01:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613401275;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mFAJGHMTIcqkF9k82J2swaNaaRa6gZ22/9SbNCI0gfs=;
 b=R6G2atkgji211cKfX/zhBxdr/RL52iGRTG3f8qag7BBNFVOWIs4V0ALWoO/PZScAH0Jg5+
 xEAPJiZyNo4zUko2XpKZpc/3iX1inPGYN27tbEvAhnjWsc2aruRh064Vwb2eZX5g6xt6BB
 yMcKMxN0pc9GpkU0pR3r3M0wLHYdcMY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-501-YaWMK2aFMRGPisFtAq1Gkg-1; Mon, 15 Feb 2021 10:01:10 -0500
X-MC-Unique: YaWMK2aFMRGPisFtAq1Gkg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0BDFE801965;
 Mon, 15 Feb 2021 15:01:09 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-113-28.ams2.redhat.com [10.36.113.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1382A5C233;
 Mon, 15 Feb 2021 15:01:07 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 04/11] hw/ide/ahci: map cmd_fis as DMA_DIRECTION_TO_DEVICE
Date: Mon, 15 Feb 2021 16:00:53 +0100
Message-Id: <20210215150100.436555-5-kwolf@redhat.com>
In-Reply-To: <20210215150100.436555-1-kwolf@redhat.com>
References: <20210215150100.436555-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Alexander Bulekov <alxndr@bu.edu>

cmd_fis is mapped as DMA_DIRECTION_FROM_DEVICE, however, it is read
from, and not written to anywhere. Fix the DMA_DIRECTION and mark
cmd_fis as read-only in the code.

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
Message-Id: <20210119164051.89268-1-alxndr@bu.edu>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 hw/ide/ahci.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/ide/ahci.c b/hw/ide/ahci.c
index 6d50482b8d..f2c5157483 100644
--- a/hw/ide/ahci.c
+++ b/hw/ide/ahci.c
@@ -700,7 +700,7 @@ static void ahci_reset_port(AHCIState *s, int port)
 }
 
 /* Buffer pretty output based on a raw FIS structure. */
-static char *ahci_pretty_buffer_fis(uint8_t *fis, int cmd_len)
+static char *ahci_pretty_buffer_fis(const uint8_t *fis, int cmd_len)
 {
     int i;
     GString *s = g_string_new("FIS:");
@@ -1100,11 +1100,11 @@ static void execute_ncq_command(NCQTransferState *ncq_tfs)
 }
 
 
-static void process_ncq_command(AHCIState *s, int port, uint8_t *cmd_fis,
+static void process_ncq_command(AHCIState *s, int port, const uint8_t *cmd_fis,
                                 uint8_t slot)
 {
     AHCIDevice *ad = &s->dev[port];
-    NCQFrame *ncq_fis = (NCQFrame*)cmd_fis;
+    const NCQFrame *ncq_fis = (NCQFrame *)cmd_fis;
     uint8_t tag = ncq_fis->tag >> 3;
     NCQTransferState *ncq_tfs = &ad->ncq_tfs[tag];
     size_t size;
@@ -1185,7 +1185,7 @@ static AHCICmdHdr *get_cmd_header(AHCIState *s, uint8_t port, uint8_t slot)
 }
 
 static void handle_reg_h2d_fis(AHCIState *s, int port,
-                               uint8_t slot, uint8_t *cmd_fis)
+                               uint8_t slot, const uint8_t *cmd_fis)
 {
     IDEState *ide_state = &s->dev[port].port.ifs[0];
     AHCICmdHdr *cmd = get_cmd_header(s, port, slot);
@@ -1301,7 +1301,7 @@ static int handle_cmd(AHCIState *s, int port, uint8_t slot)
     tbl_addr = le64_to_cpu(cmd->tbl_addr);
     cmd_len = 0x80;
     cmd_fis = dma_memory_map(s->as, tbl_addr, &cmd_len,
-                             DMA_DIRECTION_FROM_DEVICE);
+                             DMA_DIRECTION_TO_DEVICE);
     if (!cmd_fis) {
         trace_handle_cmd_badfis(s, port);
         return -1;
@@ -1326,7 +1326,7 @@ static int handle_cmd(AHCIState *s, int port, uint8_t slot)
     }
 
 out:
-    dma_memory_unmap(s->as, cmd_fis, cmd_len, DMA_DIRECTION_FROM_DEVICE,
+    dma_memory_unmap(s->as, cmd_fis, cmd_len, DMA_DIRECTION_TO_DEVICE,
                      cmd_len);
 
     if (s->dev[port].port.ifs[0].status & (BUSY_STAT|DRQ_STAT)) {
-- 
2.29.2


