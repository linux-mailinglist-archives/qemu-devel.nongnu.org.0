Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9813DE53F
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 06:25:25 +0200 (CEST)
Received: from localhost ([::1]:57652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAlzY-0005cU-89
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 00:25:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAlpc-0003Cf-Bp
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 00:15:08 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:54868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAlpa-0002Ep-RB
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 00:15:08 -0400
Received: by mail-pj1-x102c.google.com with SMTP id a8so5028704pjk.4
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 21:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HMfZmsl9b34V239Gzg7uffeLnYB6fZGcKfNq7/+awZA=;
 b=bSbRBMMtjiy5woY/GT/W/DaPx6/1TdpR1EPMebC7eAd+Ie7umJhkZPIPMWo6Hy3giT
 78LKfTsCDx2NlJAxyp1eqi4S1OTFKm6R/8FU0JjmqZLxvAQ/E1o0Di0r1jnAu1Fn3Kts
 /qK36McPTiRcxHAIlFhcZBnb+EdIqFhUYE5ngvkassEC4hoowNVAfiGLs3MeLdTfD41q
 yrSldn7OodrFiY8XzWnWRMzgvLTPFvyneuy4MKyzhj5sa/MJxK7ZDNTRvvuJZlynQKxk
 6Qu4e5HQa0MUxC+KvE7ChBgrnvsGDCczxEuAbSgRIWn9079h+xMzQENYgYWLuuoDx8xS
 gNzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HMfZmsl9b34V239Gzg7uffeLnYB6fZGcKfNq7/+awZA=;
 b=CNEvqH/e0wYh39CLVVNLVy/uuwRTi24/FfCpD9K/Utki2wAq6qhiCtNxZUzfYs9CBD
 jCLE6kxZMohHkknxioidDcJGSf8VkYvRIcquDzMhP8/tt8HHM1Y2reikafoNF+/7o/rD
 1zoEaZycGUsIxwOpbIWD1ClMtEXuIrz272yfwtLsFCB4IkCC2NMiyAiV90vFoEkW9Uu+
 ufmupvnKPvtMWWfSNRohcfbX3VZk1iydwTXJdCMD97HqLd5Pl3WmKciB9KtPJikgWlBQ
 UtV9vmqf6TLzJY3MNDKDFEpleoGep/xUH+48Hgi6/bFS14073px/xoh/Aqhi2JPmsrcH
 OmyA==
X-Gm-Message-State: AOAM531DVGK1cGiGh+HvLM6N3hKtldwjtHg/3eq5c9rSkTYkOhTDg9mT
 IQz4JDAGxglYcE4LOl8Sq0D688Lcbo9YkA==
X-Google-Smtp-Source: ABdhPJwlCSNWVBQv4M0z3iuRK0psv57gQJFqEua6fDkJ9NQ4jd9p2MF1Qa+hoSaXvuHshNHbzOrFNA==
X-Received: by 2002:a05:6a00:ac6:b029:374:a33b:a74 with SMTP id
 c6-20020a056a000ac6b0290374a33b0a74mr20164191pfl.51.1627964105670; 
 Mon, 02 Aug 2021 21:15:05 -0700 (PDT)
Received: from localhost.localdomain (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id c23sm13718532pfn.140.2021.08.02.21.15.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 21:15:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 17/55] target/sparc: Set fault address in
 sparc_cpu_do_unaligned_access
Date: Mon,  2 Aug 2021 18:14:05 -1000
Message-Id: <20210803041443.55452-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210803041443.55452-1-richard.henderson@linaro.org>
References: <20210803041443.55452-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We ought to have been recording the virtual address for reporting
to the guest trap handler.  Move the function to mmu_helper.c, so
that we can re-use code shared with get_physical_address_data.

Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/sparc/ldst_helper.c | 13 -------------
 target/sparc/mmu_helper.c  | 18 ++++++++++++++++++
 2 files changed, 18 insertions(+), 13 deletions(-)

diff --git a/target/sparc/ldst_helper.c b/target/sparc/ldst_helper.c
index 974afea041..ea163200a4 100644
--- a/target/sparc/ldst_helper.c
+++ b/target/sparc/ldst_helper.c
@@ -1953,16 +1953,3 @@ void sparc_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
                           is_asi, size, retaddr);
 }
 #endif
-
-#if !defined(CONFIG_USER_ONLY)
-void QEMU_NORETURN sparc_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
-                                                 MMUAccessType access_type,
-                                                 int mmu_idx,
-                                                 uintptr_t retaddr)
-{
-    SPARCCPU *cpu = SPARC_CPU(cs);
-    CPUSPARCState *env = &cpu->env;
-
-    cpu_raise_exception_ra(env, TT_UNALIGNED, retaddr);
-}
-#endif
diff --git a/target/sparc/mmu_helper.c b/target/sparc/mmu_helper.c
index 5b2fda534a..2f260b0085 100644
--- a/target/sparc/mmu_helper.c
+++ b/target/sparc/mmu_helper.c
@@ -946,4 +946,22 @@ hwaddr sparc_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
     }
     return phys_addr;
 }
+
+void QEMU_NORETURN sparc_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
+                                                 MMUAccessType access_type,
+                                                 int mmu_idx,
+                                                 uintptr_t retaddr)
+{
+    SPARCCPU *cpu = SPARC_CPU(cs);
+    CPUSPARCState *env = &cpu->env;
+
+#ifdef TARGET_SPARC64
+    env->dmmu.sfsr = build_sfsr(env, mmu_idx, access_type);
+    env->dmmu.sfar = addr;
+#else
+    env->mmuregs[4] = addr;
 #endif
+
+    cpu_raise_exception_ra(env, TT_UNALIGNED, retaddr);
+}
+#endif /* CONFIG_USER_ONLY */
-- 
2.25.1


