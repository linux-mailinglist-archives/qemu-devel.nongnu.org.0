Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 550154037A4
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 12:14:21 +0200 (CEST)
Received: from localhost ([::1]:48150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNuay-00018e-CL
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 06:14:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNuRw-0006nu-5p
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 06:05:00 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:45011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNuRt-00035J-NI
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 06:04:59 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 l7-20020a1c2507000000b002e6be5d86b3so1072805wml.3
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 03:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LrpWhKARcoTgZN4W9UXAhXElE4Wt3Yuz4O1+ggge9gI=;
 b=MZnw4kM+syualv5NlUB1RXF2Yx8EoHbF7dyrfDjQsuBy59sc52tsNte67OW3DEDtn4
 Nl+WqX4atlq6WZrV/DEHL7yc15cq2xD9hwiHVIMlAWCCUxnQ1NlyKh2pHGT65ZmiP8ZT
 2lk+ksl265ORykH3lKIN+Xh3gNh4bFs6K5ShEz+dtzxJVZ0TTA+DEj/yIxS8GyXQtBhN
 6zX85Sdjp6SuBcwmGlwXbpaisP//URDlZDIeUPVxI9A1CQ+FUBSp4txgeTgpz3LiiV+I
 8GpL2Y7hYonOz9YcKrMMbA28NFthlqu5cQo9LVXHf294q5B7NF4DSw0dBkoQm7fQ57Su
 Jy7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=LrpWhKARcoTgZN4W9UXAhXElE4Wt3Yuz4O1+ggge9gI=;
 b=XD7evLr+DFz7n8XafLWjXtah1AOpx60crknwOy+EYcc+at+9k88HghT1qX47piYlNO
 dcqTig4TL5SnIr5JqHlotMmtVG71/ghtzsgV3Sam+hBUYFgFv3pum8tvjVqcxy2bQDek
 fUDq6ZnabUKWzZfpqOpuw7lr5qkDDBXMqcfb453Mz/IouSCZQDI1ol701jWOKZPlxD8W
 hP3sXngHDPMAf8o2p9UbNA2VQFpYeCH/VAI6TRh725EPJM7oMcxnil/hqh6H/+ZV5XLn
 IjcMlhZq1BKiIJdcGEM85c2sxDXI0ODy1mWDrOhsWbRwfaHn37i/khT4F8oi9Myu6EOj
 Dg+Q==
X-Gm-Message-State: AOAM531odQMmZrEMpqio832lgCH1pCXSp4ZOpdHVc8B+gH0W4h+GHVHO
 Tb0xYIcaAPtA4hWBFSWlrYxIbZrIxh0=
X-Google-Smtp-Source: ABdhPJwY9bVmWVabsz9txeGcc+cCXyXDPIaWpQsBtllgngVbyHOpHEJorj2+74h0kQ+j4SOQTC6zjA==
X-Received: by 2002:a1c:1cc:: with SMTP id 195mr2750080wmb.188.1631095494778; 
 Wed, 08 Sep 2021 03:04:54 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id u8sm1683715wmq.45.2021.09.08.03.04.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 03:04:54 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v4 26/43] hw/i386/pc: Account for SGX EPC sections when
 calculating device memory
Date: Wed,  8 Sep 2021 12:04:09 +0200
Message-Id: <20210908100426.264356-27-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210908100426.264356-1-pbonzini@redhat.com>
References: <20210908100426.264356-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32e.google.com
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



