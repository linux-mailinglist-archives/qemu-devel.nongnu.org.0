Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E9CD6A286C
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Feb 2023 10:29:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVqg4-0001PD-EE; Sat, 25 Feb 2023 04:17:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqf9-0007PC-Po
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:16:17 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqf7-0002Lr-J0
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:16:14 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 h11-20020a17090a2ecb00b00237c740335cso531714pjs.3
 for <qemu-devel@nongnu.org>; Sat, 25 Feb 2023 01:16:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b6y4zpHlwmASZL3Wsq/COyCHbhwEv63XD2IWNIuyt6k=;
 b=ik1urcTh+U9FbRYzMlnJivWHRq7+DU6YVeiKBnRPzKa4Y19hCBDSDc3iWT/QinlZ/q
 InkXlBZk7y7W+NFlJysj1D7mjGOgN5DLYh5QjV7vkQYbk/3Rk1+ZxnH9HcDoy8iqNhGR
 c1vnTinWskpR7CMXVWBViuh+X9lWepMqPh7CwavI9KHb9L/obOYFnTId/dEauGEu3ju+
 /Q64gK8S74kouxqDe/9pf59E4Z4xdjF37lpPlttQNvAvHxiFW4PGZRO7je3Rqr4fSeGl
 Qx7cHAoT3nCmjTt9ugO/PU7F4WOBH+KbmP9TbHX60KxzPpi40GTmDkrYpIkMdIPqS+0s
 ZFUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b6y4zpHlwmASZL3Wsq/COyCHbhwEv63XD2IWNIuyt6k=;
 b=rgl73OYRiK1TkuwrRHrUnpy6h+R7+Z1FNyDXiWhVzQtNaZkdXmaZ2xP/ImLJJWI/jI
 vxhJDHWpHMB32dCaXU1NOCqadVoXuW8Mcqxdk7jvy6nSxPa6pv0n4MLPzz4pLp4L0m48
 AJgO9DPR/FcAfLzV4DMLYPokfy1mk5ARg4+Cf4HKgi/oaBakEKArsnFsBKDG1VeegTEn
 pb5QQTtBZxl+OukPq5s6aD52oBym1W/SSqA1dG+CGyKYhONvaK5EgUguzq812giTMKp6
 MdVy+CSI/wnYxb1qG7EQjrPIuINCcMJTdoGgvso1xKpO1lv1275fUr9bpj/a/5QgGwO2
 fw+Q==
X-Gm-Message-State: AO0yUKUw9YebxWbWHXFIIwrqQtQYakMdHd04BTvfbzMSVpb7fwCPzRUm
 9JBsJC5W0Nf/RVmrIEoWOvj8qi9Sib06Hs+ptFM=
X-Google-Smtp-Source: AK7set8mgbwZkAukE4gvhcx08tIJp5f8r8irB4//6BvBRub3k4+52wf+K1GQiyNoJZn4SQGtXOml9g==
X-Received: by 2002:a17:903:11d0:b0:19c:b7da:fc44 with SMTP id
 q16-20020a17090311d000b0019cb7dafc44mr10911346plh.34.1677316570469; 
 Sat, 25 Feb 2023 01:16:10 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 je12-20020a170903264c00b0019607aeda8bsm831101plb.73.2023.02.25.01.16.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 01:16:10 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 38/76] target/mips: Drop tcg_temp_free from
 mips16e_translate.c.inc
Date: Fri, 24 Feb 2023 23:13:49 -1000
Message-Id: <20230225091427.1817156-39-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230225091427.1817156-1-richard.henderson@linaro.org>
References: <20230225091427.1817156-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
 target/mips/tcg/mips16e_translate.c.inc | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/target/mips/tcg/mips16e_translate.c.inc b/target/mips/tcg/mips16e_translate.c.inc
index 918b15d55c..602f5f0c02 100644
--- a/target/mips/tcg/mips16e_translate.c.inc
+++ b/target/mips/tcg/mips16e_translate.c.inc
@@ -280,9 +280,6 @@ static void gen_mips16_save(DisasContext *ctx,
 
     tcg_gen_movi_tl(t2, -framesize);
     gen_op_addr_add(ctx, cpu_gpr[29], cpu_gpr[29], t2);
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-    tcg_temp_free(t2);
 }
 
 static void gen_mips16_restore(DisasContext *ctx,
@@ -386,9 +383,6 @@ static void gen_mips16_restore(DisasContext *ctx,
 
     tcg_gen_movi_tl(t2, framesize);
     gen_op_addr_add(ctx, cpu_gpr[29], cpu_gpr[29], t2);
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-    tcg_temp_free(t2);
 }
 
 #if defined(TARGET_MIPS64)
-- 
2.34.1


