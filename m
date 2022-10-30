Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A0E612D7A
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Oct 2022 23:35:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opGpH-0003YY-13; Sun, 30 Oct 2022 18:30:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opGpE-0003Nu-M8
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 18:30:40 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opGpC-0007z8-RN
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 18:30:40 -0400
Received: by mail-wr1-x42b.google.com with SMTP id v1so13648251wrt.11
 for <qemu-devel@nongnu.org>; Sun, 30 Oct 2022 15:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YuLrB6PN9aH0KHWyG0T6ZTaW1FYgHjfaNl3gUqsPi8Q=;
 b=Cp3SeKrEIoYKu7d6OoHLUGudPG4A4aI6QQTNFGPzDFtq2sRxjVU5ueCDPcV88PaURi
 Xy5Y9EoqS9fMNibFOiuRS6WhjyTtwSpLkXysCLLr7F5sfUEypjNUbGtujKBt2z52RJrA
 uUKOywM7A1JYqyqOOrbHrnnHg71NbqTNYS9z9/Mr2+v9PmssbZaObkU/PV0OFUTLSAAA
 NeE9fcGo+muIDfa9n34U7xrghREggTtA/gGsHH526Lw5h3UKkOtvZzodT13yPgVfkCEN
 83KLiV8CRqqs3uhJEBz7lkjST/R7eJn7n2y7GDIBn7/P4fjw6250ZJNI/l5KX9d6Nvpn
 plfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YuLrB6PN9aH0KHWyG0T6ZTaW1FYgHjfaNl3gUqsPi8Q=;
 b=Xh6Bqb96io7Zsw9dY3FpUhzozaBswX9Pc8jkfTdTMgzSI3NXESPKAIhcsWGXRxyKOr
 vNIX8KPNTWscv3cXsxSEkmJPunoLb3iCEC7qx2RnoQ0ENMpg1+PLJOwQwxSjPBc7CEN3
 25gf+uq1n9M+FCDwwBbWCaPe1Qx0Rq6pEZiI6TDLeDIgDRC+Jgw8T6EQXcVLk/zpiH8U
 45pWPC7rd+WpQ2isTBBlKZOyPwZesZaUM9I2gjyA8kXrhqpWLVatx7g2tdckip71vrsD
 DR6PZHLxdBHxfbp6MwSoCCQhiQDkcpyAdL7IzUrS4OVrahAoC0lnAh0jDJAk57ZXUq9e
 rghw==
X-Gm-Message-State: ACrzQf3w7oaKy71hkoyQO7h3DDWHS5LyyHhVZqAHclFT2au6FaVr9I0+
 a7kqL/xwAUg+pRbp/ZQsNkkYZIX+4OI4xw==
X-Google-Smtp-Source: AMsMyM4Gv6PHV5fpgd4rB10lBSdB/kTZCce6+6R2hMZaSg4wi1ZU5N5ZgbpCYKBKTHprw3EWa27IWA==
X-Received: by 2002:a05:6000:16cd:b0:236:cd1a:ba1c with SMTP id
 h13-20020a05600016cd00b00236cd1aba1cmr825738wrf.261.1667169037198; 
 Sun, 30 Oct 2022 15:30:37 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 b13-20020a5d550d000000b002366b17ca8bsm6004756wrv.108.2022.10.30.15.30.34
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 30 Oct 2022 15:30:36 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Stefan Pejic <stefan.pejic@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paul Burton <paulburton@kernel.org>,
 Milica Lazarevic <milica.lazarevic@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 17/55] disas/nanomips: Delete NMD class field
Date: Sun, 30 Oct 2022 23:28:03 +0100
Message-Id: <20221030222841.42377-18-philmd@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221030222841.42377-1-philmd@linaro.org>
References: <20221030222841.42377-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Milica Lazarevic <milica.lazarevic@syrmia.com>

The m_requested_instruction_categories field always has the same value,
ALL_ATTRIBUTES. The only use of that field is within the if statement.
When replaced with a specific value, the if statement is always false,
so it has been removed.

Now, when the only use of the m_requested_instruction_categories field
is removed, we can delete the field declaration and initialization in
the NMD class. Also, we're changing the way of the construction of the
NMD object in the nanomips_dis function.

Signed-off-by: Milica Lazarevic <milica.lazarevic@syrmia.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220912122635.74032-4-milica.lazarevic@syrmia.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 disas/nanomips.cpp | 13 +------------
 disas/nanomips.h   |  4 +---
 2 files changed, 2 insertions(+), 15 deletions(-)

diff --git a/disas/nanomips.cpp b/disas/nanomips.cpp
index bdc640b38b..721ca3f52b 100644
--- a/disas/nanomips.cpp
+++ b/disas/nanomips.cpp
@@ -51,7 +51,7 @@ int nanomips_dis(char *buf,
     uint16 bits[3] = {one, two, three};
 
     TABLE_ENTRY_TYPE type;
-    NMD d(address, ALL_ATTRIBUTES);
+    NMD d(address);
     int size = d.Disassemble(bits, disasm, type);
 
     strcpy(buf, disasm.c_str());
@@ -812,17 +812,6 @@ int NMD::Disassemble(const uint16 * data, std::string & dis,
                                    (table[i].type == call_instruction) ||
                                    (table[i].type == branch_instruction) ||
                                    (table[i].type == return_instruction)) {
-                            if ((table[i].attributes != 0) &&
-                                (m_requested_instruction_categories &
-                                 table[i].attributes) == 0) {
-                                /*
-                                 * failed due to instruction having
-                                 * an ASE attribute and the requested version
-                                 * not having that attribute
-                                 */
-                                dis = "ASE attribute mismatch";
-                                return -5;
-                            }
                             disassembly_function dis_fn = table[i].disassembly;
                             if (dis_fn == 0) {
                                 dis = "disassembler failure - bad table entry";
diff --git a/disas/nanomips.h b/disas/nanomips.h
index f65a0957b8..5bdfe1e30b 100644
--- a/disas/nanomips.h
+++ b/disas/nanomips.h
@@ -65,9 +65,8 @@ class NMD
 {
 public:
 
-    NMD(img_address pc, TABLE_ATTRIBUTE_TYPE requested_instruction_categories)
+    NMD(img_address pc)
         : m_pc(pc)
-        , m_requested_instruction_categories(requested_instruction_categories)
     {
     }
 
@@ -77,7 +76,6 @@ public:
 private:
 
     img_address           m_pc;
-    TABLE_ATTRIBUTE_TYPE   m_requested_instruction_categories;
 
     typedef std::string(NMD:: *disassembly_function)(uint64 instruction);
     typedef bool(NMD:: *conditional_function)(uint64 instruction);
-- 
2.37.3


