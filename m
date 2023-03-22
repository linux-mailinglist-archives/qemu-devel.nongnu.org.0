Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC806C5A35
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 00:19:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pf6py-0006RX-AU; Wed, 22 Mar 2023 18:21:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pf6px-0006RP-2J
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 18:21:41 -0400
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pf6pe-0006W6-3E
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 18:21:40 -0400
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-17ab3a48158so20930699fac.1
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 15:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679523678;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BwzFze6i9LF5NLZ7SPHJQ/+EluN5wBR39ZnMalzotlU=;
 b=dXPyXHBNJXSyODKedfiHpizA/XWbYcwroXt3zZwrdLGt3e5X6go4s35YwFDlPD8dYS
 AqcVQBFT7LS9z+C+nUKZmQ2kIoX46ajMO6iBWsj+VjsEV91ZaL2Sv14kiHLpqhszKlTM
 E/mqsyqhGVvtEeqNJcSUopn1F37ZV8Bflv7Q3mnhTdYBzSGd7W/a4g9BbHflZhSnICuw
 RblFywU5NhtBchqZeLmuPkLyGWZyntigK/SSQgVHBZ7rZVVNz5j42kBzJK/vl4m54ERT
 pSQqnG94MhA5xc9JdJkIahy0eRKKy4lO5lZ7fHck8RRYVrOApiDbbmQgztdgFnZxBsHg
 cJAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679523678;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BwzFze6i9LF5NLZ7SPHJQ/+EluN5wBR39ZnMalzotlU=;
 b=gsflPgYVKYxoFaSX3uHOv8huI6QgrUS9okt1/AMvLmbuPpstC0peezI4EZWwqCVz13
 smWFHVJv+dCDoMUg+rOXExo6laO/xlWdD5WJRAFRg/0ylj/inwzB+evpx5S/G5P+IKah
 rEzPafC4+eSysG8nDmI78NPGnTd6rmFR8BXUkCmqjX34S6hbvV3Oo1sgkOgGIIWA1c5e
 z5NKzNK1cslsGmgjhP7Bdhhye/JsQ9raGD5dGcAw8WTfreRYdfw/fsJ1SgLO7/bOFfFa
 ggF64mG5LQxcFcmYWWL7iG1SFkaxoOogKSGsgfme8Mi/374Eay7IGYuxRyuc7h7CAc/7
 8A6Q==
X-Gm-Message-State: AO0yUKXWwcjxi5/l3WhTSb1m7lP5XrbKYX6YZlKE2BPRzfAeVAk/7ad4
 7iXnCRSnwK6cEfdfNrsEbC8uWZuOAv6WTaU42n0=
X-Google-Smtp-Source: AKy350ZydfC8A8L4qtc8RDIfp2m00RMW8ls4na6hL+QPsvtXlkBqXUqCG/4wx9/F9+brCsM0o7j3nA==
X-Received: by 2002:a05:6870:5806:b0:17a:a2ba:9032 with SMTP id
 r6-20020a056870580600b0017aa2ba9032mr859890oap.3.1679523678241; 
 Wed, 22 Mar 2023 15:21:18 -0700 (PDT)
Received: from grind.. ([177.95.89.231]) by smtp.gmail.com with ESMTPSA id
 ax35-20020a05687c022300b0017243edbe5bsm5586817oac.58.2023.03.22.15.21.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 15:21:17 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.1 v4 18/25] target/riscv: error out on priv failure for
 RVH
Date: Wed, 22 Mar 2023 19:19:57 -0300
Message-Id: <20230322222004.357013-19-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230322222004.357013-1-dbarboza@ventanamicro.com>
References: <20230322222004.357013-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2d.google.com
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

riscv_cpu_disable_priv_spec_isa_exts(), at the end of
riscv_cpu_validate_set_extensions(), will disable cpu->cfg.ext_h and
cpu->cfg.ext_v if priv_ver check fails.

This check can be done in riscv_cpu_validate_misa_ext(). The difference
here is that we're not silently disable it: we'll error out. Silently
disabling a MISA extension after all the validation is completed can can
cause inconsistencies that we don't have to deal with. Verify ealier and
fail faster.

Note that we're ignoring RVV priv_ver validation since its minimal priv
is also the minimal value we support. RVH will error out if enabled
under priv_ver under 1_12_0.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 399f63b42f..d2eb2b3ba1 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1055,6 +1055,20 @@ static void riscv_cpu_validate_misa_ext(RISCVCPU *cpu, Error **errp)
         return;
     }
 
+    /*
+     * Check for priv spec version. RVH is 1_12_0, RVV is 1_10_0.
+     * We don't support anything under 1_10_0 so skip checking
+     * priv for RVV.
+     *
+     * We're hardcoding it here to avoid looping into the
+     * 50+ entries of isa_edata_arr[] just to check the RVH
+     * entry.
+     */
+    if (cpu->cfg.ext_h && env->priv_ver < PRIV_VERSION_1_12_0) {
+        error_setg(errp, "H extension requires priv spec 1.12.0");
+        return;
+    }
+
     if (cpu->cfg.ext_v) {
         riscv_cpu_validate_v(env, &cpu->cfg, &local_err);
         if (local_err != NULL) {
-- 
2.39.2


