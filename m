Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA5E3C1EF9
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 07:36:08 +0200 (CEST)
Received: from localhost ([::1]:33466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1jBH-0004Zi-2M
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 01:36:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m1itm-0001IE-Qp; Fri, 09 Jul 2021 01:18:02 -0400
Received: from ozlabs.org ([203.11.71.1]:60181)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m1itl-000233-4V; Fri, 09 Jul 2021 01:18:02 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GLhHf35b0z9t5K; Fri,  9 Jul 2021 15:17:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1625807854;
 bh=fmtyaAfW8gexYPiNoF7QBDrbqMXBLaAkCCswKdWHVfQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WScZhKUPKG+fknTaSIHINkKtmFuDQZUa7P4O62Yu4PMZ1MHDA99KcgD1iojlPtTdN
 SAoiAIcKU35jFpKlop273oC1A+hSmwFlA0qxjeIh1M4zXT6UGigjgZpoLdE47APUi/
 plsKVxplN95UDYL3+uSxrXzD3gmacOKwYj0rKoOk=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 23/33] target/ppc: mtmsrd is an illegal instruction on BookE
Date: Fri,  9 Jul 2021 15:17:18 +1000
Message-Id: <20210709051728.170203-24-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210709051728.170203-1-david@gibson.dropbear.id.au>
References: <20210709051728.170203-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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
Cc: aik@ozlabs.ru, qemu-devel@nongnu.org, Nicholas Piggin <npiggin@gmail.com>,
 qemu-ppc@nongnu.org, Christian Zigotzky <chzigotzky@xenosoft.de>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Nicholas Piggin <npiggin@gmail.com>

MSR is a 32-bit register in BookE and there is no mtmsrd instruction.

Cc: Christian Zigotzky <chzigotzky@xenosoft.de>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
Message-Id: <20210706051321.609046-1-npiggin@gmail.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/translate.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index f65d1e81ea..d1f482b0f3 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -4940,6 +4940,11 @@ static void gen_mtcrf(DisasContext *ctx)
 #if defined(TARGET_PPC64)
 static void gen_mtmsrd(DisasContext *ctx)
 {
+    if (unlikely(!is_book3s_arch2x(ctx))) {
+        gen_invalid(ctx);
+        return;
+    }
+
     CHK_SV;
 
 #if !defined(CONFIG_USER_ONLY)
-- 
2.31.1


