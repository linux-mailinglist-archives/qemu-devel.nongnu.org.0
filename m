Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A63E9400CEF
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Sep 2021 22:42:46 +0200 (CEST)
Received: from localhost ([::1]:37210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMcUv-00014I-OQ
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 16:42:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mMcNv-0005wD-SF
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 16:35:32 -0400
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135]:47008)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mMcNo-0002qV-2k
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 16:35:29 -0400
Received: by mail-lf1-x135.google.com with SMTP id t19so5304391lfe.13
 for <qemu-devel@nongnu.org>; Sat, 04 Sep 2021 13:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull-eu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+RYgb2Yyt+iByrgIUPc6oLOtmbpHlp17f5Zuux7SRC8=;
 b=0BvrqpScmpgXfBj7jy0/Gjn22M72ZwAYQuQK2V+ipVi8HQKSKm2cMo52Rou8dX4t1u
 Tmc+aV80U2FQOQ6I/dVkCreUsg6zb69XrooqZGdLUrUu3eNfiFQpMbBMzRwHNbzXGZZw
 yvFsmwROrd1ZVTy6BB63EGmN/kd1UYOXEEiKn+/WpLnJpeICj1UGWsX0gkMVhclrb79J
 lMuZtInJz4zNRtugNKlfrXVAZncK+NYCNkZsw177h+hgGTPvwmJab0WKoibXMFsn2VNb
 kRFavxA3N/cuAHyBnTNUzyvIbzu/iT36Ro37/CxnLsCAN4cHKglt+oO4ARWX/mu5fosm
 XRdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+RYgb2Yyt+iByrgIUPc6oLOtmbpHlp17f5Zuux7SRC8=;
 b=QKyul8o1L/8Bq103ahSuuqnyKRBs3Bb5bJ6zY1YRmutIHsRblrTH9SZRpJqUWpeBxx
 i/45o91GAz3wRMtma+NolXw9b61hfj5nfG5nNnPD5WklSgQMaIkxSLoS1N8M5CA94/Ly
 S1/9bFFSbQRzqbWsmpnMSe7UYAO/BwSOIgbj4ven66ohmgtjLvbIk3GUYwozF50B8Xrv
 KfqMANv4HbVjbaMxbW9vn53yt5xwiXj9oiDEjq7xE8XmECppGg1YJcHhpwTzHs0jBG1B
 ZuuE+14jXABONSQLipQxqzvkjpBNvHlj08by+4jqeTyVg8Ur0vo9K3WDdTXx9v7UyOyO
 HL8w==
X-Gm-Message-State: AOAM530z8qHWlqYMm3B4fSTUdznh0WN+Nb68KoYyPTWLZ08v99cqhwlW
 gnlt7b/od/mfSrmHvrro4fWjtZ/lkiTvzZ/Hfi4=
X-Google-Smtp-Source: ABdhPJwTMxF1mDJmevj6Aie8+ol8seBsy5YKyAIfC2nSir0eB6otGXUxXVRbt8+BdrLIzAZUE1OHaw==
X-Received: by 2002:a05:6512:3096:: with SMTP id
 z22mr4078856lfd.475.1630787720287; 
 Sat, 04 Sep 2021 13:35:20 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id v15sm326304lfq.142.2021.09.04.13.35.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 13:35:20 -0700 (PDT)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v10 01/16] target/riscv: Introduce temporary in gen_add_uw()
Date: Sat,  4 Sep 2021 22:35:00 +0200
Message-Id: <20210904203516.2570119-2-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210904203516.2570119-1-philipp.tomsich@vrull.eu>
References: <20210904203516.2570119-1-philipp.tomsich@vrull.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::135;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lf1-x135.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Kito Cheng <kito.cheng@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Following the recent changes in translate.c, gen_add_uw() causes
failures on CF3 and SPEC2017 due to the reuse of arg1.  Fix these
regressions by introducing a temporary.

Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
---

Changes in v10:
- new patch

 target/riscv/insn_trans/trans_rvb.c.inc | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index b72e76255c..c0a6e25826 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -624,8 +624,10 @@ GEN_TRANS_SHADD_UW(3)
 
 static void gen_add_uw(TCGv ret, TCGv arg1, TCGv arg2)
 {
-    tcg_gen_ext32u_tl(arg1, arg1);
-    tcg_gen_add_tl(ret, arg1, arg2);
+    TCGv t = tcg_temp_new();
+    tcg_gen_ext32u_tl(t, arg1);
+    tcg_gen_add_tl(ret, t, arg2);
+    tcg_temp_free(t);
 }
 
 static bool trans_add_uw(DisasContext *ctx, arg_add_uw *a)
-- 
2.25.1


