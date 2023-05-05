Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8816A6F8AD0
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 23:25:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pv2vl-0000sN-PG; Fri, 05 May 2023 17:25:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pv2vV-0000oZ-Ck
 for qemu-devel@nongnu.org; Fri, 05 May 2023 17:25:17 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pv2vH-0004TJ-LR
 for qemu-devel@nongnu.org; Fri, 05 May 2023 17:25:17 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3f173af665fso15920855e9.3
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 14:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683321901; x=1685913901;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l0A/LgUi4z6B1lwW4uNcjXdWAYm4PmHLzeyxMeuQV08=;
 b=JVY0lvMpyVLRAVSp/Z6fB/aClgYH0Lg2BZ0yKWpmWY2KFECZ+d8KW//52TJJF6IEM7
 G9r1gqBmo3ZUJSaSw8GvxZqVR1vq4SwZdK3CRrLGR3J6cX5KYRkhUUcOlfJLtgnfD3HP
 L2RyWkOa6AQGm/gEu0yWXpoVbYP3rVQMHiPy0beH1tz27vKVrCLVV0eQ7eYD/wdJUDlN
 MQap36yWYu7mKFTaY/pwhN/xWnPVbliEqLHh7mBDmV0V9/LbheAlVxYw3jNI5CeF2cz8
 V2MLnmfTBQfJsYeQ4qutTPJdX39qdGj79m/fzFv53hm5Vhn6vJ6HAlZ1e22U4OAlVCeP
 O0nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683321901; x=1685913901;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l0A/LgUi4z6B1lwW4uNcjXdWAYm4PmHLzeyxMeuQV08=;
 b=coZ/4Zde/K9f3RWjRjkOtOr3v9yQC3ZFJHi0XsH5fljPD2AfyGVpSHjcp4iQvinjuU
 KJ9r6aGbQDyFLOqy8USa65bBe47HleexnQK80gKMglNERbw2viIhzV8WnsfZQ5bEQJ1E
 onZa4s0pVB3e4mMwse/j/0isu+T01Vp2Z8q/ozbNhwpY4q8cvvhKN+JHllsSU/XoJFeY
 tOiBgaS3DCEbjqMdDO7+Ut2Y/7r9JkOB93tuWXyHCH3N2WEOxju0iSnth5WagWSQBt4T
 ufhk7eHoekPM2hg3o/mkwGqh+cDNeeAAH0+ti6Yy0CFIx0aXRLuBacPOUbsAMTff+gkt
 TgfA==
X-Gm-Message-State: AC+VfDzj6s3oReW8MotdmoJQf9kgJME+/vOIKwiRxzQH1arSgT3IJfGb
 gimPQsPGEe01UTer42Cgb2yNZcxfiY2LNwXYN2cgcw==
X-Google-Smtp-Source: ACHHUZ42PVh9BwlnZzYlSq+c6XqXaEd1FUqsyXiuCsVqBUOk5DwF3EWKuK27KrpiOmtecHTpQx6EmQ==
X-Received: by 2002:a7b:cb57:0:b0:3f1:7a4a:7f9 with SMTP id
 v23-20020a7bcb57000000b003f17a4a07f9mr2094554wmj.7.1683321901521; 
 Fri, 05 May 2023 14:25:01 -0700 (PDT)
Received: from stoup.. ([212.241.182.8]) by smtp.gmail.com with ESMTPSA id
 t14-20020a5d460e000000b003047ae72b14sm3426709wrq.82.2023.05.05.14.25.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 May 2023 14:25:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 23/42] tcg/i386: Introduce tcg_out_testi
Date: Fri,  5 May 2023 22:24:28 +0100
Message-Id: <20230505212447.374546-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230505212447.374546-1-richard.henderson@linaro.org>
References: <20230505212447.374546-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32c.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Split out a helper for choosing testb vs testl.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 30 ++++++++++++++++++------------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 78160f453b..aae698121a 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -1751,6 +1751,23 @@ static void tcg_out_nopn(TCGContext *s, int n)
     tcg_out8(s, 0x90);
 }
 
+/* Test register R vs immediate bits I, setting Z flag for EQ/NE. */
+static void __attribute__((unused))
+tcg_out_testi(TCGContext *s, TCGReg r, uint32_t i)
+{
+    /*
+     * This is used for testing alignment, so we can usually use testb.
+     * For i686, we have to use testl for %esi/%edi.
+     */
+    if (i <= 0xff && (TCG_TARGET_REG_BITS == 64 || r < 4)) {
+        tcg_out_modrm(s, OPC_GRP3_Eb | P_REXB_RM, EXT3_TESTi, r);
+        tcg_out8(s, i);
+    } else {
+        tcg_out_modrm(s, OPC_GRP3_Ev, EXT3_TESTi, r);
+        tcg_out32(s, i);
+    }
+}
+
 typedef struct {
     TCGReg base;
     int index;
@@ -2051,18 +2068,7 @@ static void tcg_out_test_alignment(TCGContext *s, bool is_ld, TCGReg addrlo,
     unsigned a_mask = (1 << a_bits) - 1;
     TCGLabelQemuLdst *label;
 
-    /*
-     * We are expecting a_bits to max out at 7, so we can usually use testb.
-     * For i686, we have to use testl for %esi/%edi.
-     */
-    if (a_mask <= 0xff && (TCG_TARGET_REG_BITS == 64 || addrlo < 4)) {
-        tcg_out_modrm(s, OPC_GRP3_Eb | P_REXB_RM, EXT3_TESTi, addrlo);
-        tcg_out8(s, a_mask);
-    } else {
-        tcg_out_modrm(s, OPC_GRP3_Ev, EXT3_TESTi, addrlo);
-        tcg_out32(s, a_mask);
-    }
-
+    tcg_out_testi(s, addrlo, a_mask);
     /* jne slow_path */
     tcg_out_opc(s, OPC_JCC_long + JCC_JNE, 0, 0, 0);
 
-- 
2.34.1


