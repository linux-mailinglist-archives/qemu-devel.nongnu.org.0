Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B48031BA40
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 14:24:50 +0100 (CET)
Received: from localhost ([::1]:33054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBdrt-0002CZ-CO
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 08:24:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lBdjv-0005Vk-Ux
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 08:16:36 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:34187)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lBdju-0005Vt-FA
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 08:16:35 -0500
Received: by mail-ej1-x632.google.com with SMTP id hs11so11110168ejc.1
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 05:16:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3L8J4G/OuQfDu+BLdvk75fMpqFgpjr5W7kEtzKbxSzQ=;
 b=kydCY7RdE3c3cqChe5iGDWoLhwkBdHf/CpIM/3FAVtcfEE2M9PA1scsTEVx/RQDsY+
 bHoVrn7+QJuJMl8xzatWL1S1MtYqETb8UyluTD3bd+MbDlBQylEijJPfpiJmgDWWoLER
 HvIHp7NqDvMkJ1Hq4/i1+91xREffx2wsRZezmREIdDJgip3s9eC+mAprcui/diiyJZLR
 227TE26rh5chdjmNuBo/z/h9ci8WYr2Cj3JqMMEyy+Y3/2V9A65A9ehikmEJfBrYZS8s
 SbqdTIwuQ2pxW+Df4CeQGk01hFrXtZckRP1bKc9HS9lS3QpWrnNVlSb6uQE1A/w98Mdw
 X0DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=3L8J4G/OuQfDu+BLdvk75fMpqFgpjr5W7kEtzKbxSzQ=;
 b=LQN8uZ3pAj3qCgS9l0k3cSw1m2pe+6eqy1f3/baktLF5TXxOAtvxoU8kehyGjn+K5o
 pGqa/G+Wsmvrq3eFHqi88GYlENL5afU5wvL0mW3bNPIoDUUtgGLgz34d5KnjVDXguH+C
 I8Bm0tZzDOmI+jW8AkvZY0j3qZLtsARlH0tqRM6oDxUEyoM/d3Y+ReiP4wi/hjVemZqe
 cS1Pz9TN6SUEZ3afUlxj7p6HtFqCH9uH2xOavrwuDRxwE0/An2jfeJc2nl6EAes3QL5Z
 WZQkG3Q14iX8qT0U44LYdRhZvXVcsWPjY3ZJRWrP/tUVCBSdYKGCAn5EaxZj8LuoLwGo
 8/Yw==
X-Gm-Message-State: AOAM533Wzq545iB79hoPGIxe8Bp3jx2x5fMbkyulkz8Wp+Pm9zAobYMO
 rGBmuywsYBn7Xxby0GWwa5mkc3SuklE=
X-Google-Smtp-Source: ABdhPJz8e1UDz69R4ts+F1QZNtKF2WacvL+CbB1oBW9XyPaV1Cw48w5dqT7d2DfLHszd/Khs8Vt6NA==
X-Received: by 2002:a17:907:9614:: with SMTP id
 gb20mr15140132ejc.157.1613394993131; 
 Mon, 15 Feb 2021 05:16:33 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id o4sm9950184edw.78.2021.02.15.05.16.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 05:16:32 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/19] kvm/i386: Use a per-VM check for SMM capability
Date: Mon, 15 Feb 2021 14:16:14 +0100
Message-Id: <20210215131626.65640-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210215131626.65640-1-pbonzini@redhat.com>
References: <20210215131626.65640-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x632.google.com
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>,
 Venu Busireddy <venu.busireddy@oracle.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Sean Christopherson <seanjc@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Tom Lendacky <thomas.lendacky@amd.com>

SMM is not currently supported for an SEV-ES guest by KVM. Change the SMM
capability check from a KVM-wide check to a per-VM check in order to have
a finer-grained SMM capability check.

Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Suggested-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>
Reviewed-by: Venu Busireddy <venu.busireddy@oracle.com>
Message-Id: <f851903809e9d4e6a22d5dfd738dac8da991e28d.1611682609.git.thomas.lendacky@amd.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/kvm/kvm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index d10667b21b..0b5755e42b 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -137,7 +137,7 @@ int kvm_has_pit_state2(void)
 
 bool kvm_has_smm(void)
 {
-    return kvm_check_extension(kvm_state, KVM_CAP_X86_SMM);
+    return kvm_vm_check_extension(kvm_state, KVM_CAP_X86_SMM);
 }
 
 bool kvm_has_adjust_clock_stable(void)
-- 
2.29.2



