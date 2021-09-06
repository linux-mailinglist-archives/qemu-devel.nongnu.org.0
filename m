Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5A7401C38
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 15:24:56 +0200 (CEST)
Received: from localhost ([::1]:51226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNEcJ-00019Z-64
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 09:24:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNEPT-0000rw-UB
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 09:11:41 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:41659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNEPR-0007fZ-Bm
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 09:11:38 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 u15-20020a05600c19cf00b002f6445b8f55so4792508wmq.0
 for <qemu-devel@nongnu.org>; Mon, 06 Sep 2021 06:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5r01uT4tR8NNg495M2MrgoZZ94BYOI+Ryf0JV3pSQkM=;
 b=MIUaC2RHHF5qwGecVQ4fE2ZpRXtJrDS0HJ5IGOPFpsmEe59s2S3G82aZP5kihG9Cts
 syxFhCYGRwwmYvnXVggdK+MMMJ5pW+lk6D9bmnj46ERQFD9UbXlsIn8cv8j4EYZn3VOX
 Od+bX8w+egI3MdAql8dDAr2R+4Dj0waFGBw8NbhxRQhoSi3x5LUn/33/p7xs3PjSES5v
 D2OuzYkneqWzCFocIKin0ypvncHsX8cgLWbsTv8p9nmD4+IwcjRCqgiXSTevwruNiwOJ
 4JDlOqUeIfrh/sCOSrRIou5YAXt1IUGR9ysAYL3Hba6jqZOj0dUBtXU4GbIXjUUOurcW
 T03w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=5r01uT4tR8NNg495M2MrgoZZ94BYOI+Ryf0JV3pSQkM=;
 b=haGq3bafgVrpyyTV3fNQVlLHTQJ1K97bbU1DIY0+hUJPURvigVfHgmVHA3zNoKLApy
 /hvVFYpL2bN13d0yWYvX0TPPokOHXwWq1tBFfMxAjANk8qikHb/V+4fmAVTt3QlN8k8y
 Pmi5lfA6gCQNb7TjRH37a147Zh9XrB3SodQhoPmtIa3z3Abkxs84sW+z83Xk3tWigwEi
 hICdNjMFLys0jHk5nnAgvoiqQWkJLtsg01o8yloCGd7ZAa9+0smoDWsvWoxQ+xxrEYls
 1QosVE+YZ591oSQGHEPxKiWDC0wbRYQlpwpXUY314N4MFcfE6XFjTHF6hrs0r9fAbQ6x
 tRwg==
X-Gm-Message-State: AOAM530XvnrMPItZQ/K5bMlubExcBPojSJl5JFur8AzCXlryNXYTyNJ/
 WxfidrS9M5mN7DQUTSJNOeWPNxlNgMo=
X-Google-Smtp-Source: ABdhPJxqvD1+oturjFPOTIpHsQQ3uuyM/hCOo7/w0y+jgXcLMqnqgjtMyxDiaAqKgJjTUXyxjKKMig==
X-Received: by 2002:a7b:c5d8:: with SMTP id n24mr11505002wmk.51.1630933896104; 
 Mon, 06 Sep 2021 06:11:36 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 k4sm7992331wrm.74.2021.09.06.06.11.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 06:11:35 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 19/36] i386: Add feature control MSR dependency when SGX is
 enabled
Date: Mon,  6 Sep 2021 15:10:42 +0200
Message-Id: <20210906131059.55234-20-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210906131059.55234-1-pbonzini@redhat.com>
References: <20210906131059.55234-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x334.google.com
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

SGX adds multiple flags to FEATURE_CONTROL to enable SGX and Flexible
Launch Control.

Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
Signed-off-by: Yang Zhong <yang.zhong@intel.com>
Message-Id: <20210719112136.57018-12-yang.zhong@intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/kvm/kvm.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 11551648f9..6dc40161e0 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -1877,6 +1877,11 @@ int kvm_arch_init_vcpu(CPUState *cs)
                                   !!(c->ecx & CPUID_EXT_SMX);
     }
 
+    c = cpuid_find_entry(&cpuid_data.cpuid, 7, 0);
+    if (c && (c->ebx & CPUID_7_0_EBX_SGX)) {
+        has_msr_feature_control = true;
+    }
+
     if (env->mcg_cap & MCG_LMCE_P) {
         has_msr_mcg_ext_ctl = has_msr_feature_control = true;
     }
-- 
2.31.1



