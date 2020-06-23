Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 863E6206117
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Jun 2020 22:56:01 +0200 (CEST)
Received: from localhost ([::1]:52924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jnpxY-0004Sr-Hk
	for lists+qemu-devel@lfdr.de; Tue, 23 Jun 2020 16:56:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1jnpsq-0005J3-C2; Tue, 23 Jun 2020 16:51:08 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:56462
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1jnpso-0001zZ-Lj; Tue, 23 Jun 2020 16:51:08 -0400
Received: from host86-158-109-79.range86-158.btcentralplus.com
 ([86.158.109.79] helo=kentang.home)
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1jnpso-0007T1-TF; Tue, 23 Jun 2020 21:51:08 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, laurent@vivier.eu,
 fthain@telegraphics.com.au
Date: Tue, 23 Jun 2020 21:49:30 +0100
Message-Id: <20200623204936.24064-17-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200623204936.24064-1-mark.cave-ayland@ilande.co.uk>
References: <20200623204936.24064-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.158.109.79
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 16/22] cuda: add adb_autopoll_block() and
 adb_autopoll_unblock() functions
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ensure that the CUDA buffer is protected from autopoll requests overwriting
its contents whilst existing CUDA requests are in progress.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Tested-by: Finn Thain <fthain@telegraphics.com.au>
---
 hw/misc/macio/cuda.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/misc/macio/cuda.c b/hw/misc/macio/cuda.c
index b7071e89d5..5bbc7770fa 100644
--- a/hw/misc/macio/cuda.c
+++ b/hw/misc/macio/cuda.c
@@ -116,6 +116,7 @@ static void cuda_update(CUDAState *s)
 {
     MOS6522CUDAState *mcs = &s->mos6522_cuda;
     MOS6522State *ms = MOS6522(mcs);
+    ADBBusState *adb_bus = &s->adb_bus;
     int packet_received, len;
 
     packet_received = 0;
@@ -126,6 +127,9 @@ static void cuda_update(CUDAState *s)
             /* data output */
             if ((ms->b & (TACK | TIP)) != (s->last_b & (TACK | TIP))) {
                 if (s->data_out_index < sizeof(s->data_out)) {
+                    if (s->data_out_index == 0) {
+                        adb_autopoll_block(adb_bus);
+                    }
                     trace_cuda_data_send(ms->sr);
                     s->data_out[s->data_out_index++] = ms->sr;
                     cuda_delay_set_sr_int(s);
@@ -140,6 +144,7 @@ static void cuda_update(CUDAState *s)
                     /* indicate end of transfer */
                     if (s->data_in_index >= s->data_in_size) {
                         ms->b = (ms->b | TREQ);
+                        adb_autopoll_unblock(adb_bus);
                     }
                     cuda_delay_set_sr_int(s);
                 }
-- 
2.20.1


