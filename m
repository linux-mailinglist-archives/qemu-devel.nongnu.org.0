Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E0841AFC4
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 15:16:33 +0200 (CEST)
Received: from localhost ([::1]:54158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVCyG-0005qs-So
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 09:16:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mVCaC-0006Uh-5r
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 08:51:40 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:37537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mVCa6-0001Q6-LO
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 08:51:37 -0400
Received: by mail-ed1-x52b.google.com with SMTP id ba1so24896445edb.4
 for <qemu-devel@nongnu.org>; Tue, 28 Sep 2021 05:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5r01uT4tR8NNg495M2MrgoZZ94BYOI+Ryf0JV3pSQkM=;
 b=NmJ6uPj2uGCH7dcrLpA+fVWIEy7v4ciwyjKRAg3GN4XFiTqfamN4RysNz3JEfe9QK5
 ju1i5FlgY2TcwR0n3wcA/UUAcN5iqBgSt+e5ywcOWBdZatw+PzMwUg62aNBo6bX3eJO0
 xwLKC2MYIkwY4lAFyn/CWX3+VsjmMvmn0phDoOpRzryJiANxQOrFLQ1/FmDdxuDxTkTX
 3VXDAv4efwZj6R2M9o7HHvGV4SZTyS7KG9TDvFzpUeFRMPD5il+eXBX3CTKbt0nwtZ3V
 WSFilfIurxiLsxA67ONenJu9Yhv34v+xRv645+4QsA8cd7a0LbtsVG3UtSCyVUS2EZdQ
 tw2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=5r01uT4tR8NNg495M2MrgoZZ94BYOI+Ryf0JV3pSQkM=;
 b=1mSjGHnR5WRlOet1v5DZncEVri6aIjQR87wP1qpi8mgrSfjs2c6HAjbRDH5hFArazG
 /jGTmVlVNkVIXpYI4Ew/NOLtYeze8BSbwCO5huxZVFDA7WSfiEd+Y+6S1JeVwHLLU2Pr
 WUfN1h494RZ+4WMc6BGuXaHSecPcATGUjg99kBHlsK9idH3HN9soEXum6QYTu1OLqBrJ
 m0gsSxpKBnbxN9iSDAiYx03tanRVtrDeJJypIWIm8m8lrtte4QoJiT81xfTErKplz3dY
 CRDG1gDOHHy18pxC1vPS8ToVSC6UIpOk53MSaERwTb3oOxaiJibsn31oXKlxUXDQOpnX
 uktQ==
X-Gm-Message-State: AOAM53111G42Nn8xQ5afijaRqg0jQiyNLNhzdKuiPLXTIx0+b3GXZmkI
 S3DWHVmY4uM+eAfXqmFvOh5mMiGKu5A=
X-Google-Smtp-Source: ABdhPJxBtlgQKfRpA9V1m3EJeeCHB26nwgfV+qibPPzFQRGImJ79Q9QfdVrlJrBWg8MjBH52pHNOkA==
X-Received: by 2002:a17:906:114f:: with SMTP id
 i15mr6300918eja.124.1632833488167; 
 Tue, 28 Sep 2021 05:51:28 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id p24sm12641685edq.27.2021.09.28.05.51.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Sep 2021 05:51:27 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/33] i386: Add feature control MSR dependency when SGX is
 enabled
Date: Tue, 28 Sep 2021 14:50:55 +0200
Message-Id: <20210928125116.183620-13-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210928125116.183620-1-pbonzini@redhat.com>
References: <20210928125116.183620-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52b.google.com
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



