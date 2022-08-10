Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14CA458F2BF
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 21:09:06 +0200 (CEST)
Received: from localhost ([::1]:51142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLr4j-0000zJ-5u
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 15:09:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@conchuod.ie>) id 1oLqik-0005ul-Em
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 14:46:22 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:36370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mail@conchuod.ie>) id 1oLqii-0007HT-Oz
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 14:46:22 -0400
Received: by mail-wr1-x42b.google.com with SMTP id j7so18769934wrh.3
 for <qemu-devel@nongnu.org>; Wed, 10 Aug 2022 11:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=conchuod.ie; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=VJdQR/zkeKenpTuqia/TTJ9m1dTc7j3X6f24wA4YnSA=;
 b=JCziDnpU8rCiA8ClzY/qKpkzwNSWGcUrRt8hBWMXdKyFhGK2L0StNyBrEujci74qL2
 0nW44P7962pD7aiCmXLxKgF0Y17J/doJaV1eFIlWyufOIdrqEGGVl94W9BbZO0kwQXRY
 LjdXlJKRmQZat78f15w4ni+6mcdd7NGoByc4ij86QBARZPGaG4N3Tou3Y1nBCaR3/Ejw
 sWmFKisjiPAP4SFIJvlFkZeIXzbCFCh/13miY5D6s611Asz41glRIYYAZf3yjNqm1QwV
 5sS1wIvdTJAVr6T8NaA053f76PwfV9gj6sMc1GhOsCLQdMZrkLn2Wwb1YodCLL1zB+re
 R5BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=VJdQR/zkeKenpTuqia/TTJ9m1dTc7j3X6f24wA4YnSA=;
 b=Rbu9GxyhjLYDmpMxN3DJxQQQrhycCIN7GMLs4rmE7+JIPO9p1bYL0jnTI6fjZJU56U
 /Uy/BO/VB5ZHsPas1Nu8ujwirFjuAlCyaCwdRAJijd/hB086lXGp9u5CbvCL2Cliu3Pz
 xB756NQt6grTQY5Ehs5uf22rdm2ekTeakBb2bMK1+ji6s9o1x3Z612dPYYIX/F3577+F
 4G9moKwDwZUScCgb72qJWp0pisen0+XAe9k9mhLf3s/D57orAuv+foeyMUdYREuc9onn
 5LMLDzCQiwI2lGKSas4WdWCF1eDs4/GkCKYLerFhkPCYjPWFsRvE0TNcbsTRtFIsAm5W
 f1jg==
X-Gm-Message-State: ACgBeo1/Wh3zSZVedoN6V5e25rrzMQdzJDlDtXKurzgIQE922vLILCN2
 9qQ6wsCG8t3ByXZH5xwBXz4Juw==
X-Google-Smtp-Source: AA6agR7TAaQQe6nfKejnLpfRfrSOf3iJHZk7un51nw1xco6YVF1eMQV4AjOpJBkFg0N8+VJaIdPvNQ==
X-Received: by 2002:a5d:504b:0:b0:220:7ae9:d7df with SMTP id
 h11-20020a5d504b000000b002207ae9d7dfmr17470381wrt.465.1660157179375; 
 Wed, 10 Aug 2022 11:46:19 -0700 (PDT)
Received: from henark71.. ([109.76.58.63]) by smtp.gmail.com with ESMTPSA id
 y13-20020adfdf0d000000b0021f0ff1bc6csm16944743wrl.41.2022.08.10.11.46.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 11:46:19 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor.dooley@microchip.com>,
 Jessica Clarke <jrtc27@jrtc27.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, linux-riscv@lists.infradead.org
Subject: [PATCH v3 4/4] hw/core: fix platform bus node name
Date: Wed, 10 Aug 2022 19:46:12 +0100
Message-Id: <20220810184612.157317-5-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220810184612.157317-1-mail@conchuod.ie>
References: <20220810184612.157317-1-mail@conchuod.ie>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=mail@conchuod.ie; helo=mail-wr1-x42b.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Conor Dooley <conor.dooley@microchip.com>

"platform" is not a valid name for a bus node in dt-schema, so warnings
can be see in dt-validate on a dump of the riscv virt dtb:

/stuff/qemu/qemu.dtb: platform@4000000: $nodename:0: 'platform@4000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|soc|axi|ahb|apb)(@[0-9a-f]+)?$'
        From schema: /home/conor/.local/lib/python3.9/site-packages/dtschema/schemas/simple-bus.yaml
"platform-bus" is a valid name, so use that instead.

CC: Rob Herring <robh@kernel.org>
Fixes: 11d306b9df ("hw/arm/sysbus-fdt: helpers for platform bus nodes addition")
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 hw/core/sysbus-fdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/core/sysbus-fdt.c b/hw/core/sysbus-fdt.c
index 19d22cbe73..edb0c49b19 100644
--- a/hw/core/sysbus-fdt.c
+++ b/hw/core/sysbus-fdt.c
@@ -539,7 +539,7 @@ void platform_bus_add_all_fdt_nodes(void *fdt, const char *intc, hwaddr addr,
 
     assert(fdt);
 
-    node = g_strdup_printf("/platform@%"PRIx64, addr);
+    node = g_strdup_printf("/platform-bus@%"PRIx64, addr);
 
     /* Create a /platform node that we can put all devices into */
     qemu_fdt_add_subnode(fdt, node);
-- 
2.37.1


