Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 640DC60D891
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 02:49:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onUbU-0004AG-NN; Tue, 25 Oct 2022 20:49:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gourry.memverge@gmail.com>)
 id 1onUbT-000411-3f
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 20:49:07 -0400
Received: from mail-qt1-x842.google.com ([2607:f8b0:4864:20::842])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gourry.memverge@gmail.com>)
 id 1onUbR-0003YP-FZ
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 20:49:06 -0400
Received: by mail-qt1-x842.google.com with SMTP id c23so8901953qtw.8
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 17:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d7/73U88aWKwNDfroPuUtEdVueHFIV0vL1R64OOolus=;
 b=FKmI7MFmg0vUcBItLfBUZyX5abdLhN+mCsU8k+WVfoqdr5hHERIc4Wvq3lZPrstRXg
 UU/idLJ5EniJ8I8PEU5jOTkhYDuLRapTw3SvwHkTc47NGprU07JIINHnCgL6OS9KkR44
 vjFhw/GBNtDqLloY8Y9yKrAMJL+N00be2BQVNo1P7bPZGnw8xBlVJt8Pzyyg0/NoXIJH
 Z0aKwO26IYifO0lEu7wQCKDzIwVosxDU7NfS8uVYgVhO6YiRQ62OMeQNrv+hVNem51D5
 VlMp54OW5qcLwmsyfB/Bz7PfKRfnLp72A6+FQUOCUXmIL+VJ8unKmOnEQPKTU/7vA68h
 kd4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d7/73U88aWKwNDfroPuUtEdVueHFIV0vL1R64OOolus=;
 b=Ck0ikaqM0oVr7H5bCQUx4grwrLXXATilI+d0L+qw2Z3e+QV8N8Aj81g5h7QC2UyMkw
 jgyqmEp4lI6UjshJStOkw0pL/PTtdxPtxXYvdb5hAl/gpyszhwDrT7PRT93CsIGA/L0A
 73Bkdbq+xTbD7HeiF8oxoBKcKw9+yC7S1LCC6vDzabK6CUc+HeoaTNAGjK+w5b6cL6kN
 ddh7iNoHPzXAXpsLIH1whqhH3l6XotpxqvNBdId1nwGvJ4cVcp6Pe+CH7Zt4tEWRZPdG
 g5TtixLQ77v+Uph1ay4DWdpkPCdLKud+PmeS1wdP0r2VT+uM5RPwNE0RD9+RxRW3IBPQ
 VuIQ==
X-Gm-Message-State: ACrzQf1UdJmjrzpLfV733j0PT2tJOK1spYmxb+SRBMrpPW+Nob+FsID0
 mGxBMoPXDAEuxjrckj/gDFsM2TBnxw==
X-Google-Smtp-Source: AMsMyM6TE3OJhxhBREvSayYLxzwSr++OBb9psECz2cRe05REWMbChQNHncI+KtTroSDsIzP9zSKLZQ==
X-Received: by 2002:ac8:7d0d:0:b0:39c:c5e0:37c0 with SMTP id
 g13-20020ac87d0d000000b0039cc5e037c0mr33442427qtb.537.1666745343935; 
 Tue, 25 Oct 2022 17:49:03 -0700 (PDT)
Received: from fedora.mshome.net (pool-173-79-56-208.washdc.fios.verizon.net.
 [173.79.56.208]) by smtp.gmail.com with ESMTPSA id
 j15-20020ac8550f000000b0039a610a04b1sm2408651qtq.37.2022.10.25.17.48.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 17:48:43 -0700 (PDT)
From: Gregory Price <gourry.memverge@gmail.com>
X-Google-Original-From: Gregory Price <gregory.price@memverge.com>
To: qemu-devel@nongnu.org
Cc: jonathan.cameron@huawei.com, linux-cxl@vger.kernel.org, mst@redhat.com,
 marcel.apfelbaum@gmail.com, imammedo@redhat.com, ani@anisinha.ca,
 alison.schofield@intel.com, dave@stgolabs.net, a.manzanares@samsung.com,
 bwidawsk@kernel.org, gregory.price@memverge.com,
 hchkuo@avery-design.com.tw, cbrowy@avery-design.com, ira.weiny@intel.com
