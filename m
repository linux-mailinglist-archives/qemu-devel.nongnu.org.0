Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B1A29FA79
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Oct 2020 02:21:19 +0100 (CET)
Received: from localhost ([::1]:54596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kYJ6U-0000GM-C6
	for lists+qemu-devel@lfdr.de; Thu, 29 Oct 2020 21:21:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kYIc2-0004Rt-Ds
 for qemu-devel@nongnu.org; Thu, 29 Oct 2020 20:49:50 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:38657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kYIbz-0001sI-UF
 for qemu-devel@nongnu.org; Thu, 29 Oct 2020 20:49:50 -0400
Received: by mail-pl1-x635.google.com with SMTP id f21so2146100plr.5
 for <qemu-devel@nongnu.org>; Thu, 29 Oct 2020 17:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YKIoLTi5ySgzCVvhycZMdw7nP6Jv58IFUwkqltF23wU=;
 b=mScoixdVx+TtBqenU66+xOra942st+OgP4Svs5Ueve67MSHyNLMzdn05PihLgnOUv4
 3ml6ENvYnBGyveWV+ThOUGI1SORqm27Hp02vOU/3tgZD/T7dK3NJ/323lw4MT4VVm1Qk
 HF3y7j+LYF1G+U8/J8bCJjf8w5lx+S4A+0uOroILzU3+Q80me8bmEiJFleWlx+Eu0/vF
 6FqzJgos5YFZsZ1mOuuqKXS3HLl5oS9PhUHY6ICz5R9C/5C4txAHE5RZOuII5LwUCq9S
 9iUyuGLnzn8ilpwtPqdvGA3DCqh0UvZv/krk1GnUJOkRsRawI5TRIUAfbJ7Gh6/p1vpF
 Ip9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YKIoLTi5ySgzCVvhycZMdw7nP6Jv58IFUwkqltF23wU=;
 b=rLoqUrSOOhAXw1tElLP7k/sGZ0k8vSrdTNOzY6E9jUnjBLMjjboI6CXQ0PMvL3/ZFE
 T76wr3n6dBBcXz4/nFnXQymRR8hbWBryoIJSl5/n4mcC8x5JGKh6pmH3s+rnIkTsBEAv
 FftIwOCaLdEabh0RWW8cqmxGLLGIAWrITT9pKoel2V2LznQR7u/q9ARm5C16Ro3Wvj65
 JS0ruv/frLngHOQO1UqjUG82tU/u1xvJ/YFOwSNCraQcjDSFvAbCyFqaN26G50FhIZ1K
 qe7/zadP9Up3IvCcuHjP7DDfbC+mx/SvNtwE/DzMBhaFNSbgyWp8Kg7mWugz9WfnjZxX
 4eFg==
X-Gm-Message-State: AOAM530ridE8hIuamjO0XtjOex9Ta30IXu77uZV3Rgk5KiW42147hWAY
 OwPkqFZFKuHoUB+d7kd0uogV57tOYK7feg==
X-Google-Smtp-Source: ABdhPJwbCZaDGEjOM4Q8ura3Ky/hNL72DbKqz1CoT/RFZjnRh6wxAZ6D4NlwOpiYppYAOJ7NB26RjQ==
X-Received: by 2002:a17:902:758d:b029:d6:57ea:a434 with SMTP id
 j13-20020a170902758db02900d657eaa434mr6151776pll.83.1604018986241; 
 Thu, 29 Oct 2020 17:49:46 -0700 (PDT)
Received: from localhost.localdomain ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id b6sm3557264pgq.58.2020.10.29.17.49.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2020 17:49:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 17/19] tcg/aarch64: Use B not BL for tcg_out_goto_long
Date: Thu, 29 Oct 2020 17:49:19 -0700
Message-Id: <20201030004921.721096-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201030004921.721096-1-richard.henderson@linaro.org>
References: <20201030004921.721096-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: pbonzini@redhat.com, j@getutm.app, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A typo generated a branch-and-link insn instead of plain branch.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.c.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index fea784cf75..bd888bc66d 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1317,7 +1317,7 @@ static inline void tcg_out_goto_long(TCGContext *s, tcg_insn_unit *target)
 {
     ptrdiff_t offset = target - s->code_ptr;
     if (offset == sextract64(offset, 0, 26)) {
-        tcg_out_insn(s, 3206, BL, offset);
+        tcg_out_insn(s, 3206, B, offset);
     } else {
         tcg_out_movi(s, TCG_TYPE_I64, TCG_REG_TMP, (intptr_t)target);
         tcg_out_insn(s, 3207, BR, TCG_REG_TMP);
-- 
2.25.1


