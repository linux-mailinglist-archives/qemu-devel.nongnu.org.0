Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA59490A90
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 15:37:00 +0100 (CET)
Received: from localhost ([::1]:50670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9T7z-0006yd-WB
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 09:37:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n9S5d-0001QN-H0
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 08:30:30 -0500
Received: from [2607:f8b0:4864:20::1029] (port=53793
 helo=mail-pj1-x1029.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n9S5W-00012Y-2s
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 08:30:24 -0500
Received: by mail-pj1-x1029.google.com with SMTP id m13so20544031pji.3
 for <qemu-devel@nongnu.org>; Mon, 17 Jan 2022 05:30:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E5KywehhW+LFtSyAdk7dOMvOyCasUk5k/8EijDUesrA=;
 b=tgH9gvV2iv7HrcAPhTFo6vmyJt7EYdeFdsobxyC9g+LScFe3Bg7ZXha/a19TiMj3Qt
 Avw+uwi7En0vIRYE0IXwNF31bpAxWbpOkXEDCoMalclsSoABV0hAnQdK4laoxPApZeTg
 IZIfwyCjolJc7sasIh01B9Ut9huJKvKWtpJ6nRnWg6VtP4W3BlJaxiQ8KM2iH/4bUjZI
 MEecaDJwf6xTWoV84XmrHmr9E9h6f2zFjbw9IbUqGCQ2VjzoK69iEOSofIoN1LgocwaE
 g3ObRUESCs5iJgnl8hSkTW55gxHVrxFswPl5ZtDg0U5DLwBoyXQttcBD5xXIFd0yfcaY
 UkbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E5KywehhW+LFtSyAdk7dOMvOyCasUk5k/8EijDUesrA=;
 b=S/GSYJl0UO3Az97RsbEXa/MwABxQbYlTvE73YzLGduTqVTJWNnM79T9Q/EVbGN+/W2
 WY1W3fsI40cQqXysy2lx31+++JnNBCby/EahrVJ6NBZQW5E1Kn5nmIyokCsIcdiOI64/
 31z4+XIw+E6DIo2cyHJws3rarYh8IkSKnjTkHjlVVQiWqyrG9S4tthAkORHhTlDPDtdO
 7LrqXiH3bKt0aYM4P9PFAvCbZu4BrLmzo2bltKO7j/zkb+ls9WUDzYmqbPt1cL5jvadU
 XjIzDYKYMqRgLtOMk7VFYktPK40UGIy+NIK6qsPlTMwf65VGKlD2cjJIWafivFs9NflK
 4YAw==
X-Gm-Message-State: AOAM5330n852Yvw/F7VJl1wg/Y1orMRlmimNX9MRypg7Fdo2iivKD/3t
 1+LjFL70TFEZIxfmorkSR58WcA==
X-Google-Smtp-Source: ABdhPJwqZzB3amuPIz1FkyaatCIUeHr3Q5ZIaQ68Q7aHoq+9TvxRQqLwrBipVrTValJipycKOD3o5g==
X-Received: by 2002:a17:90b:4b83:: with SMTP id
 lr3mr25830254pjb.59.1642426220666; 
 Mon, 17 Jan 2022 05:30:20 -0800 (PST)
Received: from localhost.localdomain ([122.179.70.109])
 by smtp.gmail.com with ESMTPSA id 7sm9532607pfm.25.2022.01.17.05.30.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 05:30:19 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Subject: [PATCH v7 16/23] hw/riscv: virt: Use AIA INTC compatible string when
 available
Date: Mon, 17 Jan 2022 18:58:19 +0530
Message-Id: <20220117132826.426418-17-anup@brainfault.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220117132826.426418-1-anup@brainfault.org>
References: <20220117132826.426418-1-anup@brainfault.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1029
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::1029;
 envelope-from=anup@brainfault.org; helo=mail-pj1-x1029.google.com
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


