Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 167E640A1DD
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 02:24:35 +0200 (CEST)
Received: from localhost ([::1]:40054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPwFW-0007is-4e
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 20:24:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPw6Q-0001jL-Ce
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 20:15:10 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:56236)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPw6O-0007fi-Gb
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 20:15:10 -0400
Received: by mail-pj1-x1032.google.com with SMTP id t20so7593542pju.5
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 17:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ytp1qEelCCJ6X6YutHfxVHqgAYB1ZWOKL4KKnhxaBdE=;
 b=LH5odn26ajWV1GGoHhiCkkD3SP2g7r/jv2jmZT9JIEL7NmSGNnFeQnWyYAvU78o6L8
 Uvy6OFpOvHdmiq/qb5cY9SjS9Skfv9LQwaHk6OO7/J0q2KEhNjtnwFuIrdsHwbQTPqFL
 T0MlLb/bRfumuv4Fud4lt+F83kBA4tqVRhvy5retsdvmwkoPrCLVw5jXyrmI/pTjuTRZ
 e9zTIvSfz+YxLwC1elzS/FD1iLAtdYNUF+Bbmkg0jnvk+Cx91yb9K6+UAd9idNaI+PMT
 JfkSgCLCr32Mc88EYOYkItAvdb38CePLPYZeur0tecmYEhvCGTRt4hN1A/RA+Ly1nIjc
 mMtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ytp1qEelCCJ6X6YutHfxVHqgAYB1ZWOKL4KKnhxaBdE=;
 b=qW3mEIRomM3qKb5RUnxVpy6SxP9fRRQ3tzLXrijO7ldWTMSH9WR6BmrnDl1Xr8O0rw
 zFtpkQILkkigHHcVs8UZ0rZDmf+84530We/zLMT6eNtOivmx/oFASwLfij/Eroizgljw
 DXxK5EYwHJIJ4HFeXRkV3UWH3YKabEClC+FOo8H5DTUv1tmfUICAkEPcr0kYzkQOAUQF
 Q0MA7U/hIu3c8Pen3aKcEzZU2P3878uLeSEYkDaZyOcGx2z9dsbzchi1ttIac9aE+JM5
 I1TwB4MZoth1vLOYBskoO7cCM82A37yuMwWnrazAd1sR/q1MeixzmBhNmrbpPA28IHvN
 4SEg==
X-Gm-Message-State: AOAM532cHBTofKrp2nGY2OsEACMpCYfx1CzRVOs9pEeF2oYtUq8ZKNNK
 dYUUodzHacAKpgW1N/sps0cTSfY4g3Z5lA==
X-Google-Smtp-Source: ABdhPJwgs0zRLxfedmMPk5zqLxvwmc0Y0q0W+zU4qKEyPa/4z20+5WvZhowR8ocGo4FolraoYahyDw==
X-Received: by 2002:a17:90b:3901:: with SMTP id
 ob1mr2438958pjb.136.1631578507155; 
 Mon, 13 Sep 2021 17:15:07 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id m7sm9334179pgn.32.2021.09.13.17.15.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 17:15:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 12/44] target/xtensa: Restrict do_transaction_failed() to sysemu
Date: Mon, 13 Sep 2021 17:14:24 -0700
Message-Id: <20210914001456.793490-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210914001456.793490-1-richard.henderson@linaro.org>
References: <20210914001456.793490-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

The do_transaction_failed() is restricted to system emulation since
commit cbc183d2d9f ("cpu: move cc->transaction_failed to tcg_ops").

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210911165434.531552-5-f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/xtensa/cpu.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/xtensa/cpu.h b/target/xtensa/cpu.h
index 2345cb59c7..1e0cb1535c 100644
--- a/target/xtensa/cpu.h
+++ b/target/xtensa/cpu.h
@@ -568,10 +568,12 @@ bool xtensa_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                          bool probe, uintptr_t retaddr);
 void xtensa_cpu_do_interrupt(CPUState *cpu);
 bool xtensa_cpu_exec_interrupt(CPUState *cpu, int interrupt_request);
+#ifndef CONFIG_USER_ONLY
 void xtensa_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr, vaddr addr,
                                       unsigned size, MMUAccessType access_type,
                                       int mmu_idx, MemTxAttrs attrs,
                                       MemTxResult response, uintptr_t retaddr);
+#endif /* !CONFIG_USER_ONLY */
 void xtensa_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
 hwaddr xtensa_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 void xtensa_count_regs(const XtensaConfig *config,
-- 
2.25.1


