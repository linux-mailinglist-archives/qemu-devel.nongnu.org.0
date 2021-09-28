Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C7041B002
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 15:28:15 +0200 (CEST)
Received: from localhost ([::1]:51630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVD9a-0006gl-An
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 09:28:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mVCaN-0006gt-7u
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 08:51:51 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:35624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mVCaL-0001ZY-N9
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 08:51:51 -0400
Received: by mail-ed1-x52f.google.com with SMTP id l8so34475902edw.2
 for <qemu-devel@nongnu.org>; Tue, 28 Sep 2021 05:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1CNuKWJpiXhOuvCaQUOZDf4tSaDbDrxbru4USDls+5I=;
 b=BfvvaF2+sZR400nnQ2W/1SmfADsRsW3wNFQnw/4TjPy7n/rw7fJ1xGHIfpImeoncL3
 7G+PINRh/d8/QYx1Y74Fq0Ja22qNdyTJjQBxVyI6IBoDx4Zffym99Mf/Mv2+P/0iNKpY
 FTU2l8Eef7rWEsFz3a1Q2v7mYaXa4x6wVj6eoI7LRVN3H7TIAtdicWKi6U/iUN/9TlY2
 HqF4NN2yHs0+UkzYDzzUcWdGKFkxN04ufOXsA2cPO89m3BLSpzBBcEiYMTxlwgPmJ/z1
 Vg9rOknW9MIBh8OA2igqQFvQl0Ny2yuDpZ99ABYBUafg4tCAskrrXsUVVrcto3PIIDL3
 TZbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=1CNuKWJpiXhOuvCaQUOZDf4tSaDbDrxbru4USDls+5I=;
 b=IxYA/ju/PkXxGty0g3esk6hSe/SzGG7cUjS2iXLqBMWKNexi5NoBN+6aHi44fsRbvq
 dYJa9qM0zsVRWTUospAW1JHGQzi5MHkbtF5xYsuthFp2Ekm5wuioz6SjWzAb8+x+U9tA
 4SF/lfvpKzz34QjQ7SdquZhhW39hqACpzX+qCABirqNCDKKAapzvgwW423prfJ75rW5Y
 YDl7kTBs5Hm31fcKaKOfNrb7E8jMJytrNOCTRk5mFf+L/NhjdQebg2TDURzHbWQiLT8r
 adrscFim9t1wVcyMgOJXmxJfpmqp58qwikvhSf7+pMf1YrwUONfaXOworbLriaiWDCZy
 LgvA==
X-Gm-Message-State: AOAM533Z4APsnvJ6DUmkwJ5sBeiv1DbTi5fb4Pzy4yJ6pNsd7wxSLWDI
 L39++KjED3o1crGXx/hEeTL3R4JD3BM=
X-Google-Smtp-Source: ABdhPJzCI5ZAOpCUjY3r5j5zGvlror1pwfHqFvcCl7ge2xjGfDD7DP2yAmhF+8LNDz1lIDVoiGiZXQ==
X-Received: by 2002:a05:6402:16d8:: with SMTP id
 r24mr764649edx.47.1632833493980; 
 Tue, 28 Sep 2021 05:51:33 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id p24sm12641685edq.27.2021.09.28.05.51.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Sep 2021 05:51:33 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 19/33] i386/pc: Add e820 entry for SGX EPC section(s)
Date: Tue, 28 Sep 2021 14:51:02 +0200
Message-Id: <20210928125116.183620-20-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210928125116.183620-1-pbonzini@redhat.com>
References: <20210928125116.183620-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52f.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Note that SGX EPC is currently guaranteed to reside in a single
contiguous chunk of memory regardless of the number of EPC sections.

Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
Signed-off-by: Yang Zhong <yang.zhong@intel.com>
Message-Id: <20210719112136.57018-19-yang.zhong@intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/i386/pc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index e41c002539..df457eceba 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -889,6 +889,10 @@ void pc_memory_init(PCMachineState *pcms,
         e820_add_entry(0x100000000ULL, x86ms->above_4g_mem_size, E820_RAM);
     }
 
+    if (pcms->sgx_epc.size != 0) {
+        e820_add_entry(pcms->sgx_epc.base, pcms->sgx_epc.size, E820_RESERVED);
+    }
+
     if (!pcmc->has_reserved_memory &&
         (machine->ram_slots ||
          (machine->maxram_size > machine->ram_size))) {
-- 
2.31.1



