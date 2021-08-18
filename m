Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E68E63F0CC0
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 22:29:41 +0200 (CEST)
Received: from localhost ([::1]:40766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGSBw-0003Fc-Ue
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 16:29:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGS2U-0008HI-0z
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 16:19:54 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:40608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGS2Q-0006Lu-3O
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 16:19:51 -0400
Received: by mail-pg1-x536.google.com with SMTP id y23so3481434pgi.7
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 13:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=HpQSpkjMY/HVPNmupFN14WCJnZd0Eg9bjbOHuKK4v+k=;
 b=jtVxb4cfisbRGFNexDMxEdL9ceTblFTBKFJkL7HxT6/5rdDnZPJ0WO4r4jrPCaWhKn
 qdNdwPL0oOB221mKImSJHwxnCVEtlZiY6jOUp7nwSN8YDrn/zWHNhSQFmHSYfw0mFn5R
 d99AVgoLVVEmsp+EvObCmyUmkOGTqqAHLcPBFoFS29qJo0YuP6Irpxo5FPGn4XhbgNvp
 d4kZWQFmG0chD8WhYsp/VCvMaVDKXBLzKb4h/oukOWpv3XaE9ahLdUKOQyDw1FGqJLN/
 GPaBZoZHrqHWqJi3drj4b+sLyln1qMBce6yrskGIP0vOAw4qplp+ho8o3n4GeIBRLf4z
 1aLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HpQSpkjMY/HVPNmupFN14WCJnZd0Eg9bjbOHuKK4v+k=;
 b=MTqsQtlcLM7hG3CQSfuPgIW2sZh3cGWlRlFLa8xfmDO/Os1AY/YRe7cG4C2IorkDfx
 rbw1Nq+yfo9FWZ/3sjF62GNFk7qYwosCa1YE+ufG8aJK2oZHaWgetdPPazktuL/EQxFZ
 0VoW92pd3DsR3bj/NwAi9NCdDYEfE6yk5MwKU9wWOHWM4RUvOeFBto/kzR2SjS49D9B4
 0auDjTq3BUVZcDhsGapPi/2g+IoDYh/G+meKC4wo2llf0tZB13G21LWL3tkqgHaLluOn
 vyIN6tW1+MsIDAc8EM8xV/HiRqTghitIdyf4RB3LFXzNu/EP6hqVduCIxXG2rNG4tVxd
 ygJQ==
X-Gm-Message-State: AOAM53126osvbKK6sdCOti1DZzbNjic98RwtS+2E8UChSmM7+KSQsaNe
 JC6FEIIZjJmSZq1pCvzHm/jG9P6RsJKj6g==
X-Google-Smtp-Source: ABdhPJxhazTC2IhgOg08zuiMzNyhopn9ELxiH8qv27SFEmnFU2pExikZYmTKzR9d6L5YRIkpeznU9Q==
X-Received: by 2002:a65:494e:: with SMTP id q14mr10504923pgs.314.1629317988807; 
 Wed, 18 Aug 2021 13:19:48 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id x13sm619621pjh.30.2021.08.18.13.19.48
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 13:19:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 15/16] tcg/mips: Try tb-relative addresses in tcg_out_movi
Date: Wed, 18 Aug 2021 10:19:30 -1000
Message-Id: <20210818201931.393394-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818201931.393394-1-richard.henderson@linaro.org>
References: <20210818201931.393394-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These addresses are often loaded by the qemu_ld/st slow path,
for loading the retaddr value.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/mips/tcg-target.c.inc | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index f641d86561..27a23662c8 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -582,6 +582,8 @@ static void tcg_out_movi_pool(TCGContext *s, TCGReg ret,
 static void tcg_out_movi_int(TCGContext *s, TCGType type, TCGReg ret,
                              tcg_target_long arg, TCGReg tbreg)
 {
+    tcg_target_long tmp;
+
     if (TCG_TARGET_REG_BITS == 64 && type == TCG_TYPE_I32) {
         arg = (int32_t)arg;
     }
@@ -592,6 +594,17 @@ static void tcg_out_movi_int(TCGContext *s, TCGType type, TCGReg ret,
     }
     assert(TCG_TARGET_REG_BITS == 64);
 
+    /* Load addresses within 2GB of TB with 1 or 3 insns. */
+    tmp = tcg_tbrel_diff(s, (void *)arg);
+    if (tmp == (int16_t)tmp) {
+        tcg_out_opc_imm(s, OPC_DADDIU, ret, tbreg, tmp);
+        return;
+    }
+    if (tcg_out_movi_two(s, ret, tmp)) {
+        tcg_out_opc_reg(s, OPC_DADDU, ret, ret, tbreg);
+        return;
+    }
+
     /* Otherwise, put 64-bit constants into the constant pool. */
     tcg_out_movi_pool(s, ret, arg, tbreg);
 }
-- 
2.25.1


