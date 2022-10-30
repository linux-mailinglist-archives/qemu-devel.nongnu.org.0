Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 498F7612D63
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Oct 2022 23:31:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opGpB-00037L-CQ; Sun, 30 Oct 2022 18:30:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opGp7-0002ty-W9
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 18:30:34 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opGp5-0007p8-Q1
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 18:30:33 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 l16-20020a05600c4f1000b003c6c0d2a445so7049563wmq.4
 for <qemu-devel@nongnu.org>; Sun, 30 Oct 2022 15:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CGyBSYD+JsH4+UKvfVd3HbDWxqeqvtSsbbGqIJahaV8=;
 b=pBzAjOdJAcDvQvlyf0qNODSNDj9yW9lQ1JARx5gMrOSEQGUCan3/uBU4Js4YUklVXS
 PKtz5PwSbR1xgEsXgLSAjVQKs0iJzFrv+ZayCYjNGfZZXnj5oLBuO07gnh1xRARwCvts
 ILG94uLKqKAeqV/G1NbKP+Laq6BR+KFvSCS+Chv5vca01W5LeMkFJaYLRUSLSpKN4j1x
 9hPjE0vTZMWH80ELQQcW2haK5HFsg8OxrtO8ErxY9EKTotGQ47EKDnum1fvtFp9mob7y
 Y6MG41zYox2s7QBNTg767rpaa5MPsC8BkveOXOV57Em+7rW3dN3djrtfu1HX7l3LpGeC
 z8uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CGyBSYD+JsH4+UKvfVd3HbDWxqeqvtSsbbGqIJahaV8=;
 b=q1y66TiPLO9Nw2ZUEz06UV4bKe1yEk5Yd9hCph3bU0abKnCieXEA4/+Ht91B3E8dkw
 4wAWKiueqXSjMiTLr+q7pb5qazYaV9PVWNF0xj9Wmls5J7uBXWADXqweDTYrS3J+nTSW
 s9R6oX00HvBYJ12qpu193Xb4pHlqHsdkmMkaijtOQ81HSokiYWgajC0zP4Skk3CnLEtp
 3JALwrD+0nNNTGiWVPmUStEoIiN9XOwJOcan4tPWdNzCHrOy25xXMlY9TMP0aaL38Rj9
 D5ooXJqVTf/+gDJvwUdLQ0zBMj/Yz5DV/VFjRpneb8ol3SBIaMuthD2swyZUOp129w/A
 /63g==
X-Gm-Message-State: ACrzQf0/CtHlFw5bieqOi+Lw4Ph0dlbVtErp60xbXE5e2u2Qw+IiFdqW
 2EipHyx3uK+LQS7kKvlGp3AjHWtoaD4imQ==
X-Google-Smtp-Source: AMsMyM5kaJYtuvDezcwmP5tpV8DbBzK0Pbx5lKobAoAFJAMDtBGx0HkRNxa86BxEHhiM8mxTX3Yd6A==
X-Received: by 2002:a05:600c:524c:b0:3cc:ed19:707 with SMTP id
 fc12-20020a05600c524c00b003cced190707mr6199080wmb.80.1667169030170; 
 Sun, 30 Oct 2022 15:30:30 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 a16-20020a5d5090000000b002206203ed3dsm5213599wrt.29.2022.10.30.15.30.28
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 30 Oct 2022 15:30:29 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Stefan Pejic <stefan.pejic@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paul Burton <paulburton@kernel.org>,
 Milica Lazarevic <milica.lazarevic@syrmia.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 16/55] disas/nanomips: Extract enums out of the NMD class
Date: Sun, 30 Oct 2022 23:28:02 +0100
Message-Id: <20221030222841.42377-17-philmd@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221030222841.42377-1-philmd@linaro.org>
References: <20221030222841.42377-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
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

Definitions of enums TABLE_ENTRY_TYPE and TABLE_ATTRIBUTE_TYPE are moved
out of the NMD class. The main goal is to remove NMD class completely.

Signed-off-by: Milica Lazarevic <milica.lazarevic@syrmia.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220912122635.74032-3-milica.lazarevic@syrmia.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 disas/nanomips.cpp |  8 +++----
 disas/nanomips.h   | 59 +++++++++++++++++++++++-----------------------
 2 files changed, 33 insertions(+), 34 deletions(-)

