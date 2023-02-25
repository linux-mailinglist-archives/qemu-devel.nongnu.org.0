Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED98D6A282E
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Feb 2023 10:17:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVqeJ-0005NS-BM; Sat, 25 Feb 2023 04:15:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqeG-0005FC-LW
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:15:20 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqeE-0001hH-Dx
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:15:20 -0500
Received: by mail-pj1-x102e.google.com with SMTP id c23so1408690pjo.4
 for <qemu-devel@nongnu.org>; Sat, 25 Feb 2023 01:15:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fUKDP/sNQLKaEx4yocSZm1dTXssXHt62OOCODiQNZGU=;
 b=H7Wf4CpTki4dMZf7CWGUMBD9Cu4Pk01In6wHW0aU19eN0lD0Sbv/bSCEfH91+tznDC
 vtm+EPLxIzJuaf9diEwkk6geP/xf+QOFemU+OhUCkGEd6cvdZCXHNHjU0LAzBHu/jGsw
 IncGyWtvfQ7YlH3cbMN9+xEf04Fqb5RVbnlD6oATuZvhxMTKKnxMqkrLkpI+JqGfWRul
 8aETUUv7bIbiIu/Ye1eSPKBbgh6uDmlJu4GizMQ9PdqdKlxsHCWPJePwVMWD3gIzWvJt
 HaZjQsyLLSP/iIDXjSPJ25E4IxIXjT5e2h6gO+jWqVwSpcvD+uhuewBk4qD39y2eWJ9J
 JJZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fUKDP/sNQLKaEx4yocSZm1dTXssXHt62OOCODiQNZGU=;
 b=zj/YP7rupCo8pshG+vux0Jqu5z69SK09L5zTsD0LX8EJwX4zSJtwytIbgPv3m1qNg4
 T6SgLwNEWAf8oT63+2P71uNjMCSU45/tUXGWaU5RgkUQ77de1+sf5DJtvnQQ1wgrrJ+d
 iF5tH2re/PW+XLTD+qcaNmE7ghF/KcJhTHhu7sO82eN++MCR7lfXfm6vq6fyt6uU/19e
 OiYbKHcQJL2gnjz7R5xVxGiKhxAip6f/QgUoJpqYAydrTyicIlW1YXeT+rB19b29ggBN
 01bwouzkWGrlM4/DMpBrO5zQpqm3f8OcZRCN2LXYf7vTZRuxLaBc18Hqh89bhl6HrOGC
 8m/g==
X-Gm-Message-State: AO0yUKV5ZQZ5TmMoUrgNiqIM/4+blDaBvxlWp5Gkz5X30JVVBAzIdu26
 1nw4yxB0HQJGqsjsryH5iHlMjiWa8K83tsrH2gY=
X-Google-Smtp-Source: AK7set/q2b5ehT2hakpfNtQXYe6q2jwrrTfbeRmdfDXspBO0VyrLvjTvQBIe2+GepAiplifwQsBqBg==
X-Received: by 2002:a17:902:e745:b0:19a:839d:b682 with SMTP id
 p5-20020a170902e74500b0019a839db682mr20758866plf.17.1677316517119; 
 Sat, 25 Feb 2023 01:15:17 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 je12-20020a170903264c00b0019607aeda8bsm831101plb.73.2023.02.25.01.15.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 01:15:16 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 17/76] target/arm: Drop tcg_temp_free from translator.h
Date: Fri, 24 Feb 2023 23:13:28 -1000
Message-Id: <20230225091427.1817156-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230225091427.1817156-1-richard.henderson@linaro.org>
References: <20230225091427.1817156-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
 target/arm/translate.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/target/arm/translate.h b/target/arm/translate.h
index d7fdbc1e3e..3dbff87349 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -331,7 +331,6 @@ static inline void set_pstate_bits(uint32_t bits)
     tcg_gen_ld_i32(p, cpu_env, offsetof(CPUARMState, pstate));
     tcg_gen_ori_i32(p, p, bits);
     tcg_gen_st_i32(p, cpu_env, offsetof(CPUARMState, pstate));
-    tcg_temp_free_i32(p);
 }
 
 /* Clear bits within PSTATE.  */
@@ -344,7 +343,6 @@ static inline void clear_pstate_bits(uint32_t bits)
     tcg_gen_ld_i32(p, cpu_env, offsetof(CPUARMState, pstate));
     tcg_gen_andi_i32(p, p, ~bits);
     tcg_gen_st_i32(p, cpu_env, offsetof(CPUARMState, pstate));
-    tcg_temp_free_i32(p);
 }
 
 /* If the singlestep state is Active-not-pending, advance to Active-pending. */
-- 
2.34.1