Subject: [PATCH 1/4] hw/i386/pc.c: CXL Fixed Memory Window should not reserve
 e820 in bios
Date: Tue, 25 Oct 2022 20:47:34 -0400
Message-Id: <20221026004737.3646-2-gregory.price@memverge.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221026004737.3646-1-gregory.price@memverge.com>
References: <20221026004737.3646-1-gregory.price@memverge.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::842;
 envelope-from=gourry.memverge@gmail.com; helo=mail-qt1-x842.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Early-boot e820 records will be inserted by the bios/efi/early boot
software and be reported to the kernel via insert_resource.  Later, when
CXL drivers iterate through the regions again, they will insert another
resource and make the RESERVED memory area a child.

This RESERVED memory area causes the memory region to become unusable,
and as a result attempting to create memory regions with

    `cxl create-region ...`

Will fail due to the RESERVED area intersecting with the CXL window.

During boot the following traceback is observed:

0xffffffff81101650 in insert_resource_expand_to_fit ()
0xffffffff83d964c5 in e820__reserve_resources_late ()
0xffffffff83e03210 in pcibios_resource_survey ()
0xffffffff83e04f4a in pcibios_init ()

Which produces a call to reserve the CFMWS area:

(gdb) p *new
$54 = {start = 0x290000000, end = 0x2cfffffff, name = "Reserved",
       flags = 0x200, desc = 0x7, parent = 0x0, sibling = 0x0,
       child = 0x0}

Later the Kernel parses ACPI tables and reserves the exact same area as
the CXL Fixed Memory Window:

0xffffffff811016a4 in insert_resource_conflict ()
                      insert_resource ()
0xffffffff81a81389 in cxl_parse_cfmws ()
0xffffffff818c4a81 in call_handler ()
                      acpi_parse_entries_array ()

(gdb) p/x *new
$59 = {start = 0x290000000, end = 0x2cfffffff, name = "CXL Window 0",
       flags = 0x200, desc = 0x0, parent = 0x0, sibling = 0x0,
       child = 0x0}

This produces the following output in /proc/iomem:

590000000-68fffffff : CXL Window 0
  590000000-68fffffff : Reserved

This reserved area causes `get_free_mem_region()` to fail due to a check
against `__region_intersects()`.  Due to this reserved area, the
intersect check will only ever return REGION_INTERSECTS, which causes
`cxl create-region` to always fail.

Signed-off-by: Gregory Price <gregory.price@memverge.com>
---
 hw/i386/pc.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 768982ae9a..203c90fedb 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1062,7 +1062,6 @@ void pc_memory_init(PCMachineState *pcms,
         hwaddr cxl_size = MiB;
 
         cxl_base = pc_get_cxl_range_start(pcms);
-        e820_add_entry(cxl_base, cxl_size, E820_RESERVED);
         memory_region_init(mr, OBJECT(machine), "cxl_host_reg", cxl_size);
         memory_region_add_subregion(system_memory, cxl_base, mr);
         cxl_resv_end = cxl_base + cxl_size;
@@ -1078,7 +1077,6 @@ void pc_memory_init(PCMachineState *pcms,
                 memory_region_init_io(&fw->mr, OBJECT(machine), &cfmws_ops, fw,
                                       "cxl-fixed-memory-region", fw->size);
                 memory_region_add_subregion(system_memory, fw->base, &fw->mr);
-                e820_add_entry(fw->base, fw->size, E820_RESERVED);
                 cxl_fmw_base += fw->size;
                 cxl_resv_end = cxl_fmw_base;
             }
-- 
2.37.3


