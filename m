Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF57B5355DC
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 23:57:28 +0200 (CEST)
Received: from localhost ([::1]:45692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuLTz-0002Iu-Qq
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 17:57:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nuLCk-00024t-Fk; Thu, 26 May 2022 17:39:39 -0400
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31]:40797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nuLCi-0008CC-Uo; Thu, 26 May 2022 17:39:38 -0400
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-f2cd424b9cso3751848fac.7; 
 Thu, 26 May 2022 14:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=etQ/DHgEtaOxRzCgfJL4a60cE/2gkCcNm19XWuRtQUk=;
 b=PeWe9rAA87M7uVnOJzuyMR924hjKkARQVtm1ij8wAG6LrFZA3pCBMZNL79JSGB1yO2
 pp8GNuIfdHKbGUyQp+Lz5qvDKBsArrb+QbO8yNOwXjWyZElJw7/N/PyLoHHcL9tj2yQu
 0MlyK6/TYq6N8g7UEnQxKRwuznu6Fcz9ajUHajnBiCpgWSum04oHS+lcw3OR6YDYWSwo
 ceXqnoueK9zn6gvKoqxzTs8CP1cHA//rfJwpidQdLEjjAjWR/wKQUp4qM/Rytv/POr1X
 k9IlPMPJ1p5MyGw288mtcJNRar2+NxqiuONIB/TuosFEJXmMSE0efEHRQB9JcyCWXp6C
 Jrmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=etQ/DHgEtaOxRzCgfJL4a60cE/2gkCcNm19XWuRtQUk=;
 b=Fp07IoPM4LPonKNaIWIoRirWaqWM9ULZal4YMlXA8WuxVzoDJXJCuZc+ckwXNIa48q
 Sara6ZXgFedG3IXa91ZuUKkGzhJ4VKcsDsyNz4AjtLXGlyGR8x//BQyTJ9BF+mam3HH3
 dAyZw8vz/yKsZF26lhHyU6aDzVCN3DsRskdHKeHGREGyKPHa57fM1IhMd0ILzzyzNM+p
 MNAxP7yEDArquSSmVPCk60nPiLRPniifolFKY1q409tl2siaR6qFC3iC5+yjedhIPFZI
 PEsrxphwiwEJFFSxPuKGkQwVn15gddwvxyHxqp5ZHZEHaLwhKNUwre5zfQycbgwxBnVZ
 EVbA==
X-Gm-Message-State: AOAM530yTqZvPSaWaMrg5Ts9XcseauiXcA1lF74eelgIxMtmk7A2DIB7
 LhLx6bJ67bNyRA4Hwv3CKMj0TEu79vo=
X-Google-Smtp-Source: ABdhPJydc/p1aXUjyhRbMl/cFYVEKz0OoTWhbQWLLtQonR7MldYbG9JKr0vZAIyWobGuPj9oEZ63nw==
X-Received: by 2002:a05:6870:610b:b0:f1:8f35:b9e7 with SMTP id
 s11-20020a056870610b00b000f18f35b9e7mr2548635oae.19.1653601175880; 
 Thu, 26 May 2022 14:39:35 -0700 (PDT)
Received: from balboa.COMFAST (189-46-169-45.dsl.telesp.net.br.
 [189.46.169.45]) by smtp.gmail.com with ESMTPSA id
 l43-20020a0568302b2b00b00606ad72bdcbsm1066999otv.38.2022.05.26.14.39.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 May 2022 14:39:35 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, Nicholas Piggin <npiggin@gmail.com>
Subject: [PULL 23/34] target/ppc: Fix eieio memory ordering semantics
Date: Thu, 26 May 2022 18:38:04 -0300
Message-Id: <20220526213815.92701-24-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220526213815.92701-1-danielhb413@gmail.com>
References: <20220526213815.92701-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::31;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x31.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Nicholas Piggin <npiggin@gmail.com>

The generated eieio memory ordering semantics do not match the
instruction definition in the architecture. Add a big comment to
explain this strange instruction and correct the memory ordering
behaviour.

Signed-off: Nicholas Piggin <npiggin@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220519135908.21282-2-npiggin@gmail.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/translate.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index fa34f81c30..eb42f7e459 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -3513,7 +3513,32 @@ static void gen_stswx(DisasContext *ctx)
 /* eieio */
 static void gen_eieio(DisasContext *ctx)
 {
-    TCGBar bar = TCG_MO_LD_ST;
+    TCGBar bar = TCG_MO_ALL;
+
+    /*
+     * eieio has complex semanitcs. It provides memory ordering between
+     * operations in the set:
+     * - loads from CI memory.
+     * - stores to CI memory.
+     * - stores to WT memory.
+     *
+     * It separately also orders memory for operations in the set:
+     * - stores to cacheble memory.
+     *
+     * It also serializes instructions:
+     * - dcbt and dcbst.
+     *
+     * It separately serializes:
+     * - tlbie and tlbsync.
+     *
+     * And separately serializes:
+     * - slbieg, slbiag, and slbsync.
+     *
+     * The end result is that CI memory ordering requires TCG_MO_ALL
+     * and it is not possible to special-case more relaxed ordering for
+     * cacheable accesses. TCG_BAR_SC is required to provide this
+     * serialization.
+     */
 
     /*
      * POWER9 has a eieio instruction variant using bit 6 as a hint to
-- 
2.36.1


