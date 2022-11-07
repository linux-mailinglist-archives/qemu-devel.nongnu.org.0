Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C1BB620458
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 00:59:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osC1Y-00054x-Vs; Mon, 07 Nov 2022 18:59:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1osC1W-0004z3-A8
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 18:59:26 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1osC1U-0003pf-L4
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 18:59:26 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 j5-20020a05600c410500b003cfa9c0ea76so2689383wmi.3
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 15:59:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zpwW1WmuKF4HLpSpU3/p7YGXqdSMsI7/VzGcJtnIKNo=;
 b=rvuIrsoikCvbuWDy4CRkhV5BXANnqK94hhBIlNEvIiYqzktdQZ5Hzs7RBc9tQ796P0
 lvDnRZX0FGrmv1Q5mbc3BrWUY7H/vgwb8cC8UOoHPVCTrnqs7rOFHLEYXHmku/X3yImt
 eAXFhqVyOATEoazimz/zIlpXCC1iRV07wRXzxIy0THeTe6r8MCYLdkpxAxRehF/V+BfY
 HDX/kkq8QZgr6XuLphLE3PgElYi2Wl8UXMVFBKIYm3XTHJbcLSG/VITaMwF8WeGG29+9
 ORoRCePQE5GwjDg1B5+PwK0QGFdVTVsw/tocWABx5k7r2S7/wvDKps7bgGvpTPHhVVcr
 JMEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zpwW1WmuKF4HLpSpU3/p7YGXqdSMsI7/VzGcJtnIKNo=;
 b=njVzguUvAub5grnbW6kdNr9HKJAF8MpteWgSGcr5EwRkiiU0LZVdGvEFE/XsQ7i92B
 t4GsYzrU7Ylalg7sRjH80sf4RPvE/+EoJMC5Exn3elysTNIt+8TO4KBCMsy8R9+TISrE
 Vh288rkbrS4qvSDIRTKtI1lNjg2X/xKfV3n5psLopQ0mZxTGKVt1r8t62f+iQr33CnsC
 zkLaLVsotE/FsMMgIQptad6Gz07iQh0mVMFW8HUjnMY0q4j9qeY4EBgIsfNtgZwXzPEE
 dPpyTh4DHO1chY/u+oQNsXSp14iO18q1SRa3XDRW3wGN8a28kBC4vBWqAv22MynJgn11
 tnHg==
X-Gm-Message-State: ACrzQf0MM/yz/RCAeb1KbbKvJs6SU8uxInPs1dT1BUrf0x5lwc3iVspq
 tnsh4GrBOqWkrf2E9FjQ4IWKZIKgDQwfHg==
X-Google-Smtp-Source: AMsMyM52NisXFso+92PeaRKU/2ynGKUx9S0P0KCNsiz2gw13t4SuXJ96lYs+tcoJ229SloRPMBRExA==
X-Received: by 2002:a05:600c:424c:b0:3cf:6cbc:91fc with SMTP id
 r12-20020a05600c424c00b003cf6cbc91fcmr32129275wmm.90.1667865563232; 
 Mon, 07 Nov 2022 15:59:23 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 t188-20020a1c46c5000000b003cfa622a18asm6145156wma.3.2022.11.07.15.59.22
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 07 Nov 2022 15:59:22 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 12/14] disas/nanomips: Split out read_u16
Date: Tue,  8 Nov 2022 00:58:20 +0100
Message-Id: <20221107235822.71458-13-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221107235822.71458-1-philmd@linaro.org>
References: <20221107235822.71458-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Richard Henderson <richard.henderson@linaro.org>

Split out a helper function for reading a uint16_t
with the correct endianness.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221106023735.5277-4-richard.henderson@linaro.org>
---
 disas/nanomips.c | 48 +++++++++++++++++++-----------------------------
 1 file changed, 19 insertions(+), 29 deletions(-)

diff --git a/disas/nanomips.c b/disas/nanomips.c
index e462256760..3b998118e3 100644
--- a/disas/nanomips.c
+++ b/disas/nanomips.c
@@ -21918,10 +21918,24 @@ static bool nanomips_dis(const uint16_t *data, char **buf, Dis_info *info)
     return Disassemble(data, buf, &type, MAJOR, ARRAY_SIZE(MAJOR), info) >= 0;
 }
 
+static bool read_u16(uint16_t *ret, bfd_vma memaddr,
+                     struct disassemble_info *info)
+{
+    int status = (*info->read_memory_func)(memaddr, (bfd_byte *)ret, 2, info);
+    if (status != 0) {
+        (*info->memory_error_func)(status, memaddr, info);
+        return false;
+    }
+
+    if ((info->endian == BFD_ENDIAN_BIG) != HOST_BIG_ENDIAN) {
+        bswap16s(ret);
+    }
+    return true;
+}
+
 int print_insn_nanomips(bfd_vma memaddr, struct disassemble_info *info)
 {
-    int status, length;
-    bfd_byte buffer[2];
+    int length;
     uint16_t words[3] = { };
     g_autofree char *buf = NULL;
 
@@ -21939,48 +21953,24 @@ int print_insn_nanomips(bfd_vma memaddr, struct disassemble_info *info)
     disassm_info.fprintf_func = info->fprintf_func;
     disassm_info.stream = info->stream;
 
-    status = (*info->read_memory_func)(memaddr, buffer, 2, info);
-    if (status != 0) {
-        (*info->memory_error_func)(status, memaddr, info);
+    if (!read_u16(&words[0], memaddr, info)) {
         return -1;
     }
-
-    if (info->endian == BFD_ENDIAN_BIG) {
-        words[0] = bfd_getb16(buffer);
-    } else {
-        words[0] = bfd_getl16(buffer);
-    }
     length = 2;
 
     /* Handle 32-bit opcodes.  */
     if ((words[0] & 0x1000) == 0) {
-        status = (*info->read_memory_func)(memaddr + 2, buffer, 2, info);
-        if (status != 0) {
-            (*info->memory_error_func)(status, memaddr + 2, info);
+        if (!read_u16(&words[1], memaddr + 2, info)) {
             return -1;
         }
-
-        if (info->endian == BFD_ENDIAN_BIG) {
-            words[1] = bfd_getb16(buffer);
-        } else {
-            words[1] = bfd_getl16(buffer);
-        }
         length = 4;
     }
 
     /* Handle 48-bit opcodes.  */
     if ((words[0] >> 10) == 0x18) {
-        status = (*info->read_memory_func)(memaddr + 4, buffer, 2, info);
-        if (status != 0) {
-            (*info->memory_error_func)(status, memaddr + 4, info);
+        if (!read_u16(&words[1], memaddr + 4, info)) {
             return -1;
         }
-
-        if (info->endian == BFD_ENDIAN_BIG) {
-            words[2] = bfd_getb16(buffer);
-        } else {
-            words[2] = bfd_getl16(buffer);
-        }
         length = 6;
     }
 
-- 
2.38.1


