Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D2C6117B3
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 18:41:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooSPM-0004t9-WB; Fri, 28 Oct 2022 12:40:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ooSP3-0003Nk-Rq; Fri, 28 Oct 2022 12:40:18 -0400
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ooSP2-0007kb-An; Fri, 28 Oct 2022 12:40:17 -0400
Received: by mail-ot1-x334.google.com with SMTP id
 d18-20020a05683025d200b00661c6f1b6a4so3278301otu.1; 
 Fri, 28 Oct 2022 09:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kesQ4O7GHSfLA7oFoVmvKFfpde6zZU42AJgjgBx5tTg=;
 b=LhS3Fes307fywaL815fLjNOszPdkZsc35wm3PE4iTqggVBtqKpc2KIDSuEj5R7CT5B
 TNYCLV/O/k506zZ2fIsH4ja3OCm17ehOM2gGVWYNrwKBqYoMfRn+Fpu/a7WdWJQQsl8f
 q1R28VyxyWYF2+/HEJlnRclqPfygrqWkjIw4N83Zc6fixJSV+UWPujloVVm5RJ0Gq2vZ
 76K2fEwts/fV1OhKAuwUZZJMMMl7HYkyqaDfqnJon3EtO6W2EeGkdtFc+D9xkELDDCuk
 1Z0wX5q3GD2I4+/QES9vyhVs4Z70EdV/ut/b1XBooE+/rjKU0RfpsJr7vztKo85NlreA
 pnYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kesQ4O7GHSfLA7oFoVmvKFfpde6zZU42AJgjgBx5tTg=;
 b=tjYHDIl/oEugQZsXQLasPwXnQTNoPff057mUc3RjRK5lsTOXX3DsqnozegQJs+x6Kh
 czGWL1Ctv5E0SSckCsuZA3xxwQtJPusKW7NsIKMh6RaaUumxIXPK2pPabJAJ/UGftWCb
 +NEOHG0aOHozkWI2Y/6X7wws/te94DxL9oPx3U6hhul15gTPokfZ0Q1xM319dlv2bfB+
 AoEerhLHiGwKSI5PnskMjKe9FOGTSJdAo/gnnIN8FUK/Lkt9AFTRJjkdidVckYyy3EXX
 vVI6f3fjGE4/L/ARlWO9ym8dabHTrZV7A6CdIMqRvgQcgMKvuWUSHUDoNHjvj4vYUaue
 6Y1Q==
X-Gm-Message-State: ACrzQf3SUpiNdokocAxhiBhu0XBGflaMm1WTnq+hBXW9zCSNlbitATR5
 Z5P5tsc5yfR0rFfPoeMx8xTK2DuAqecs6Q==
X-Google-Smtp-Source: AMsMyM66U1ARXpBqmKrlBm4tx0HjypZl+yJoAtKa2V1XBPOEG3i6C399I+PwVwImKCv6+RsBzmYOBg==
X-Received: by 2002:a9d:5d10:0:b0:661:1106:6cee with SMTP id
 b16-20020a9d5d10000000b0066111066ceemr113757oti.362.1666975214306; 
 Fri, 28 Oct 2022 09:40:14 -0700 (PDT)
Received: from balboa.COMFAST ([177.45.165.63])
 by smtp.gmail.com with ESMTPSA id
 s127-20020acaa985000000b00354b7120d60sm1658373oie.52.2022.10.28.09.40.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 09:40:12 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, stefanha@redhat.com,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 Fabiano Rosas <farosas@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 03/62] target/ppc: fix REQUIRE_HV macro definition
Date: Fri, 28 Oct 2022 13:38:52 -0300
Message-Id: <20221028163951.810456-4-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221028163951.810456-1-danielhb413@gmail.com>
References: <20221028163951.810456-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::334;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x334.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

The macro is missing a '{' after the if condition. Any use of REQUIRE_HV
would cause a compilation error.

Fixes: fc34e81acd51 ("target/ppc: add macros to check privilege level")
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
Message-Id: <20221006200654.725390-4-matheus.ferst@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/translate.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index ccf2ffd567..f73ff2d2ee 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -6545,12 +6545,12 @@ static int64_t dw_compose_ea(DisasContext *ctx, int x)
         }                           \
     } while (0)
 
-#define REQUIRE_HV(CTX)                         \
-    do {                                        \
-        if (unlikely((CTX)->pr || !(CTX)->hv))  \
-            gen_priv_opc(CTX);                  \
-            return true;                        \
-        }                                       \
+#define REQUIRE_HV(CTX)                             \
+    do {                                            \
+        if (unlikely((CTX)->pr || !(CTX)->hv)) {    \
+            gen_priv_opc(CTX);                      \
+            return true;                            \
+        }                                           \
     } while (0)
 #else
 #define REQUIRE_SV(CTX) do { gen_priv_opc(CTX); return true; } while (0)
-- 
2.37.3


