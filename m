Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D5C6C5C8D
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 03:24:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfAbT-00023t-Ad; Wed, 22 Mar 2023 22:22:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1pfAbN-00023F-Kp; Wed, 22 Mar 2023 22:22:53 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1pfAbM-00083Q-2p; Wed, 22 Mar 2023 22:22:53 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 om3-20020a17090b3a8300b0023efab0e3bfso525069pjb.3; 
 Wed, 22 Mar 2023 19:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679538169;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nyq0pQCVaR7tQ5J0BWrgvGNg57mKGgj/17nqWtHTu0w=;
 b=ao3gxVhiOMxDiiyqrRuvAFiyzaPRo9s9qAWxm4Ah2UWjM/h7yZYVsZRKvJbjuBtD1T
 dXV3i5NJgKv62rSrltGrxjJYkdV5WQzZWjZcY+PJYWciEXX97jZ9UPRVotU3+NCoLpWh
 QmTLQWUVGJtg4tTSZrPiUGiengYT4rGVGTY8l71PUaqbUomQYvzEPtUtBcAKPW95fv16
 VkOKxk51GqZxVYPT6CfDC3D0ShO9RHxp4SZcRIIPMe9hcPYp7qOkXHtEWxYxKI0EZF5B
 87oq0f8b/PHKL+JsQrDXqaZHmt9FDTWLQp1m6wmcNKoBjd4/qgrbxVd+G2HQz/MwkcGB
 2CFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679538169;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nyq0pQCVaR7tQ5J0BWrgvGNg57mKGgj/17nqWtHTu0w=;
 b=Vxib7aW8R+yBGOMclP/QPWU5+v3tCPAKJwACCVM1EVxK1gAxNYQXIe8qVSNaqhoNXQ
 X29nwQsE3O54xrmvbSyw5asWQPnXbEgeglwFLpAqOgPH1AWoLiLupnuA9dIhxHX6Xv6Z
 6PtBP4JG2PvWRLygfDXoRlzTNM2A7eQCXJDUNNAX0QUDyvgVXyiq8UBpD8JbngSZxgdH
 Ayqa1fMOo9bgs1xmYrZKZIPPZG11o6iKBrOpshpGNsfxj7N3emU2mCb/vj8emWwvuHgR
 pabU9w6HZB0DQ7r/Ef8XOukCAZPMb9jvoopSqILdne/ziQmpjLj3oBzRWNtLwy9YlKG8
 H5Tw==
X-Gm-Message-State: AO0yUKUq+2nj/cDfW0bjOO7kmO2qFS2C5xPQUY1bbtfHPKroRI5sPP67
 +M2/iDjpZPyPweAwOxDy+Qo70q+aVi9rUw==
X-Google-Smtp-Source: AK7set+b+k6n4jcZkYbfRWKz6aJxAwtGfIzldT7Lsp5SqGWDAOYy7H76UvjweTQElV6FiG+nInJOHw==
X-Received: by 2002:a17:902:cad5:b0:19f:380e:9cca with SMTP id
 y21-20020a170902cad500b0019f380e9ccamr3846796pld.20.1679538169548; 
 Wed, 22 Mar 2023 19:22:49 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (61-68-215-123.tpgi.com.au. [61.68.215.123])
 by smtp.gmail.com with ESMTPSA id
 jc11-20020a17090325cb00b001a1abc93eabsm10609438plb.226.2023.03.22.19.22.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 19:22:49 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: qemu-ppc@nongnu.org
Cc: Nicholas Piggin <npiggin@gmail.com>,
	qemu-devel@nongnu.org
Subject: [PATCH 2/6] target/ppc: Better CTRL SPR implementation
Date: Thu, 23 Mar 2023 12:22:33 +1000
Message-Id: <20230323022237.1807512-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230323022237.1807512-1-npiggin@gmail.com>
References: <20230323022237.1807512-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=npiggin@gmail.com; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

The CTRL register is able to write bit zero, and that is reflected in a
bit field in the register that reflects the state of all threads in the
core.

TCG does not implement SMT, so this just requires mirroring that bit into
the first bit of the thread state field.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 target/ppc/translate.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 58fa509057..d699acb3d0 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -413,7 +413,14 @@ void spr_write_generic(DisasContext *ctx, int sprn, int gprn)
 
 void spr_write_CTRL(DisasContext *ctx, int sprn, int gprn)
 {
-    spr_write_generic32(ctx, sprn, gprn);
+    /* This does not implement >1 thread */
+    TCGv t0 = tcg_temp_new();
+    TCGv t1 = tcg_temp_new();
+    tcg_gen_extract_tl(t0, cpu_gpr[gprn], 0, 1); /* Extract RUN field */
+    tcg_gen_shli_tl(t1, t0, 8); /* Duplicate the bit in TS */
+    tcg_gen_or_tl(t1, t1, t0);
+    gen_store_spr(sprn, t1);
+    spr_store_dump_spr(sprn);
 
     /*
      * SPR_CTRL writes must force a new translation block,
-- 
2.37.2


