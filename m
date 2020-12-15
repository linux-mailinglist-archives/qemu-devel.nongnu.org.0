Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C84B32DAF0C
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 15:37:21 +0100 (CET)
Received: from localhost ([::1]:56614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpBS4-00064c-QG
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 09:37:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kpB4m-0001f0-H9
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 09:13:16 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:44251)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kpB4a-0007Bv-Gq
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 09:13:16 -0500
Received: by mail-wr1-x42b.google.com with SMTP id w5so16252691wrm.11
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 06:13:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=vfsjB+5EKQ5ZFSeZREuqmO7AlPzocEX4KU0OKohIt3c=;
 b=frfWHKaAe+fHHAfmdqqEsoftWpDK53HDkWRjg43IipnW2un6OE5RbDwnPy1wKS++05
 TrCwAnkpCin7VOHUtHN2aHJ2AusPq+1y8enWfrBoJkYIpWcoWUw1Sa+w+baplR4B7opf
 I7MioIk6snMhQZqAhPmxcyqeSMuVkIDMQvSYgFksAibBXsizPBkIsJmz62wagHpKjB/0
 HcI0GCqkVzSvOH0Is24meI/fo+bzbcHTDEBD7OepoaQ+hUqKPekEzpece+hWe8K1oDNi
 IH60xGl2CzI0IQEPMVG/gbFbkL4QHd3odkwBy8DhV4g3zw0Hm1Q0NiktfPgwM2USjJkc
 wnKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vfsjB+5EKQ5ZFSeZREuqmO7AlPzocEX4KU0OKohIt3c=;
 b=mE/fqvP/PnCzudwDFxvAVZVW3tsDsChlCLeeISQVSXX70I9nFtI/M9tQoGNjYc8iZz
 ebLf48HjL2pylgfr3O6Bl8EV98cU/zvNS42DQvNYNIF22/x5q0p7/qNHqVhO+VLJogd9
 LoNoutUcDb9AXEjsav8QfTUB9HT9VrF+GPYHgYXfjPmiWHe9M+gQr+elKBKY/2p4GNYJ
 bEth9FXK9qAdIKEdcvRIeN87mKfMJ5bO+enzZAxAdORkhxl+iRSkHTV42iS2nRLB+Nz+
 81g/q6/L6WTgAYf7NBYspMgFmJvCKAa52KN5YWJJyZIcDJCP29lTUYG0rTU72e7tVCMr
 doEQ==
X-Gm-Message-State: AOAM532srqOu5shCB+jjg94D0vgHU54Zve8stlyGenvtJ0CGmNsi38Ll
 KDcDr0oc/emYM7iZFR0X5ZQU/YEYbXo2DQ==
X-Google-Smtp-Source: ABdhPJzb7+Cl1yUy4DQpghhp7trcG5do1e8NRDTzidwu81o8/O7XISFaoh3RY9ej8l/cL1ik91uQ/g==
X-Received: by 2002:a5d:69c2:: with SMTP id s2mr2918340wrw.36.1608041582546;
 Tue, 15 Dec 2020 06:13:02 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id w21sm19667319wmi.45.2020.12.15.06.13.01
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 06:13:01 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 20/20] hw/block/m25p80: Fix Numonyx fast read dummy cycle count
Date: Tue, 15 Dec 2020 14:12:37 +0000
Message-Id: <20201215141237.17868-21-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201215141237.17868-1-peter.maydell@linaro.org>
References: <20201215141237.17868-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Joe Komlodi <joe.komlodi@xilinx.com>

Numonyx chips determine the number of cycles to wait based on bits 7:4
in the volatile configuration register.

However, if these bits are 0x0 or 0xF, the number of dummy cycles to
wait is 10 for QIOR and QIOR4 commands or when in QIO mode, and otherwise 8 for
the currently supported fast read commands. [1]

[1]
https://www.micron.com/-/media/client/global/documents/products/data-sheet/nor-flash/serial-nor/mt25q/die-rev-b/mt25q_qlkt_u_02g_cbb_0.pdf?rev=9b167fbf2b3645efba6385949a72e453

Signed-off-by: Joe Komlodi <komlodi@xilinx.com>
Reviewed-by: Francisco Iglesias <francisco.iglesias@xilinx.com>
Message-id: 1605568264-26376-5-git-send-email-komlodi@xilinx.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/block/m25p80.c | 30 +++++++++++++++++++++++++++---
 1 file changed, 27 insertions(+), 3 deletions(-)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index f1d7da65c85..c45afdd2cb3 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -837,6 +837,30 @@ static uint8_t numonyx_mode(Flash *s)
     }
 }
 
+static uint8_t numonyx_extract_cfg_num_dummies(Flash *s)
+{
+    uint8_t num_dummies;
+    uint8_t mode;
+    assert(get_man(s) == MAN_NUMONYX);
+
+    mode = numonyx_mode(s);
+    num_dummies = extract32(s->volatile_cfg, 4, 4);
+
+    if (num_dummies == 0x0 || num_dummies == 0xf) {
+        switch (s->cmd_in_progress) {
+        case QIOR:
+        case QIOR4:
+            num_dummies = 10;
+            break;
+        default:
+            num_dummies = (mode == MODE_QIO) ? 10 : 8;
+            break;
+        }
+    }
+
+    return num_dummies;
+}
+
 static void decode_fast_read_cmd(Flash *s)
 {
     s->needed_bytes = get_addr_length(s);
@@ -846,7 +870,7 @@ static void decode_fast_read_cmd(Flash *s)
         s->needed_bytes += 8;
         break;
     case MAN_NUMONYX:
-        s->needed_bytes += extract32(s->volatile_cfg, 4, 4);
+        s->needed_bytes += numonyx_extract_cfg_num_dummies(s);
         break;
     case MAN_MACRONIX:
         if (extract32(s->volatile_cfg, 6, 2) == 1) {
@@ -885,7 +909,7 @@ static void decode_dio_read_cmd(Flash *s)
                                     );
         break;
     case MAN_NUMONYX:
-        s->needed_bytes += extract32(s->volatile_cfg, 4, 4);
+        s->needed_bytes += numonyx_extract_cfg_num_dummies(s);
         break;
     case MAN_MACRONIX:
         switch (extract32(s->volatile_cfg, 6, 2)) {
@@ -925,7 +949,7 @@ static void decode_qio_read_cmd(Flash *s)
                                     );
         break;
     case MAN_NUMONYX:
-        s->needed_bytes += extract32(s->volatile_cfg, 4, 4);
+        s->needed_bytes += numonyx_extract_cfg_num_dummies(s);
         break;
     case MAN_MACRONIX:
         switch (extract32(s->volatile_cfg, 6, 2)) {
-- 
2.20.1


