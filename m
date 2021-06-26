Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 853623B4D29
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Jun 2021 08:42:05 +0200 (CEST)
Received: from localhost ([::1]:35200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lx20y-0007Q9-KF
	for lists+qemu-devel@lfdr.de; Sat, 26 Jun 2021 02:42:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lx1vl-0001tf-Bq
 for qemu-devel@nongnu.org; Sat, 26 Jun 2021 02:36:41 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:42496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lx1vi-0000I5-LX
 for qemu-devel@nongnu.org; Sat, 26 Jun 2021 02:36:40 -0400
Received: by mail-pg1-x532.google.com with SMTP id d12so10117601pgd.9
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 23:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YG56GEd6EE9U8N/emoRIIwHrWk0AxFerNcV6hPIns7o=;
 b=iatTEIX+f3DuMZqnA8qGkL7kTXNfWotVB2BbBTWwDgCae4fiZyrsKR/a4eyT/fO4/I
 rTGMvYadqVxFSXfAFgaIcv9pciWjQttnWjalNEznn1ZUfddbQWeIWzTj5k1i6COrdlNk
 LokW3obz92+v2pPDV+pbQq4FBqtjcjDJqNLRGAr9vE3bWS+eQIyhyt1Ec8P+Dqp7EyvN
 X4E9t6K5okFItZc0r6szw7zepijEqR4t52DEuYEvSFdmsmwtb3ehkRvzFFimYuSwfxXN
 Lw5KVtarS4tNQmdkLKjyT0DpmYAO2vKTdUK1JzJaKarDhjxsGXWvv12dEnYp72hOa+5a
 IK7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YG56GEd6EE9U8N/emoRIIwHrWk0AxFerNcV6hPIns7o=;
 b=ngYmIx1S3RkA1ZT8QJ2Pzh52aEvPho5M+nKH+D054WY49KzDazowfh2O8qpc4V+lef
 +WvDaQH9WusAwJ54nSVTUF/5fhxOgoBOY/GDdIl9FzZ09iYzhFyXzD6tslM5++xdSFbB
 iLxY8amP03u2e8vzJPBNOOgnfvOhmczSKCxda/J/wUXEdBGSCROLjuHp0K1UodRAixgY
 6jCkeCkey8bdnqW0tFs6d0JYqKa9s4h5ob35AiUKjivyFSdUw0xQlZ5MNhDpYmxLEYak
 yNaAqhJ13wD5pIuZmwspRvWihnWIuY0OpARH+EyO5p9kQFcE3T7F4rVh45ngbuFlgIyk
 /Kqw==
X-Gm-Message-State: AOAM531fd9SlbS5uOEljl7KJqB0N5AlhXEfZO6RShYZOwo51ZKEwQE13
 2QyxQU9vWd3wabPSx5AJkhYWgnOSwRflyQ==
X-Google-Smtp-Source: ABdhPJyI0QJLOYkTMlOFClnvoNtkUUacD5lTt0vTOBhUtu+VRwi6Qu9GvKkyaNt6tLL6ilXVE12lSA==
X-Received: by 2002:a05:6a00:1c6a:b029:304:2fb8:7ef4 with SMTP id
 s42-20020a056a001c6ab02903042fb87ef4mr14273722pfw.16.1624689397527; 
 Fri, 25 Jun 2021 23:36:37 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id v9sm7724201pgq.54.2021.06.25.23.36.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 23:36:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 08/29] tcg/ppc: Split out tcg_out_bswap16
Date: Fri, 25 Jun 2021 23:36:10 -0700
Message-Id: <20210626063631.2411938-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210626063631.2411938-1-richard.henderson@linaro.org>
References: <20210626063631.2411938-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

With the use of a suitable temporary, we can use the same
algorithm when src overlaps dst.  The result is the same
number of instructions either way.

Cc: qemu-ppc@nongnu.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/ppc/tcg-target.c.inc | 34 +++++++++++++++++++---------------
 1 file changed, 19 insertions(+), 15 deletions(-)

diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index 50347182d7..ad46ce32ca 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -789,6 +789,24 @@ static inline void tcg_out_sari64(TCGContext *s, TCGReg dst, TCGReg src, int c)
     tcg_out32(s, SRADI | RA(dst) | RS(src) | SH(c & 0x1f) | ((c >> 4) & 2));
 }
 
+static void tcg_out_bswap16(TCGContext *s, TCGReg dst, TCGReg src)
+{
+    TCGReg tmp = dst == src ? TCG_REG_R0 : dst;
+
+    /*
+     * In the following,
+     *   dep(a, b, m) -> (a & ~m) | (b & m)
+     *
+     * Begin with:                              src = xxxxabcd
+     */
+    /* tmp = rol32(src, 24) & 0x000000ff            = 0000000c */
+    tcg_out_rlw(s, RLWINM, tmp, src, 24, 24, 31);
+    /* tmp = dep(tmp, rol32(src, 8), 0x0000ff00)    = 000000dc */
+    tcg_out_rlw(s, RLWIMI, tmp, src, 8, 16, 23);
+
+    tcg_out_mov(s, TCG_TYPE_REG, dst, tmp);
+}
+
 /* Emit a move into ret of arg, if it can be done in one insn.  */
 static bool tcg_out_movi_one(TCGContext *s, TCGReg ret, tcg_target_long arg)
 {
@@ -2779,21 +2797,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
 
     case INDEX_op_bswap16_i32:
     case INDEX_op_bswap16_i64:
-        a0 = args[0], a1 = args[1];
-        /* a1 = abcd */
-        if (a0 != a1) {
-            /* a0 = (a1 r<< 24) & 0xff # 000c */
-            tcg_out_rlw(s, RLWINM, a0, a1, 24, 24, 31);
-            /* a0 = (a0 & ~0xff00) | (a1 r<< 8) & 0xff00 # 00dc */
-            tcg_out_rlw(s, RLWIMI, a0, a1, 8, 16, 23);
-        } else {
-            /* r0 = (a1 r<< 8) & 0xff00 # 00d0 */
-            tcg_out_rlw(s, RLWINM, TCG_REG_R0, a1, 8, 16, 23);
-            /* a0 = (a1 r<< 24) & 0xff # 000c */
-            tcg_out_rlw(s, RLWINM, a0, a1, 24, 24, 31);
-            /* a0 = a0 | r0 # 00dc */
-            tcg_out32(s, OR | SAB(TCG_REG_R0, a0, a0));
-        }
+        tcg_out_bswap16(s, args[0], args[1]);
         break;
 
     case INDEX_op_bswap32_i32:
-- 
2.25.1


