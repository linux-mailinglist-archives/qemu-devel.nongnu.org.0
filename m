Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E904C58F4
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Feb 2022 03:11:55 +0100 (CET)
Received: from localhost ([::1]:55260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nO92Q-0005bB-Nm
	for lists+qemu-devel@lfdr.de; Sat, 26 Feb 2022 21:11:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nO8vd-00033p-OY
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 21:04:53 -0500
Received: from [2607:f8b0:4864:20::631] (port=39524
 helo=mail-pl1-x631.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nO8vD-0007T4-Ve
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 21:04:53 -0500
Received: by mail-pl1-x631.google.com with SMTP id l9so7456213pls.6
 for <qemu-devel@nongnu.org>; Sat, 26 Feb 2022 18:04:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4V3DAl/KfzvmWaQbzqlIHfN7HstB27sk8ff49XT9o98=;
 b=KGMuiBVXEhwUqESaYjXQXeO5lj25GQenfJC+EAfB4o4lIQ6n0ixTpiFqt0W4xeTtHa
 F/iA9G/vJPJzroc9AHGAysE1uhwW/k9mbJ+1oUaJbeBI524MB+6bI1NtE5fcQaphj9c1
 GkkLZWsTz542ElC7UgOo9A701Mc4rkYQcJiVzW7VrbGsBFBf0RAysgbbVzqDdhv5/ogv
 WTAhWQOhqLSWDwrJ/QbpjSMEjfL8h1Q0kutgG0xQcDeHA/Aq5jxD2k9r9AWJbBlYpyM5
 +TdKAXf0Kka+ZIv7SjIffErQemlC3yRJlojmw8Vkv2VlqXGD32GMiRzf/mw2Fb7FzWsY
 xoMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4V3DAl/KfzvmWaQbzqlIHfN7HstB27sk8ff49XT9o98=;
 b=5jUIV5wFMYu1AF/ZLBV2MlczK5WK2stRqONLyPQm62WMvYwqxP7cgYUtBJdtAHBOV+
 lraTPL2NuHUEPYJreYJCkoXK1uh4puNHKHa7Dx+AMnF03O9zECCYm+gLXFZE4jxKE7ye
 oAdMVT6pH+dXOVHBOXH/5HN4c0XnPqj9+OMRa5cEK9k09Hr6+1X714g7jPyubc5uQvbD
 bEzn/p8/KrjRYt9BAujrR1UOn0BEOnOrpk5KuNd9VHls0BnnqyLbZXcLHwjyI0eXbjGm
 9cWIlulIxmTxyEkQy7JlwHnBoCPYYL9tdAm7RWiWO8U+IOlgtsU6tPs6vPVe+V2i1LHd
 3jyA==
X-Gm-Message-State: AOAM532SyooBKlNsmS6ZotYlEYk0hs2/TpmpvoP6Ep0UAJAjPF6sYepY
 YVFLWJ4FiDe0i0g34yGFuJyMaHVhZCvZa242
X-Google-Smtp-Source: ABdhPJxaMe/5jC7B6hE4RDcwClHt7mnBVM2+CgfaNE4QlU13GZ7DAlGKoD9RvwyoZZLt/tahdjYH1A==
X-Received: by 2002:a17:902:7586:b0:14f:687c:9d69 with SMTP id
 j6-20020a170902758600b0014f687c9d69mr14624198pll.81.1645927465729; 
 Sat, 26 Feb 2022 18:04:25 -0800 (PST)
Received: from localhost.localdomain
 (2603-800c-1201-c600-9001-d56a-9ee0-0246.res6.spectrum.com.
 [2603:800c:1201:c600:9001:d56a:9ee0:246])
 by smtp.gmail.com with ESMTPSA id
 q13-20020a056a00088d00b004e1bea9c582sm8304021pfj.43.2022.02.26.18.04.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Feb 2022 18:04:25 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 7/9] tcg/mips: Support TCG_TARGET_SIGNED_ADDR32
Date: Sat, 26 Feb 2022 16:04:11 -1000
Message-Id: <20220227020413.11741-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220227020413.11741-1-richard.henderson@linaro.org>
References: <20220227020413.11741-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::631
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Huacai Chen <chenhuacai@kernel.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All 32-bit mips operations sign-extend the output, so we are easily
able to keep TCG_TYPE_I32 values sign-extended in host registers.

Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: Aurelien Jarno <aurelien@aurel32.net>
Cc: Huacai Chen <chenhuacai@kernel.org>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/mips/tcg-target-sa32.h |  8 ++++++++
 tcg/mips/tcg-target.c.inc  | 10 ++--------
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/tcg/mips/tcg-target-sa32.h b/tcg/mips/tcg-target-sa32.h
index cb185b1526..51255e7cba 100644
--- a/tcg/mips/tcg-target-sa32.h
+++ b/tcg/mips/tcg-target-sa32.h
@@ -1 +1,9 @@
+/*
+ * Do not set TCG_TARGET_SIGNED_ADDR32 for mips32;
+ * TCG expects this to only be set for 64-bit hosts.
+ */
+#ifdef __mips64
+#define TCG_TARGET_SIGNED_ADDR32 1
+#else
 #define TCG_TARGET_SIGNED_ADDR32 0
+#endif
diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index 993149d18a..b97c032ded 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -1168,12 +1168,6 @@ static void tcg_out_tlb_load(TCGContext *s, TCGReg base, TCGReg addrl,
                      TCG_TMP0, TCG_TMP3, cmp_off);
     }
 
-    /* Zero extend a 32-bit guest address for a 64-bit host. */
-    if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
-        tcg_out_ext32u(s, base, addrl);
-        addrl = base;
-    }
-
     /*
      * Mask the page bits, keeping the alignment bits to compare against.
      * For unaligned accesses, compare against the end of the access to
@@ -1679,7 +1673,7 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is_64)
                         data_regl, data_regh, addr_regl, addr_regh,
                         s->code_ptr, label_ptr);
 #else
-    if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
+    if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS && !guest_base_signed_addr32) {
         tcg_out_ext32u(s, base, addr_regl);
         addr_regl = base;
     }
@@ -1878,7 +1872,7 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is_64)
                         data_regl, data_regh, addr_regl, addr_regh,
                         s->code_ptr, label_ptr);
 #else
-    if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
+    if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS && !guest_base_signed_addr32) {
         tcg_out_ext32u(s, base, addr_regl);
         addr_regl = base;
     }
-- 
2.25.1


