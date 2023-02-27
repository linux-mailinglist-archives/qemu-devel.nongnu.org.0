Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC2446A3AA6
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 06:41:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWW6M-0004sg-Qy; Mon, 27 Feb 2023 00:31:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW5W-000341-4U
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:30:16 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW5U-0000Lq-7k
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:30:13 -0500
Received: by mail-pj1-x102b.google.com with SMTP id x34so4920869pjj.0
 for <qemu-devel@nongnu.org>; Sun, 26 Feb 2023 21:30:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YHoTHrUgBZpaOPEfBJAi/HMPT06pVs2AARTKGv//H+s=;
 b=XE96EhJN+TaW6zfldy9kaaWagwgVOeCV+R0fCrCyVAa5mKlAS7ZXPHS8LadZFvkeOc
 OJVhlwBUtUO3L1Gq/bu/shyJT/o10aYGxr3CqgF2gQgA58PzqWjKBOOF1lmfd6nbmdwW
 KPJjrVn557j+Z/95YslK+uzaRIvtXVucDIKbx7SD/pyE+f3Fw9CqkKSs+hmWxna2+gb0
 U1dR6ct2Y3kuuAb9THnZqswc+qEb+XDpXRXKB/6KnJsXwjlwrbafcMO8b8u88Ij2yPaW
 TsV5R5nInFMEezpTj0+s4ALPTpkPWXDmQZm8ZYrCPADVDFvbTGBqXkqk0hHTC7I+YRK+
 Kpew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YHoTHrUgBZpaOPEfBJAi/HMPT06pVs2AARTKGv//H+s=;
 b=43w+LBAQWay6QrVXRv7l8vvM/LxEZ1nECUbGIW4Tx/H1Nk6h7zqR0Z+RFS9CBZATzj
 QCX1ujqB/i+PPVOhfcYg+WOHS6j5T86cxC5j52XSxiCUw5qnfwhJV/ybCHqPr5ckVxUm
 dc2Zc2Qu1nDzO7O5JFNX/mBaAPdvj96OmqWWlB6jHCBFnTmnDw24B6/gGPGGn/OCIVNv
 pNqc7/Rkz7AGT/CKrxmh5uMFQIdeMU3ecvGGgdqjIL73c8LxSI/Oaegb88hmEhw4Y/wx
 IapPu/7HqiagHAmdH2VqxIrlWTvfPqoCEW29A7A84MT1vEqsHnhKFm0AAgCaMDZSE3W9
 /Cag==
X-Gm-Message-State: AO0yUKVtiP7tYSuUAY7fnpNYhe3itwZNspASo+ba+OCg7IUQcbbYXrp0
 r4TaVX+fQ9H6ymxv0LgGTjxX1Kgg8tSwPIMYEj4=
X-Google-Smtp-Source: AK7set8Drj87yBFr3iVgLUt+IWpWUXGoQwrbFbIJ56AzWyNnZiiEnuQ7IsN1CgwCVaR4JJHWo3snEw==
X-Received: by 2002:a17:90b:3802:b0:234:6c1a:8d9b with SMTP id
 mq2-20020a17090b380200b002346c1a8d9bmr24451990pjb.0.1677475809908; 
 Sun, 26 Feb 2023 21:30:09 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 v4-20020a17090a520400b002369e16b276sm5172926pjh.32.2023.02.26.21.30.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:30:09 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH v2 43/76] target/mips: Drop tcg_temp_free from
 translate_addr_const.c
Date: Sun, 26 Feb 2023 19:24:32 -1000
Message-Id: <20230227052505.352889-44-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227052505.352889-1-richard.henderson@linaro.org>
References: <20230227052505.352889-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Translators are no longer required to free tcg temporaries.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/tcg/translate_addr_const.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/target/mips/tcg/translate_addr_const.c b/target/mips/tcg/translate_addr_const.c
index 96f483418e..a510da406c 100644
--- a/target/mips/tcg/translate_addr_const.c
+++ b/target/mips/tcg/translate_addr_const.c
@@ -30,10 +30,6 @@ bool gen_lsa(DisasContext *ctx, int rd, int rt, int rs, int sa)
     tcg_gen_shli_tl(t0, t0, sa + 1);
     tcg_gen_add_tl(cpu_gpr[rd], t0, t1);
     tcg_gen_ext32s_tl(cpu_gpr[rd], cpu_gpr[rd]);
-
-    tcg_temp_free(t1);
-    tcg_temp_free(t0);
-
     return true;
 }
 
@@ -54,8 +50,5 @@ bool gen_dlsa(DisasContext *ctx, int rd, int rt, int rs, int sa)
     gen_load_gpr(t1, rt);
     tcg_gen_shli_tl(t0, t0, sa + 1);
     tcg_gen_add_tl(cpu_gpr[rd], t0, t1);
-    tcg_temp_free(t1);
-    tcg_temp_free(t0);
-
     return true;
 }
-- 
2.34.1


