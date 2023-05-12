Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C21700DC3
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 19:19:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxWPA-0007Lt-2L; Fri, 12 May 2023 13:18:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pxWP3-0007Jr-59
 for qemu-devel@nongnu.org; Fri, 12 May 2023 13:18:04 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pxWP1-0005HB-Eg
 for qemu-devel@nongnu.org; Fri, 12 May 2023 13:18:00 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3063b5f32aaso6709063f8f.2
 for <qemu-devel@nongnu.org>; Fri, 12 May 2023 10:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683911876; x=1686503876;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=miBGGjW/ZQfOCs7U5dTa3vNRbLi2IQsdXFfT88TdwaM=;
 b=ePDCiVkrEf0LQHw1xkBKNodcLt464K5eZ0IuIF5Is9ByYN8hVEGyjAjek1Qv+3Or7N
 S8RwDOgUY3jsDblmrS4RaW28EjKa3QSTNrS6qUToWcM0v2XP4jHPEv/j1kCgnuI06GTq
 0lZJYYnTMZ8si+RhHEZeKeh4YBOPfn8bl0mp3p/YBlZHWQ/qGrCZPmCTSUcNWS/POpM6
 HeMA9WaeHrlOxb4KcDFRtnJUwrYdXkKb37pFS6iUkHTjk9yFGEqFgNjcFYonujtmwJUE
 p4OYYBLHWp2ClV7Wiel359atrqr+kISw5i+KcHj1UlnNDgVimrw4njQ5MaT610LWJ7AF
 p7Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683911876; x=1686503876;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=miBGGjW/ZQfOCs7U5dTa3vNRbLi2IQsdXFfT88TdwaM=;
 b=kCxGEtnYdDGPJHuUZrVx8wUMepW0i3OlF/u+rEg+cLkB7Dp+rD5hKHJzC5BCGNqruH
 FD/sdEcoFGFuvPSnm60oSYRXFHRkY8+dIFomKdTgKlI3Kno2bdxB+eL2egkH204Z98I7
 VbmCBkRTUNvq9NpB2a/oRm5p1ow3opWcIEpMyJ04kFkD4weVCHuXF7BlJDQsUQrgxljJ
 w2+ooO9KDNL7M47nJcodHC28gdZYdcI+23z54XOBVBQ+TecN4iILxiX/+1jDh2oTRFvT
 CcprGWef0wIkJqUeSbKYrcPR99iqXtJLGBeNBYa8HEhGsK9a64WySBX+ehCg6jLmwmpH
 jeVQ==
X-Gm-Message-State: AC+VfDysSIPY0KoIP9+ARHUxuQtYZHfFz4B8SBz26QIB/yp5cT1DmXST
 yJk1COL59v16AiISk6Q6lYQTyYmCPn2HMVytgSjSSg==
X-Google-Smtp-Source: ACHHUZ6Uu6u1VQxqMI7Kc/TERJ2MPonQd1oD8TXC287MSuxIrtDqDZcRYX7SqfmxldQHAPPcaiX69g==
X-Received: by 2002:a5d:5248:0:b0:307:aa7c:58 with SMTP id
 k8-20020a5d5248000000b00307aa7c0058mr8638998wrc.40.1683911876536; 
 Fri, 12 May 2023 10:17:56 -0700 (PDT)
Received: from stoup.. ([83.98.42.3]) by smtp.gmail.com with ESMTPSA id
 j18-20020a5d4492000000b003021288a56dsm24010620wrq.115.2023.05.12.10.17.56
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 May 2023 10:17:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] tcg/i386: Set P_REXW in tcg_out_addi_ptr
Date: Fri, 12 May 2023 18:17:55 +0100
Message-Id: <20230512171755.1237329-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The REXW bit must be set to produce a 64-bit pointer result; the
bit is disabled in 32-bit mode, so we can do this unconditionally.

Fixes: 7d9e1ee424b0 ("tcg/i386: Adjust assert in tcg_out_addi_ptr")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1592
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1642
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index a01bfad773..9fc5592f5d 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -1091,7 +1091,7 @@ static void tcg_out_addi_ptr(TCGContext *s, TCGReg rd, TCGReg rs,
 {
     /* This function is only used for passing structs by reference. */
     tcg_debug_assert(imm == (int32_t)imm);
-    tcg_out_modrm_offset(s, OPC_LEA, rd, rs, imm);
+    tcg_out_modrm_offset(s, OPC_LEA | P_REXW, rd, rs, imm);
 }
 
 static inline void tcg_out_pushi(TCGContext *s, tcg_target_long val)
-- 
2.34.1


