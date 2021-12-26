Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B14A247F826
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Dec 2021 16:44:28 +0100 (CET)
Received: from localhost ([::1]:44322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n1VhD-0005oK-SU
	for lists+qemu-devel@lfdr.de; Sun, 26 Dec 2021 10:44:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1n1VdY-0000Jr-Q5
 for qemu-devel@nongnu.org; Sun, 26 Dec 2021 10:40:41 -0500
Received: from mailout08.t-online.de ([194.25.134.20]:40516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1n1VdW-0008Ar-TI
 for qemu-devel@nongnu.org; Sun, 26 Dec 2021 10:40:40 -0500
Received: from fwd75.dcpf.telekom.de (fwd75.aul.t-online.de [10.223.144.101])
 by mailout08.t-online.de (Postfix) with SMTP id 0648A2003;
 Sun, 26 Dec 2021 16:40:31 +0100 (CET)
Received: from linpower.localnet ([46.86.48.20]) by fwd75.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1n1VdG-1rsBkn0; Sun, 26 Dec 2021 16:40:22 +0100
Received: by linpower.localnet (Postfix, from userid 1000)
 id 53087200610; Sun, 26 Dec 2021 16:40:17 +0100 (CET)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 3/3] hw/audio/intel-hda: fix stream reset
Date: Sun, 26 Dec 2021 16:40:17 +0100
Message-Id: <20211226154017.6067-3-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cf516f2a-fea8-2000-1b80-a5465d0e1ee6@t-online.de>
References: <cf516f2a-fea8-2000-1b80-a5465d0e1ee6@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1640533222-000184BD-4B97F37E/0/0 CLEAN NORMAL
X-TOI-MSGID: 42266fdf-f7fa-4414-b59e-dec32e836437
Received-SPF: none client-ip=194.25.134.20;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout08.t-online.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Quote from:
High Definition Audio Specification 1.0a, section 3.3.35

Offset 80: {IOB}SDnCTL Stream Reset (SRST): Writing a 1 causes
the corresponding stream to be reset. The Stream Descriptor
registers (except the SRST bit itself) ... are reset.

Change the code to reset the Stream Descriptor Control and Status
registers except the SRST bit.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/757
Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 hw/audio/intel-hda.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/audio/intel-hda.c b/hw/audio/intel-hda.c
index 8ce9df64e3..eed81f9023 100644
--- a/hw/audio/intel-hda.c
+++ b/hw/audio/intel-hda.c
@@ -578,7 +578,7 @@ static void intel_hda_set_st_ctl(IntelHDAState *d, const IntelHDAReg *reg, uint3
     if (st->ctl & 0x01) {
         /* reset */
         dprint(d, 1, "st #%d: reset\n", reg->stream);
-        st->ctl = SD_STS_FIFO_READY << 24;
+        st->ctl = SD_STS_FIFO_READY << 24 | SD_CTL_STREAM_RESET;
     }
     if ((st->ctl & 0x02) != (old & 0x02)) {
         uint32_t stnr = (st->ctl >> 20) & 0x0f;
-- 
2.31.1


