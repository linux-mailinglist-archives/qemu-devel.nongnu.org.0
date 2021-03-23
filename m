Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D872345552
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 03:09:37 +0100 (CET)
Received: from localhost ([::1]:57704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOWUC-0004Do-Lp
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 22:09:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=709ee912d=alistair.francis@wdc.com>)
 id 1lOWKm-0002gA-TQ
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 21:59:52 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:2072)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=709ee912d=alistair.francis@wdc.com>)
 id 1lOWKl-0006vy-3u
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 21:59:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1616464791; x=1648000791;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=n+t/4XqLP1Tl30ccvO+t9Nzu+o57JmIV+EnK5sVD+Sg=;
 b=hrhaL7lIp8UCPWUAO4DrNFHiVyzuhzX2s861PXeOyFIKrAmOGiQ2c0jK
 UElz9f+Yusk0DFGewZp3utsQQgqlkk1UoEyRl0vrzpizj8PK3yuVBUbuT
 mLhC7ch0o7DmZ8VObauoUVr0/Tlfk5AfXVlFOrjwMJj+i2uLlgQ+kZNka
 iAvMWhUkDhBbOsZwR/MEDjORS14xZLnBjXm+nHHmoEwVjjvdcsM6dfc7e
 5rl2lMb/1CUOsDYlE2vsI+9zgnqTOAH70cSMo45B5SM8DtWe9u0CXJVtd
 y+TR4fyPJ4qd6aOjfh7U9KFhhurAQGFsIY2DMq6yb1GHViBfuNl9c9CMV Q==;
IronPort-SDR: g8nknRJIKjHSXm/HLWXs5jElo1kbTyyWLwvJ2w9Z6z9eT8PIiZa8GTUcgkRvGVWfgTYogrCN6w
 K6A5UBUY+zCW/pECzrTzF36++pHKMCp+eujKwWvz1PHknW6y6XUiJzViz34/f9dLPU5bF9MI0g
 TqRhXQe1Ae5vXg/DEu++9YNSNUBPtiyfVEikSFrXRaoGJ58YkM/jjxTN3+ebcSVlIfnBq2Owpw
 Il3TsVbm3HsLxn/QMrLJO2Z/OuplbfQ4LQk53UUOjR/u5LXB8ZLileKNbfrRkW87SbUqBSNeGt
 a+o=
X-IronPort-AV: E=Sophos;i="5.81,270,1610380800"; d="scan'208";a="162707640"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 23 Mar 2021 09:59:38 +0800
IronPort-SDR: J/upp2esAk9mJxeRo0WZ0kKxpwqbudWyihFky5XPPQMjEmf2Bn45FzPTn2NIaK/dtY3+kROHAx
 rWGY7Et3q2tHu2T0GNyf3vaWfEMGNjNlM+o9F+4NgpC20/tpRISl3QIJR5zf7eHxOOSIP3RZOI
 U84FZdXzIty2oSpU70Q5IL5ukD9ph0/OHJ8h1f1eeMSVPr0FqhbC7LDF2RKWb27tZq8oaROq5Z
 WtOaMLcwHDd/sivdeIbsuTAXlTpke1G1k1sth5iC9Q8gfJpa65XwlzXYSJChk5Z9MowtAFigLI
 6SbjvqM1MSS78U5EoJ5Vnkvn
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2021 18:41:45 -0700
IronPort-SDR: 3zJVqPE4dPa3MbBRgYzyh43Obe7GB4x6V5kJYH+3PjXaQX4i/AF9tfHxYieMg8Pvv3mVr52yO0
 5e0hoGuxS5xNzL4jWCCtzo/5hyzh/kWz68JJc7umdGL/0XOAxhai25D8Ik9dSH0zcnI9gW+IB5
 g/jIMpDXKfrpr1d9+0mmMFmZyUtLxP659pjuMBIAuQ8S8tXi7XHFhMhOkcUNUyoZcvuYy8RNz7
 0JszcvFvu5vA4TISKCT+sF3xeB6MKMiHOkXiALfrQB8ho0swnlDeOOwTfB+u3eNJpOjNYch8p3
 Sk0=
WDCIronportException: Internal
Received: from cn6ntbqq2.ad.shared (HELO alistair-risc6-laptop.hgst.com)
 ([10.86.49.5])
 by uls-op-cesaip01.wdc.com with ESMTP; 22 Mar 2021 18:59:37 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL 10/16] hw/riscv: allow ramfb on virt
Date: Mon, 22 Mar 2021 21:57:50 -0400
Message-Id: <20210323015756.3168650-11-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210323015756.3168650-1-alistair.francis@wdc.com>
References: <20210323015756.3168650-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=709ee912d=alistair.francis@wdc.com;
 helo=esa4.hgst.iphmx.com
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
Cc: alistair23@gmail.com, Bin Meng <bmeng.cn@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 Asherah Connor <ashe@kivikakk.ee>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Asherah Connor <ashe@kivikakk.ee>

Allow ramfb on virt.  This lets `-device ramfb' work.

Signed-off-by: Asherah Connor <ashe@kivikakk.ee>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210318235041.17175-3-ashe@kivikakk.ee
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/virt.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index e96ec4cbbc..c0dc69ff33 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -42,6 +42,7 @@
 #include "sysemu/sysemu.h"
 #include "hw/pci/pci.h"
 #include "hw/pci-host/gpex.h"
+#include "hw/display/ramfb.h"
 
 static const MemMapEntry virt_memmap[] = {
     [VIRT_DEBUG] =       {        0x0,         0x100 },
@@ -781,6 +782,8 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     mc->cpu_index_to_instance_props = riscv_numa_cpu_index_to_props;
     mc->get_default_cpu_node_id = riscv_numa_get_default_cpu_node_id;
     mc->numa_mem_supported = true;
+
+    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_RAMFB_DEVICE);
 }
 
 static const TypeInfo virt_machine_typeinfo = {
-- 
2.30.1


