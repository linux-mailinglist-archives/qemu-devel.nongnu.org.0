Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B65414A9F05
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 19:29:30 +0100 (CET)
Received: from localhost ([::1]:36896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG3Kr-0001d6-79
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 13:29:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nG2hO-00060E-Gz
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 12:48:42 -0500
Received: from [2a00:1450:4864:20::42f] (port=33440
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nG2hJ-0003yd-K7
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 12:48:42 -0500
Received: by mail-wr1-x42f.google.com with SMTP id e8so12816692wrc.0
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 09:48:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pp8R2yp0LwUIqj1uG0Z00NdjUepf/4Fv+MsY1tChXMw=;
 b=PaV1mKaqr+CMDsNeD1CiVKQMRh6i0PnTejy9cvAWbFXEhcDwfecHNQfC8fbzCB+DM8
 A2cvCXPTHnHTP/cL/uZYm6AhbdfLTsmUdjStvmcmPlX+bX5PSGafQAhxZvxnexhNq4YL
 EvbrcuNHnBlt8cOY8QPX+2hXHfxCkXztaVnk/VxDMXamBTcjZc5fHZka4BqJ/aEZWEzV
 Tpq/xkmOOf/WHmKTbL7W7Hbxp5Hzj2aGQXeMGxTcftRudbktA6ZqQgtzawDpIBMa/C6i
 4rcLtZv/YPGmNHEDBKGSucFaZqdS74M8SQbfxM7UNDHB8q5ltFZTZswmiY7iAk1ytt1z
 onSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pp8R2yp0LwUIqj1uG0Z00NdjUepf/4Fv+MsY1tChXMw=;
 b=fs2pZrOTGTsaM8LxUrfJZsNdOFbV7Iy52r6Vzy8URBdpu2ieRJXKE+offXrjAsmEuj
 AE29vYSivlTMwj0nt2n6lsuaZaw3cT7buHltdgkAqvZfTajQLr8NwTO2VPLwvs1yA8EA
 TaqNmMmZlu5/PKdNhyNPygi8qgFl5I81JAeox1f9y2bju+M7nXuxxdPGf0PiUOkz93Bn
 rJXMhxtaDAtBC/TP3rNHwPH51zhEmIW4rv7K6FHWP1bwHaqI/XwD9At4M/7OxBHRbf0j
 kHc6wWT9NweYGDcLJexyTVezNU7FtLAhzYLzHva9oAYFWnwMwRbrYQnYTL1Y2upQF0RL
 GVKw==
X-Gm-Message-State: AOAM530mfNMyYOH7ko5YhqGvETmQQ5CsBfMye6ULyxjWbMXQ1IHd0Lgb
 cOy1C5B1pHgnE5jTn2tWyJYXSg==
X-Google-Smtp-Source: ABdhPJyreK4yVcbEAQmHL6uNW0WrwbnuLr85eDXUBR3Yei0qJ9lkFXTtDS+dZDiDPP8Vg8G/I9zw9g==
X-Received: by 2002:adf:f252:: with SMTP id b18mr30287wrp.50.1643996916335;
 Fri, 04 Feb 2022 09:48:36 -0800 (PST)
Received: from localhost.localdomain ([122.167.157.188])
 by smtp.gmail.com with ESMTPSA id f13sm11381876wmq.29.2022.02.04.09.48.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 09:48:35 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Subject: [PATCH v9 16/23] hw/riscv: virt: Use AIA INTC compatible string when
 available
Date: Fri,  4 Feb 2022 23:16:52 +0530
Message-Id: <20220204174700.534953-17-anup@brainfault.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220204174700.534953-1-anup@brainfault.org>
References: <20220204174700.534953-1-anup@brainfault.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::42f;
 envelope-from=anup@brainfault.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

We should use the AIA INTC compatible string in the CPU INTC
DT nodes when the CPUs support AIA feature. This will allow
Linux INTC driver to use AIA local interrupt CSRs.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
---
 hw/riscv/virt.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 2643c8bc37..e3068d6126 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -212,8 +212,17 @@ static void create_fdt_socket_cpus(RISCVVirtState *s, int socket,
         qemu_fdt_add_subnode(mc->fdt, intc_name);
         qemu_fdt_setprop_cell(mc->fdt, intc_name, "phandle",
             intc_phandles[cpu]);
-        qemu_fdt_setprop_string(mc->fdt, intc_name, "compatible",
-            "riscv,cpu-intc");
+        if (riscv_feature(&s->soc[socket].harts[cpu].env,
+                          RISCV_FEATURE_AIA)) {
+            static const char * const compat[2] = {
+                "riscv,cpu-intc-aia", "riscv,cpu-intc"
+            };
+            qemu_fdt_setprop_string_array(mc->fdt, intc_name, "compatible",
+                                      (char **)&compat, ARRAY_SIZE(compat));
+        } else {
+            qemu_fdt_setprop_string(mc->fdt, intc_name, "compatible",
+                "riscv,cpu-intc");
+        }
         qemu_fdt_setprop(mc->fdt, intc_name, "interrupt-controller", NULL, 0);
         qemu_fdt_setprop_cell(mc->fdt, intc_name, "#interrupt-cells", 1);
 
-- 
2.25.1


