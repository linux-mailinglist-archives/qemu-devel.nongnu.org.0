Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0CA559ADF
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 16:05:02 +0200 (CEST)
Received: from localhost ([::1]:36996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4jvf-0001QA-O2
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 10:05:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jaO-0001Mc-PD; Fri, 24 Jun 2022 09:43:01 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:41920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jaL-0005Ex-R4; Fri, 24 Jun 2022 09:42:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eMm3zc2ggsmpnF30OFxvoiRVnJIgdRorq+sG6jZDxbs=; b=0QP4vNZcRsbCxLWiPEBAaaueWD
 KIvY0rWQh/CCfWphwe3NG4x/DyxQrHpSAczY4gZx9nqx2n9XtbK5aW7jsWPKooINHJVJ1G6BdQ4IN
 NKQziuDC1cltf2Z3QqZ+5BS1tKn5SxgSaONF/qeXpwNZvKZQJNF6ZkaowOxAppsergnS5pUncCqFA
 9jajKicjB2KxrkHBg4YYaPCIBNrAJXUr4MbQudWKst7XUxmcxCfvuH0iMu45GrofBqQFaf0NBflOQ
 sV89PEZjf2g/Jidhi1BXssiS4bII/e0jthcSzVFm9e87VyUf3aMqc1EIrHEpUaRGJUldI/1a0Ui1a
 OxoYB/NCRwom0+ysiFOCoDxuEtY+y8jqfGW10WrvTp9DXtkZi7+ZoUJ6iX55qSB/qWzZmwVgvdHd4
 bkX4WkjoUPQ1ZjdXvD4WOjteDEObduTZsX2oseWv/KalP+dWrjoFXtBEPiojLfsGaP3K5yXvQFke2
 cCL5TngFU+4QsBYFxz6QnEhXvjzENDPxdJV5FkP26kdLd11GzrWNu0r5Wn2J37oRSGrPyopv3TsqR
 mx/PO+kUT3n/dXH5+RtDBGB5T181ggEvEsF+XcbfYeuc4Xd+ZmkumUbsYu3vtuGGlVybkH572atT/
 uB4x6zilccn32xnb9xAMLa3IE/It+tLTitgaJWJuE=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jYj-00037t-FY; Fri, 24 Jun 2022 14:41:20 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, jiaxun.yang@flygoat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Fri, 24 Jun 2022 14:40:35 +0100
Message-Id: <20220624134109.881989-21-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
References: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 20/54] pckbd: move ISAKBDState from pckbd.c to i8042.h
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

This allows the QOM types in pckbd.c to be used elsewhere by simply including
i8042.h.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Helge Deller <deller@gmx.de>
---
 hw/input/pckbd.c         | 10 ----------
 include/hw/input/i8042.h | 10 ++++++++++
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
index 7b14cd007e..f99e10cfcf 100644
--- a/hw/input/pckbd.c
+++ b/hw/input/pckbd.c
@@ -686,16 +686,6 @@ void i8042_mm_init(qemu_irq kbd_irq, qemu_irq mouse_irq,
     qemu_register_reset(kbd_reset, s);
 }
 
-struct ISAKBDState {
-    ISADevice parent_obj;
-
-    KBDState kbd;
-    bool kbd_throttle;
-    MemoryRegion io[2];
-    uint8_t kbd_irq;
-    uint8_t mouse_irq;
-};
-
 void i8042_isa_mouse_fake_event(ISAKBDState *isa)
 {
     KBDState *s = &isa->kbd;
diff --git a/include/hw/input/i8042.h b/include/hw/input/i8042.h
index 84b5aa7f23..a246250d1f 100644
--- a/include/hw/input/i8042.h
+++ b/include/hw/input/i8042.h
@@ -39,6 +39,16 @@ typedef struct KBDState {
 #define TYPE_I8042 "i8042"
 OBJECT_DECLARE_SIMPLE_TYPE(ISAKBDState, I8042)
 
+struct ISAKBDState {
+    ISADevice parent_obj;
+
+    KBDState kbd;
+    bool kbd_throttle;
+    MemoryRegion io[2];
+    uint8_t kbd_irq;
+    uint8_t mouse_irq;
+};
+
 #define I8042_A20_LINE "a20"
 
 
-- 
2.30.2


