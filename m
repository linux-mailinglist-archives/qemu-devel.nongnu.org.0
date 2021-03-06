Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D00F732F982
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Mar 2021 11:58:28 +0100 (CET)
Received: from localhost ([::1]:46948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIUdf-0002du-RI
	for lists+qemu-devel@lfdr.de; Sat, 06 Mar 2021 05:58:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lIUZk-0005jJ-DP
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 05:54:24 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:43807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lIUZi-00082f-Vf
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 05:54:24 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 a25-20020a1cf0190000b029010b1cbe2dd0so814674wmb.2
 for <qemu-devel@nongnu.org>; Sat, 06 Mar 2021 02:54:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mGJQ/MT5+qh0FcV5UI0gtmeVdq+aG4jQfcWO47MpsT4=;
 b=I50LCQzDwXtWwe4cFvUjyWp0mjKtbha85YFtYKlmbdYxbrMUOD+CGkNypaJNEvXFeD
 1gDw0l5QWE+EuIejLWe+60VNKvuVUORNIy7ciSgdLi+ck7FGe2iwAL/Jy5jGN2NlWCun
 C6tm8KpzOljAfzDrlTLhnTgTaOeDrC5ZtdOnLbGGk8/7Iwi/DU/9vVs3iXhyr9bWiKf/
 vah2RPqs6DUXlBFEpTwEazhWpgtsdJ3mwwLL2G0WxHwE2Qkxm8b3lj8/l8Z61F+yiXx0
 VU6wz415+G768CysFUOB+7+fRwnTpF5Tjm1h1AsnqIP5FWA2+H/EklZ0sRsPdfZ3hj7f
 4CjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=mGJQ/MT5+qh0FcV5UI0gtmeVdq+aG4jQfcWO47MpsT4=;
 b=MqIXlM+q3Fl7DS4o6wdbe6FmRNa2Ectuo1mAytiC4p3zKNDu7Saz6SrokpUm4AEnoI
 hQpyiNb1S0HI+sa7ba/otYZ6DI+OStx6CUywSrm0MXmsnLU4jAYa9KDkDd+VC8GRk46a
 qrMTewjTz/EAhVLUVZEv15aFxYREXOXe8Al6Kvz895S5Xkd68dIhQFM+CWReXfiU79/9
 eABmkWAflECzQlBukNfpNntLXQX0AMnv3m+1N0F360VoQKntABaTKqLYm7Dc1vBhSzL3
 DDtZ5etHY4pIzhrHP/+2RDOaZdjxBLGNgKAvgonlqq3FYwNEan7uNoc0eZi/YejjYwkq
 3Y1Q==
X-Gm-Message-State: AOAM532YtLKrb7ZoWPCtDZGXdQVNza/p7dXnEKLgJGDJp4sjAQcLmXST
 Cv4bn4RvQLkLRLqaxyI/MvZnR/RkaHU=
X-Google-Smtp-Source: ABdhPJx3L0AWetowaX9lMvbLvviUewNuAMXWk+su8hPhjiaBsd2RHeGsDCXcEi9Q/XwcpSm0S61++A==
X-Received: by 2002:a1c:4143:: with SMTP id o64mr13139739wma.50.1615028061690; 
 Sat, 06 Mar 2021 02:54:21 -0800 (PST)
Received: from avogadro.redhat.com ([93.56.170.5])
 by smtp.gmail.com with ESMTPSA id i26sm9326472wmb.18.2021.03.06.02.54.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Mar 2021 02:54:21 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/23] KVM: x86: do not fail if software breakpoint has already
 been removed
Date: Sat,  6 Mar 2021 11:53:57 +0100
Message-Id: <20210306105419.110503-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210306105419.110503-1-pbonzini@redhat.com>
References: <20210306105419.110503-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32a.google.com
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
Cc: Maxim Levitsky <mlevitsk@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If kvm_arch_remove_sw_breakpoint finds that a software breakpoint does not
have an INT3 instruction, it fails.  This can happen if one sets a
software breakpoint in a kernel module and then reloads it.  gdb then
thinks the breakpoint cannot be deleted and there is no way to add it
back.

Suggested-by: Maxim Levitsky <mlevitsk@redhat.com>
Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>
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



