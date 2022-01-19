Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B589D493E78
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 17:42:36 +0100 (CET)
Received: from localhost ([::1]:32988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAE2d-0000bV-Pg
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 11:42:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nACsV-000830-0E
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 10:28:03 -0500
Received: from [2607:f8b0:4864:20::636] (port=43939
 helo=mail-pl1-x636.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nACsQ-0000YX-A1
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 10:28:02 -0500
Received: by mail-pl1-x636.google.com with SMTP id d1so2507692plh.10
 for <qemu-devel@nongnu.org>; Wed, 19 Jan 2022 07:27:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CnHH56RqfoB2RJzhhfZR7f6puxrawvCR54T85x1CXEM=;
 b=pm33744mSbETIHzlSPZ5BoX7TSbrcaik3YNtZGgmVTHJt29klTbHZm9E64GHRt4Rau
 teiHWIEL3CVoZElu3vzkOLSfUJ98du7GtmL+ZgZm+ceyMn/euPmvd8/cbJMm0WK23LcL
 9HsZmhbQPPYZcWQ9dQJ0ymgEU3hCkHnDQAuyVMsCTuExvzWtOhgwtwbK/d1wd5EUR1E/
 +6VeQviwhoUqOrIHZEhNRN+IehF/y64ecHMAU/+yqs+WAR85E7Y6ItWeCu5JHoLZL1zX
 w97g3LGdEjqCe5DPa0qXvuFFrHYB7PRgdP6rJ4bX8bRqu/ECyVFtTADyUse1e87cHxAr
 oPMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CnHH56RqfoB2RJzhhfZR7f6puxrawvCR54T85x1CXEM=;
 b=BmhXAImISmE1K2hkUa4ehC8rNz7XyisGPhLK8FoEwvYq9VJWEx0dNmaChnSAirxBAg
 WMoBCBKeOXzG26jY81VlPiv4EArdzJkUsL7E5xeSQVitT3X4OcKQk/ECpd+ObW2gwHZt
 fgy88011g+TcBH9KH5WZWkM2X6W5699fbYVvF+VcN+m/kBUSK+P7SzmPXK2TGqZrp2xr
 7IXBG56cLTa8RGdqEQgEMmel0hvHyX/xjXJG39CH1Jslb28LlthVg044YN0QQ0KQLK7W
 37Q88VwOaqL0Cfi58lf7kWSCvSqr+GNJDLfaR2yY2NnF1NNtHWQz0Z4IvcOmT47nGDYS
 +/yQ==
X-Gm-Message-State: AOAM532IEsVREniCqal9bASAf1Uj7uiXcTLnRuLQWGv26oetDONKD49J
 Nqc0PppdqVoX46iwxfWDB+dMCT/06Nr0kA==
X-Google-Smtp-Source: ABdhPJxe1w3frYoNS2FHJ7zvr510pvLtnCJRf4u0Hx+39u05MmmKEBxxdjFQgV4s000Xiu8cM8h1+g==
X-Received: by 2002:a17:90a:2e81:: with SMTP id
 r1mr5029697pjd.174.1642606065867; 
 Wed, 19 Jan 2022 07:27:45 -0800 (PST)
Received: from localhost.localdomain ([122.179.40.245])
 by smtp.gmail.com with ESMTPSA id 187sm26791pfv.157.2022.01.19.07.27.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jan 2022 07:27:45 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Subject: [PATCH v8 17/23] target/riscv: Allow users to force enable AIA CSRs
 in HART
Date: Wed, 19 Jan 2022 20:56:08 +0530
Message-Id: <20220119152614.27548-18-anup@brainfault.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220119152614.27548-1-anup@brainfault.org>
References: <20220119152614.27548-1-anup@brainfault.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::636
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::636;
 envelope-from=anup@brainfault.org; helo=mail-pl1-x636.google.com
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

We add "x-aia" command-line option for RISC-V HART using which
allows users to force enable CPU AIA CSRs without changing the
interrupt controller available in RISC-V machine.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/cpu.c | 5 +++++
 target/riscv/cpu.h | 1 +
 2 files changed, 6 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index f137c4bffb..2668f9c358 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -508,6 +508,10 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         }
     }
 
+    if (cpu->cfg.aia) {
+        riscv_set_feature(env, RISCV_FEATURE_AIA);
+    }
+
     set_resetvec(env, cpu->cfg.resetvec);
 
     /* Validate that MISA_MXL is set properly. */
@@ -749,6 +753,7 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("x-j", RISCVCPU, cfg.ext_j, false),
     /* ePMP 0.9.3 */
     DEFINE_PROP_BOOL("x-epmp", RISCVCPU, cfg.epmp, false),
+    DEFINE_PROP_BOOL("x-aia", RISCVCPU, cfg.aia, false),
 
     DEFINE_PROP_UINT64("resetvec", RISCVCPU, cfg.resetvec, DEFAULT_RSTVEC),
     DEFINE_PROP_END_OF_LIST(),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 058ea9ce99..9d24d678e9 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -387,6 +387,7 @@ struct RISCVCPU {
         bool mmu;
         bool pmp;
         bool epmp;
+        bool aia;
         uint64_t resetvec;
     } cfg;
 };
-- 
2.25.1


