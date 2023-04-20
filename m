Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2A06E9DDE
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 23:30:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppbqD-0007GA-AC; Thu, 20 Apr 2023 17:29:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1ppbqA-0007Ec-7J
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 17:29:18 -0400
Received: from rev.ng ([5.9.113.41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1ppbq7-0005YU-By
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 17:29:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=r2PjhWBCDWy69p3MQqHLdHlmJI2itJ0uiNpQysAZt1Q=; b=Pv8VRXs2neoCsZoSdzkQL0KYtG
 jE/KkUMj1djPm+OCG7qkPBEzU8OZJthMOZzMwUHjOtsGMQWsd9kZOKHtMC7CuwT8MED6UGG+PvvMX
 6fGiAKcKDN2eRMIWKqQSqetkr9G9fEjhnAJVLS8+E5cTdLMqcs+hIwF7nuFuLPnrUjmw=;
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, richard.henderson@linaro.org, pbonzini@redhat.com,
 eduardo@habkost.net, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com
Subject: [PATCH 8/8] tcg: Replace target_ulong with vaddr in tcg_gen_code()
Date: Thu, 20 Apr 2023 23:28:50 +0200
Message-Id: <20230420212850.20400-9-anjo@rev.ng>
In-Reply-To: <20230420212850.20400-1-anjo@rev.ng>
References: <20230420212850.20400-1-anjo@rev.ng>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.9.113.41; envelope-from=anjo@rev.ng; helo=rev.ng
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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
Reply-to:  Anton Johansson <anjo@rev.ng>
From:  Anton Johansson via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Anton Johansson <anjo@rev.ng>
---
 include/tcg/tcg.h | 2 +-
 tcg/tcg.c         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 5cfaa53938..b8dbc66610 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -852,7 +852,7 @@ void tcg_register_thread(void);
 void tcg_prologue_init(TCGContext *s);
 void tcg_func_start(TCGContext *s);
 
-int tcg_gen_code(TCGContext *s, TranslationBlock *tb, target_ulong pc_start);
+int tcg_gen_code(TCGContext *s, TranslationBlock *tb, vaddr pc_start);
 
 void tb_target_set_jmp_target(const TranslationBlock *, int,
                               uintptr_t, uintptr_t);
diff --git a/tcg/tcg.c b/tcg/tcg.c
index bb52bc060b..3823c3156a 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -4922,7 +4922,7 @@ int64_t tcg_cpu_exec_time(void)
 #endif
 
 
-int tcg_gen_code(TCGContext *s, TranslationBlock *tb, target_ulong pc_start)
+int tcg_gen_code(TCGContext *s, TranslationBlock *tb, vaddr pc_start)
 {
 #ifdef CONFIG_PROFILER
     TCGProfile *prof = &s->prof;
-- 
2.39.1


