Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B0D6A3AE0
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 06:51:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWWDg-0004P9-Ob; Mon, 27 Feb 2023 00:38:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWCe-000332-SL
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:37:37 -0500
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWCd-0002V3-BR
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:37:36 -0500
Received: by mail-pg1-x530.google.com with SMTP id h31so2838440pgl.6
 for <qemu-devel@nongnu.org>; Sun, 26 Feb 2023 21:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o/EjYc2nVUGmJDjgiY+6sooQV/WDkGEXpQsAaSq1iFA=;
 b=YT6jOUiBrbX3oGd2PhE4NgjvtF1tNzSZ+O8na1jDHSBxIIAlwb+vXgPI5q/brU8tWd
 Q8ENE7KuwVBGui764pi+f+yD8Qn9FBfmyH2fLQn3x4AFT1L/dWMGrklVkyS8sDaUlR45
 LmnuX9e1UVP7SZqQeJYSwi18UAyzuGwxVStAv6u1hME9oepfyEJGBaSaClUZptaxF377
 mACMe+OLbrS6OoHRHms/jVDG4RXljBrPKvGw1ZXu9NBeOEIbQxp0hocCjujaiz8iXWBD
 Ww6444SnFOuiOK+fCSC+MqbXQ0vxoLjF6yB+8IFqEuDSjt2Mrjr3MwXJj1TUE5eOsdw/
 XXvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o/EjYc2nVUGmJDjgiY+6sooQV/WDkGEXpQsAaSq1iFA=;
 b=Z6cXh8puL3wuBi+/4/rrTW65iVn6GdY83sgMt6/pTNbwl4GArYSwEZq+SXkFeeBJ1x
 7sRGNQsxIrTV+ejZAPvUwHFhb4DNgVxZH1oqphAmwPGYPwBxzug4T3fJzv2ewUZIBsfq
 sxEJP39Gqz/h2VMNiQXAjaKf0Q+poXnKPPouAOshAjlxtr7uQi/Ipr35w0vY3UiA8OXd
 LQTp9maPl6lvAIzLBeEbMLVMcItGBnvYGMoPG5KhNLLq8OOeB6HL0ReoVPabAkwc/Qwh
 tib8J7G8tFxpedRlhbSik1qyLFBEUb+SBtvSl1kMfJkIg/CtKOrZs+OkwjwjPkL40spQ
 xAxQ==
X-Gm-Message-State: AO0yUKVqEduj+3jgMb4wNrB9TWFssWS4Wuq/7Dn67HSZP7lHZtiVLlgg
 fz2zMbxv9fUBMIcvvnFm/RLjDABlW1ucrJqKTFs=
X-Google-Smtp-Source: AK7set9wD8JI2IP/JGjjzUpqGHBNNlAMqJHE7pn56gTmR5z1lRq5/i6/j6nZY+4gaQCFRaiB/AjCHg==
X-Received: by 2002:aa7:8882:0:b0:5a8:e3d5:d7d4 with SMTP id
 z2-20020aa78882000000b005a8e3d5d7d4mr9489088pfe.7.1677476253963; 
 Sun, 26 Feb 2023 21:37:33 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 k12-20020aa792cc000000b005a7c892b435sm3342137pfa.25.2023.02.26.21.37.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:37:33 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v4 10/31] tcg: Use tcg_constant_i32 in tcg_gen_io_start
Date: Sun, 26 Feb 2023 19:36:40 -1000
Message-Id: <20230227053701.368744-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227053701.368744-1-richard.henderson@linaro.org>
References: <20230227053701.368744-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/gen-icount.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/include/exec/gen-icount.h b/include/exec/gen-icount.h
index c57204ddad..4d8b1f9ae5 100644
--- a/include/exec/gen-icount.h
+++ b/include/exec/gen-icount.h
@@ -10,11 +10,9 @@ static TCGOp *icount_start_insn;
 
 static inline void gen_io_start(void)
 {
-    TCGv_i32 tmp = tcg_const_i32(1);
-    tcg_gen_st_i32(tmp, cpu_env,
+    tcg_gen_st_i32(tcg_constant_i32(1), cpu_env,
                    offsetof(ArchCPU, parent_obj.can_do_io) -
                    offsetof(ArchCPU, env));
-    tcg_temp_free_i32(tmp);
 }
 
 static inline void gen_tb_start(const TranslationBlock *tb)
-- 
2.34.1


