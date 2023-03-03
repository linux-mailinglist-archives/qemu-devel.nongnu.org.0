Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9A36A92CA
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 09:43:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY0zG-00086B-4H; Fri, 03 Mar 2023 03:41:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0zA-00082M-HB
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 03:41:52 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0z8-0007n9-Nr
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 03:41:52 -0500
Received: by mail-pj1-x1035.google.com with SMTP id l1so1811408pjt.2
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 00:41:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677832910;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dje010AVV2QeyT/FX8byAIDnwjz48KiaRt3orgmfVv8=;
 b=AG2+x8MM7CaNbBIWYD8C0jVL5biCj8aqVwEYTfszSxWvSGn64u3+xU21AE/kV1ydKh
 FdBSY9LsIaF6xYmfRaQHhZBGaXrKBsxjOG1vRs+41XbfB+kztEyaN3vkSPqpnvPRYKLW
 FVxdAXyuFyiL6iYU7N4RwFKbktNnHe0A7IAbiZHbQ72mNC3qU7IB2Z1C50PPmy6ABDMh
 ON2l56DsXYvyU0OuvLiXbEvOfAEHVHSynmis5P4Y1TeoZ9fBwXy34uiUXvbb3XuxtlLU
 crh64Vq0+692e6Y04mbs0ZXcWSfyNlJaAJ2r/GZXXMhtlD/Pp/urlhlQmrvw7fEwhxV4
 4RqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677832910;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dje010AVV2QeyT/FX8byAIDnwjz48KiaRt3orgmfVv8=;
 b=MgNH2FfLLtArHdEga83H6e5bSIo6GpGgMMWnmminMWGqvlYLdAx0aNqsNy8uKvsQCD
 SWDpIJyLm7x1lXzM/uEl/eNejRUb7oqYUIcZT68W7SrVG30erjQrsTEXM9EqvgQrRN8V
 IMQA+0mgSoZVYXnxrc9OuNLC8lSNKBpRZXtOPsTRbGkUnaw9fur2/8vDpbt02OYvqMyI
 ytZVbM7EJHn3TD111BRJqmSi969lRlrpu60KJozcsNSzJNXYga1GOewyo55BTWniXvzy
 Jj7V7o7mGINlXerhugTyP0JPG2P8tIjERPwHaWdbbYrV/omKJCOG/GrqZF5Z3jC5X4CT
 vd+Q==
X-Gm-Message-State: AO0yUKVdDcmc6emDRXRX8RSymkIroZKBBJW9bgOvlDabffj5EHwvsY4R
 2eQeXDBUxQamaoBlwFPjoU1dvQ==
X-Google-Smtp-Source: AK7set/c8y9Vn/ZPgDHxB+vMXOhGvlNK/LN/FVUs8xh9ZoC3qAzRJQNbzly5tDtbhS3KBFA5Wi2stA==
X-Received: by 2002:a05:6a20:c510:b0:cc:ac05:88f7 with SMTP id
 gm16-20020a056a20c51000b000ccac0588f7mr1111818pzb.34.1677832909947; 
 Fri, 03 Mar 2023 00:41:49 -0800 (PST)
Received: from localhost ([135.180.224.71]) by smtp.gmail.com with ESMTPSA id
 m8-20020aa79008000000b005dae7d1b61asm1022277pfo.154.2023.03.03.00.41.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 00:41:49 -0800 (PST)
Subject: [PULL 23/59] target/riscv: Simplify check for EEW = 64 in
 trans_rvv.c.inc
Date: Fri,  3 Mar 2023 00:37:04 -0800
Message-Id: <20230303083740.12817-24-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230303083740.12817-1-palmer@rivosinc.com>
References: <20230303083740.12817-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Weiwei Li <liweiwei@iscas.ac.cn>, Junqiang Wang <wangjunqiang@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=palmer@rivosinc.com; helo=mail-pj1-x1035.google.com
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

From: Weiwei Li <liweiwei@iscas.ac.cn>

Only V extension supports EEW = 64 in these cases: Zve64* extensions don't
support EEW = 64 in these cases as commented before the check.

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Message-ID: <20230215020539.4788-14-liweiwei@iscas.ac.cn>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 5dbdce073b..fc0d0d60e8 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -1998,8 +1998,7 @@ static bool vmulh_vv_check(DisasContext *s, arg_rmrr *a)
      * are not included for EEW=64 in Zve64*. (Section 18.2)
      */
     return opivv_check(s, a) &&
-           (!has_ext(s, RVV) &&
-            s->cfg_ptr->ext_zve64f ? s->sew != MO_64 : true);
+           (!has_ext(s, RVV) ? s->sew != MO_64 : true);
 }
 
 static bool vmulh_vx_check(DisasContext *s, arg_rmrr *a)
@@ -2012,8 +2011,7 @@ static bool vmulh_vx_check(DisasContext *s, arg_rmrr *a)
      * are not included for EEW=64 in Zve64*. (Section 18.2)
      */
     return opivx_check(s, a) &&
-           (!has_ext(s, RVV) &&
-            s->cfg_ptr->ext_zve64f ? s->sew != MO_64 : true);
+           (!has_ext(s, RVV) ? s->sew != MO_64 : true);
 }
 
 GEN_OPIVV_GVEC_TRANS(vmul_vv,  mul)
@@ -2230,8 +2228,7 @@ static bool vsmul_vv_check(DisasContext *s, arg_rmrr *a)
      * for EEW=64 in Zve64*. (Section 18.2)
      */
     return opivv_check(s, a) &&
-           (!has_ext(s, RVV) &&
-            s->cfg_ptr->ext_zve64f ? s->sew != MO_64 : true);
+           (!has_ext(s, RVV) ? s->sew != MO_64 : true);
 }
 
 static bool vsmul_vx_check(DisasContext *s, arg_rmrr *a)
@@ -2242,8 +2239,7 @@ static bool vsmul_vx_check(DisasContext *s, arg_rmrr *a)
      * for EEW=64 in Zve64*. (Section 18.2)
      */
     return opivx_check(s, a) &&
-           (!has_ext(s, RVV) &&
-            s->cfg_ptr->ext_zve64f ? s->sew != MO_64 : true);
+           (!has_ext(s, RVV) ? s->sew != MO_64 : true);
 }
 
 GEN_OPIVV_TRANS(vsmul_vv, vsmul_vv_check)
-- 
2.39.2


