Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B49995788BB
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 19:47:14 +0200 (CEST)
Received: from localhost ([::1]:46956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDUpt-0008PH-QH
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 13:47:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oDUSD-0007qr-A6; Mon, 18 Jul 2022 13:22:46 -0400
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331]:37789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oDUSA-0001iF-Jt; Mon, 18 Jul 2022 13:22:44 -0400
Received: by mail-ot1-x331.google.com with SMTP id
 l9-20020a056830268900b006054381dd35so9715049otu.4; 
 Mon, 18 Jul 2022 10:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sD+YNABs2LjOHi8LN8fzLMnu0iUTB68Z93In0DoQXKI=;
 b=NosPw521rznf1eqBzm939HhxrFffZMKa562+7NX8obks+OaK6VNxo34dX6AJTvba6v
 0cMALdP1KkmmTowhpr+YjjzUYN0ItQuZEgIqIBIznAjmmKI5sN6fxbEOfY6Fo/ALTFle
 zbIxABwTiXHvb7mwHKIMyb0LXaySq+zJoXAzhNm7j1/ls+MSiluFCQygz7PzVMBs4yrm
 pY73HE+NqfR0d1Cs//jZ+1PoV40QdnLfnQo5fpFkDzUpcuWH6R01RbZQhOwcf9uSPmZN
 65FwKrTtyA5oQzzpQCyYlXXoDWw6sFg7g1HGjPaYglTJSfhz67ZxBg4yMQBXhg7LmH1h
 PL5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sD+YNABs2LjOHi8LN8fzLMnu0iUTB68Z93In0DoQXKI=;
 b=2iPllCtGofkcuaizAnG6b6nBUCEDW6VQMOMda25UOtmVg8GLu8P6sID70ENB5ILB1B
 wj16YPrM4ftRyYEXnVShVMUcHy4VNYqDQ0UovJcY9JxA1ZB+c20ogDZUOhgmRCGNyfdB
 z3XReKJama1N0ON+zlLtwx//wxWHKqdfriw8oJZHa18kK5dFbX+cbrt71U8FXKmwoA52
 CK84lKpCwWbJ7MNOctcnU28UeQlnyPlpDNlQy1pfFPi97iEcZ7tY9lgdfeyNN27MbIf7
 ki9ej6xA2FsR9Wo6kqj7YlpnnXrdEIptp3CQ5fRLIZ46g61QKkbvrCo1h3iZYr8czvG3
 VSWg==
X-Gm-Message-State: AJIora/M/CDLmxKhVofX1OPXr9ElJy0TltOBOGHtUZ17MrMy4eh00yiL
 e7q9zPcuUGnLm8xSsA26eVNRgk9NtN8=
X-Google-Smtp-Source: AGRyM1vAAdZljQEfyIqwOvwRGVF9Ay8S69PQPnn/EPu3kO9mMYmNGzCjG/qvUKPBqS0tUtQODeKnBA==
X-Received: by 2002:a9d:6945:0:b0:61c:81f2:733b with SMTP id
 p5-20020a9d6945000000b0061c81f2733bmr7326472oto.241.1658164960327; 
 Mon, 18 Jul 2022 10:22:40 -0700 (PDT)
Received: from balboa.ibmmodules.com (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 j27-20020a056870169b00b0010c33621645sm6523856oae.55.2022.07.18.10.22.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jul 2022 10:22:40 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 11/30] target/ppc: fix exception error code in helper_{load,
 store}_dcr
Date: Mon, 18 Jul 2022 14:21:49 -0300
Message-Id: <20220718172208.1247624-12-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220718172208.1247624-1-danielhb413@gmail.com>
References: <20220718172208.1247624-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::331;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x331.google.com
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

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

POWERPC_EXCP_INVAL should only be or-ed with other constants prefixed
with POWERPC_EXCP_INVAL_. Also, take the opportunity to move both
helpers under #if !defined(CONFIG_USER_ONLY) as the instructions that
use them are privileged.

No functional change is intended, the lower 4 bits of the error code are
ignored by all powerpc_excp_* methods on POWERPC_EXCP_INVAL exceptions.

Reported-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20220627141104.669152-5-matheus.ferst@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/helper.h          | 2 +-
 target/ppc/timebase_helper.c | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index ed0641a234..2f112b7de0 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -694,10 +694,10 @@ DEF_HELPER_2(book3s_msgclr, void, env, tl)
 DEF_HELPER_4(dlmzb, tl, env, tl, tl, i32)
 #if !defined(CONFIG_USER_ONLY)
 DEF_HELPER_2(rac, tl, env, tl)
-#endif
 
 DEF_HELPER_2(load_dcr, tl, env, tl)
 DEF_HELPER_3(store_dcr, void, env, tl, tl)
+#endif
 
 DEF_HELPER_2(load_dump_spr, void, env, i32)
 DEF_HELPER_2(store_dump_spr, void, env, i32)
diff --git a/target/ppc/timebase_helper.c b/target/ppc/timebase_helper.c
index 86d01d6e4e..b80f56af7e 100644
--- a/target/ppc/timebase_helper.c
+++ b/target/ppc/timebase_helper.c
@@ -143,7 +143,6 @@ void helper_store_booke_tsr(CPUPPCState *env, target_ulong val)
 {
     store_booke_tsr(env, val);
 }
-#endif
 
 /*****************************************************************************/
 /* Embedded PowerPC specific helpers */
@@ -169,7 +168,7 @@ target_ulong helper_load_dcr(CPUPPCState *env, target_ulong dcrn)
                           (uint32_t)dcrn, (uint32_t)dcrn);
             raise_exception_err_ra(env, POWERPC_EXCP_PROGRAM,
                                    POWERPC_EXCP_INVAL |
-                                   POWERPC_EXCP_PRIV_REG, GETPC());
+                                   POWERPC_EXCP_INVAL_INVAL, GETPC());
         }
     }
     return val;
@@ -192,7 +191,8 @@ void helper_store_dcr(CPUPPCState *env, target_ulong dcrn, target_ulong val)
                           (uint32_t)dcrn, (uint32_t)dcrn);
             raise_exception_err_ra(env, POWERPC_EXCP_PROGRAM,
                                    POWERPC_EXCP_INVAL |
-                                   POWERPC_EXCP_PRIV_REG, GETPC());
+                                   POWERPC_EXCP_INVAL_INVAL, GETPC());
         }
     }
 }
+#endif
-- 
2.36.1


