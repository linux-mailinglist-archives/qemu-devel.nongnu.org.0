Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C21967A38A
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 21:02:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKPTE-0007Gk-Qy; Tue, 24 Jan 2023 15:00:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1pKPSj-00075f-J1
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 15:00:09 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1pKPSh-0002du-Rc
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 15:00:09 -0500
Received: by mail-wr1-x436.google.com with SMTP id t18so2179732wro.1
 for <qemu-devel@nongnu.org>; Tue, 24 Jan 2023 12:00:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N7n8pswPkAZaRTA9ogyPX3kWNifKRUmtja86fT61IcQ=;
 b=D+Lo6aG4jgg3R6afbjWPzxI17s/RFg1Ue+lf0JhAU0GEjRKisXT4eU5iKlHYOj6mNT
 jdOvf94O48XKgILk9GZPqNXt4BNm6RQqWyPida75QGbHBYWKrpx0MSmP+bjTd8nvRqS1
 2MaOklJh/kqmm3aKyf6qByEEtImf9qxIQZmL5ODP9Wv8rx5kcPuhiSTpbqyaEk45czt1
 3uGxoq+evYGgB3PXjdVSMc++xhpO8qh7ai5qctjOlU+seyQpoRLoLopTOcxA1epNfxIu
 MZiYvs7PEzbgCmVgb/AKPFfzJ/g6fqJzcAgpJzzIivahP7njcTg1XWsLzIl9wJZnaQ+j
 fWKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N7n8pswPkAZaRTA9ogyPX3kWNifKRUmtja86fT61IcQ=;
 b=494mI9SEqdHmsQhJiUzNGPkhDUCWNKvalFUGq0p2c19azS9sXDO1bANxLVz9C18MUL
 Gmc4kWsl/A/p0MwuPSQDQELnDSAbc6EIxIAMN+RXIlwFNGWyeGdGDrSJ/TH2OfQcOiSn
 woZhPi9mFkFobbw9W7bdsLuQf7QfmU/p1hAacHjV+Er+INDRxt+Swhdq2cRkppMVkHx2
 giyvlE+7TcM5zIvLXqkQbGbDvYuUKvyUm+wjqv46DQ1CIrDBlESe8ElZLFd6IXOGdPO4
 Ls/Zjyzt9Iu9D0h+HLXgGUokmjz/z8NR/dtJtqm1CMLfLu7D/tZ8CV6HV4NvN8rx9/2z
 GgPw==
X-Gm-Message-State: AFqh2kpGgy06LScU+Cxgjt8+2nD26km8sfOXbtB/L3NEWkYpRZ+AgRvo
 +ClXfvtSfI1WgXJCzw4NbsXhsw==
X-Google-Smtp-Source: AMrXdXsWedHheNHinE6JcZDevf7GxWkDYwoNc++EnZ/9Dq2eLON0DlciLsmnX4F3hJTlHPk30q//kQ==
X-Received: by 2002:adf:c688:0:b0:2bf:94ea:67ca with SMTP id
 j8-20020adfc688000000b002bf94ea67camr14663246wrg.25.1674590406654; 
 Tue, 24 Jan 2023 12:00:06 -0800 (PST)
Received: from beast.fritz.box (62-178-148-172.cable.dynamic.surfer.at.
 [62.178.148.172]) by smtp.gmail.com with ESMTPSA id
 j26-20020a5d453a000000b002bdf3809f59sm2607005wra.38.2023.01.24.12.00.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 12:00:06 -0800 (PST)
From: Christoph Muellner <christoph.muellner@vrull.eu>
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko.stuebner@vrull.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Nelson Chu <nelson@rivosinc.com>, Kito Cheng <kito.cheng@sifive.com>,
 Cooper Qu <cooper.qu@linux.alibaba.com>,
 Lifang Xia <lifang_xia@linux.alibaba.com>,
 Yunhai Shang <yunhai@linux.alibaba.com>,
 Zhiwei Liu <zhiwei_liu@linux.alibaba.com>
Cc: =?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>
Subject: [PATCH v3 11/14] RISC-V: Set minimum priv version for Zfh to 1.11
Date: Tue, 24 Jan 2023 20:59:42 +0100
Message-Id: <20230124195945.181842-12-christoph.muellner@vrull.eu>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230124195945.181842-1-christoph.muellner@vrull.eu>
References: <20230124195945.181842-1-christoph.muellner@vrull.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=christoph.muellner@vrull.eu; helo=mail-wr1-x436.google.com
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

From: Christoph Müllner <christoph.muellner@vrull.eu>

There are no differences for floating point instructions in priv version 1.11
and 1.12. There is also no dependency for Zfh to priv version 1.12.
Therefore allow Zfh to be enabled for priv version 1.11.

Acked-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Christoph Müllner <christoph.muellner@vrull.eu>
---
 target/riscv/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 6121a5e4ba..b18df9fa2a 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -77,7 +77,7 @@ static const struct isa_ext_data isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(zifencei, true, PRIV_VERSION_1_10_0, ext_ifencei),
     ISA_EXT_DATA_ENTRY(zihintpause, true, PRIV_VERSION_1_10_0, ext_zihintpause),
     ISA_EXT_DATA_ENTRY(zawrs, true, PRIV_VERSION_1_12_0, ext_zawrs),
-    ISA_EXT_DATA_ENTRY(zfh, true, PRIV_VERSION_1_12_0, ext_zfh),
+    ISA_EXT_DATA_ENTRY(zfh, true, PRIV_VERSION_1_11_0, ext_zfh),
     ISA_EXT_DATA_ENTRY(zfhmin, true, PRIV_VERSION_1_12_0, ext_zfhmin),
     ISA_EXT_DATA_ENTRY(zfinx, true, PRIV_VERSION_1_12_0, ext_zfinx),
     ISA_EXT_DATA_ENTRY(zdinx, true, PRIV_VERSION_1_12_0, ext_zdinx),
-- 
2.39.0


