Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 461E9417137
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 13:48:52 +0200 (CEST)
Received: from localhost ([::1]:46896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTjhD-0006e9-99
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 07:48:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mTjKb-0007ua-0T
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 07:25:29 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:44561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mTjKY-0000ac-If
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 07:25:28 -0400
Received: by mail-ed1-x530.google.com with SMTP id v22so34025410edd.11
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 04:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kNzhl1msHGxezSlUcnJIDIIKyeuSLJuoEOzVFefl4Ns=;
 b=hHX8VVxeVOs0vTExyUPeoG+4nT+KsG5nZIPOmrE8uHYSoQ0pPiPsJXavZBOb7XqWxA
 W92U5vpEuxhjncVhMrC8r3zDpNgPHAgXnSrvrjjLLBgmxkiUI/INgWvnicGbB19UdqzZ
 03q0CoszdU9w69Uwvv4IM1usK2IbHigaY3kBOET3m2+Po0R24DYVXYIuay9z/uJKkOit
 xaaKPK5UfFaHAlZN1YuQmap2XY11PvMcrcqgJyAxURTkeW0TiWvHT3cNODZ61dMGjMOW
 ciaONuoaMcr5bQpq5xTVcqZw+pknp6FfFW6CzrJAFipAVnxZT4KIf0yb41VhzPvZAdKe
 7AhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=kNzhl1msHGxezSlUcnJIDIIKyeuSLJuoEOzVFefl4Ns=;
 b=uoKcM9y4EyvedNKSr6YRB7VCl0485iE3270jeEHWxwvIQkqHq3job6eQp4W24NCmEW
 gPLsbq281jOlc4Us4NCxuXp3Z482Q/u837AlFBAyxMiQft27GjWVx/CrExZKkkcB3fhS
 X0yXArG/jYaDqeLCxtQcxE2VMXWoDI8tC7Bt4Q8TxQ2IFQsZvQ3I53cUivDwrB5GGnFU
 /1kuIBRuVsqLEISLYjAaXnqFnkrDcc+P/ORhC7e4SB6a1gnqP1fXyzjfl3eJ4JelkXHN
 lo5d02P8IkY/EXwiap1rJjN/ACEJCAM4wdlUvZ2TAks3qhih8JRhojAxrDmvw01eI1tV
 THhQ==
X-Gm-Message-State: AOAM531S0MhC56BY8tjtVnRjmQvEHI6+CSFBHYERXqHm4F6cG9bkCj0x
 +uoR+EiGHn/jkNK3PBng+s42qCWFlB4=
X-Google-Smtp-Source: ABdhPJw0yNIm0Bf8rVmYZq58grRYWfxfNyt09dao1h2rrB0aCPdBW17M2GjNeZu6+HXcYH8ZZ7W06A==
X-Received: by 2002:a17:906:f243:: with SMTP id
 gy3mr10691971ejb.327.1632482725352; 
 Fri, 24 Sep 2021 04:25:25 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id t14sm4886961ejf.24.2021.09.24.04.25.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 04:25:24 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 18/26] hw/i386/pc: Account for SGX EPC sections when
 calculating device memory
Date: Fri, 24 Sep 2021 13:25:01 +0200
Message-Id: <20210924112509.25061-19-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210924112509.25061-1-pbonzini@redhat.com>
References: <20210924112509.25061-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: yang.zhong@intel.com, philmd@redhat.com, eblake@redhat.com,
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
index 7e523b913c..58700af138 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -913,8 +913,15 @@ void pc_memory_init(PCMachineState *pcms,
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
@@ -999,6 +1006,8 @@ uint64_t pc_pci_hole64_start(void)
         if (!pcmc->broken_reserved_end) {
             hole64_start += memory_region_size(&ms->device_memory->mr);
         }
+    } else if (pcms->sgx_epc.size != 0) {
+            hole64_start = sgx_epc_above_4g_end(&pcms->sgx_epc);
     } else {
         hole64_start = 0x100000000ULL + x86ms->above_4g_mem_size;
     }
diff --git a/include/hw/i386/sgx-epc.h b/include/hw/i386/sgx-epc.h
index 75b19f464c..65a68ca753 100644
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



