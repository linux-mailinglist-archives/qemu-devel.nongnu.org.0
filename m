Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 110556DC7BA
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Apr 2023 16:14:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1plsHH-00012O-Ev; Mon, 10 Apr 2023 10:13:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1plsHF-00011i-Ba
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 10:13:49 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1plsHE-0000Pt-0R
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 10:13:49 -0400
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-63266bbff53so531695b3a.3
 for <qemu-devel@nongnu.org>; Mon, 10 Apr 2023 07:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1681136026; x=1683728026;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OcH4w6tRPn9WyarG+LzAEbQ8PKEmCZEgzDYRD1X2f0s=;
 b=WdAeWmWs4AEobpIJcf9xEinJEzl0oQNoqp6xEFW/g2+mx4mfKCedj0gvu1GjFUE5KT
 s4Zk4eEvIN5K3vXxZZ3oi0E4wewk8b0ACH/HLo4xfsdEoCUVZi+ketL0GwsvRZpSMCE0
 MP7xcvZDZ8G1EPpXmq/0FjB5Nb82+sCGPjFUPlwWgADxYThOUqi9P/8FL9roxmbgHNUZ
 Ac50YeYfXb83YOu6v1lWP56NnBNW8M1PQgcxr2er8MuEh2TTodtgQgsBCg92F4epSiMx
 JyJ0hBP2TwGg6UTWT5sbIX+ftmvBM84YaO4FOfSMKr3D+j2HgEzFaQ1bo0Ri+9gvnYxF
 gHvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681136026; x=1683728026;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OcH4w6tRPn9WyarG+LzAEbQ8PKEmCZEgzDYRD1X2f0s=;
 b=dYgVf+4LkyZcWC+c0K9yUW+wdIIrGxyLMdGGeHFodZR4PL7YPxBYOcvhmfJTvQIgjV
 34QBM867LtAbKpVjVINGJGcSgldkTSo/42uVzsTPUz7aXnzNcSKPinyppxM9r/4ZsyHP
 4TXQSuQzaOT/Gbj29sE0dhozfBB+RGe88s1D54PbutRfExvVEeNxFLkBiBHeKvnDtdxb
 kjIG3rTlFLbM0P7ty0gCHdnxQbqNltaNpgyTeMRRev3MW5sWPfDMulfQhGHBRPN7Io/Q
 ZbPvSBIkLvUb8TOMs7BjoNNTWZlsVb884VdJ39J/sdY2DezxnURbHYakdiTGTEnA8Rer
 ExKA==
X-Gm-Message-State: AAQBX9dLmPG/7JwbHniPbKTd9x8o3jTrqg7gDqO+bg4+QBUm6YGzURz6
 eDLyQkqUp7bMEMpIcqRYd3goSpF6DW39j9rX0GBSkg==
X-Google-Smtp-Source: AKy350ZnzifSjf0nEQ8oBZMBe+7i7bIzUfTWtdzWU7r2NC4yoU+xKjLnxxf6Lp3d2jITMg8F6xgazg==
X-Received: by 2002:aa7:960f:0:b0:5a8:4861:af7d with SMTP id
 q15-20020aa7960f000000b005a84861af7dmr11954953pfg.20.1681136026590; 
 Mon, 10 Apr 2023 07:13:46 -0700 (PDT)
Received: from mchitale-vm.. ([103.97.165.210])
 by smtp.googlemail.com with ESMTPSA id
 b22-20020aa78716000000b0063486255a87sm3783526pfo.142.2023.04.10.07.13.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 07:13:46 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org,
	alistair.francis@wdc.com
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
 Alistair Francis <alistair23@gmail.com>,
 Daniel Barboza <dbarboza@ventanamicro.com>, liweiwei@iscas.ac.cn,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [RFC PATCH 4/4] target/riscv: smstateen knobs
Date: Mon, 10 Apr 2023 19:43:16 +0530
Message-Id: <20230410141316.3317474-5-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230410141316.3317474-1-mchitale@ventanamicro.com>
References: <20230410141316.3317474-1-mchitale@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=mchitale@ventanamicro.com; helo=mail-pf1-x42e.google.com
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

Add knobs to allow users to enable smstateen and also export it via the
ISA extension string.

Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
Reviewed-by: Weiwei Li<liweiwei@iscas.ac.cn>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 1e97473af2..4e926b0143 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -112,6 +112,7 @@ static const struct isa_ext_data isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(zhinx, true, PRIV_VERSION_1_12_0, ext_zhinx),
     ISA_EXT_DATA_ENTRY(zhinxmin, true, PRIV_VERSION_1_12_0, ext_zhinxmin),
     ISA_EXT_DATA_ENTRY(smaia, true, PRIV_VERSION_1_12_0, ext_smaia),
+    ISA_EXT_DATA_ENTRY(smstateen, true, PRIV_VERSION_1_12_0, ext_smstateen),
     ISA_EXT_DATA_ENTRY(ssaia, true, PRIV_VERSION_1_12_0, ext_ssaia),
     ISA_EXT_DATA_ENTRY(sscofpmf, true, PRIV_VERSION_1_12_0, ext_sscofpmf),
     ISA_EXT_DATA_ENTRY(sstc, true, PRIV_VERSION_1_12_0, ext_sstc),
@@ -1395,8 +1396,8 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
     DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
 
+    DEFINE_PROP_BOOL("smstateen", RISCVCPU, cfg.ext_smstateen, false),
     DEFINE_PROP_BOOL("svadu", RISCVCPU, cfg.ext_svadu, true),
-
     DEFINE_PROP_BOOL("svinval", RISCVCPU, cfg.ext_svinval, false),
     DEFINE_PROP_BOOL("svnapot", RISCVCPU, cfg.ext_svnapot, false),
     DEFINE_PROP_BOOL("svpbmt", RISCVCPU, cfg.ext_svpbmt, false),
-- 
2.34.1


