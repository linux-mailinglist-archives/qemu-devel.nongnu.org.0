Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6D06AB3BB
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 01:41:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYytw-0004SQ-6s; Sun, 05 Mar 2023 19:40:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYytc-0004PD-Ky
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:40:09 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYyta-0006Zj-JS
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:40:08 -0500
Received: by mail-pl1-x636.google.com with SMTP id n6so8512168plf.5
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 16:40:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678063204;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=07DvNEQN6ya7xMt+CBzeTMYjrYnBsPy3UDNRCngWab0=;
 b=Et2xGaVAX4RotZoTpBUqE3H/QTN0Xqsl5bZh4XT4WnqAe6S6WKmMyWCAdZ4WjUvRhM
 nt4o3+avggl98xAGo5GqLV3jhZtu2PL19DVNr2rmD77qXbWtFJq5iT0Tuf1swsc4Y6fY
 tTkLYVs1f+ypwmNeT9R2SwabCOQQ5eYoWI7GnYKT4PbHv4+QWbtkKMrCxLdMXd9Hdg/X
 N/II07RDDOxZcMv/9B6B8zfjhiIpdPHa1VSXSCEodBcTk63/rWo4Tk0Ho8T+CNylv1Ms
 OY5xHWzQ2VH2GK/yhBV9hZrNR99wZ9NN4sJs9bI6tgQx6hn/Ak2cTnBUyf0HLaJdnxXK
 E1zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678063204;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=07DvNEQN6ya7xMt+CBzeTMYjrYnBsPy3UDNRCngWab0=;
 b=Za/l+Y3eC+DrsoLiOcmLeo5dSW9q5pLnHVmUC5B9SB/ufntdIzGHoLJQt04bKjgoUo
 7t24WqUKTHwPhiW7Oiys3JhTVRq51cb0a8QYt0IetAmGy86hXcz2DPd22hEiylwJmpn+
 qf3GQwvo8e59JnDsMjoobe31o06c/UhIfVDwV/39HlbxHjBQbDhuOpqOGdFOrzSLxom6
 cIe1d2SZ0xCk45mxRLMUOyy6+Hs7b1LI4YeCmtJ3jZJ9/gTneOLt5DrmosKWDHPrky6S
 Iu2VoNm4GgYFOn2gF54tP/kJ65Kkd5PGMshizAj7wGHaIT4Jz/7vMIAyl10kKmMRKHv2
 0Q0w==
X-Gm-Message-State: AO0yUKXa+BgEKFNGMd15xdGTP6HU8wPMmqkqoys0qwsUtqmeuaska1fp
 tMGrkgY8Z23cxi+8bnSznTTl/abF+f9edrXbs8xlVA==
X-Google-Smtp-Source: AK7set8HtOreUuvlU3oJBqFwkWbzpF3Ps9fS+d7XwnNPi26qQwI/Ommd8loCqENtnNl0bvQB8OS/sg==
X-Received: by 2002:a17:90b:2241:b0:237:29b1:1893 with SMTP id
 hk1-20020a17090b224100b0023729b11893mr9005258pjb.46.1678063204640; 
 Sun, 05 Mar 2023 16:40:04 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:87cc:49bb:2900:c08b])
 by smtp.gmail.com with ESMTPSA id
 r13-20020a17090b050d00b002372106a5c2sm6567901pjz.37.2023.03.05.16.40.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Mar 2023 16:40:04 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 10/84] tcg/i386: Mark Win64 call-saved vector regs as reserved
Date: Sun,  5 Mar 2023 16:38:40 -0800
Message-Id: <20230306003954.1866998-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230306003954.1866998-1-richard.henderson@linaro.org>
References: <20230306003954.1866998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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

While we do not include these in tcg_target_reg_alloc_order,
and therefore they ought never be allocated, it seems safer
to mark them reserved as well.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 028ece62a0..4060a35cf6 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -4218,6 +4218,19 @@ static void tcg_target_init(TCGContext *s)
 
     s->reserved_regs = 0;
     tcg_regset_set_reg(s->reserved_regs, TCG_REG_CALL_STACK);
+#ifdef _WIN64
+    /* These are call saved, and we don't save them, so don't use them. */
+    tcg_regset_set_reg(s->reserved_regs, TCG_REG_XMM6);
+    tcg_regset_set_reg(s->reserved_regs, TCG_REG_XMM7);
+    tcg_regset_set_reg(s->reserved_regs, TCG_REG_XMM8);
+    tcg_regset_set_reg(s->reserved_regs, TCG_REG_XMM9);
+    tcg_regset_set_reg(s->reserved_regs, TCG_REG_XMM10);
+    tcg_regset_set_reg(s->reserved_regs, TCG_REG_XMM11);
+    tcg_regset_set_reg(s->reserved_regs, TCG_REG_XMM12);
+    tcg_regset_set_reg(s->reserved_regs, TCG_REG_XMM13);
+    tcg_regset_set_reg(s->reserved_regs, TCG_REG_XMM14);
+    tcg_regset_set_reg(s->reserved_regs, TCG_REG_XMM15);
+#endif
 }
 
 typedef struct {
-- 
2.34.1


