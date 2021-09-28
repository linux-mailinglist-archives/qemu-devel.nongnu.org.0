Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 340D941AFB5
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 15:13:00 +0200 (CEST)
Received: from localhost ([::1]:46556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVCun-0000kU-Lc
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 09:12:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mVCaC-0006Us-70
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 08:51:40 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:43564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mVCa7-0001R0-Dx
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 08:51:37 -0400
Received: by mail-ed1-x52a.google.com with SMTP id v10so78451561edj.10
 for <qemu-devel@nongnu.org>; Tue, 28 Sep 2021 05:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WkjhuyBO0N6fxaVEUOUbeysGxGrIJEx9LEs65ZvcK4A=;
 b=hUc4ZAUcXJICdh5F+kwTHaPFOKxi9VBPGoLQsPYXnQF/tg4fHUcSuvnI2umzEw78yx
 +fhZnLECZQ8qg/vhXGzA7tqC+FuwJCF0gbRbomZHY+st3q7ObkUtHRpqMFIaj+HwpLVE
 g3sfhIJu7dMKLf+NwziH5eGwgI1mSDLGa2ARbU5QwWPVEiBBh1XITVlWsU3hYKXK+k9Q
 MX7IZ8z6SRyReeHOHDUg7+tqL0/8C689hiD+5z3azmJvxki/yKcZ9g2eNhh6Go0DmQI7
 +gUgWtvVtCZiu5u84cip9mhskpMWLFIxe4JJ+q+rY46ovbLtEV8fWFkezALMbWYoXcQi
 jpZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=WkjhuyBO0N6fxaVEUOUbeysGxGrIJEx9LEs65ZvcK4A=;
 b=THFWBuyET3xJlbPQmXQh67FRohg/Erx24MPfqbTBv/CSFBuSMbVJcSblStmlU9mA90
 WK57QajOt7rib/imG7YenTGkcP7CJ80jc8ukox1yUdmD31vPBSsCVng1IOcS6mxr4d9C
 Fe3+bP9P4/FA2YnS947x/JOW/m3psrtGX4cTsRaAW9CG5nZW7CvgKUHac2nzKTL89SD0
 CXjEn346Is/G9zDzrrPw1qnP1XlvII4vdnroaalA8EyQE2RuE03RdlhXcFqypAUFHk6L
 sf03iDOsOmcghXkdLbdMW/km2uYmXprHxg6Mba6aKIk0huWanjTduGGywtAa0xMNRFty
 /khA==
X-Gm-Message-State: AOAM531MyDGa4xxoJeicPH0+H4mTrH8CSJmfev9rKijT2DhzI18zINlc
 gMwUT6+G7gonS5tWDQ6A99TGywpOxUw=
X-Google-Smtp-Source: ABdhPJzEFCyQqkc2Qn7JhqglQAijAkRXlO1scmb+FzINwth9uuJr2draB7ZhfOLOpWGDKp6Uw6lAiA==
X-Received: by 2002:a17:906:fa90:: with SMTP id
 lt16mr6522905ejb.567.1632833492833; 
 Tue, 28 Sep 2021 05:51:32 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id p24sm12641685edq.27.2021.09.28.05.51.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Sep 2021 05:51:32 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 18/33] hw/i386/pc: Account for SGX EPC sections when
 calculating device memory
Date: Tue, 28 Sep 2021 14:51:01 +0200
Message-Id: <20210928125116.183620-19-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210928125116.183620-1-pbonzini@redhat.com>
References: <20210928125116.183620-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
index 557d49c9f8..e41c002539 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -919,8 +919,15 @@ void pc_memory_init(PCMachineState *pcms,
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
@@ -1005,6 +1012,8 @@ uint64_t pc_pci_hole64_start(void)
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



