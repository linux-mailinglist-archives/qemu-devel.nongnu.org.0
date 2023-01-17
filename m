Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F48670CE2
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 00:12:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHv78-0003xp-D6; Tue, 17 Jan 2023 18:11:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHv76-0003wY-Uu
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 18:11:32 -0500
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHv74-0001Tv-1G
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 18:11:31 -0500
Received: by mail-pg1-x52b.google.com with SMTP id g68so22099206pgc.11
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 15:11:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PwXkaDD20Cfx8f1Iebsx9a3a6LNR85MdarseuO3nHWc=;
 b=Be5ivDxAAp/cJ2hHmyLfG52eJufNvFtbVdTHai2XV9Fy+XoMkutDoVCuTmg7wR7BK/
 u0X55tEXa3fwCVJLmBAr2cALULq4VBxt4Nd/rvqmxyF3WW4QN9DdDrXbeKFRMHzyWLFq
 ah4bDdLIOvOM2rYvbqO0ajtgs9thICjfZaBUSUgMVt+vd8Zm2zUboZ0F+aUYVww0h4sT
 ySe+5u0aB6RYT7Vtv5u3LOjveZ8iPPEULiiYg7YsGHQtYHqs64JDm9GbQXxXme+yGmgY
 M4xfT0w0725cS0WV8dW7QCbigPUKfR/OWzSPsoAe241KdwJB5bQIGA0SMiro/A9oQYDL
 ED0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PwXkaDD20Cfx8f1Iebsx9a3a6LNR85MdarseuO3nHWc=;
 b=4B1Hh2U0yunU1a8E02Mv09j6Lt4N7rtUk4J+ivZdWAgv/v0xR2Mr997brHREQ5i3JP
 LFHJRMzjZx9BrLJpXMH6NwBsgdtNwmcBvE/3uLnA+srscRe62HNHoJrYXTEZ96QTJrAH
 8od639t2c3HrhhExyK7RK2nJCdlfAzbtqNYkrXStcMHR+LolaE2VzAqKDNpvrrV35bXE
 h5lBFno0xkx969segWQI5hMHTdw7zSrZjBlU2v77zmAjNq48FQ7MKP4tTc7w9PEkQDsF
 penZA3vbZD9AU4RgYk8m/ygtU/d6Da5VUGcrXjsyojNpx0jN8bLOKdo69XLYbpx/rIy5
 yQbg==
X-Gm-Message-State: AFqh2kpTA8t2meK0+WRg/QAaiEQLV2oFn9myd/5uKilE36ElKiLClMuO
 P+6VVfaMyf9WZQhvVQ/wBabIMuNHshdaQ77x
X-Google-Smtp-Source: AMrXdXtqSOI2u0yXPdDsutZbBx+OaFhTebQPvvwc3Boq0AAeJiwNtx4yPaNB48DVZty9vYlM4lqL9Q==
X-Received: by 2002:a62:5341:0:b0:57f:c170:dc6 with SMTP id
 h62-20020a625341000000b0057fc1700dc6mr4170516pfb.14.1673997088838; 
 Tue, 17 Jan 2023 15:11:28 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 b193-20020a621bca000000b005810c4286d6sm20747070pfb.0.2023.01.17.15.11.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 15:11:28 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 21/22] tcg/riscv: Introduce OPC_NOP
Date: Tue, 17 Jan 2023 13:10:50 -1000
Message-Id: <20230117231051.354444-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230117231051.354444-1-richard.henderson@linaro.org>
References: <20230117231051.354444-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/riscv/tcg-target.c.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index 136fe54d4b..82ca86431e 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -267,6 +267,7 @@ typedef enum {
 #endif
 
     OPC_FENCE = 0x0000000f,
+    OPC_NOP   = OPC_ADDI,   /* nop = addi r0,r0,0 */
 } RISCVInsn;
 
 /*
@@ -403,7 +404,7 @@ static void tcg_out_nop_fill(tcg_insn_unit *p, int count)
 {
     int i;
     for (i = 0; i < count; ++i) {
-        p[i] = encode_i(OPC_ADDI, TCG_REG_ZERO, TCG_REG_ZERO, 0);
+        p[i] = OPC_NOP;
     }
 }
 
-- 
2.34.1


