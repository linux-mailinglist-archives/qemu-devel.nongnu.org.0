Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A08B33F4E9
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 17:04:09 +0100 (CET)
Received: from localhost ([::1]:48728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMYeW-0002rw-GA
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 12:04:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMYCV-0005Fo-7z
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 11:35:12 -0400
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c]:39703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMYCO-0007CM-8R
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 11:35:10 -0400
Received: by mail-ot1-x32c.google.com with SMTP id
 h6-20020a0568300346b02901b71a850ab4so2179600ote.6
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 08:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JpDz6oY9vwUgYbUC8y1zTqK+NAlPHi554TXdiibHnyo=;
 b=AzkDADfY+I38lx0ypQxuuqn039tQpwq0q4L7iV1I2OOYJCKy/3lmCDsvHeEqW5RQWT
 ZMuMsP9b87803mjfsuX+hnOR9kAMd8MTmQ776Yi5sm7LdWO2lyynUElYjAqUT9uM4vDD
 EGfyGcOf29VLzkByqJJjT4VkZHzo3GehMvopa8B/UowEwLTrLUuvaaj0zpJxAP5+xmRX
 OWjqvvW9WnZvMfQWuO5swjIqBzGdq0+NngAlUkWCY5N9U9kaw7oX7p+gqE6XpawKE+up
 BXMc9nPgCi+6GedosYoe6rsLybu2OLohYMDwlwewxnLrr3MCy/UYFqiVUe60zu8u0PgQ
 qPfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JpDz6oY9vwUgYbUC8y1zTqK+NAlPHi554TXdiibHnyo=;
 b=R06FPc5rQxdk5l+Y5HiiciziBgAUdLtRVVilasTACHLzKfEjAVhqzGuPmxV835JRL+
 Vig3SxWxel5D7ACS6LqAF1ArVqXJC3Ylfj1SDWzYh8PM9SI/4QaK4FWpwvipNNY/KL6m
 bVhsPGeksIpW1WASJUfKjQ93SFuvHulh0oxki3qcpWi924eJR1gIapuckqEEIKcO12zD
 VtHyDK5I3BLFfFpWsHJUPBCpPnGlUTa6JLmI7uoVhA74+Ich3uCjM6NFh6IMiO/HVaew
 yZ0uhmZHb0QopbkY9IVQp0Qol14U8CzUtLKeOahKTRtMzCih3ZpY3sziyH2w8QlXrfj4
 0xOA==
X-Gm-Message-State: AOAM532FBfGDvQ6et0b1qF9YwDjBVXPQhYABipzlcvsRqSOz/Yu9xOVZ
 cBE6WczqC6TM4/sXOVuvRUr1ni9B2BiqdvLb
X-Google-Smtp-Source: ABdhPJyOSMNMyIcABwhaXSxeovy+Te/MpJdBw60EhX2YLVaLgvJj9PMMHeNwD40j/F9bPvQWyLdgUg==
X-Received: by 2002:a05:6830:18c:: with SMTP id
 q12mr3802847ota.355.1615995303199; 
 Wed, 17 Mar 2021 08:35:03 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id i11sm8271154otp.76.2021.03.17.08.35.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 08:35:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 17/38] tcg/tci: Reduce qemu_ld/st TCGMemOpIdx operand to 32-bits
Date: Wed, 17 Mar 2021 09:34:23 -0600
Message-Id: <20210317153444.310566-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210317153444.310566-1-richard.henderson@linaro.org>
References: <20210317153444.310566-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32c.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We are currently using the "natural" size routine, which
uses 64-bits on a 64-bit host.  The TCGMemOpIdx operand
has 11 bits, so we can safely reduce to 32-bits.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c                | 8 ++++----
 tcg/tci/tcg-target.c.inc | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 22a5832387..ebd4c74176 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -840,7 +840,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
         case INDEX_op_qemu_ld_i32:
             t0 = *tb_ptr++;
             taddr = tci_read_ulong(regs, &tb_ptr);
-            oi = tci_read_i(&tb_ptr);
+            oi = tci_read_i32(&tb_ptr);
             switch (get_memop(oi) & (MO_BSWAP | MO_SSIZE)) {
             case MO_UB:
                 tmp32 = qemu_ld_ub;
@@ -877,7 +877,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
                 t1 = *tb_ptr++;
             }
             taddr = tci_read_ulong(regs, &tb_ptr);
-            oi = tci_read_i(&tb_ptr);
+            oi = tci_read_i32(&tb_ptr);
             switch (get_memop(oi) & (MO_BSWAP | MO_SSIZE)) {
             case MO_UB:
                 tmp64 = qemu_ld_ub;
@@ -926,7 +926,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
         case INDEX_op_qemu_st_i32:
             t0 = tci_read_rval(regs, &tb_ptr);
             taddr = tci_read_ulong(regs, &tb_ptr);
-            oi = tci_read_i(&tb_ptr);
+            oi = tci_read_i32(&tb_ptr);
             switch (get_memop(oi) & (MO_BSWAP | MO_SIZE)) {
             case MO_UB:
                 qemu_st_b(t0);
@@ -950,7 +950,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
         case INDEX_op_qemu_st_i64:
             tmp64 = tci_read_r64(regs, &tb_ptr);
             taddr = tci_read_ulong(regs, &tb_ptr);
-            oi = tci_read_i(&tb_ptr);
+            oi = tci_read_i32(&tb_ptr);
             switch (get_memop(oi) & (MO_BSWAP | MO_SIZE)) {
             case MO_UB:
                 qemu_st_b(tmp64);
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 640407b4a8..6c187a25cc 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -550,7 +550,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
         if (TARGET_LONG_BITS > TCG_TARGET_REG_BITS) {
             tcg_out_r(s, *args++);
         }
-        tcg_out_i(s, *args++);
+        tcg_out32(s, *args++);
         break;
 
     case INDEX_op_qemu_ld_i64:
@@ -563,7 +563,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
         if (TARGET_LONG_BITS > TCG_TARGET_REG_BITS) {
             tcg_out_r(s, *args++);
         }
-        tcg_out_i(s, *args++);
+        tcg_out32(s, *args++);
         break;
 
     case INDEX_op_mb:
-- 
2.25.1


