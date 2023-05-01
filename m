Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF57E6F31C0
	for <lists+qemu-devel@lfdr.de>; Mon,  1 May 2023 16:02:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptU5Q-0003Jn-Mx; Mon, 01 May 2023 10:01:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1ptU5E-0003Gr-Te
 for qemu-devel@nongnu.org; Mon, 01 May 2023 10:00:59 -0400
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1ptU5B-0006KU-GR
 for qemu-devel@nongnu.org; Mon, 01 May 2023 10:00:51 -0400
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-18f4a6d2822so16638322fac.1
 for <qemu-devel@nongnu.org>; Mon, 01 May 2023 07:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1682949648; x=1685541648;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ry93EuiL339cXmTcSwW+O/TAemEHyYi1HmGB8rjIeQg=;
 b=Zj4jtWwgEX6mjVCbvPYoyJtgrQaQwqcaPohyiqGS89kchaZ7s6PGomzmRqIrH5ceUJ
 MjLRH6Ers+OrQYkMRMQWUD0VwawQ7n0nOFpOd7j9lshf7wGNkt9wxOdSKhD4Edg7Fsxh
 7+XX8kV2CeN3UiS1XeVNjE88eAAjAAVWasziS73FcK0YuaXJ2K3NgEJ32jttonGzJurt
 pItt/bDusymTKTKeuEUaHm6beK1x9NfbA2O/Uq3FdkgMuayH8KwSN6UtA2H0tFvsd1zs
 K9zhRZqjTGtUOYSr8DxErUNZ3A+WDEyVY3j5V45jipst2LrjsTH3N/ziYptaMnC3+9JQ
 QzIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682949648; x=1685541648;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ry93EuiL339cXmTcSwW+O/TAemEHyYi1HmGB8rjIeQg=;
 b=hrRYhlJuCstjPVgKGXZbjzFOBC+hCmIig39BHB2l8swS3EOyPpEnEC+Cbu8CYxwfns
 +QheHnzNE8AdI8kkxj1L3chM0ofkLJSzU46uOzXfybBJLuuqT6QXA25kEa+uTIZdTfGu
 /PGSblNZLLjaIxTua1Tdo4It+aKosRD7QtIIJi4udFVUVbIOV7F7jl20Yn2qIW2j1dCJ
 5l+VcZiFW/2uDijREqyulDwiMK3wg+KDCO3xdFJp1gCy5b1p/X6jN3T7Fmyg0dNDXjQx
 5rw3yXBfGCJMLW1tzXN4oga5mnGEslL4z2Owl1VXFVxOocK3cbECppE9gYGnPpGrFNex
 zRtA==
X-Gm-Message-State: AC+VfDzPvUPTDNfHH1cp4VsTYD06sjPNrlfhgfpFY7QdD6DZEPD9cJTL
 CqS0Va9eGBkXmeDRFS3BZK7aRCHn5LIjLjbD2Vftmg==
X-Google-Smtp-Source: ACHHUZ7ffdaAbYd1NiyvihdcR7+nEc9PLhTkiUokwgdxwyp4miEwMpBg8Re5URwWm29+VDV1jcgHHQ==
X-Received: by 2002:a05:6870:8990:b0:184:283f:e3c8 with SMTP id
 f16-20020a056870899000b00184283fe3c8mr8132985oaq.1.1682949647850; 
 Mon, 01 May 2023 07:00:47 -0700 (PDT)
Received: from mchitale-vm.. ([103.97.165.210])
 by smtp.googlemail.com with ESMTPSA id
 f12-20020a9d6c0c000000b006a44338c8efsm10744342otq.44.2023.05.01.07.00.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 May 2023 07:00:47 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org,
	alistair.francis@wdc.com
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
 Alistair Francis <alistair23@gmail.com>,
 Daniel Barboza <dbarboza@ventanamicro.com>, liweiwei@iscas.ac.cn,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v4 3/3] target/riscv: smstateen knobs
Date: Mon,  1 May 2023 19:30:20 +0530
Message-Id: <20230501140020.3667219-4-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230501140020.3667219-1-mchitale@ventanamicro.com>
References: <20230501140020.3667219-1-mchitale@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::30;
 envelope-from=mchitale@ventanamicro.com; helo=mail-oa1-x30.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
index befa64528f..9420cd670e 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -119,6 +119,7 @@ static const struct isa_ext_data isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(zhinx, PRIV_VERSION_1_12_0, ext_zhinx),
     ISA_EXT_DATA_ENTRY(zhinxmin, PRIV_VERSION_1_12_0, ext_zhinxmin),
     ISA_EXT_DATA_ENTRY(smaia, PRIV_VERSION_1_12_0, ext_smaia),
+    ISA_EXT_DATA_ENTRY(smstateen, PRIV_VERSION_1_12_0, ext_smstateen),
     ISA_EXT_DATA_ENTRY(ssaia, PRIV_VERSION_1_12_0, ext_ssaia),
     ISA_EXT_DATA_ENTRY(sscofpmf, PRIV_VERSION_1_12_0, ext_sscofpmf),
     ISA_EXT_DATA_ENTRY(sstc, PRIV_VERSION_1_12_0, ext_sstc),
@@ -1498,8 +1499,8 @@ static Property riscv_cpu_extensions[] = {
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


