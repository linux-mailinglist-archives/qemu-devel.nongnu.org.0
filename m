Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4014037DE
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 12:31:49 +0200 (CEST)
Received: from localhost ([::1]:60646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNurr-0003dp-1Y
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 06:31:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNuRw-0006pD-Fn
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 06:05:00 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:56212)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNuRt-00036b-Qf
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 06:05:00 -0400
Received: by mail-wm1-x32e.google.com with SMTP id g74so1261239wmg.5
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 03:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UgkF1mvQK//t6XGujinPfYl2Zezj6c5sitJ7wVbQTZk=;
 b=Hd7pnbPDuAf0zLagGSdKx1ypt9m+xMEpRS6CDRG8oSyV2lv1chdnlGRC/2pFn2WsYV
 SSpudIhhnjVco6rfsP0z44v6HbDkd2eEFivSXzUrE+KgZp7LpEaTLohR6sRFBlZQhKSz
 F5BGmWvZ2u9He/Z3BpUJTYJbuLuQ0FdAIX8gEdwkmwRh57bEHc4pllCFiJy1LFyBmZvk
 rKqoN3bFepFBl1pXmzGUvJCLJCgqB1bbQ/VCAy9RWqwOCNH3TOB51d7uf8lBv9100wca
 /R0E2Z4xTi91i/yGib93d7y6K7v4BVK+c+FkaglNKscFq0DD+W+j2Y+kZGASJKNZOZ6v
 7lXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=UgkF1mvQK//t6XGujinPfYl2Zezj6c5sitJ7wVbQTZk=;
 b=Mf3dqS7+m1eLIBWxdnLmNiZose528xgVHwdlGl1vip2PEY+sxrtNtydW7sFjUG0wcf
 Naxbnwj2t50jkGN0RecqaXhYNL33r5CG/OWTqm2QZ2+qby9r3DptWT9cImoS5YdCpLXa
 xRY5kuzV2Vp7CxbWprOd7jD2jVVNxENyvgwGM4i7W+CguHczekC2w4i3pvcWPhCtSLBM
 21WrLOpHmF5EAFYW+RRFJ79jEoEsD9KIIPQr/wLfDWyGhU8WbHrh2llXTvqPBU1Ue+IW
 lgeXZdFMBTs16ovSo3InnqaFGO3sI4r9zWIIFyG0W1S4qfblIT689tNnDq+cmYoAmYzq
 9KZA==
X-Gm-Message-State: AOAM533PMTcntCcusdFVvQDm1yoRHqJrobbqCaieAb8ejbLqhJQtqIRL
 4ZHqlXgzyE50x82DB3nbVa9zyIkdXQw=
X-Google-Smtp-Source: ABdhPJwlsNIxE3pbkt+4GQAKWhu37LK0Id6WXr5zzJgTC+s77pCj8KcEmNcgPrxsRr8FE2zHWQAqdA==
X-Received: by 2002:a05:600c:295:: with SMTP id
 21mr2658560wmk.37.1631095495471; 
 Wed, 08 Sep 2021 03:04:55 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id u8sm1683715wmq.45.2021.09.08.03.04.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 03:04:55 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v4 27/43] i386/pc: Add e820 entry for SGX EPC section(s)
Date: Wed,  8 Sep 2021 12:04:10 +0200
Message-Id: <20210908100426.264356-28-pbonzini@redhat.com>
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
index 58700af138..1260fb6197 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -883,6 +883,10 @@ void pc_memory_init(PCMachineState *pcms,
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



