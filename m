Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 212EF52E61C
	for <lists+qemu-devel@lfdr.de>; Fri, 20 May 2022 09:22:54 +0200 (CEST)
Received: from localhost ([::1]:42156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrwyJ-0007eA-1t
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 03:22:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1nrwn1-0001LV-Go
 for qemu-devel@nongnu.org; Fri, 20 May 2022 03:11:13 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:47075)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1nrwmy-0002hE-Hm
 for qemu-devel@nongnu.org; Fri, 20 May 2022 03:11:10 -0400
Received: by mail-pf1-x42d.google.com with SMTP id j6so7014390pfe.13
 for <qemu-devel@nongnu.org>; Fri, 20 May 2022 00:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0KUgn4q69DG5zIlC1bOLKat5AESimquHJFEcH7Mymww=;
 b=RnsS8rlcaqrcj3RhK36pn8NouGunnnwM0GWKWK3X1PoabzQ9x/1iAvkQLVXobtqqiM
 ckZSnIumZQpT0Pn4mHGXaQGJs831i9051mt2zMMjIB2XhqpiqHY8bdQK0fBaG0UzRLoL
 naPm0yF6A6L94p3Q2Soc1gjNiohCOmp8PNK2xsJ1qIt96FT3yDkxJr3YdN+/AofbvEvv
 viiJ12IC5jdwnOJpCr2ZYAjcUz0d5cNGgjyvZNDDRv2FFmf08kbSdTBBLUn+EpnaRT41
 YrATyb3OhG5XZvVh8xQe3R/6NeJ9DaM/oG6826oJKua/ka22lR8KaQ90kEd3mlS4ekaU
 2VZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0KUgn4q69DG5zIlC1bOLKat5AESimquHJFEcH7Mymww=;
 b=RRe+GAZwEe/My4aA89b9qDPDQVAiSXWm1I8Xi80tEL+Gl/S52klE9sz1h7hfPMluck
 AZ+LVaBXy3kGkJf4xIzlSjcNPq12ItyEWA8jjC856t9np5NDg05AkTdWOCjEcjTDtO4s
 qkH+Rr3Nn25Au2zVSOPukRtu1BCYRVW85H3oJra5rpZIwLJg9SF0qXaRKheZHg9aak/I
 ynNlDaZGTTzBNZ6FQPgxQa1DsUN+5ZpSoMFhbf6eE6aXDkd5KhWsRd0HODQsIToPDTHp
 Hsb6/4obaqo/ZWAM2eS4e05MJP3c+GCtruDPzhaVoYAkDP4h9AoVihBHvgNlWG3JId8v
 GoOQ==
X-Gm-Message-State: AOAM5317dzZwch+bwhM4XDsl5r8q23ggTp2WSSiiyLVWxQujRpydklGj
 t3NxNan89cMcUK/7cKoyysRR2A==
X-Google-Smtp-Source: ABdhPJy2CdwQr543isCK/keOAsVtpqVPpZ286CuyvQTXDJe5qsQURjhpmTDYka3gLq4fZ2UvZmCJZg==
X-Received: by 2002:a63:5a09:0:b0:3c2:5dfa:285c with SMTP id
 o9-20020a635a09000000b003c25dfa285cmr7271718pgb.381.1653030667026; 
 Fri, 20 May 2022 00:11:07 -0700 (PDT)
Received: from always-x1.www.tendawifi.com ([139.177.225.255])
 by smtp.gmail.com with ESMTPSA id
 t18-20020a170902d21200b00161b3d5e3e4sm4965168ply.304.2022.05.20.00.11.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 00:11:05 -0700 (PDT)
From: zhenwei pi <pizhenwei@bytedance.com>
To: akpm@linux-foundation.org, naoya.horiguchi@nec.com, mst@redhat.com,
 david@redhat.com
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, jasowang@redhat.com,
 virtualization@lists.linux-foundation.org, pbonzini@redhat.com,
 peterx@redhat.com, qemu-devel@nongnu.org,
 zhenwei pi <pizhenwei@bytedance.com>
Subject: [PATCH 1/3] memory-failure: Introduce memory failure notifier
Date: Fri, 20 May 2022 15:06:46 +0800
Message-Id: <20220520070648.1794132-2-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220520070648.1794132-1-pizhenwei@bytedance.com>
References: <20220520070648.1794132-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce memory failure notifier, once hardware memory failure
occurs, after the kernel handles the corrupted page successfully,
someone who registered this chain gets noticed of the corrupted PFN.

Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
---
 include/linux/mm.h  |  2 ++
 mm/memory-failure.c | 33 +++++++++++++++++++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 9f44254af8ce..665873c2788c 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -3197,6 +3197,8 @@ extern int sysctl_memory_failure_recovery;
 extern void shake_page(struct page *p);
 extern atomic_long_t num_poisoned_pages __read_mostly;
 extern int soft_offline_page(unsigned long pfn, int flags);
+extern int register_memory_failure_notifier(struct notifier_block *nb);
+extern int unregister_memory_failure_notifier(struct notifier_block *nb);
 #ifdef CONFIG_MEMORY_FAILURE
 extern int __get_huge_page_for_hwpoison(unsigned long pfn, int flags);
 #else
diff --git a/mm/memory-failure.c b/mm/memory-failure.c
index 2d590cba412c..95c218bb0a37 100644
--- a/mm/memory-failure.c
+++ b/mm/memory-failure.c
@@ -68,6 +68,35 @@ int sysctl_memory_failure_recovery __read_mostly = 1;
 
 atomic_long_t num_poisoned_pages __read_mostly = ATOMIC_LONG_INIT(0);
 
+static BLOCKING_NOTIFIER_HEAD(mf_notifier_list);
+
+/**
+ * register_memory_failure_notifier - Register function to be called if a
+ *                                    corrupted page gets handled successfully
+ * @nb: Info about notifier function to be called
+ *
+ * Currently always returns zero, as blocking_notifier_chain_register()
+ * always returns zero.
+ */
+int register_memory_failure_notifier(struct notifier_block *nb)
+{
+	return blocking_notifier_chain_register(&mf_notifier_list, nb);
+}
+EXPORT_SYMBOL_GPL(register_memory_failure_notifier);
+
+/**
+ * unregister_memory_failure_notifier - Unregister previously registered
+ *                                      memory failure notifier
+ * @nb: Hook to be unregistered
+ *
+ * Returns zero on success, or %-ENOENT on failure.
+ */
+int unregister_memory_failure_notifier(struct notifier_block *nb)
+{
+	return blocking_notifier_chain_unregister(&mf_notifier_list, nb);
+}
+EXPORT_SYMBOL_GPL(unregister_memory_failure_notifier);
+
 static bool __page_handle_poison(struct page *page)
 {
 	int ret;
@@ -1136,6 +1165,10 @@ static void action_result(unsigned long pfn, enum mf_action_page_type type,
 	num_poisoned_pages_inc();
 	pr_err("Memory failure: %#lx: recovery action for %s: %s\n",
 		pfn, action_page_types[type], action_name[result]);
+
+	/* notify the chain if we handle successfully only */
+	if (result == MF_RECOVERED)
+		blocking_notifier_call_chain(&mf_notifier_list, pfn, NULL);
 }
 
 static int page_action(struct page_state *ps, struct page *p,
-- 
2.20.1


