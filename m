Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF68327CF7
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 12:18:51 +0100 (CET)
Received: from localhost ([::1]:40366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGgZe-0002gz-Dy
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 06:18:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lGgYQ-0001gp-7j
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 06:17:34 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:34977)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lGgYN-0002VO-H0
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 06:17:34 -0500
Received: by mail-wm1-x32d.google.com with SMTP id o16so14080792wmh.0
 for <qemu-devel@nongnu.org>; Mon, 01 Mar 2021 03:17:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mTqFgQ1zRtnyIC/edI9mEfQD5oqcrOxpjPZEtid9C34=;
 b=jcrl2qrco1tCy7LKgK2PMsYO81qlxUwmZyPcCxOdXcBROuqWmU/ZVt8U+zelDcuhnv
 6PLb4BhyIbsz/AFr5tCnw9LM1CNG1FRbvJI8DO3RANd/FVojKGvxJYiItyKPWM3X9sVc
 VTFwnG7PsVw+wiHfBAFnfq/yhSuOIQ1Pna9Ve00YVvHdJ5xfAOJ93ZRTs7ZEsIWGFc9Y
 lMZEyWiBrP4PNzhegSkB126CHQSI1mQakrTSzjt4inoX5yaQlCLDlwPCgRtWO3O+yZZh
 TqAjrStFTmEHxKUmXQmFppCUyEmOsTgdhpEPVF/r+BUpbl+ml6Sw6/pi59xqyukVJWsG
 tEAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=mTqFgQ1zRtnyIC/edI9mEfQD5oqcrOxpjPZEtid9C34=;
 b=az13txubDsd8S2uw3k+mQ1UMcuopp+PDP5/4MZchMzmbJFqMer7suKQCN0mMOKxJdA
 iKRPqBhq2aRduZ9qj66Ep/6Jg0ZG6c9BEzmD79ZkwBMxNuPnL6NI07gZWIy6+7L3kLx+
 Z8op3fJQb8MEuAiG7ZciMS2749utmreq3UchteGyhP7Mc+EHBsUmAK0N7uNm3nn0NeCG
 zwyIOqKtKIMdfRnzuFawPwPFngLXbTikfqHfuspPgIDbbqnzO6YWJmQuQT0K6zbTWBQf
 SUtlQ4VSJg/7is3ZVkKjKmOoEOjqLMahQPAJWnqXugYtIqO5dRi1F5E2blpn3cmJNb4z
 CS8A==
X-Gm-Message-State: AOAM530zbIbf4BKVT7EA3YxTblhhAqhwIw2VZSbCdxKoHImdGaw6I+ov
 bPvuAq5X/K4mXaJeO2VlUuVLwjQaCDM=
X-Google-Smtp-Source: ABdhPJyi3MZI/JkQH2okIYTr8Bdhqm82Y3WZGZFE4j4OZcwwU8F0wMiXaJ01BCHqgmwm54B0BJ40Kw==
X-Received: by 2002:a7b:c007:: with SMTP id c7mr15120255wmb.59.1614597447090; 
 Mon, 01 Mar 2021 03:17:27 -0800 (PST)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id
 r9sm20551660wmq.26.2021.03.01.03.17.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Mar 2021 03:17:26 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] KVM: x86: do not fail if software breakpoint has already been
 removed
Date: Mon,  1 Mar 2021 12:17:24 +0100
Message-Id: <20210301111725.18434-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: mlevitsk@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If kvm_arch_remove_sw_breakpoint finds that a software breakpoint does not
have an INT3 instruction, it fails.  This can happen if one sets a
software breakpoint in a kernel module and then reloads it.  gdb then
thinks the breakpoint cannot be deleted and there is no way to add it
back.

Suggested-by: Maxim Levitsky <mlevitsk@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/kvm/kvm.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 0b5755e42b..c8d61daf68 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -4352,8 +4352,13 @@ int kvm_arch_remove_sw_breakpoint(CPUState *cs, struct kvm_sw_breakpoint *bp)
 {
     uint8_t int3;
 
-    if (cpu_memory_rw_debug(cs, bp->pc, &int3, 1, 0) || int3 != 0xcc ||
-        cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)&bp->saved_insn, 1, 1)) {
+    if (cpu_memory_rw_debug(cs, bp->pc, &int3, 1, 0)) {
+        return -EINVAL;
+    }
+    if (int3 != 0xcc) {
+        return 0;
+    }
+    if (cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)&bp->saved_insn, 1, 1)) {
         return -EINVAL;
     }
     return 0;
-- 
2.29.2


