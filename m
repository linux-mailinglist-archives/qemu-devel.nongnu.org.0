Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9224037F5
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 12:36:09 +0200 (CEST)
Received: from localhost ([::1]:43210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNuw4-0002dj-Gj
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 06:36:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNuRw-0006qL-Th
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 06:05:01 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:34453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNuRu-000383-AM
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 06:05:00 -0400
Received: by mail-wr1-x435.google.com with SMTP id m9so2433812wrb.1
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 03:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mu1UtmsG86JlazQUUmDKwC0IiVFtrn8Kpc5xYuE0ukg=;
 b=X4ls9LQiAfQIgpQMHraNWu00GOCaCPdOZLk187J40+PWQXwGqwp44Um5AVSot8dzDy
 av7/nXpzH3sx4TIOVrnDXvt+YqgwcMaNTyeeWMU8idC4upkDLp2QOku79bOE/z+ekFzv
 Qv8jH0IaSWgRebn5Cp8kcRXhyS2uOi4Gfe73RPN0l4JIC2Fi1ib/0NvkXfSwkGUPIcp5
 Odj5cTf9U4qq2XsPMSlsHnpQEzSARK13obWi+U/+cpx712evzt7Fuj+8odquO1O0kvJ6
 A9xZ79TaStig2gkkg1aMQoQm71iFa/8qybOmg1FC5q8YFKidcHcV9+ZVo3ZneOrTJjAo
 UoJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=mu1UtmsG86JlazQUUmDKwC0IiVFtrn8Kpc5xYuE0ukg=;
 b=kR/CyspNkqTQl4vI2gu1ZvcL9eHFd8B+hlKagglrRzKJPCchZDXHWQow1hXhNb2vKE
 VMyB+4/bJsPB0cIUaWN3SJ+0kyf7NUMguuH6oYDeTtXmuZJ38gloQwvVS6bkQ8gOdwrk
 BHBmTW1BpLooHmsp1Wh423ywxp8Ooe2Xf7Dy2pPgSpMF4D6o4nBV/GBMOdAcY+PzWCHK
 VuLhMJ6meDqbHNp+DAu+7I+wVlr6roc3xo4l3slXpdaeIPgE8Oy9DkuBpxifYv3LkCOx
 +FFIUwNErtn123gf5pY1txcdKpKtN/26lhqQmINj4pH0o1FHTg9454z5YYuThrnNbxBj
 L0Lg==
X-Gm-Message-State: AOAM533I6t09J/xrWHMO4RkwlndyYAjjmergCtbLyF08F4G0xLcfpH7u
 16w5RavRK08k75ckFvcI7EiCH+Gz8kM=
X-Google-Smtp-Source: ABdhPJypoGzWJ7Kqm6PR+W06W0xo6tEpAc/uZHtmRFfJKuwrQ0VE+YJMBQZf7kRR/PzWx/PRRSsNVw==
X-Received: by 2002:adf:c3cd:: with SMTP id d13mr3003293wrg.312.1631095496974; 
 Wed, 08 Sep 2021 03:04:56 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id u8sm1683715wmq.45.2021.09.08.03.04.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 03:04:56 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v4 29/43] q35: Add support for SGX EPC
Date: Wed,  8 Sep 2021 12:04:12 +0200
Message-Id: <20210908100426.264356-30-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210908100426.264356-1-pbonzini@redhat.com>
References: <20210908100426.264356-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x435.google.com
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

Enable SGX EPC virtualization, which is currently only support by KVM.

Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
Signed-off-by: Yang Zhong <yang.zhong@intel.com>
Message-Id: <20210719112136.57018-21-yang.zhong@intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/i386/pc_q35.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 46cd542d17..216e044d45 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -177,6 +177,9 @@ static void pc_q35_init(MachineState *machine)
         x86ms->below_4g_mem_size = machine->ram_size;
     }
 
+    if (x86ms->sgx_epc_list) {
+        pc_machine_init_sgx_epc(pcms);
+    }
     x86_cpus_init(x86ms, pcmc->default_cpu_version);
 
     kvmclock_create(pcmc->kvmclock_create_always);
-- 
2.31.1



