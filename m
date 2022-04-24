Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3339550D3C2
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Apr 2022 18:59:14 +0200 (CEST)
Received: from localhost ([::1]:58438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nifZp-0000fa-9a
	for lists+qemu-devel@lfdr.de; Sun, 24 Apr 2022 12:59:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nifR6-0002At-V8; Sun, 24 Apr 2022 12:50:13 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:36140)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nifR2-00013S-2d; Sun, 24 Apr 2022 12:50:09 -0400
Received: from [2a00:23c4:8ba2:c800:3cf5:fb4b:b388:106c] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nifQ3-000BIt-N2; Sun, 24 Apr 2022 17:49:11 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: pbonzini@redhat.com, laurent@vivier.eu, fam@euphon.net,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Date: Sun, 24 Apr 2022 17:49:28 +0100
Message-Id: <20220424164935.7339-5-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220424164935.7339-1-mark.cave-ayland@ilande.co.uk>
References: <20220424164935.7339-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba2:c800:3cf5:fb4b:b388:106c
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 04/11] q800: implement compat_props to enable
 quirk_mode_page_apple_vendor for scsi-hd devices
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

By default quirk_mode_page_apple_vendor should be enabled for all scsi-hd devices
connected to the q800 machine to enable MacOS to detect and use them.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/m68k/q800.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
index 099a758c6f..42bf7bb4f0 100644
--- a/hw/m68k/q800.c
+++ b/hw/m68k/q800.c
@@ -686,6 +686,11 @@ static void q800_init(MachineState *machine)
     }
 }
 
+static GlobalProperty hw_compat_q800[] = {
+    { "scsi-hd", "quirk_mode_page_apple_vendor", "on"},
+};
+static const size_t hw_compat_q800_len = G_N_ELEMENTS(hw_compat_q800);
+
 static void q800_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -695,6 +700,7 @@ static void q800_machine_class_init(ObjectClass *oc, void *data)
     mc->max_cpus = 1;
     mc->block_default_type = IF_SCSI;
     mc->default_ram_id = "m68k_mac.ram";
+    compat_props_add(mc->compat_props, hw_compat_q800, hw_compat_q800_len);
 }
 
 static const TypeInfo q800_machine_typeinfo = {
-- 
2.20.1


