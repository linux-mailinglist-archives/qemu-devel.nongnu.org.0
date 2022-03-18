Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C91994DDAAD
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 14:38:23 +0100 (CET)
Received: from localhost ([::1]:57882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVCoA-0006dd-TX
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 09:38:22 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nVCZh-0006cI-7m
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 09:23:25 -0400
Received: from [2a00:1450:4864:20::433] (port=44830
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nVCZf-0002CH-Hy
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 09:23:24 -0400
Received: by mail-wr1-x433.google.com with SMTP id b19so11706660wrh.11
 for <qemu-devel@nongnu.org>; Fri, 18 Mar 2022 06:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=BdSqB/hxDC2NJFyRoZAEcCAYDQy1ee8PfJktNbNz4sU=;
 b=xMbYwIsKRiGpbPJN6kwPkm6m+Gi/7F2SpZV0C1BUV0lxHW+o/jWBzMPk95wXmae8Z1
 K/27gbOmmVnM+lUK3SHi6Ycil9HKgQaEdfobiKr4J/5b509WCdLLmlzG/q0fUMm53qYz
 SRPGzx5XDO3R9P4+VwjmWSMvJuNTjIe4kJAjXZAjgWJ6MRJwg5xx8ULvSU30h8+IofhO
 CvkEhQ/tCb0b/y8+QstUwy4DMUmVpYJsiKAjBLPobOxFRT/KAmO4IHkG6FdeMCo8x3rt
 /Ox2LDt9JUfO8xOmfS+nrewsPhC6zpiI/gFDAmP1ScxdQrW2c3K7OQ1Kc7WUlMK0BDu1
 k3rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BdSqB/hxDC2NJFyRoZAEcCAYDQy1ee8PfJktNbNz4sU=;
 b=7S3HNmSu/lXIlmSO+GytJgnWX5Q0CxQVFUnP7g95R2tXEfYJY3TSIcjVrBh4uuZb+7
 560LYMdyA+X0dWcwL23R22ujGMoL0vc9TxBXtnKEMT+iYPs38SZjQCKXMzQmrkuyIf7g
 QahnN9/DM0a4flmwaNIc8qoYgckIef54tSXFk0OGRpa2sjk8lWYx2z3RvmUcHzL2TUfG
 vuFdFNYEmhVvJbkj+KndGIljdNxqhO4dawln4MukLkUT+h+Mo2UaHO6SFb5wmWDoXpRO
 t7aUHLY0QaV+X9Xn+F9VBznZbuhrx4IAaJepat49lSRQJlbc04PaYU89vTnNoqZ12BiG
 xcVw==
X-Gm-Message-State: AOAM5310OYkzrNpltn62m3Vj8X9WIa0WftBfAAkDN9Op0Vj7vi7uOwai
 YygCU+qy3l141EIU18ox2LsyC0CcTQtCiA==
X-Google-Smtp-Source: ABdhPJxfFmyNCDbhven6Hsl4+d5OxAhErrGo9+cDubuJa9c0jft1hzBMF6hlAybZi5z0GVHXQgoqGg==
X-Received: by 2002:adf:a35e:0:b0:1f0:9f2:a65e with SMTP id
 d30-20020adfa35e000000b001f009f2a65emr8094244wrb.535.1647609802121; 
 Fri, 18 Mar 2022 06:23:22 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 y15-20020a05600015cf00b00203e324347bsm6316599wry.102.2022.03.18.06.23.21
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Mar 2022 06:23:21 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 12/21] target/arm: Log fault address for M-profile faults
Date: Fri, 18 Mar 2022 13:22:57 +0000
Message-Id: <20220318132306.3254960-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220318132306.3254960-1-peter.maydell@linaro.org>
References: <20220318132306.3254960-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For M-profile, the fault address is not always exposed to the guest
in a fault register (for instance the BFAR bus fault address register
is only updated for bus faults on data accesses, not instruction
accesses).  Currently we log the address only if we're putting it
into a particular guest-visible register.  Since we always have it,
log it generically, to make logs of i-side faults a bit clearer.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-id: 20220315204306.2797684-3-peter.maydell@linaro.org
---
 target/arm/m_helper.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
index 3bd16c0c465..b7a0fe01141 100644
--- a/target/arm/m_helper.c
+++ b/target/arm/m_helper.c
@@ -2272,7 +2272,13 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
          * Note that for M profile we don't have a guest facing FSR, but
          * the env->exception.fsr will be populated by the code that
          * raises the fault, in the A profile short-descriptor format.
+         *
+         * Log the exception.vaddress now regardless of subtype, because
+         * logging below only logs it when it goes into a guest visible
+         * register.
          */
+        qemu_log_mask(CPU_LOG_INT, "...at fault address 0x%x\n",
+                      (uint32_t)env->exception.vaddress);
         switch (env->exception.fsr & 0xf) {
         case M_FAKE_FSR_NSC_EXEC:
             /*
-- 
2.25.1


