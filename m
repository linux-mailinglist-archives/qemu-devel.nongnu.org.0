Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C29401C4F
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 15:31:16 +0200 (CEST)
Received: from localhost ([::1]:43216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNEiR-0006nk-3X
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 09:31:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNEPc-0001IZ-8f
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 09:11:48 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:40827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNEPa-0007p0-92
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 09:11:47 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 n14-20020a05600c3b8e00b002f8bd2f8ab6so1681837wms.5
 for <qemu-devel@nongnu.org>; Mon, 06 Sep 2021 06:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=a7aXv0A4+P9EFw8cFzYOvGeZ/WgOiho5EPrt+6F4ydA=;
 b=XxvHcA+eXpza20X7VxWFEtElky+mjgn0oMeLQ5E/nskwvN2VBmNB8Z6VgzR+ivxR0G
 3my3tsUBi1eVwnzZNxs7kkiSzbYau/8RWZhyyW/9o+nMFeMl0+raxfmeavdX5mYb4wsb
 1sbru0LJ5CSlczLmOcjZ7dhTW4FQSxjrvOfjXkGeKGVCBsuZg+P0dWVkIGR833gq3Bjz
 Zl/jhnk6YFUBnAquR3ZK9V8bFg7KxTUDsS+lizKL/bsTm1AT1A4/G/sdUGtmf8kCYVvE
 NTU5IZIbvMOaKd7HuBwnWjPvAZBYqyqVqlwqxD3ObXD5kJ2x+H5WeB2D+Kko+fiSLfC5
 XY7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=a7aXv0A4+P9EFw8cFzYOvGeZ/WgOiho5EPrt+6F4ydA=;
 b=aF/oYTgjI3/y3f0AYkxJ9wQcczNCw9/Sc0jDvlteFt/huLWL7HNa/sPu9qNeopbS1C
 qN+ibBSBc6rqgVHZsZHvmOb+IvkdUtyPTLuYt836m06EFLnKLreUjREvYDzJwZgPJJs7
 KdmsOr6gdQP01/n5ar/NegXhncbq4jlHnzNEshgCisHTYG1IAbj9cWDytydMaOEaxeiR
 hGNNhj+Iarkffv7GEM4TDOTcGBIzyzAoYI+cp3HRfJjAoSlUg7YrKxh/ylwJ+eZywm4R
 b1hO40f2MU/mv1YIJcWKtpy1YIdtsh1X8VQuxP/HZNUTQfSkNJHgAawzv3QxqaKds9r9
 6FWw==
X-Gm-Message-State: AOAM530/O4wjD0rs2fUf9zJ1MmM8hkAFct/CkpeSh9mSSpH7Kttxgqj9
 0cYTob0VmmJWee80dpTFtCfhE3qtBr0=
X-Google-Smtp-Source: ABdhPJzcnr9QFP7NjvYxH3VDjilPVJUQXKvCIMF40QXcB05OfRHnH1cItAdhu/t+XfThZoslgkSPbg==
X-Received: by 2002:a7b:cbc9:: with SMTP id n9mr11501315wmi.50.1630933904957; 
 Mon, 06 Sep 2021 06:11:44 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 k4sm7992331wrm.74.2021.09.06.06.11.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 06:11:44 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 25/36] hw/i386/pc: Account for SGX EPC sections when
 calculating device memory
Date: Mon,  6 Sep 2021 15:10:48 +0200
Message-Id: <20210906131059.55234-26-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210906131059.55234-1-pbonzini@redhat.com>
References: <20210906131059.55234-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Yang Zhong <yang.zhong@intel.com>,
 Sean Christopherson <sean.j.christopherson@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Sean Christopherson <sean.j.christopherson@intel.com>

Add helpers to detect if SGX EPC exists above 4g, and if so, where SGX
EPC above 4g ends.  Use the helpers to adjust the device memory range
if SGX EPC exists above 4g.

For multiple virtual EPC sections, we just put them together physically
contiguous for the simplicity because we don't support EPC NUMA affinity
now. Once the SGX EPC NUMA support in the kernel SGX driver, we will
support this in the future.

Note that SGX EPC is currently hardcoded to reside above 4g.

Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
Signed-off-by: Yang Zhong <yang.zhong@intel.com>
Message-Id: <20210719112136.57018-18-yang.zhong@intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/i386/pc.c              | 11 ++++++++++-
 include/hw/i386/sgx-epc.h |  7 +++++++
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 1276bfeee4..f79be3edc2 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -922,8 +922,15 @@ void pc_memory_init(PCMachineState *pcms,
             exit(EXIT_FAILURE);
         }
 
+        if (pcms->sgx_epc.size != 0) {
+            machine->device_memory->base = sgx_epc_above_4g_end(&pcms->sgx_epc);
+        } else {
+            machine->device_memory->base =
+                0x100000000ULL + x86ms->above_4g_mem_size;
+        }
+
         machine->device_memory->base =
-            ROUND_UP(0x100000000ULL + x86ms->above_4g_mem_size, 1 * GiB);
+            ROUND_UP(machine->device_memory->base, 1 * GiB);
 
         if (pcmc->enforce_aligned_dimm) {
             /* size device region assuming 1G page max alignment per slot */
@@ -1008,6 +1015,8 @@ uint64_t pc_pci_hole64_start(void)
         if (!pcmc->broken_reserved_end) {
             hole64_start += memory_region_size(&ms->device_memory->mr);
         }
+    } else if (pcms->sgx_epc.size != 0) {
+            hole64_start = sgx_epc_above_4g_end(&pcms->sgx_epc);
     } else {
         hole64_start = 0x100000000ULL + x86ms->above_4g_mem_size;
     }
diff --git a/include/hw/i386/sgx-epc.h b/include/hw/i386/sgx-epc.h
index f85fd2a4ca..155e8fad3e 100644
--- a/include/hw/i386/sgx-epc.h
+++ b/include/hw/i386/sgx-epc.h
@@ -57,4 +57,11 @@ typedef struct SGXEPCState {
 
 int sgx_epc_get_section(int section_nr, uint64_t *addr, uint64_t *size);
 
+static inline uint64_t sgx_epc_above_4g_end(SGXEPCState *sgx_epc)
+{
+    assert(sgx_epc != NULL && sgx_epc->base >= 0x100000000ULL);
+
+    return sgx_epc->base + sgx_epc->size;
+}
+
 #endif
-- 
2.31.1



