Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 356D22F95A5
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Jan 2021 22:55:43 +0100 (CET)
Received: from localhost ([::1]:43008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1G1O-0007MY-40
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 16:55:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=64494dccb=alistair.francis@wdc.com>)
 id 1l1Fzz-0005i2-T0
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 16:54:15 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:21685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=64494dccb=alistair.francis@wdc.com>)
 id 1l1Fzw-0005UE-RO
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 16:54:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1610920452; x=1642456452;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9uJ+/j2JwaP+9An/iZxf0sTQOr3EQxrWnRygwBLhPrI=;
 b=gEG/1j4Q1Gz908qfibRLUyypYz+IxoUPVz/koaE5/0vrQnuUYOs2mu1x
 iH0hHr9c4p9CNi0ydThyDvd1CSQlmF4b9KKr7nfDgT/ZbZZLup4P5gOih
 rpdBFK5OW7E0AxV7K2vKeznkM7xoCvErUWVI/LeX2YY0jxrDrmJbC36qP
 DRd7IcNRTdpd12PPmwOhhLzE7ZAIqGslb+dCmEb0y9hc0T7xo669d3czq
 sFY6JPh4X5ngiOQl5+PW/v62hbFcaxrhNiWyu1hn3J6QoXadrD17GFsM3
 khUlBLWuvPiKMcdh4ecUudSzn32+WMc7ouYkn1RyhDjHELJHIDm5JG6Os A==;
IronPort-SDR: Jj46JEURbqLL1STMpMBSq5N7aztz5EJh8YdO03oODEtlBjaiPpiv7L/V0JxTDvevb4iYE3vqzn
 5G68bYY0ksGdaGxPqTBj6R34Im6pFVeeeX/eyTkyQiLp/0WAOKrltnYFQWrxquwgamaXca8iw4
 Ikxur5nkyODHs3Y+LDNnVZgRHx5g0bcvFT404TPa32dbmkPVLZamPml3nnQKREPl0ghrXGdT2V
 3/4o2L2v43LYYm1FsuszB0+u5h+r6J9cfjFjpXcXK170pVSHmmMlm/qIfhtirm9T5EUwD5p0hD
 vz0=
X-IronPort-AV: E=Sophos;i="5.79,355,1602518400"; d="scan'208";a="157645968"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 18 Jan 2021 05:54:06 +0800
IronPort-SDR: UCjUy7QWfMgL1NZqhg3zqZQoYh3AtDNrCQfSNexfCHOT7x2kDLWICdeh/cahncNfCcwxhfMB3A
 n2i/fUpSsuCHa0dqs8yt7CTXs6EwNL2Mxe6IdxZbR8dL0UY1pwmJAbGLGu3fpwmqS/XPy4K8Bt
 WMaS9Gb+FZzS6ReS8o244Md67byFMeEfwKVWzXySpN5MCFNEJnoJThbetMJJGvQoxJzSHR9lfe
 FfY/U/WYdgLB3A9qisTALfYbm6iDzHV2HPAkHcDbRuOQeEQJkNATW6GxEzoBTXxyVDWqf120Wd
 VLxTgFyd1yrJWBYS7lwbaChb
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2021 13:38:45 -0800
IronPort-SDR: RpSa+kJzi+zXcA2lH7xLOnHynfZtlF1yfgiolLq/cOdn9H/u345VtK/ILVGh68k98zLRNmAeid
 jmrpHT/WYfT2LUodhLMmObgVwpf1vN902w6azNTx1/FK5Y/2g+3P/d+S6dJgWDFsvzwpqeY+Rc
 BOFQnCDUaizlKajjm4g/515NngRJdkhRY5tlzdN/AzCRw6Grcqw9CdSBuRPcfrqViTp8VEhJX/
 ryHxwiw1p3Hu0H1I4r0X0g/4aVFsn1zvMWJgNXwAVZ4pnRPOhUEa2W3wCzLglMLNO5l9q8TojA
 PLg=
WDCIronportException: Internal
Received: from 7l95g12.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.62.251])
 by uls-op-cesaip01.wdc.com with ESMTP; 17 Jan 2021 13:54:06 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 06/12] hw/riscv: sifive_u: Use SIFIVE_U_CPU for
 mc->default_cpu_type
Date: Sun, 17 Jan 2021 13:53:57 -0800
Message-Id: <20210117215403.2277103-7-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210117215403.2277103-1-alistair.francis@wdc.com>
References: <20210117215403.2277103-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=64494dccb=alistair.francis@wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

SIFIVE_U_CPU is conditionally set to SIFIVE_U34 or SIFIVE_U54, hence
there is no need to use #idef to set the mc->default_cpu_type.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210109143637.29645-1-bmeng.cn@gmail.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/sifive_u.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index f5c400dd44..e083510e0e 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -628,11 +628,7 @@ static void sifive_u_machine_class_init(ObjectClass *oc, void *data)
     mc->init = sifive_u_machine_init;
     mc->max_cpus = SIFIVE_U_MANAGEMENT_CPU_COUNT + SIFIVE_U_COMPUTE_CPU_COUNT;
     mc->min_cpus = SIFIVE_U_MANAGEMENT_CPU_COUNT + 1;
-#if defined(TARGET_RISCV32)
-    mc->default_cpu_type = TYPE_RISCV_CPU_SIFIVE_U34;
-#elif defined(TARGET_RISCV64)
-    mc->default_cpu_type = TYPE_RISCV_CPU_SIFIVE_U54;
-#endif
+    mc->default_cpu_type = SIFIVE_U_CPU;
     mc->default_cpus = mc->min_cpus;
 
     object_class_property_add_bool(oc, "start-in-flash",
-- 
2.29.2


