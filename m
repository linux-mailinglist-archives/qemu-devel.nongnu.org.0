Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5263F401C3C
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 15:25:39 +0200 (CEST)
Received: from localhost ([::1]:54862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNEd0-0003Zx-CH
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 09:25:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNEPg-0001aA-MS
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 09:11:52 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:38877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNEPe-0007uG-Ja
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 09:11:52 -0400
Received: by mail-wr1-x431.google.com with SMTP id u16so9796905wrn.5
 for <qemu-devel@nongnu.org>; Mon, 06 Sep 2021 06:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/RU/BIwi2NMUOiTU0NmUWQqmXLerm1KNQgo7Fx1Az8k=;
 b=ZbW0ed3KIkaSwvDtv7qPhatvH/HaZ810ovR23o24n1i2qqGIInXNa/4V5f4RUgJnvv
 y56fanUViw8mAAA0lc57RDBcgkFYTOg9r/TJlvNbI3MUgkOAZO0RIiwIAoGS4bRUh5fa
 UMntCJxWzjNVT9ygEAICJaqa95dxnOTM09+mjjaVu7zZicRO+Jf57VKXQoqqHrlOegiQ
 DyYbxLuFI2Xnb9IUS5/Ef1SdJ4ZqrF3RF97gY/mJN/1up2J3BPOiMl+Fi9utH2Eyjj2+
 s2sDey5gv+hFQKGLMtb2KaEvNrhJrHxSm7P/v/I0MGHMTsGbs6aIom3gPdimvARV10rb
 DWYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=/RU/BIwi2NMUOiTU0NmUWQqmXLerm1KNQgo7Fx1Az8k=;
 b=i1h+cxlQ88mxhqkMClpCNjWkQPIM0UK9g/OJctScTeXapozr/4lErOsk3JT9x+KXUr
 U0aDU7DpJIY3nNpCPZ4nqW73nG+PL9fdd+lNysVxw+lnZIOwFW79DLd6R9JnLeoE6Yj+
 GAy990ncEWPA6d5kwgBa+psrZ5HH5eCkd+D7aTs4Tp/YyRLpUaL8XHAZGLOEnsKnvWRS
 bZBbqNd8Lmp0cBZUCwGgu4EehCT1ni7bNSx3TLqbtqEezohfs9fR38cwbEmEQ2Dsdw6J
 YUMH8veEavECLOI0srjJksxUV7AyLKXFsZWblYKWfQPqPHBI7U0rA0x2sbsTV7lTnk9h
 FQIg==
X-Gm-Message-State: AOAM533DepF+k5ATNQGFlPv0FcTZzFrVp1JtKWdbJt/kqZM/rLuCn5jF
 4v5WXrIF/La4fxO6pKl5tEQMZgmMfJA=
X-Google-Smtp-Source: ABdhPJxLeYRmWYYjapn2DvRiDLZqirJzviuiWoJcAYvYd9cSLuxb78HOiM1qGvFB7wY0OUqhieT69g==
X-Received: by 2002:adf:e604:: with SMTP id p4mr13467132wrm.37.1630933909286; 
 Mon, 06 Sep 2021 06:11:49 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 k4sm7992331wrm.74.2021.09.06.06.11.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 06:11:48 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 28/36] q35: Add support for SGX EPC
Date: Mon,  6 Sep 2021 15:10:51 +0200
Message-Id: <20210906131059.55234-29-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210906131059.55234-1-pbonzini@redhat.com>
References: <20210906131059.55234-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x431.google.com
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
index 565fadce54..f27d49f7e4 100644
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



