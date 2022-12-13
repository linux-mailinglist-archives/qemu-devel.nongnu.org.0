Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68ABD64BE5D
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 22:27:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5Cn2-0000jx-LO; Tue, 13 Dec 2022 16:26:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p5Cmz-0000im-4v
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 16:26:13 -0500
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p5Cmx-0003Bt-JF
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 16:26:12 -0500
Received: by mail-oi1-x22b.google.com with SMTP id t62so1011753oib.12
 for <qemu-devel@nongnu.org>; Tue, 13 Dec 2022 13:26:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=tSbRzCjHlrSQSoghRByzLuEHEpXHbvdfoP5b3KIKF+c=;
 b=GjMlv7FRRMsK9hP4CDuuondcV4EqJA40IfkY8yIpNhfFyCYdzvZsUr1e6X6XmGWJ+C
 68h5zoTu8/Co81I7GQvXdSGVLKg69vlugXjb5vEHmqTRIjo1XXE7GPTwi7sS3zTHKnpw
 XMqkBw1zjH9vrwsEv9p/bCn4Zbshs07vi3ULGO9AhD0zeJVvkqrl0Ua/DtxYLAaaXam5
 8VSjsip7bf5gSdPy2L/M+gCK2CRjhUNmqdRchmhOSBHiuFY6EFN8KGHqTxBlWCf4Jk6Z
 w8QjZ8+GWXWxqVEZ5SOKgM9mLhTgEeUbxVT0tDLI3LV21socR7Hu/MuDa0/k+DY+9hxr
 2w8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tSbRzCjHlrSQSoghRByzLuEHEpXHbvdfoP5b3KIKF+c=;
 b=ZfRMlEqW1YyVBrA/nqjZIjaiOP82Yll6v8CThKVZioR0sT/YUUzVJj+q0QV3F9Bhjy
 n45vTI7h3/AJszs4ubDlpBsjRjKiKE1rL9ZMpKtpcZzKGAfFGxWFSDyh+EGqZ5ft4u9+
 U6OemIlwVRrcnx29qDridwmDxx2D+uwrOH2vn5fu0x6QLCQiuxccYMoH8Vh34BF+bLgc
 YKLuv20B/KJkbpTKVZh0X0MJsEnbLsjXNrhnUHM4xo8ArktLdM3QQ/scjfftZlPh38Lp
 TFeNcpHsmtADbRGHcDU9ftt4n2v+2NXOwVXwvKDU+ltawxFdrTxmqYrWhuzSQCXV42Ot
 We6g==
X-Gm-Message-State: ANoB5plFW12+OP0uYpNaTHWH5QGMpTro9zM6RL8VPWlU9APllgdgmTxk
 rOhB0TkOl1G3SYpJcU2cSii6Y2Fr6PBk1BOfL88=
X-Google-Smtp-Source: AA0mqf6MrKDhDu01slG51lMTMIDDU8xKXIC54r1BXwN17lmlLtxYmk18K7Gz4se8BY6XuWy8ENLVnA==
X-Received: by 2002:a05:6808:15a7:b0:35c:4a91:79bd with SMTP id
 t39-20020a05680815a700b0035c4a9179bdmr12990980oiw.41.1670966770920; 
 Tue, 13 Dec 2022 13:26:10 -0800 (PST)
Received: from stoup.. ([2806:102e:18:2efc:c63:85ed:4256:8ad0])
 by smtp.gmail.com with ESMTPSA id
 a7-20020a056808098700b0035c073aa0d8sm5006831oic.18.2022.12.13.13.26.09
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Dec 2022 13:26:10 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 26/27] tcg/aarch64: Merge tcg_out_callr into tcg_out_call
Date: Tue, 13 Dec 2022 15:25:40 -0600
Message-Id: <20221213212541.1820840-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221213212541.1820840-1-richard.henderson@linaro.org>
References: <20221213212541.1820840-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22b;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22b.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

There is only one use, and BLR is perhaps even more
self-documentary than CALLR.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.c.inc | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index 344b63e20f..1af879e6f5 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1336,11 +1336,6 @@ static void tcg_out_goto_long(TCGContext *s, const tcg_insn_unit *target)
     }
 }
 
-static inline void tcg_out_callr(TCGContext *s, TCGReg reg)
-{
-    tcg_out_insn(s, 3207, BLR, reg);
-}
-
 static void tcg_out_call(TCGContext *s, const tcg_insn_unit *target)
 {
     ptrdiff_t offset = tcg_pcrel_diff(s, target) >> 2;
@@ -1348,7 +1343,7 @@ static void tcg_out_call(TCGContext *s, const tcg_insn_unit *target)
         tcg_out_insn(s, 3206, BL, offset);
     } else {
         tcg_out_movi(s, TCG_TYPE_I64, TCG_REG_TMP, (intptr_t)target);
-        tcg_out_callr(s, TCG_REG_TMP);
+        tcg_out_insn(s, 3207, BLR, TCG_REG_TMP);
     }
 }
 
-- 
2.34.1


