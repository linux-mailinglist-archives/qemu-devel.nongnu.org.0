Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B068B65EB3D
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 13:57:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDPnM-00072w-8G; Thu, 05 Jan 2023 07:56:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cyruscyliu@gmail.com>)
 id 1pDPnK-00072i-Jb; Thu, 05 Jan 2023 07:56:30 -0500
Received: from [125.120.148.222] (helo=liuqiang-OptiPlex-7060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cyruscyliu@gmail.com>)
 id 1pDPnI-0004la-Iv; Thu, 05 Jan 2023 07:56:30 -0500
Received: from localhost (liuqiang-OptiPlex-7060 [local])
 by liuqiang-OptiPlex-7060 (OpenSMTPD) with ESMTPA id 4bfde3b5;
 Thu, 5 Jan 2023 11:09:41 +0000 (UTC)
From: Qiang Liu <cyruscyliu@gmail.com>
To: qemu-devel@nongnu.org
Cc: Qiang Liu <cyruscyliu@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org (open list:Xilinx ZynqMP and...)
Subject: [PATCH] hw/display/xlnx_dp: fix abort in xlnx_dp_change_graphic_fmt()
Date: Thu,  5 Jan 2023 19:09:37 +0800
Message-Id: <20230105110937.436585-1-cyruscyliu@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 125.120.148.222 (failed)
Received-SPF: softfail client-ip=125.120.148.222;
 envelope-from=cyruscyliu@gmail.com; helo=liuqiang-OptiPlex-7060
X-Spam_score_int: 48
X-Spam_score: 4.8
X-Spam_bar: ++++
X-Spam_report: (4.8 / 5.0 requ) BAYES_00=-1.9, DKIM_ADSP_CUSTOM_MED=0.001,
 FORGED_GMAIL_RCVD=1, FREEMAIL_FROM=0.001, FSL_HELO_NON_FQDN_1=0.001,
 HELO_NO_DOMAIN=0.001, NML_ADSP_CUSTOM_MED=0.9, RCVD_IN_PBL=3.335,
 RDNS_NONE=0.793, SPF_SOFTFAIL=0.665, SPOOFED_FREEMAIL=0.001,
 SPOOFED_FREEMAIL_NO_RDNS=0.001, SPOOF_GMAIL_MID=0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=no autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

xlnx_dp_change_graphic_fmt() will directly abort if either graphic
format or the video format is not supported.

This patch directly let xlnx_dp_change_graphic_fmt() return if the
formats are not supported.

xlnx_dp_change_graphic_fmt() has two callsites in xlnx_dp_avbufm_write()
and xlnx_dp_reset(). I think it may be OK to drop the abort in
xlnx_dp_change_graphic_fmt() because the error information will be
printed.

Fixes: 58ac482a66de ("introduce xlnx-dp")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1415
Reported-by: Qiang Liu <cyruscyliu@gmail.com>
Signed-off-by: Qiang Liu <cyruscyliu@gmail.com>
---
 hw/display/xlnx_dp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/display/xlnx_dp.c b/hw/display/xlnx_dp.c
index b0828d65aa..407518c870 100644
--- a/hw/display/xlnx_dp.c
+++ b/hw/display/xlnx_dp.c
@@ -641,7 +641,7 @@ static void xlnx_dp_change_graphic_fmt(XlnxDPState *s)
     default:
         error_report("%s: unsupported graphic format %u", __func__,
                      s->avbufm_registers[AV_BUF_FORMAT] & DP_GRAPHIC_MASK);
-        abort();
+        return;
     }
 
     switch (s->avbufm_registers[AV_BUF_FORMAT] & DP_NL_VID_FMT_MASK) {
@@ -657,7 +657,7 @@ static void xlnx_dp_change_graphic_fmt(XlnxDPState *s)
     default:
         error_report("%s: unsupported video format %u", __func__,
                      s->avbufm_registers[AV_BUF_FORMAT] & DP_NL_VID_FMT_MASK);
-        abort();
+        return;
     }
 
     xlnx_dp_recreate_surface(s);
-- 
2.25.1


