Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 438FA401C35
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 15:23:33 +0200 (CEST)
Received: from localhost ([::1]:46446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNEay-0006No-8l
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 09:23:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNEPY-00015v-Uj
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 09:11:44 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:45633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNEPX-0007m7-3I
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 09:11:44 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 j17-20020a05600c1c1100b002e754875260so4740518wms.4
 for <qemu-devel@nongnu.org>; Mon, 06 Sep 2021 06:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JwjqCRXQx9MlfSnrV5qD4bpa9qVZzm/hjGfrBWyX5Yo=;
 b=FjqrF901vZNzmpbIScc5gZOIQpA5E0mICv0LS6zIq89VX5LAlzXekWq6SyVAq6Y+ZS
 XTrVz6fzNlu4UbkCssppvxFb5HV6vQbXCfZjoJySefmWnLxOcNEzAf5McRy4oglgLZ7k
 MOmXI6JkrnWwKeC4YGROTgJ4Y0koBuxIE8kj5dkCJDUkAXXtKDxLlQpqcYf3C0XqrDu0
 ISffnqJzsScuwwC91/zSQpjAC9XN6xQc7UNbQ0F7aPzwZgF44TFzQuAAnciX8gDhrh8S
 VVkjUqTBcThjJdT9FPIR+ELG8oTgQ3BebjSBViSpBVvzQ6khemWxF6BVCW4RsQL245yf
 vmcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=JwjqCRXQx9MlfSnrV5qD4bpa9qVZzm/hjGfrBWyX5Yo=;
 b=Vek/2dwLaaAul2jw6EGlRef1H84DjxQMbgtMsgnCFMufx5mZZZAMHkkDfR9OejKdRx
 Buqc3tmZN7SoKC3rN1MwiwG7QMz6T8Y1l91KnzpPjfq81bx+tnR77owuZ5/4TyQTIfZv
 AVEgEr0G63l6x50duPtEKfU7TS0/A6/JZzTDZunYMSUdMzJW4XshYBpOH4DrMQfLqtT+
 wzARQsj9rd+vs7hg9lahCAEtfzkg07tiJmDAYg1bXWJnFQJoZ6qZvodiyRx267bXLJjQ
 yz2gBKjuatlfR4rdAwRFDKE5qK/1Hi++l3CrZT9Z6whGDxiMWwganB0GY7nTDOk13kr5
 wmoQ==
X-Gm-Message-State: AOAM532M/bArJP2dGeom8QIv5ezfJAfY9QlxCFu9RlQzgo0OFkgi28gg
 0So8PzJvtia2N6lkJ3cTxfRM/85oalc=
X-Google-Smtp-Source: ABdhPJzxrE3C6wOXiSDgpIhY0CHlxDf5gjcqsKXTGeFRyszbyOR4iWT8UJmWFb7RksZaYeT9sKIO4g==
X-Received: by 2002:a7b:c405:: with SMTP id k5mr11213823wmi.87.1630933901733; 
 Mon, 06 Sep 2021 06:11:41 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 k4sm7992331wrm.74.2021.09.06.06.11.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 06:11:41 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 23/36] Adjust min CPUID level to 0x12 when SGX is enabled
Date: Mon,  6 Sep 2021 15:10:46 +0200
Message-Id: <20210906131059.55234-24-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210906131059.55234-1-pbonzini@redhat.com>
References: <20210906131059.55234-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
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

SGX capabilities are enumerated through CPUID_0x12.

Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
Signed-off-by: Yang Zhong <yang.zhong@intel.com>
Message-Id: <20210719112136.57018-16-yang.zhong@intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 3b1f9cbdf6..2774550501 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6153,6 +6153,11 @@ void x86_cpu_expand_features(X86CPU *cpu, Error **errp)
         if (sev_enabled()) {
             x86_cpu_adjust_level(cpu, &env->cpuid_min_xlevel, 0x8000001F);
         }
+
+        /* SGX requires CPUID[0x12] for EPC enumeration */
+        if (env->features[FEAT_7_0_EBX] & CPUID_7_0_EBX_SGX) {
+            x86_cpu_adjust_level(cpu, &env->cpuid_min_level, 0x12);
+        }
     }
 
     /* Set cpuid_*level* based on cpuid_min_*level, if not explicitly set */
-- 
2.31.1



