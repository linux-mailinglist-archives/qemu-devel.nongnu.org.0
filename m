Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D968481C51
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Dec 2021 14:02:21 +0100 (CET)
Received: from localhost ([::1]:45920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2v4S-0007YM-Uz
	for lists+qemu-devel@lfdr.de; Thu, 30 Dec 2021 08:02:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n2ufo-0003ao-Ee
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 07:36:48 -0500
Received: from [2607:f8b0:4864:20::42a] (port=39455
 helo=mail-pf1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n2ufm-0003SH-9b
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 07:36:47 -0500
Received: by mail-pf1-x42a.google.com with SMTP id s15so21300337pfk.6
 for <qemu-devel@nongnu.org>; Thu, 30 Dec 2021 04:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6KNcxB0lI+145naSOKpjow3XUCsQJZAnp5v4CWe5LiQ=;
 b=i/XLEi9gvP9RnOOUcndn4eoQFfHb7Lp2xSMNLauICR5/FWFTqT6q8dfVGDnWSg2j9x
 EkJUekUiK0coZ5hUvPcVwdavwZUcr2mAMl036in9LjFUMYM0+R7biWBbVmK0ImdYV++Z
 +Xm8OOW0++8J3O1d2RbfxSKDBoFz4wqPyJ3vshHGVtWEo0AIvNZu2+SHRWfhDwjdWRMI
 4hub/BVIKyXA3u14GTQCLP+cDXnu2smPPs+GjIqZUJv8ZfZHBUSt5KRW7xuQiYydSG1w
 +QSrGtfg9Wqi+uRb4265/zJaOyVTPQtWGGULBCNTiMcST6evW+L0opF13JPYSuTB07gj
 Jy1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6KNcxB0lI+145naSOKpjow3XUCsQJZAnp5v4CWe5LiQ=;
 b=X9VL46+6TTDqeCbWvUgRpD6g064Ibpn0tCR/s6UjvqO2z3ODMazDcQZ3y/uX65WMsZ
 SIHFbFBSSEus2KP4lcMGj1T2gcZP3xQC29bu0+vOA//3pRuobNOEKgFsAShx34XEwA1K
 +2iDHc+g21DaQ6PHBhMdp1KiUVdpgMgHufpRId8unzPPg8ccJnLTx/7NjSbjBkW5vOFI
 I/NROPJXJlYNvNg7vV3hbF+2m7915EZ2heAbsKvCFvm0XpUwjIiWLDzQie6IysQRWAlw
 Y42YCJiEVKAFC0VWfkOQGRl9+zdJJwcPKhgun0F18ojf5P62e9DIAGCVQSn1EDmB5TvL
 tsmw==
X-Gm-Message-State: AOAM532Wa9FHIlY/THP6uG69LpxfD28jLWBAGlbK9ot9AnDp2wCMQ/dG
 NKn2rOq0zUThGhanrJVEavVDaA==
X-Google-Smtp-Source: ABdhPJzJwf3dkh3dhpoIpux70bsHIbxkE9En0c7Q4BEhtUqeAIMh05POl2dYt5TVhrO4aCSJ5l9gvg==
X-Received: by 2002:aa7:868d:0:b0:4ba:e919:b2f1 with SMTP id
 d13-20020aa7868d000000b004bae919b2f1mr31130673pfo.31.1640867805001; 
 Thu, 30 Dec 2021 04:36:45 -0800 (PST)
Received: from localhost.localdomain ([171.61.71.9])
 by smtp.gmail.com with ESMTPSA id a3sm28588348pfv.47.2021.12.30.04.36.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Dec 2021 04:36:44 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Subject: [PATCH v6 16/23] hw/riscv: virt: Use AIA INTC compatible string when
 available
Date: Thu, 30 Dec 2021 18:05:32 +0530
Message-Id: <20211230123539.52786-17-anup@brainfault.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211230123539.52786-1-anup@brainfault.org>
References: <20211230123539.52786-1-anup@brainfault.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42a
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::42a;
 envelope-from=anup@brainfault.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: qemu-riscv@nongnu.org, Anup Patel <anup@brainfault.org>,
 qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
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
---
 hw/riscv/virt.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 3af074148e..720641b1dd 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -211,8 +211,17 @@ static void create_fdt_socket_cpus(RISCVVirtState *s, int socket,
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


