Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F515325C0D
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 04:41:17 +0100 (CET)
Received: from localhost ([::1]:36838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFU0C-0001VG-5t
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 22:41:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTft-0006g5-AY
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 22:20:17 -0500
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:42630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTfq-0000lu-05
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 22:20:16 -0500
Received: by mail-pg1-x52c.google.com with SMTP id o38so5380028pgm.9
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 19:20:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=qE9r5ZjX6mwcZyVZNsOAbjPFyZpzWntWWeWkewrFtBY=;
 b=aVHGvImYMtJQDpTNiClZlg50dH4M/Y8iC5TxIHzzAGSb5dEj3LfMfINJhRzpJl7Q0B
 pe4TJKvWLwlOf4l8IlQAUul7oNiz+VZ+ZADorBpLXfLICnLKmmdABi431VnrwNBKjQ7w
 PVbtbCtK2yOQapZuMEW7IW9jwJy5YniESGuKeT5VUYKgOpYaIhrhPFfBzmZfWySq9UaK
 +JSrYFKfA73XG44FrylV2HDJ/izsZRfBPiJT4JwuXEn2/T2ICnGigFq2qmnsCe83MSlF
 9ku/v+eisgsYAOUNjTMNTxKEie4/EjIgElxJuWgGD3AjCn6APvUxPdpZxIBLW/mboQLo
 0oRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=qE9r5ZjX6mwcZyVZNsOAbjPFyZpzWntWWeWkewrFtBY=;
 b=Iyb1eNDt/F/MJMM2PrKe7XuEqH+9OA9xDbxEftR/KfOeZsf+XOvM/UJQCrP+Takhmo
 nthUXPfQniscas1zt3HsFKVfPkkMNlup/XMolSyNhRSdEdtEQDl+edVLyPFEgAaU5Nup
 DG7Axh0dQmU60NzHllT3poVR09CZnGhoNOOyAS0pOpKXjO0PYFygj1w7AgwsJa2adS53
 ExIZ9xa8ULFT4m3kvI11xsF4kxUpfbYbh1sf0ucogahwm2sBRlmJ+pJKxAeXdIQuuFBk
 yjvf/x7WRpOrixiHuqTDpICfH2dKUI8pBQAMX5HabvWR+SzxYYpIxLKL7NyFN9b8Tqij
 QjtA==
X-Gm-Message-State: AOAM533OpVHGLpsu2IcSMcqvyXpxtrxRHr+Favs32iTphJPkLD40+L+f
 uI+7xxsShhr+3CVWL/jAqVT/Z5blf2h+5w==
X-Google-Smtp-Source: ABdhPJy8kZlBjVtBEWJmZFx8t6z0PJdTG25UE4oxiIiBZeifE38hWsUPiSexjk2ltznwiftmFysSyA==
X-Received: by 2002:a63:8c0b:: with SMTP id m11mr1007532pgd.306.1614309611361; 
 Thu, 25 Feb 2021 19:20:11 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id p11sm7083709pjb.31.2021.02.25.19.20.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 19:20:11 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v7 10/75] target/riscv: rvv-1.0: check MSTATUS_VS when
 accessing vector csr registers
Date: Fri, 26 Feb 2021 11:17:54 +0800
Message-Id: <20210226031902.23656-11-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210226031902.23656-1-frank.chang@sifive.com>
References: <20210226031902.23656-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x52c.google.com
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
Cc: Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

If VS field is off, accessing vector csr registers should raise an
illegal-instruction exception.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/csr.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 92cf2eedd40..a6a535f7e33 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -48,6 +48,11 @@ static int fs(CPURISCVState *env, int csrno)
 static int vs(CPURISCVState *env, int csrno)
 {
     if (env->misa & RVV) {
+#if !defined(CONFIG_USER_ONLY)
+        if (!env->debugger && !riscv_cpu_vector_enabled(env)) {
+            return -RISCV_EXCP_ILLEGAL_INST;
+        }
+#endif
         return 0;
     }
     return -RISCV_EXCP_ILLEGAL_INST;
-- 
2.17.1


