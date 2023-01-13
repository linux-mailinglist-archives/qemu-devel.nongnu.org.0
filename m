Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9873669EBB
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 17:51:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGMJ2-0003VE-Fn; Fri, 13 Jan 2023 10:49:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGMIq-0003Jd-3s
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 10:49:12 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGMIo-0006gl-BV
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 10:49:11 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 m26-20020a05600c3b1a00b003d9811fcaafso17660458wms.5
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 07:49:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DnhJ7rZGBGKTAcNlXGvyVGOP+VYybjlW9y+KDk+N4ic=;
 b=MH66mGAxxWVr2qmCWjN9dXF1fjV4zXEMdclzj5zwL4hMhXjExjx0Qimbu7XhUK2Mni
 h8FE+/lnc62TiXdcQLd+ZHK+2ur9ElvQv2fPfc5c7+kbRFUP3wLGLLCmgFI5SVxL0eUi
 BtUPjEi42zOK7vErNik1HWPq5amAANs42XGLLPBZPoDlh3zhhng7MzmIe3eyX3E348dC
 T5AttgVEpeVYHZac4dwmSIOq/8zrNndUa3lBRpql2NK6hzpJAxTYOuHwBcCK3Ohtq246
 jPGrcQPokH6givAO7B4gjflna+0qJQhMO/IJeweR87JzReOIBKjSAtf35zT22L7bV7XE
 xFLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DnhJ7rZGBGKTAcNlXGvyVGOP+VYybjlW9y+KDk+N4ic=;
 b=38YBF/nBCBKh2pNG4tv3vQSqo1SH4qDTNs/77ypQsodiv8E/H6ArReDxYSOZK5pGIl
 Fluqr5w69bkowGbrl3J8D5wsa0o+Q0FhzKO5hYLSIsACPSJ9sju/vcq0HHkVW0vY/25n
 5duYS+h8oCEdcE8teUtqo4JPaGKFkr4yLFmTLPziDzsODzqmu1Jmyslu3L9VE3t94E5D
 N0wnkYz1yu74I3oiZqafX/U9YU1H6+Uh86q3ibkIGB03wXfZmAfFrRFiYSJX9She2+Vw
 hADz7szbf2auqkD+Wt0GchqBy/LIUVwGzwydfGS7SRMWJfVRzcVAG5DnMUqYv3B6deug
 Q9bg==
X-Gm-Message-State: AFqh2kp5a7HUX8+G+Ktbaaph34YxI8+Wa+iM9z1Y/gBwygoQHBxrDdr9
 xCpXcn9MZkHFIs8+6j9QvbbKdgXbHeH6Guf1
X-Google-Smtp-Source: AMrXdXuwsXfT068o0Vm4/YEymz5dMu/U3TPZaWdK6LDNC93lHeNd3p96Ap4eDRqcFGp2yBjWzn2xUQ==
X-Received: by 2002:a05:600c:1c85:b0:3d3:4b18:27c6 with SMTP id
 k5-20020a05600c1c8500b003d34b1827c6mr57829632wms.11.1673624947374; 
 Fri, 13 Jan 2023 07:49:07 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 p16-20020a05600c469000b003d9b87296a9sm32823139wmo.25.2023.01.13.07.49.06
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 13 Jan 2023 07:49:07 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Paul Burton <paulburton@kernel.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [PULL 44/46] hw/mips/boston: Rename MachineState 'mc' pointer to 'ms'
Date: Fri, 13 Jan 2023 16:45:30 +0100
Message-Id: <20230113154532.49979-45-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230113154532.49979-1-philmd@linaro.org>
References: <20230113154532.49979-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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

From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Follow the QEMU convention of naming MachineState pointers as 'ms' by
renaming the instance in create_fdt() where we're calling it 'mc'.

Cc: Paul Burton <paulburton@kernel.org>
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Suggested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-Id: <20230111172133.334735-1-dbarboza@ventanamicro.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/mips/boston.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/mips/boston.c b/hw/mips/boston.c
index b6dd9fb200..a9d87f3437 100644
--- a/hw/mips/boston.c
+++ b/hw/mips/boston.c
@@ -515,7 +515,7 @@ static const void *create_fdt(BostonState *s,
 {
     void *fdt;
     int cpu;
-    MachineState *mc = s->mach;
+    MachineState *ms = s->mach;
     uint32_t platreg_ph, gic_ph, clk_ph;
     char *name, *gic_name, *platreg_name, *stdout_name;
     static const char * const syscon_compat[2] = {
@@ -542,7 +542,7 @@ static const void *create_fdt(BostonState *s,
     qemu_fdt_setprop_cell(fdt, "/cpus", "#size-cells", 0x0);
     qemu_fdt_setprop_cell(fdt, "/cpus", "#address-cells", 0x1);
 
-    for (cpu = 0; cpu < mc->smp.cpus; cpu++) {
+    for (cpu = 0; cpu < ms->smp.cpus; cpu++) {
         name = g_strdup_printf("/cpus/cpu@%d", cpu);
         qemu_fdt_add_subnode(fdt, name);
         qemu_fdt_setprop_string(fdt, name, "compatible", "img,mips");
-- 
2.38.1


