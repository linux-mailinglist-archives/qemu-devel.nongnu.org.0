Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 276C46EE922
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 22:38:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prPNi-0007R9-FJ; Tue, 25 Apr 2023 16:35:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dfustini@baylibre.com>)
 id 1prPNf-0007Pv-PH
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 16:35:19 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dfustini@baylibre.com>)
 id 1prPNc-0002kG-Dk
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 16:35:19 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 98e67ed59e1d1-24986ade373so5605850a91.2
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 13:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1682454915; x=1685046915; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WaDtd/395hxMojMVgG+C/5eVlpWymJCq+5z/234wYXM=;
 b=BLDzWGwGiOsgsPGnH6YutZ9VeZx1l8xA+PVHZzXgfVl3WFPF2TNFJbI/mra8PTARgr
 93vqs0mEjRq7XT53OlRJqtJ4zpxMftoJwjNW98UBv7PGnVS6R9lVG5ZtmlIzJO2FlJj8
 bIi+dPd6h44q9uD1oSn2JNXvGKF/6l+Sz+VfjxJOIH2SBnFqEMwg2qSAuiOp4Hg9VP9A
 8IsrtrezY5h0x3yQ383XZck9FTZscNGYYYfmzeiif9sQt6D13cELH/EoviHgC4ODCHOH
 tXp8o7KPS9ai20Urs2SPuETZqkglbxr+SwNHPb9fP1WhXf+CJBuaV7QjocViSOH0pGCr
 i6Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682454915; x=1685046915;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WaDtd/395hxMojMVgG+C/5eVlpWymJCq+5z/234wYXM=;
 b=g9Bv5CO0OLYHGrY2tsvTyWv0Tv8Jbwm8kwh7xgGmLJWnP365KcEfdY/JIFQWha5wpm
 ua1KBxt+tgcabSIGQFb7acMHYOkUqU1TzvU4JX3y023Tcw4GgD91+X/7B46hDwfiQ+1N
 m2inXwkV/4cowgQCIcaxtgLM5AXReuyGqGuyhJUDKQaEx46A93KXpMTr70ON1hUe6ejK
 OQc9vTPpLJX4wefMgaatjFsU+lR7fkGxgzAWa3FPiqpy+ei00DekDq8uZwqlbzC7rLGt
 49+LK1XaofAptxmXEKVtgH6JTjLbLmZuA5tbgvNMIgI1CWa0MyiF9kSWgYkZ6EfduwbD
 gqzQ==
X-Gm-Message-State: AAQBX9cdB9KFaQBvY4Vna7sukEdKSQOgjxt94hws+ncKU/AgcWHqYIZN
 jnfyEt9Kfe2LVh0u15d2UBGXGg==
X-Google-Smtp-Source: AKy350YJ8nqM+DkvbEM7Vz2/6UFsZ5yRTT5JLX6S6BJfN21GGlj2u1XwFq5MmOQeab3GVWKWlCexig==
X-Received: by 2002:a17:90b:400e:b0:24b:6d50:fed8 with SMTP id
 ie14-20020a17090b400e00b0024b6d50fed8mr15937843pjb.24.1682454914886; 
 Tue, 25 Apr 2023 13:35:14 -0700 (PDT)
Received: from x1.hsd1.or.comcast.net
 ([2601:1c2:1800:f680:b08a:7f49:1848:42ff])
 by smtp.gmail.com with ESMTPSA id
 ep8-20020a17090ae64800b0024739e4ad02sm762752pjb.28.2023.04.25.13.35.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 13:35:14 -0700 (PDT)
From: Drew Fustini <dfustini@baylibre.com>
To: Ved Shanbhogue <ved@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Nicolas Pitre <npitre@baylibre.com>,
 Adrien Ricciardi <aricciardi@baylibre.com>,
 =?UTF-8?q?Kornel=20Dul=C4=99ba?= <mindal@semihalf.com>
