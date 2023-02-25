Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC566A2817
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Feb 2023 10:04:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVqPZ-0000Qt-QZ; Sat, 25 Feb 2023 04:00:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqPX-0000QS-AS
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:00:07 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqPV-0004rx-Iu
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:00:06 -0500
Received: by mail-pl1-x630.google.com with SMTP id p6so1014003plf.0
 for <qemu-devel@nongnu.org>; Sat, 25 Feb 2023 01:00:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OFUuZdWV0m8yJX6N50IyEHkVAVhjqKt8H7H64KRcmDU=;
 b=iQsXe47PUxCyG9fve+aiF0ZWlaAu4rSQgyOskHeqRiIzPED3T1fBX9lgr6hfnUinFn
 MvfHviCHABXmTrYWU2YNas3L4nzOo55JRt+sIoIWTh4hztEyEjFqRbsLOoW6ALVB+szl
 Rv4nEDmTdDQrYUGOmQxJN4UVPXDj0gkSGn/7VtmH3KyVbt+Mj0HHGpFxPM2SNUaNtOcg
 tRi4q+fgpGoDL7KYPoQMmMhofZvmG2wbmjTe9Hi/cKD3QwZa9o20YxeGCrD9NimJP2/i
 hOtZlQvtQUH1Gq6OI6QsAowyZyGm54bkISPwKBCfbf5nYZ1WMuGZKmcQ1wm+BlyoULrC
 S1Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OFUuZdWV0m8yJX6N50IyEHkVAVhjqKt8H7H64KRcmDU=;
 b=P+KEscjSsUHsXGCiwfqEr27KZT3TrHAX5UuvYe7VpfuXn72GNRNFlB8I+LH6/k2K19
 5Km1rbkCITBvi/PcJOPkRUUO9Km5P6SYS4hZJC+vIt9r7i6soEh46IvoljcYq1Z7K/c2
 nEY+K7llmXZaeWYkj6vFYavMmsew6K6ZNgt1S9rFCFLXM/OTnVGqLgp2ub9Ru/S5xzzB
 5EawwZwJwaQbXyag/lUA/SnQA1r3QDOJSiCHlG00sQwiXM9tfkOndTGM+feJb6vPFh8y
 VZy1iYOe+Syj1kWxr2lGebiWWsxDY+o25Cbwu07+i04ctY//2Q0B/mqgEnvn9AIcCao7
 htiQ==
X-Gm-Message-State: AO0yUKUZJ3WVHc1TzBN3CaXaqQWD0zh4mqwo/F9lLPTPm5E8rsIGp93I
 QH1f12xQtkBib6GW9kd6WRvRL3Yb6BVR1oWedeM=
X-Google-Smtp-Source: AK7set+vEN/S2w38M2GsJvA12FXSuBcui60aPHhGyCK3zyTEFWjPpq2ZnWi2pUoH2jC9naWveYnypw==
X-Received: by 2002:a17:90b:1d88:b0:237:c52f:a54d with SMTP id
 pf8-20020a17090b1d8800b00237c52fa54dmr1193850pjb.21.1677315604234; 
 Sat, 25 Feb 2023 01:00:04 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 s17-20020a639251000000b00502ecb91940sm715546pgn.55.2023.02.25.01.00.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 01:00:03 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
Subject: [PATCH v3 10/30] tcg: Use tcg_constant_i32 in tcg_gen_io_start
Date: Fri, 24 Feb 2023 22:59:25 -1000
Message-Id: <20230225085945.1798188-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230225085945.1798188-1-richard.henderson@linaro.org>
References: <20230225085945.1798188-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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


