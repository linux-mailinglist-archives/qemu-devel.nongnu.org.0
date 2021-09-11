Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 569CD407898
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Sep 2021 16:03:25 +0200 (CEST)
Received: from localhost ([::1]:36254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mP3bH-00056L-OX
	for lists+qemu-devel@lfdr.de; Sat, 11 Sep 2021 10:03:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mP3YP-0002Px-Ql
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 10:00:26 -0400
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230]:39831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mP3YO-0005ap-1j
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 10:00:25 -0400
Received: by mail-lj1-x230.google.com with SMTP id q21so8213784ljj.6
 for <qemu-devel@nongnu.org>; Sat, 11 Sep 2021 07:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull-eu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=znJIcbDvykhlPiOkywG7CiGuep1TxUorlr4tUumTAF4=;
 b=ZBHdNisEPcTrXEEp41wd3nDlH1nhjjPH28jVRB5p5t1nGtVs8kCCu8JzH9Et2LDdTB
 sNo+T9bDiSK1J1csnSA+WMb0IE2iQPVO+3AWgRBoirEUu9wLWmC0swjd4DKyAy+QIsmM
 gvt1FD0p1lrM1XyDBtqI1VwmtqrV6GNl6Tsqkt+75MN7cNJbw2hmCB98V3CJjsq/goEg
 JZNFqvHFSlwOs7qdQdkxmaisGGl1vvHVuLsxb9Ky+E4224nxz/Xi/oX3lrQmVjGJH5Up
 BQdqWGCOoao1EhFqXmjr0Ep/lwSQNkAd1VMs1wWVZyvHMoXnMhPpbjKAJUl4KRkg9EN3
 JRPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=znJIcbDvykhlPiOkywG7CiGuep1TxUorlr4tUumTAF4=;
 b=Y1jRVwqktm3jdPSh5Ocz2fu6Xre9jmCQLhDRABBBG7sfDj7wjDp4Kw/2ObzzEuK+4m
 m8tgSwBRPEP0yyr+Q52qnnJLv1FKR/2XcT2xngKCnsv+vC9/vTCrlLmN6G2ym3LkckXi
 vh9lCLd1unqkDlicTD+EzNdQEoxf70o1Awp8w+K4+cD9qPvadN0fSbgBEc/BiDRYpiCk
 y/jheaFiwbW4RusrjGaBV7lPX3kZKJnaDqWDZ3Nj1p8ixS9z6og9818tjtTX3jZ8xpqr
 5RWCUHeFNskqmn4MrN9hvw5V/xAmd0iV1ZfbtH4GmRSwik/C0AqznZ3vBWT4ARDZydE7
 Fbqg==
X-Gm-Message-State: AOAM531xnQnUB9ysssMEQxBGFI0a+oeGjXDfoKBncoeqVwtwmtyVm/5k
 BXz9T46g7xQhQxk1D8WmwuvQoYJ8Ap4Wf9jU
X-Google-Smtp-Source: ABdhPJw48LVNd0xSp3Zpdm6qtlAOKjH4FJFdDrp5ArGbzYJrD4X9esV9nWgs1ijOqr6gfGCD1e4+Rg==
X-Received: by 2002:a2e:a7cf:: with SMTP id x15mr2347912ljp.227.1631368821003; 
 Sat, 11 Sep 2021 07:00:21 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id u15sm213052lfk.26.2021.09.11.07.00.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Sep 2021 07:00:20 -0700 (PDT)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v11 01/16] target/riscv: Introduce temporary in gen_add_uw()
Date: Sat, 11 Sep 2021 16:00:01 +0200
Message-Id: <20210911140016.834071-2-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210911140016.834071-1-philipp.tomsich@vrull.eu>
References: <20210911140016.834071-1-philipp.tomsich@vrull.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::230;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lj1-x230.google.com
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
 Kito Cheng <kito.cheng@sifive.com>, Bin Meng <bmeng.cn@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Following the recent changes in translate.c, gen_add_uw() causes
failures on CF3 and SPEC2017 due to the reuse of arg1.  Fix these
regressions by introducing a temporary.

Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
Fixes: 191d1dafae9c ("target/riscv: Add DisasExtend to gen_arith*")
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---

(no changes since v10)

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


