Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D69869C812
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 10:56:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU2uJ-0002z3-V2; Mon, 20 Feb 2023 04:56:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1pU2uD-0002yQ-Qy
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 04:56:21 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1pU2uC-0006Au-4f
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 04:56:21 -0500
Received: by mail-ed1-x535.google.com with SMTP id b12so2287343edd.4
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 01:56:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uNIXAIiCHY5tNHZQsSeZepuT/whFbyEot/ug3OODyTg=;
 b=X9uO8qcHF3OpVRLMoZg2JPIbSFntn2nSXulu05z23JNx1cTx+OyRIpCeQntMlVC6pA
 CCuZivQY266DZzpxB55yfVmOU5eXReS0ZFcEoP7GtZklr1Y+be/8V+3NNHVumWP8qH0P
 b7KM9nb+UTro5Jzs/4zMUGmvVH7iNgZ6bNY29pdff9lLUqnYGiiygj0etSzvROZrcpa9
 ooiWGs6T3lYvr2z0s2VHMuFLwjRN8nGn9R8aOvknj1y2mok0n6nDFg7aSwPglmsR+T6n
 /ZLM2PyaVMTlwS6u+WbuGvaoQiuqS/S+p7euqeTBQabzwm0sIcb9IeRo4cmQTFqI0/Tp
 mZQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uNIXAIiCHY5tNHZQsSeZepuT/whFbyEot/ug3OODyTg=;
 b=RUQHHp0aGIacKfkVTAla5TBzGYNBHQtD772WwxGviJyZ6bAIYpJMSz7yxDNC/ViIMT
 Du7oybBabcSCIefwwS2u6QwmiINXKn/P53nMWsAq7xCqW2HyDZ/1PXkyozhyEKlWvZxl
 x7/diwInhNFWc6s5CsDUpfJOrPWRiispV6W2aw3Rh/WvQwpzGYMNhmKPiTS0n1uJb3H8
 NgkG1fEMyPtlkX9HJhtBiA2nlvTCp3vSkduihnTCRVcb6gnDyJ+OgucVxeSHG2y+jTMA
 SHRIeYpntR2WJsGP5kNCY3fcO4pioRFqXusSmHhl3eF1ZYF7ED7VS9gnq76HFW7DZ4jk
 fkow==
X-Gm-Message-State: AO0yUKW4DMShhBNiJwr6Ai4HoCYzXp6t+F/9lzWd9AGngWbHgCU00Okc
 Zjzt9lJO5gv91XUULfbVVimLmQ==
X-Google-Smtp-Source: AK7set8Kef4AJSjfQfV8dnaPq7FO4sWNJQrk7VYGViWLMugq676hNUu2NkOK+J0/uLARx24/9XQigg==
X-Received: by 2002:a17:906:f0d1:b0:888:5d34:dc79 with SMTP id
 dk17-20020a170906f0d100b008885d34dc79mr8817288ejb.40.1676886977527; 
 Mon, 20 Feb 2023 01:56:17 -0800 (PST)
Received: from beast.fritz.box (62-178-148-172.cable.dynamic.surfer.at.
 [62.178.148.172]) by smtp.gmail.com with ESMTPSA id
 s6-20020a170906bc4600b008cfd5673f55sm1393050ejv.203.2023.02.20.01.56.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 01:56:16 -0800 (PST)
From: Christoph Muellner <christoph.muellner@vrull.eu>
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Manolis Tsamis <manolis.tsamis@vrull.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cooper Qu <cooper.qu@linux.alibaba.com>,
 Lifang Xia <lifang_xia@linux.alibaba.com>,
 Yunhai Shang <yunhai@linux.alibaba.com>,
 Zhiwei Liu <zhiwei_liu@linux.alibaba.com>
Cc: =?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>
Subject: [PATCH] RISC-V: XTheadMemPair: Remove register restrictions for
 store-pair
Date: Mon, 20 Feb 2023 10:56:12 +0100
Message-Id: <20230220095612.1529031-1-christoph.muellner@vrull.eu>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=christoph.muellner@vrull.eu; helo=mail-ed1-x535.google.com
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

From: Christoph Müllner <christoph.muellner@vrull.eu>

The XTheadMemPair does not define any restrictions for store-pair
instructions (th.sdd or th.swd). However, the current code enforces
the restrictions that are required for load-pair instructions.
Let's fix this by removing this code.

Signed-off-by: Christoph Müllner <christoph.muellner@vrull.eu>
---
 target/riscv/insn_trans/trans_xthead.c.inc | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/target/riscv/insn_trans/trans_xthead.c.inc b/target/riscv/insn_trans/trans_xthead.c.inc
index be87c34f56..cf1731b08d 100644
--- a/target/riscv/insn_trans/trans_xthead.c.inc
+++ b/target/riscv/insn_trans/trans_xthead.c.inc
@@ -980,10 +980,6 @@ static bool trans_th_lwud(DisasContext *ctx, arg_th_pair *a)
 static bool gen_storepair_tl(DisasContext *ctx, arg_th_pair *a, MemOp memop,
                              int shamt)
 {
-    if (a->rs == a->rd1 || a->rs == a->rd2 || a->rd1 == a->rd2) {
-        return false;
-    }
-
     TCGv data1 = get_gpr(ctx, a->rd1, EXT_NONE);
     TCGv data2 = get_gpr(ctx, a->rd2, EXT_NONE);
     TCGv addr1 = tcg_temp_new();
-- 
2.39.2


