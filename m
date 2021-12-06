Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5AA24694C4
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 12:10:05 +0100 (CET)
Received: from localhost ([::1]:37656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muBsi-0000eD-EG
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 06:10:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1muBqe-0006sQ-JV
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 06:07:56 -0500
Received: from [2a00:1450:4864:20::430] (port=35701
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1muBqc-0003Lk-RF
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 06:07:56 -0500
Received: by mail-wr1-x430.google.com with SMTP id i5so21645708wrb.2
 for <qemu-devel@nongnu.org>; Mon, 06 Dec 2021 03:07:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wFti5fdBWZt65wfSGIAT9DbbN09hWoSYxokOwb1uXUk=;
 b=JrwDyYOvtd3SFwLOEEz/GDqvsEVLWLZWQDqwtqbk/kb+dc1DU0E5RGDTCzYiosMrFW
 4rz32tQe7gf/K07v+YVBgBcw8WeGAymFpdvsQG6jvJi++WgFyfGONo71ZojEANfakiCy
 FcNFzhcFY1r9tldwubip00zn9hLFt7M9sv06y+CZn0Pj2TpWRZhYFIvkeWnnAapARgvN
 rPsD7qdxdqMCj7tAICsXeuotShqsoOwUFdBI4FnNOcpiUfnn8Ck2E4kUHh9VGCWJ0pzn
 hbCy2B9GytDNHkkpyfUC3FLlMd8u07Zl0Ld24khNPlNjFLiDgD9GgYVhDhceZS2cRbsk
 X/nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=wFti5fdBWZt65wfSGIAT9DbbN09hWoSYxokOwb1uXUk=;
 b=x1Hp1xGRI21lTCY2ehptnhgZU96I7S5t5Tqk9D4fJjBqX11HU2KKt0zEjQvJYLqGcr
 xHZ1qk2Z4o0A+8N+C1BHI23CvCyONaP6qDdRGsSIRXfpuSj1xB0Ns/4BJ5CzJ0pyYqzU
 /GC57a7m7slC9jpt5op2+8Iq1xvOI/yDN2QHIqh5GJgeir/Z6My3J0Om3eEhbe48QWCN
 3J3XPpJHjUnzVYhnrgKUySFmpk/CzJRMDNq70Z9GV/V1hecp9002BbTkkBoGCsUAz4U9
 GvzOPwpbvNGYgfqYM0dfZVu4+b5wEVA3C4DegpRpq2hWIjhr2mnVy1vfqVZwz8n1D1w7
 8hpQ==
X-Gm-Message-State: AOAM533mmVNSxlZd/4J+397sDwFw9Zcm9YJ2XEKyeP+jVXMnH+hYyamZ
 46RI8Ph5Bx8MgrXcF1RJnHCkhgmUTS0=
X-Google-Smtp-Source: ABdhPJwkK9o1u8HPK41xRuX7qBNU8HP4iWVhiyct5f4qJgs5J9IjZjIPkk4VMKUk5kL/BTNmcXN3Tg==
X-Received: by 2002:adf:d091:: with SMTP id y17mr44639063wrh.418.1638788873266; 
 Mon, 06 Dec 2021 03:07:53 -0800 (PST)
Received: from x1w.. (82.red-83-50-95.dynamicip.rima-tde.net. [83.50.95.82])
 by smtp.gmail.com with ESMTPSA id b10sm11021836wrt.36.2021.12.06.03.07.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Dec 2021 03:07:52 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 1/3] hw/mips/bootloader: Fix write_ulong()
Date: Mon,  6 Dec 2021 12:07:44 +0100
Message-Id: <20211206110746.360608-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211206110746.360608-1-f4bug@amsat.org>
References: <20211206110746.360608-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paul Burton <paulburton@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jiaxun Yang <jiaxun.yang@flygoat.com>

bl_gen_write_ulong uses sd for both 32 and 64 bit CPU,
while sd is illegal on 32 bit CPUs.

Replace sd with sw on 32bit CPUs.

Fixes: 3ebbf86128f ("hw/mips: Add a bootloader helper")
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20211130211729.7116-2-jiaxun.yang@flygoat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/mips/bootloader.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/mips/bootloader.c b/hw/mips/bootloader.c
index 6ec83144909..99991f8b2b5 100644
--- a/hw/mips/bootloader.c
+++ b/hw/mips/bootloader.c
@@ -182,7 +182,11 @@ void bl_gen_write_ulong(uint32_t **p, target_ulong addr, target_ulong val)
 {
     bl_gen_load_ulong(p, BL_REG_K0, val);
     bl_gen_load_ulong(p, BL_REG_K1, addr);
-    bl_gen_sd(p, BL_REG_K0, BL_REG_K1, 0x0);
+    if (bootcpu_supports_isa(ISA_MIPS3)) {
+        bl_gen_sd(p, BL_REG_K0, BL_REG_K1, 0x0);
+    } else {
+        bl_gen_sw(p, BL_REG_K0, BL_REG_K1, 0x0);
+    }
 }
 
 void bl_gen_write_u32(uint32_t **p, target_ulong addr, uint32_t val)
-- 
2.33.1


