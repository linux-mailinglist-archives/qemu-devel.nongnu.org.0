Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 758636F7A66
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 03:09:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pujuO-0006rr-Uo; Thu, 04 May 2023 21:06:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1puju0-0006Bd-92
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:06:28 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujty-0007kW-9H
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:06:27 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 98e67ed59e1d1-24e3a0aa408so1099279a91.1
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 18:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683248785; x=1685840785;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cKRtGtYIgef1clEK0i7kNVfzqDvagT7FZvB4yYdMQ/Y=;
 b=IS81Nq4qotlTFQf1bapWJ72rm4zd9ESpbv/6ZCxZEi3Zl3gsYhXnowAOsZvLWsAZ2/
 ACcobbBLuvHSTg6jJcb/lxWhLeVPp8KR1SWvrrW77CQdEUpXu9TQg6opQkMUCFpHQHMe
 97jEgW2/PFTUdnQ/iH9xkbMPqyhlFAf26/XtmHAnkQ0NCpRi952W4XG5hJGm4mDla51q
 FrMkirJC1wa1nEVhVheMUbcAvVXlVhdt8SI3y1OPRwC6vvYwXNK1gwT+k7YeQImeHLM8
 oUp7OnMdu0vMYGNKLiLXWyZB29a0wSaAZcigrc3mIc327qbKbCT7Tpo0Q4TqBDqjNZ2O
 xntA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683248785; x=1685840785;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cKRtGtYIgef1clEK0i7kNVfzqDvagT7FZvB4yYdMQ/Y=;
 b=hhmMOKXCi0Bgr9IP44nOalQd3nXN4A5IIK3VndoDFnHRYKzPSP7WAPxXgExdgnFs9b
 nKafm7c6mWXq54qxwB99yQsReEcuEW1KGG491A2uuVQrhn0vz2K0Y+8obUvraL+ETnHT
 7/d1LsbYvStIqg2F6XJxQ8nd9p63UhOP8WG2RGbUdYHCiNXGGNpSEudvp/tQuO7J33D3
 9cdGba/KlwwgY0wUHWnyED2HygixFToUI1EfWNdDQt+ZWf+v1W57Bzq+UiAidKZw9o3E
 CbIr7hqA973BMzuR20i3VkghK3jP13qRzFioV9Ocp+tiIAUNruTfBsydPEb23Lha6U+D
 g9DQ==
X-Gm-Message-State: AC+VfDylKQHmUbM4lC3HkEQ1uXZpzO6eizdYPJhptQVX5eAdEHWyWKaN
 QtoG/kvKtDHI72XGsCk0bk8mvuSTveYhVA==
X-Google-Smtp-Source: ACHHUZ6xfXNn9XJ+7Ou6tuJ1Hdu506psOmeTzmHcsP0H0VcxoZLLlJJanmYaJpCAskjOrSCw7MClFg==
X-Received: by 2002:a17:90b:3696:b0:250:5f4:5652 with SMTP id
 mj22-20020a17090b369600b0025005f45652mr3536721pjb.39.1683248784729; 
 Thu, 04 May 2023 18:06:24 -0700 (PDT)
Received: from toolbox.alistair23.me
 (2403-580b-97e8-0-321-6fb2-58f1-a1b1.ip6.aussiebb.net.
 [2403:580b:97e8:0:321:6fb2:58f1:a1b1])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a170902d35300b0019309be03e7sm218762plk.66.2023.05.04.18.06.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 18:06:24 -0700 (PDT)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Weiwei Li <liweiwei@iscas.ac.cn>,
 Junqiang Wang <wangjunqiang@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 55/89] target/riscv: Legalize MPP value in write_mstatus
Date: Fri,  5 May 2023 11:02:07 +1000
Message-Id: <20230505010241.21812-56-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230505010241.21812-1-alistair.francis@wdc.com>
References: <20230505010241.21812-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=alistair23@gmail.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Weiwei Li <liweiwei@iscas.ac.cn>

mstatus.MPP field is a WARL field since priv version 1.11, so we
remain it unchanged if an invalid value is written into it. And
after this, RVH shouldn't be passed to riscv_cpu_set_mode().

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230407014743.18779-4-liweiwei@iscas.ac.cn>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_helper.c |  8 ++------
 target/riscv/csr.c        | 32 ++++++++++++++++++++++++++++++++
 2 files changed, 34 insertions(+), 6 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 29ac7956f7..433ea529b0 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -647,12 +647,8 @@ void riscv_cpu_set_aia_ireg_rmw_fn(CPURISCVState *env, uint32_t priv,
 
 void riscv_cpu_set_mode(CPURISCVState *env, target_ulong newpriv)
 {
-    if (newpriv > PRV_M) {
-        g_assert_not_reached();
-    }
-    if (newpriv == PRV_RESERVED) {
-        newpriv = PRV_U;
-    }
+    g_assert(newpriv <= PRV_M && newpriv != PRV_RESERVED);
+
     if (icount_enabled() && newpriv != env->priv) {
         riscv_itrigger_update_priv(env);
     }
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index e0b871f6dc..f4d2dcfdc8 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1230,6 +1230,32 @@ static bool validate_vm(CPURISCVState *env, target_ulong vm)
            satp_mode_max_from_map(riscv_cpu_cfg(env)->satp_mode.map);
 }
 
+static target_ulong legalize_mpp(CPURISCVState *env, target_ulong old_mpp,
+                                 target_ulong val)
+{
+    bool valid = false;
+    target_ulong new_mpp = get_field(val, MSTATUS_MPP);
+
+    switch (new_mpp) {
+    case PRV_M:
+        valid = true;
+        break;
+    case PRV_S:
+        valid = riscv_has_ext(env, RVS);
+        break;
+    case PRV_U:
+        valid = riscv_has_ext(env, RVU);
+        break;
+    }
+
+    /* Remain field unchanged if new_mpp value is invalid */
+    if (!valid) {
+        val = set_field(val, MSTATUS_MPP, old_mpp);
+    }
+
+    return val;
+}
+
 static RISCVException write_mstatus(CPURISCVState *env, int csrno,
                                     target_ulong val)
 {
@@ -1237,6 +1263,12 @@ static RISCVException write_mstatus(CPURISCVState *env, int csrno,
     uint64_t mask = 0;
     RISCVMXL xl = riscv_cpu_mxl(env);
 
+    /*
+     * MPP field have been made WARL since priv version 1.11. However,
+     * legalization for it will not break any software running on 1.10.
+     */
+    val = legalize_mpp(env, get_field(mstatus, MSTATUS_MPP), val);
+
     /* flush tlb on mstatus fields that affect VM */
     if ((val ^ mstatus) & (MSTATUS_MXR | MSTATUS_MPP | MSTATUS_MPV |
             MSTATUS_MPRV | MSTATUS_SUM)) {
-- 
2.40.0


