Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 691443725DF
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 08:37:41 +0200 (CEST)
Received: from localhost ([::1]:39518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldoge-0006jF-Fy
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 02:37:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldo1F-0006w6-6Z; Tue, 04 May 2021 01:54:53 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:35131)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldo1D-0005JI-HC; Tue, 04 May 2021 01:54:52 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FZ8CQ0Stsz9t1C; Tue,  4 May 2021 15:53:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620107602;
 bh=Waw0NZnem3odKQHfMNelimpPmlKaZSKhjMfc8vEz4Uc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Q//2GDmSrjB/39ZwcWkqiI5k9oBJMqS17vx9aEhVUdYHpgkL2uYsA8yCTv+Nu2MhU
 lEEVqIkaCrepPK/6KYOKrLnLZ7Cdj0SeQoi+11A+VUfeKwJ5bLWTXoAkUIeFzMgLy4
 KU6YLyltoRLDuZjbqkiPX+w3LJHewMFoKEz2pZ/0=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 42/46] target/ppc: Reduce the size of ppc_spr_t
Date: Tue,  4 May 2021 15:53:08 +1000
Message-Id: <20210504055312.306823-43-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210504055312.306823-1-david@gibson.dropbear.id.au>
References: <20210504055312.306823-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

We elide values when registering sprs, we might as well
save space in the array as well.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210501022923.1179736-3-richard.henderson@linaro.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/cpu.h | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 8a076fab48..733a2168c4 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -192,17 +192,21 @@ typedef struct ppc_hash_pte64 ppc_hash_pte64_t;
 
 /* SPR access micro-ops generations callbacks */
 struct ppc_spr_t {
+    const char *name;
+    target_ulong default_value;
+#ifndef CONFIG_USER_ONLY
+    unsigned int gdb_id;
+#endif
+#ifdef CONFIG_TCG
     void (*uea_read)(DisasContext *ctx, int gpr_num, int spr_num);
     void (*uea_write)(DisasContext *ctx, int spr_num, int gpr_num);
-#if !defined(CONFIG_USER_ONLY)
+# ifndef CONFIG_USER_ONLY
     void (*oea_read)(DisasContext *ctx, int gpr_num, int spr_num);
     void (*oea_write)(DisasContext *ctx, int spr_num, int gpr_num);
     void (*hea_read)(DisasContext *ctx, int gpr_num, int spr_num);
     void (*hea_write)(DisasContext *ctx, int spr_num, int gpr_num);
-    unsigned int gdb_id;
+# endif
 #endif
-    const char *name;
-    target_ulong default_value;
 #ifdef CONFIG_KVM
     /*
      * We (ab)use the fact that all the SPRs will have ids for the
-- 
2.31.1


