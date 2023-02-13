Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FDAF69522E
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 21:49:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRfkv-0000rc-Ev; Mon, 13 Feb 2023 15:48:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1pRbT2-00083V-Lb
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 11:14:12 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1pRbT1-0005kL-2t
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 11:14:12 -0500
Received: by mail-wr1-x42e.google.com with SMTP id o18so12827482wrj.3
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 08:14:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tJhjoJrgbkz6/pE4uSBB6RIn4rUqwO2CFL7SGx4wCgY=;
 b=EpJ3TrQuQe57RQnquZYYMtWOWpF9CbvRMSTvXjk5cNab+SYDEqJY+vbTrD78J3t9F9
 LZfEgXVdK6l2WFyRoiysIbX0RmX0MjOBLb3suPegGPb02Sh7wa2p9FbVbSWcpYNro/3k
 Dx3DSZwDfZeCjW7lRJ40Q5eGBE/VbSJnMXl0KqRQwe2NyBB+j7zLDAWfPsywMZb0D3Za
 DPPeHktfsc7hQnqdNoKIU6T2ycjuSDwTu0UIx8kwXUF4cNIpok+fYoWw3lkxsvAdb/SX
 WvQWDN94YlMQGW7Kf8NzQdIalco2Xy51Rn4vW3Um+YHaM3hyXJx+58KPlAxrVe6uMVM3
 +Y2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tJhjoJrgbkz6/pE4uSBB6RIn4rUqwO2CFL7SGx4wCgY=;
 b=OR6HVnAgV7HgWJFfbtMSfcIoyO5UJ7hG99xq6nxX1ZiEcFHsB5nKnW2tMJZM1XfAmA
 Ye8t7NnXPDomU8bF7kgjyokUW1ABImqQUK/smRm4oLBX0yIgjcY0ujzZeKJgYW/o4n2o
 IQYBP/dObiSF7XfxGG658V7FDI0oFR/D7Bve9gVRmhmFwtCKxTl/22c7comLdtA4vnPe
 CxZqI94ctFNwKTzq0J7+qAaiYjsVOGzoB0xLvweb5/q7t4mHySxL5liP87BERGQAdoEP
 So0N8o5coEJXPmVDoutHaSZvx/BMDHj8nAQlaS/3tNnQXPJiOuJvVtXV3j097Bm5fd0i
 DnSw==
X-Gm-Message-State: AO0yUKXLvEzqE4yx0KhAiJyFbtYwG1HN07QUqK5SCvCPp2BNpDPA1YFx
 txMolOiT+Bei+ON8AE3w6sW6Xa38gljDNWB4j5I=
X-Google-Smtp-Source: AK7set+t4ZwnPSPambYtgI/1V+vR0qBVbLDV4YT1JFzxNbX6WtS2RMPXwB9z/HrRVNZ56/OjC0MhkA==
X-Received: by 2002:a05:6000:1007:b0:2c3:e993:9d7d with SMTP id
 a7-20020a056000100700b002c3e9939d7dmr20081969wrx.30.1676304849480; 
 Mon, 13 Feb 2023 08:14:09 -0800 (PST)
Received: from volterra.localdomain ([2a01:e0a:5cc:caa0:8df5:e191:f2b0:5825])
 by smtp.gmail.com with ESMTPSA id
 t13-20020adfe44d000000b002c557f82e27sm3582882wrm.99.2023.02.13.08.14.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 08:14:09 -0800 (PST)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: sw@weilnetz.de, kkostiuk@redhat.com, clg@kaod.org,
 richard.henderson@linaro.org, alex.bennee@linaro.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 4/4] target/ppc: fix warning with clang-15
Date: Mon, 13 Feb 2023 17:13:52 +0100
Message-Id: <20230213161352.17199-5-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230213161352.17199-1-pierrick.bouvier@linaro.org>
References: <20230213161352.17199-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 13 Feb 2023 15:48:53 -0500
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

When compiling for windows-arm64 using clang-15, it reports a sometimes
uninitialized variable. This seems to be a false positive, as a default
case guards switch expressions, preventing to return an uninitialized
value, but clang seems unhappy with assert definition.

Setting the rnd variable to zero does not hurt anyway.

../target/ppc/dfp_helper.c:141:13: error: variable 'rnd' is used uninitialized whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]                                                                              assert(0); /* cannot get here */                                                                                                                                                                                    ^~~~~~~~~
../include/qemu/osdep.h:229:20: note: expanded from macro 'assert'                                                                                                                                        #define assert(x)  g_assert(x)                                                                                                                                                                                                         ^~~~~~~~~~~
/clangarm64/bin/../include/glib-2.0/glib/gtestutils.h:235:49: note: expanded from macro 'g_assert'                                                                                                                               if G_LIKELY (expr) ; else \
                                                ^~~~~~~~~~~~~~~
/clangarm64/bin/../include/glib-2.0/glib/gmacros.h:1186:25: note: expanded from macro 'G_LIKELY'
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../target/ppc/dfp_helper.c:144:42: note: uninitialized use occurs here
    decContextSetRounding(&dfp->context, rnd);

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/ppc/dfp_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/ppc/dfp_helper.c b/target/ppc/dfp_helper.c
index cc024316d5..0b4b280683 100644
--- a/target/ppc/dfp_helper.c
+++ b/target/ppc/dfp_helper.c
@@ -69,7 +69,7 @@ struct PPC_DFP {
 
 static void dfp_prepare_rounding_mode(decContext *context, uint64_t fpscr)
 {
-    enum rounding rnd;
+    enum rounding rnd = 0;
 
     switch ((fpscr & FP_DRN) >> FPSCR_DRN0) {
     case 0:
@@ -106,7 +106,7 @@ static void dfp_prepare_rounding_mode(decContext *context, uint64_t fpscr)
 static void dfp_set_round_mode_from_immediate(uint8_t r, uint8_t rmc,
                                                   struct PPC_DFP *dfp)
 {
-    enum rounding rnd;
+    enum rounding rnd = 0;
     if (r == 0) {
         switch (rmc & 3) {
         case 0:
-- 
2.30.2


