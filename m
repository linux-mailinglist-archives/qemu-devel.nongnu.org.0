Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A57D490AC4
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 15:53:18 +0100 (CET)
Received: from localhost ([::1]:54276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9TNk-0003KP-Pa
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 09:53:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n9S5O-0001MK-C6
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 08:30:24 -0500
Received: from [2607:f8b0:4864:20::635] (port=39446
 helo=mail-pl1-x635.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n9S58-0000e1-Qy
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 08:30:12 -0500
Received: by mail-pl1-x635.google.com with SMTP id c6so12785632plh.6
 for <qemu-devel@nongnu.org>; Mon, 17 Jan 2022 05:29:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VNASKJ00wlA5t2Q/k7jW+YzfMzGznROhiBSULHbWdaE=;
 b=SCzwUkuknW+XEzkQ1zQDs0aITub43r8AvcPW50VFojaBGQE4hq7TXxyZaMItwNRTK0
 adwDMcSJeSA4vxtVtNAbmLmezGimiKv3Bf4meER7a7Wsjj3l2ma2YVYwlcnYyBh9ofXl
 Uh30JqPaNWgizRKApUV24uJyEY0LGokRcQ1lxV1IAC1CPPXXtYC5AVrd6gy+yUnLnCqK
 teV4vschNMbIKZmzqTruEBadsdWJXpKAIL9Ocfdo5EmAqqvvxnbxNXht/r5/8fJJWe4t
 xm879iDekoSl3YY3f7K5yVMFYYRO/SdURQTDLeMfOwq8vD99aaSOYRUBQ/EjAN+ufrdu
 QFKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VNASKJ00wlA5t2Q/k7jW+YzfMzGznROhiBSULHbWdaE=;
 b=Wo2090R0JCX/l7zgP/6OuQgnISbRp+gcsAp2WNzGfFf1IwIX2yqjxHhBiss1ve0RGP
 KO4OtPlokrA+34FuVfVfxl9eIy3BRgBlF515XhLFQ3Pvh1KxtABr70nImwU0KwMJDVsf
 1xRuwd8va66GelYoOGi6KNrWGhrgmnAGShnhBbzHrzqgZKXi/TNzjyAH1h6IORefLcao
 tfOPe+mdr+vmblAZK/neKT4qXeVLkqYjFF0GQMNIwpt2rBP2RRjrUMPKcc96voCUg0Ef
 e2h9yQngIN1ytxugL4AFY01BLxWgRdYLyajOgNSO/VKG98lYXziQT1rQcx83OahXbtSU
 DbMQ==
X-Gm-Message-State: AOAM533c47KLetm95uBowftkhG/catx+lHfiPSNllSHf/jRy6I5yrtRC
 f+o6ds4pPtPtpE+aWuvZctXOVA==
X-Google-Smtp-Source: ABdhPJz3pb82h61aj+IHXfBOJ4F39AELr/F25NjLCDG0q3990rBngRRMHQt6oGY4/TS4BF+DBOt44Q==
X-Received: by 2002:a17:90b:4f84:: with SMTP id
 qe4mr24829671pjb.211.1642426157792; 
 Mon, 17 Jan 2022 05:29:17 -0800 (PST)
Received: from localhost.localdomain ([122.179.70.109])
 by smtp.gmail.com with ESMTPSA id 7sm9532607pfm.25.2022.01.17.05.29.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 05:29:16 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Subject: [PATCH v7 01/23] target/riscv: Fix trap cause for RV32 HS-mode CSR
 access from RV64 HS-mode
Date: Mon, 17 Jan 2022 18:58:04 +0530
Message-Id: <20220117132826.426418-2-anup@brainfault.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220117132826.426418-1-anup@brainfault.org>
References: <20220117132826.426418-1-anup@brainfault.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::635
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::635;
 envelope-from=anup@brainfault.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Anup Patel <anup@brainfault.org>, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Atish Patra <atishp@atishpatra.org>, Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Anup Patel <anup.patel@wdc.com>

We should be returning illegal instruction trap when RV64 HS-mode tries
to access RV32 HS-mode CSR.

Fixes: d6f20dacea51 ("target/riscv: Fix 32-bit HS mode access permissions")
Signed-off-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/csr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index adb3d4381d..bee42b6073 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -182,7 +182,7 @@ static RISCVException hmode(CPURISCVState *env, int csrno)
 static RISCVException hmode32(CPURISCVState *env, int csrno)
 {
     if (riscv_cpu_mxl(env) != MXL_RV32) {
-        if (riscv_cpu_virt_enabled(env)) {
+        if (!riscv_cpu_virt_enabled(env)) {
             return RISCV_EXCP_ILLEGAL_INST;
         } else {
             return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
-- 
2.25.1


