Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE906F1444
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 11:35:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psKVQ-0000Ut-Uy; Fri, 28 Apr 2023 05:35:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterlin@andestech.com>)
 id 1psKVH-0000Tj-V4
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 05:34:59 -0400
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70]
 helo=Atcsqr.andestech.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterlin@andestech.com>)
 id 1psKVF-00067J-Ua
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 05:34:59 -0400
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
 by Atcsqr.andestech.com with ESMTP id 33S9YdNV064294;
 Fri, 28 Apr 2023 17:34:39 +0800 (+08)
 (envelope-from peterlin@andestech.com)
Received: from atcfdc88.andestech.com (10.0.15.158) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0;
 Fri, 28 Apr 2023 17:34:37 +0800
From: Yu Chien Peter Lin <peterlin@andestech.com>
To: <qemu-devel@nongnu.org>
CC: <conor.dooley@microchip.com>, <ycliang@andestech.com>, Yu Chien Peter Lin
 <peterlin@andestech.com>
Subject: [PATCH 2/2] hw/riscv: virt: fix pmu subnode paths
Date: Fri, 28 Apr 2023 17:34:31 +0800
Message-ID: <20230428093431.10355-1-peterlin@andestech.com>
X-Mailer: git-send-email 2.38.0.68.ge85701b4af.dirty
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.0.15.158]
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL: Atcsqr.andestech.com 33S9YdNV064294
Received-SPF: pass client-ip=60.248.80.70; envelope-from=peterlin@andestech.com;
 helo=Atcsqr.andestech.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, RDNS_DYNAMIC=0.982,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, TVD_RCVD_IP=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The pmu encodes the event to counter mappings and is only used
by the SBI firmware. Currently, pmu is a subnode of soc but has
no reg properties included, causing the following failure when
checked with dt-validate.

/tmp/virt.dtb: soc: pmu: {'riscv,event-to-mhpmcounters': [[1, 1, 524281], [2, 2, 524284], [65561, 65561, 524280], [65563, 65563, 524280], [65569, 65569, 524280]], 'compatible': ['riscv,pmu']} should not be valid under {'type': 'object'}
        From schema: /home/peterlin/.local/lib/python3.10/site-packages/dtschema/schemas/simple-bus.yaml

This patch moves the pmu to top level to make the dt-validate happy.

Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
---
 hw/riscv/virt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 4e3efbee16..be8f0cb26e 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -731,7 +731,7 @@ static void create_fdt_pmu(RISCVVirtState *s)
     MachineState *ms = MACHINE(s);
     RISCVCPU hart = s->soc[0].harts[0];
 
-    pmu_name = g_strdup_printf("/soc/pmu");
+    pmu_name = g_strdup_printf("/pmu");
     qemu_fdt_add_subnode(ms->fdt, pmu_name);
     qemu_fdt_setprop_string(ms->fdt, pmu_name, "compatible", "riscv,pmu");
     riscv_pmu_generate_fdt_node(ms->fdt, hart.cfg.pmu_num, pmu_name);
-- 
2.34.1


