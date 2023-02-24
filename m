Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BBB06A21FB
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 20:03:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVdJm-0001go-Ug; Fri, 24 Feb 2023 14:01:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pVdJi-0001eU-Vg
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 14:01:14 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pVdJe-0002er-Ef
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 14:01:14 -0500
Received: by mail-pj1-x1034.google.com with SMTP id l1so51765pjt.2
 for <qemu-devel@nongnu.org>; Fri, 24 Feb 2023 11:01:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677265269;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LNYI9dmX50T6dGo7VdQuyO6akiZafXJYK1pmz8lKKOc=;
 b=azLaETNcBSd/1qj/mncSqkf9N7m7dRnnstusmkRrT/PadgC9NtPLcsoWKRMw+La+fD
 QQhzUBM+yudHJLhXOUeq580MPnR3tTQE6CYKSN6uhd27/TftUn0Y0sWXrYNXpoioP32a
 ZM2HOtIOXQsEyMxE5RnCvxdTafa56VYzLVjce2/Bkp7MO2eFgneapOAo5bS/UnIrXH+s
 kLjJE0uTBMDa/RKzK0WdayL0FN8hOSw29I9bYYQ7pEpPzPjdR81e206aC6gyE8qUjPJ3
 eyXbKJ1OEqsMtq2lf+vsfjWTYBmK0lePDgbeNme6yCjoYsOq+fhwMXxiwQHAEoEF7sVK
 UOgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677265269;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LNYI9dmX50T6dGo7VdQuyO6akiZafXJYK1pmz8lKKOc=;
 b=NKnEi3ZTZY6spBJVXW3Na0G3LU4X3IEsi+uQVRXUoduLsfqOrxP2S2RR8Ib3clJqmo
 9dy8mxxBw6HQB0sxRY3WMX5NNv1w24hkMdEKY2du5YRGGX8Upnj23cOND5/bx/9COkR1
 t3DqORKsuiIlbk6ttbz2yTenCsjDnPcLWHv/L+zRN4enZb7wcjscrYoyu1smKfWWbTXB
 dv+1D+UujaIFFrW9fJuvG9BjxNSHIaqdaPraXKBg2b33V5udP3AG4DYmjZgBXfkGl2OD
 gC52LrKqqO3RldJapDBRWwQp6POCzW014HhXZ8UNDhzbhgNa9gig75F8fI2k22YGiGL/
 bxSA==
X-Gm-Message-State: AO0yUKWrIOU85HgzfVWzGD/mMeOZmeza7FH+tLN+cLaAfNHl9qcDTsrD
 XrpCXFHpwZCCx91lWXiBT+pN0Q==
X-Google-Smtp-Source: AK7set/xfHOGTxTDaE0g2Bi9OyC2+byN/Gl0V+6hFt2A9V/VY6avfYrbf/DuBunpU4IpKai707a65w==
X-Received: by 2002:a17:902:dad1:b0:198:9683:9f0a with SMTP id
 q17-20020a170902dad100b0019896839f0amr18581562plx.30.1677265269171; 
 Fri, 24 Feb 2023 11:01:09 -0800 (PST)
Received: from localhost ([135.180.224.71]) by smtp.gmail.com with ESMTPSA id
 c14-20020a170902b68e00b0019c912c19d3sm7678485pls.62.2023.02.24.11.01.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 11:01:08 -0800 (PST)
Subject: [PULL 7/8] target/riscv: avoid env_archcpu() in cpu_get_tb_cpu_state()
Date: Fri, 24 Feb 2023 10:59:08 -0800
Message-Id: <20230224185908.32706-8-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230224185908.32706-1-palmer@rivosinc.com>
References: <20230224185908.32706-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 ilippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
 Weiwei Li <liweiwei@iscas.ac.cn>, Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=palmer@rivosinc.com; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

We have a RISCVCPU *cpu pointer available at the start of the function.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <20230210123836.506286-1-dbarboza@ventanamicro.com>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 target/riscv/cpu_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index ad8d82662c..3a9472a2ff 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -60,7 +60,7 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
          * which is not supported by GVEC. So we set vl_eq_vlmax flag to true
          * only when maxsz >= 8 bytes.
          */
-        uint32_t vlmax = vext_get_vlmax(env_archcpu(env), env->vtype);
+        uint32_t vlmax = vext_get_vlmax(cpu, env->vtype);
         uint32_t sew = FIELD_EX64(env->vtype, VTYPE, VSEW);
         uint32_t maxsz = vlmax << sew;
         bool vl_eq_vlmax = (env->vstart == 0) && (vlmax == env->vl) &&
-- 
2.39.0


