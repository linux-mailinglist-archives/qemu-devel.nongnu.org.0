Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F51B6328A2
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 16:51:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ox93y-00009h-7Z; Mon, 21 Nov 2022 10:50:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ox92T-0008CZ-AN
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 10:48:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ox92R-00023y-Mq
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 10:48:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669045730;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KW8qyJw9+BwOequ/igbnYDwU1KGG6p1xzQ1NgHCaNuc=;
 b=LAjFqRWTKyGk9Gi9/KCqfZHsYnBaHvUvw26NrC0FuJgIY0Gu6tRAmd0K3biTQuIGpD1i6b
 CVvhbCawT7kPblo9iWTVETd3KFpCs+QfLrZk40C2pws2qH7TcL1/5ZCw6KaaMKRT0O/inO
 Q+mFfXpXJcXFK5U2S9Xiq5QiEMvGjXI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-270-PEbcmzSjM1K75Jo4yDuKEA-1; Mon, 21 Nov 2022 10:48:49 -0500
X-MC-Unique: PEbcmzSjM1K75Jo4yDuKEA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D71BF85A5B6;
 Mon, 21 Nov 2022 15:48:48 +0000 (UTC)
Received: from localhost (unknown [10.39.195.179])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1B04840C6E13;
 Mon, 21 Nov 2022 15:48:41 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Fam Zheng <fam@euphon.net>, David Hildenbrand <david@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Greg Kurz <groug@kaod.org>, Amit Shah <amit@kernel.org>,
 Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Vaibhav Jain <vaibhav@linux.ibm.com>,
 Kowshik Jois B S <kowsjois@linux.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Kowshik Jois B S <kowsjois@linux.vnet.ibm.com>
Subject: [PATCH v3 1/3] target/ppc: Fix build warnings when building with
 'disable-tcg'
Date: Mon, 21 Nov 2022 10:48:31 -0500
Message-Id: <20221121154833.1914768-2-stefanha@redhat.com>
In-Reply-To: <20221121154833.1914768-1-stefanha@redhat.com>
References: <20221121154833.1914768-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Vaibhav Jain <vaibhav@linux.ibm.com>

Kowshik reported that building qemu with GCC 12.2.1 for 'ppc64-softmmu'
target is failing due to following build warnings:

<snip>
 ../target/ppc/cpu_init.c:7018:13: error: 'ppc_restore_state_to_opc' defined but not used [-Werror=unused-function]
 7018 | static void ppc_restore_state_to_opc(CPUState *cs,
<snip>

Fix this by wrapping these function definitions in 'ifdef CONFIG_TCG' so that
they are only defined if qemu is compiled with '--enable-tcg'

Reported-by: Kowshik Jois B S <kowsjois@linux.ibm.com>
Fixes: 61bd1d2942 ("target/ppc: Convert to tcg_ops restore_state_to_opc")
Fixes: 670f1da374 ("target/ppc: Implement hashst and hashchk")
Fixes: 53ae2aeb94 ("target/ppc: Implement hashstp and hashchkp")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1319
Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Kowshik Jois B S <kowsjois@linux.vnet.ibm.com>
Message-Id: <20221116131743.658708-1-vaibhav@linux.ibm.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/cpu_init.c    | 2 ++
 target/ppc/excp_helper.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 32e94153d1..cbf0081374 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -7015,6 +7015,7 @@ static vaddr ppc_cpu_get_pc(CPUState *cs)
     return cpu->env.nip;
 }
 
+#ifdef CONFIG_TCG
 static void ppc_restore_state_to_opc(CPUState *cs,
                                      const TranslationBlock *tb,
                                      const uint64_t *data)
@@ -7023,6 +7024,7 @@ static void ppc_restore_state_to_opc(CPUState *cs,
 
     cpu->env.nip = data[0];
 }
+#endif /* CONFIG_TCG */
 
 static bool ppc_cpu_has_work(CPUState *cs)
 {
diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index a05a2ed595..94adcb766b 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -2842,6 +2842,7 @@ void helper_td(CPUPPCState *env, target_ulong arg1, target_ulong arg2,
 #endif
 #endif
 
+#ifdef CONFIG_TCG
 static uint32_t helper_SIMON_LIKE_32_64(uint32_t x, uint64_t key, uint32_t lane)
 {
     const uint16_t c = 0xfffc;
@@ -2924,6 +2925,7 @@ HELPER_HASH(HASHST, env->spr[SPR_HASHKEYR], true)
 HELPER_HASH(HASHCHK, env->spr[SPR_HASHKEYR], false)
 HELPER_HASH(HASHSTP, env->spr[SPR_HASHPKEYR], true)
 HELPER_HASH(HASHCHKP, env->spr[SPR_HASHPKEYR], false)
+#endif /* CONFIG_TCG */
 
 #if !defined(CONFIG_USER_ONLY)
 
-- 
2.38.1