diff --git a/disas/nanomips.cpp b/disas/nanomips.cpp
index 84529685bf..bdc640b38b 100644
--- a/disas/nanomips.cpp
+++ b/disas/nanomips.cpp
@@ -50,8 +50,8 @@ int nanomips_dis(char *buf,
     std::string disasm;
     uint16 bits[3] = {one, two, three};
 
-    NMD::TABLE_ENTRY_TYPE type;
-    NMD d(address, NMD::ALL_ATTRIBUTES);
+    TABLE_ENTRY_TYPE type;
+    NMD d(address, ALL_ATTRIBUTES);
     int size = d.Disassemble(bits, disasm, type);
 
     strcpy(buf, disasm.c_str());
@@ -772,7 +772,7 @@ uint64 NMD::extract_op_code_value(const uint16 * data, int size)
 
 
 int NMD::Disassemble(const uint16 * data, std::string & dis,
-                     NMD::TABLE_ENTRY_TYPE & type)
+                     TABLE_ENTRY_TYPE & type)
 {
     return Disassemble(data, dis, type, MAJOR, 2);
 }
@@ -790,7 +790,7 @@ int NMD::Disassemble(const uint16 * data, std::string & dis,
  *      disassembly string  - on error will constain error string
  */
 int NMD::Disassemble(const uint16 * data, std::string & dis,
-                     NMD::TABLE_ENTRY_TYPE & type, const Pool *table,
+                     TABLE_ENTRY_TYPE & type, const Pool *table,
                      int table_size)
 {
     try
diff --git a/disas/nanomips.h b/disas/nanomips.h
index 9fe0cc67da..f65a0957b8 100644
--- a/disas/nanomips.h
+++ b/disas/nanomips.h
@@ -31,41 +31,40 @@ typedef uint32_t uint32;
 typedef uint16_t uint16;
 typedef uint64_t img_address;
 
+enum TABLE_ENTRY_TYPE {
+    instruction,
+    call_instruction,
+    branch_instruction,
+    return_instruction,
+    reserved_block,
+    pool,
+};
+
+enum TABLE_ATTRIBUTE_TYPE {
+    MIPS64_    = 0x00000001,
+    XNP_       = 0x00000002,
+    XMMS_      = 0x00000004,
+    EVA_       = 0x00000008,
+    DSP_       = 0x00000010,
+    MT_        = 0x00000020,
+    EJTAG_     = 0x00000040,
+    TLBINV_    = 0x00000080,
+    CP0_       = 0x00000100,
+    CP1_       = 0x00000200,
+    CP2_       = 0x00000400,
+    UDI_       = 0x00000800,
+    MCU_       = 0x00001000,
+    VZ_        = 0x00002000,
+    TLB_       = 0x00004000,
+    MVH_       = 0x00008000,
+    ALL_ATTRIBUTES = 0xffffffffull,
+};
+
 
 class NMD
 {
 public:
 
-    enum TABLE_ENTRY_TYPE {
-        instruction,
-        call_instruction,
-        branch_instruction,
-        return_instruction,
-        reserved_block,
-        pool,
-    };
-
-    enum TABLE_ATTRIBUTE_TYPE {
-        MIPS64_    = 0x00000001,
-        XNP_       = 0x00000002,
-        XMMS_      = 0x00000004,
-        EVA_       = 0x00000008,
-        DSP_       = 0x00000010,
-        MT_        = 0x00000020,
-        EJTAG_     = 0x00000040,
-        TLBINV_    = 0x00000080,
-        CP0_       = 0x00000100,
-        CP1_       = 0x00000200,
-        CP2_       = 0x00000400,
-        UDI_       = 0x00000800,
-        MCU_       = 0x00001000,
-        VZ_        = 0x00002000,
-        TLB_       = 0x00004000,
-        MVH_       = 0x00008000,
-        ALL_ATTRIBUTES = 0xffffffffull,
-    };
-
-
     NMD(img_address pc, TABLE_ATTRIBUTE_TYPE requested_instruction_categories)
         : m_pc(pc)
         , m_requested_instruction_categories(requested_instruction_categories)
-- 
2.37.3