Cc: Drew Fustini <dfustini@baylibre.com>
Subject: [RFC PATCH v2 7/9] hw/riscv: add CBQRI controllers to virt machine
Date: Tue, 25 Apr 2023 13:38:32 -0700
Message-Id: <20230425203834.1135306-8-dfustini@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230425203834.1135306-1-dfustini@baylibre.com>
References: <20230425203834.1135306-1-dfustini@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=dfustini@baylibre.com; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Nicolas Pitre <npitre@baylibre.com>

Add CBQRI controllers to the RISC-V virt machine. The device properties
can be fully configured from the command line:

  $ qemu-system-riscv64 -M virt ... \
      -device riscv.cbqri.capacity,mmio_base=0x04828000[,...]
      -device riscv.cbqri.bandwidth,mmio_base=0x04829000[,...]

The mmio_base option is mandatory, the others are optional.

Many -device arguments as wanted can be provided as long as their
mmio regions don't conflict.

To see all possible options:

  $ qemu-system-riscv64 -device riscv.cbqri.capacity,help
  riscv.cbqri.capacity options:
    alloc_op_config_limit=<bool> -  (default: true)
    alloc_op_flush_rcid=<bool> -  (default: true)
    alloc_op_read_limit=<bool> -  (default: true)
    at_code=<bool>         -  (default: true)
    at_data=<bool>         -  (default: true)
    max_mcids=<uint16>     -  (default: 256)
    max_rcids=<uint16>     -  (default: 64)
    mmio_base=<uint64>     -  (default: 0)
    mon_evt_id_none=<bool> -  (default: true)
    mon_evt_id_occupancy=<bool> -  (default: true)
    mon_op_config_event=<bool> -  (default: true)
    mon_op_read_counter=<bool> -  (default: true)
    ncblks=<uint16>        -  (default: 16)
    target=<str>

  $ qemu-system-riscv64 -device riscv.cbqri.bandwidth,help
  riscv.cbqri.bandwidth options:
    alloc_op_config_limit=<bool> -  (default: true)
    alloc_op_read_limit=<bool> -  (default: true)
    at_code=<bool>         -  (default: true)
    at_data=<bool>         -  (default: true)
    max_mcids=<uint16>     -  (default: 256)
    max_rcids=<uint16>     -  (default: 64)
    mmio_base=<uint64>     -  (default: 0)
    mon_evt_id_none=<bool> -  (default: true)
    mon_evt_id_rdonly_count=<bool> -  (default: true)
    mon_evt_id_rdwr_count=<bool> -  (default: true)
    mon_evt_id_wronly_count=<bool> -  (default: true)
    mon_op_config_event=<bool> -  (default: true)
    mon_op_read_counter=<bool> -  (default: true)
    nbwblks=<uint16>       -  (default: 1024)
    target=<str>

Boolean options correspond to hardware capabilities that can be disabled

Signed-off-by: Nicolas Pitre <npitre@baylibre.com>
Signed-off-by: Drew Fustini <dfustini@baylibre.com>
---
Changes since v1:
- remove initialization of the example SoC now that device properties
  can be use to configure controllers from the command line

 hw/riscv/virt.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 4e3efbee16f0..674a6a34de3a 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -50,6 +50,7 @@
 #include "hw/pci-host/gpex.h"
 #include "hw/display/ramfb.h"
 #include "hw/acpi/aml-build.h"
+#include "hw/riscv/cbqri.h"
 #include "qapi/qapi-visit-common.h"
 
 /*
@@ -1688,6 +1689,8 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
 #ifdef CONFIG_TPM
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_TPM_TIS_SYSBUS);
 #endif
+    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_RISCV_CBQRI_BC);
+    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_RISCV_CBQRI_CC);
 
     object_class_property_add_bool(oc, "aclint", virt_get_aclint,
                                    virt_set_aclint);
-- 
2.34.1


