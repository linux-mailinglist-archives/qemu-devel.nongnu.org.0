Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E696A3A89
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 06:38:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWW1v-0008H5-Q3; Mon, 27 Feb 2023 00:26:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW1f-0007S3-TX
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:26:17 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW1e-0007Ls-7K
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:26:15 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 h11-20020a17090a2ecb00b00237c740335cso3976915pjs.3
 for <qemu-devel@nongnu.org>; Sun, 26 Feb 2023 21:26:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/xF3Zv42jI/oruaha4e4sWoXABmLVdJQBTLNajb+CF8=;
 b=X+pP2vR6DKKUY7zIJxV0IG+zHr4jj06M02ffECX3vuC0mTcHEe2cgIixGrKHVjrrc1
 bGUaZYz0rdCz035oqhwlOD29cqcJQNFX6Lw0EA2dhduyWqFCL/7tDMytP4WO/cnrEbmR
 9i3ATwg1xAyuwDceVVAKXpoOW3zDTnweKJYaXOniWXMA6wJUIQVvW0IepPzgNHOgkopK
 xDriqG6segjZDhA3FYXTIOHH2mkb8iDkM5oDhxR2RzjNjeOU++xLsQRjxYQyTZYZFOW5
 eGdQw0vdpva2uwdg9uzdpO8jiQCUgkyyNpzEogfXlBO4+1ppwCRkfw0asTYcW9vPMzVT
 YL7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/xF3Zv42jI/oruaha4e4sWoXABmLVdJQBTLNajb+CF8=;
 b=go02ZTbx2cSBUt6iW8MyRnVtrwcZOjgDpJFSHvowmet8T1/vjtpKDhZAUgqwV/4txf
 ILzmkmpuAH4Tpfe96h5sTq1fQWCPhDXHdrckoHDr2zYJkUfkRbshbWtJwufvCRW1gRW8
 nDnOf0mSLGJo9j7dtakn0SwMa1lAA/+ZIPKvXSdoNExirlUzFupbnrXcf/Jjmk5B1dwF
 WdkQoVsQTTtmuuFz5rXj3xnhCtcugmYjt30KMbf8fW9SiMIdandx3l2E1Waw2LM2XHc/
 90imD/91HKIUsfncp5nh3f+lXcWwzEa98w0MJYOYuq3KSnJY3BLZykahvBEOIpupxEL+
 SVvQ==
X-Gm-Message-State: AO0yUKW0N7DT+7YLcZ9k+Pi4uSf7BDPz9RhvXt46NY9rHPT8+nCTqgwJ
 WdH8vGhwQAx6QczPZ6rwe2KZjoe+SKsUHv0/v58=
X-Google-Smtp-Source: AK7set+/92daBnjQjxBJuU5+gl4PwZziYINYQJxL1fmK7kC0r9mPtVgt2AyuzCLpbTEK1JNE/WixCg==
X-Received: by 2002:a17:903:1205:b0:19a:b151:bf68 with SMTP id
 l5-20020a170903120500b0019ab151bf68mr27857055plh.38.1677475573454; 
 Sun, 26 Feb 2023 21:26:13 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 a14-20020a170902ecce00b0019a837be977sm3513341plh.271.2023.02.26.21.26.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:26:13 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH v2 23/76] target/cris: Drop addr from dec10_ind_move_m_pr
Date: Sun, 26 Feb 2023 19:24:12 -1000
Message-Id: <20230227052505.352889-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227052505.352889-1-richard.henderson@linaro.org>
References: <20230227052505.352889-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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

This variable is not used, only allocated and freed.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/cris/translate_v10.c.inc | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/target/cris/translate_v10.c.inc b/target/cris/translate_v10.c.inc
index 5e9d1c0fe8..4f03548365 100644
--- a/target/cris/translate_v10.c.inc
+++ b/target/cris/translate_v10.c.inc
@@ -800,12 +800,11 @@ static unsigned int dec10_ind_move_r_m(DisasContext *dc, unsigned int size)
 static unsigned int dec10_ind_move_m_pr(CPUCRISState *env, DisasContext *dc)
 {
     unsigned int insn_len = 2, rd = dc->dst;
-    TCGv t, addr;
+    TCGv t;
 
     LOG_DIS("move.%d $p%d, [$r%d]\n", dc->size, dc->dst, dc->src);
     cris_lock_irq(dc);
 
-    addr = tcg_temp_new();
     t = tcg_temp_new();
     insn_len += dec10_prep_move_m(env, dc, 0, 4, t);
     if (rd == 15) {
@@ -816,7 +815,6 @@ static unsigned int dec10_ind_move_m_pr(CPUCRISState *env, DisasContext *dc)
         tcg_gen_mov_tl(cpu_PR[rd], t);
         dc->cpustate_changed = 1;
     }
-    tcg_temp_free(addr);
     tcg_temp_free(t);
     return insn_len;
 }
-- 
2.34.1


