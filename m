Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7794232FD98
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Mar 2021 22:44:19 +0100 (CET)
Received: from localhost ([::1]:48128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIeig-00026y-G9
	for lists+qemu-devel@lfdr.de; Sat, 06 Mar 2021 16:44:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lIebA-0006y9-7A
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 16:36:32 -0500
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:39098)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lIeb6-0002xe-Ic
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 16:36:31 -0500
Received: by mail-pf1-x42f.google.com with SMTP id 18so4646799pfo.6
 for <qemu-devel@nongnu.org>; Sat, 06 Mar 2021 13:36:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xk1GB79AaGUkcV+qDEpBrBCVOi2EqtNfKQnf1wr+BmM=;
 b=uSaziWlkTsvp7WKiKbvVtCTZKB++EvLVWEhZbHsxF4MH8BRvRvTxKTVYBEnH0a+mcj
 W18VjnRi9kyVVcBJYxZ26Cx5rw7GBdEwyhFBadpZ/QDRtOWxqAr/hKgPQIu8rzZ33AsG
 gSEC5USYd61uRGvWChj4XbV9nLRoLwWjaWjzFhGqbu/j6PBrGslA/aNwqXQrL8ApIUXt
 fOALjUlycJ866eLrtVdAUaxv5SOCEUyw/Nv/4nd/8nKOXbCSeqk85T4EfJ5JGwG+XM+Q
 ITZTlC0sn74MqvhwjDH2TZR9/2gwTltV6lBMoKzUV6LCfBuzfFoCKIencfTow0dADeXB
 nFjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xk1GB79AaGUkcV+qDEpBrBCVOi2EqtNfKQnf1wr+BmM=;
 b=uidvlJj2hFhR2hsJIpNOaP1aoM8CfFY6X73/i3MAFuFe51p+TMOdf1tqLDPVyigplu
 /P6lZeCRhdgKGYmZfBwpXZbB6wWj56pcJ2joirptFAj9zcq4SjQYfzioeDOHfws7jddb
 vaW7r69heqKe+xVcO4Rb8ovKgX/IxLWxGpG8GHgPiUEfI9TEOV4zOK0rfeQ5nEGlbSQ5
 bBkCQ982H4rAqcEFYvuIJ61fJ2TGxvza8q1b0LVLGF9X1pqhw4HvXfR8BPatN2wqWv1D
 vqhsvsg1/lpx5GwXMWQ+kLzw0i0qFC5pYIv9qSdTUfyBGBWMsMgQyk1JFdgQXzQc98BG
 Q7OQ==
X-Gm-Message-State: AOAM532bB89r/Nvb5VLxU4JuZZvlk3j/0XHl5iOEo1OPDyKaSczMboWc
 yqI+mB4rU+HC/NqI3NBKJFsvPjWR+3fH6w==
X-Google-Smtp-Source: ABdhPJw0tx6Wh3YKvoNKAu0x9QAkfzTvlhrXts0CT0C5fBwrmT5TMyuehdtZ8IpcuDUmstN80GVF5w==
X-Received: by 2002:a63:1845:: with SMTP id 5mr14508118pgy.244.1615066586903; 
 Sat, 06 Mar 2021 13:36:26 -0800 (PST)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id r30sm6365616pgu.86.2021.03.06.13.36.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Mar 2021 13:36:26 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 11/27] tcg/tci: Merge identical cases in generation (load/store
 opcodes)
Date: Sat,  6 Mar 2021 13:35:57 -0800
Message-Id: <20210306213613.85168-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210306213613.85168-1-richard.henderson@linaro.org>
References: <20210306213613.85168-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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

Use CASE_32_64 and CASE_64 to reduce ifdefs and merge
cases that are identical between 32-bit and 64-bit hosts.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210217202036.1724901-5-richard.henderson@linaro.org>
[PMD: Split patch as 5/5]
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210218232840.1760806-6-f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci/tcg-target.c.inc | 49 ++++++++++++----------------------------
 1 file changed, 14 insertions(+), 35 deletions(-)

diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index f9893b9539..c79f9c32d8 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -440,25 +440,20 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
         tcg_out8(s, args[5]);   /* condition */
         break;
 #endif
-    case INDEX_op_ld8u_i32:
-    case INDEX_op_ld8s_i32:
-    case INDEX_op_ld16u_i32:
-    case INDEX_op_ld16s_i32:
+
+    CASE_32_64(ld8u)
+    CASE_32_64(ld8s)
+    CASE_32_64(ld16u)
+    CASE_32_64(ld16s)
     case INDEX_op_ld_i32:
-    case INDEX_op_st8_i32:
-    case INDEX_op_st16_i32:
+    CASE_64(ld32u)
+    CASE_64(ld32s)
+    CASE_64(ld)
+    CASE_32_64(st8)
+    CASE_32_64(st16)
     case INDEX_op_st_i32:
-    case INDEX_op_ld8u_i64:
-    case INDEX_op_ld8s_i64:
-    case INDEX_op_ld16u_i64:
-    case INDEX_op_ld16s_i64:
-    case INDEX_op_ld32u_i64:
-    case INDEX_op_ld32s_i64:
-    case INDEX_op_ld_i64:
-    case INDEX_op_st8_i64:
-    case INDEX_op_st16_i64:
-    case INDEX_op_st32_i64:
-    case INDEX_op_st_i64:
+    CASE_64(st32)
+    CASE_64(st)
         stack_bounds_check(args[1], args[2]);
         tcg_out_r(s, args[0]);
         tcg_out_r(s, args[1]);
@@ -552,24 +547,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
 #endif
 
     case INDEX_op_qemu_ld_i32:
-        tcg_out_r(s, *args++);
-        tcg_out_r(s, *args++);
-        if (TARGET_LONG_BITS > TCG_TARGET_REG_BITS) {
-            tcg_out_r(s, *args++);
-        }
-        tcg_out_i(s, *args++);
-        break;
-    case INDEX_op_qemu_ld_i64:
-        tcg_out_r(s, *args++);
-        if (TCG_TARGET_REG_BITS == 32) {
-            tcg_out_r(s, *args++);
-        }
-        tcg_out_r(s, *args++);
-        if (TARGET_LONG_BITS > TCG_TARGET_REG_BITS) {
-            tcg_out_r(s, *args++);
-        }
-        tcg_out_i(s, *args++);
-        break;
     case INDEX_op_qemu_st_i32:
         tcg_out_r(s, *args++);
         tcg_out_r(s, *args++);
@@ -578,6 +555,8 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
         }
         tcg_out_i(s, *args++);
         break;
+
+    case INDEX_op_qemu_ld_i64:
     case INDEX_op_qemu_st_i64:
         tcg_out_r(s, *args++);
         if (TCG_TARGET_REG_BITS == 32) {
-- 
2.25.1


