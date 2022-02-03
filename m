Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E684A8D0E
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 21:14:14 +0100 (CET)
Received: from localhost ([::1]:53262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFiUf-00036W-Eb
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 15:14:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nFhg4-0003JM-87
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 14:21:58 -0500
Received: from [2607:f8b0:4864:20::1033] (port=45719
 helo=mail-pj1-x1033.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nFhfO-0002gd-2c
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 14:21:38 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 g15-20020a17090a67cf00b001b7d5b6bedaso3935420pjm.4
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 11:21:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=msH7qg69hCRTFoTF2Q5gZeU9fIFrOr0593v5UHiptQg=;
 b=Gv83Npq66QIBvlqIVVM4outynwaVPa79Cc98c5B34pAvbUZBEg58bk8nEh0oUD2Ceq
 9Te7q4uEjxV2tn4nfG5MEqXJa5J2ofjyK60/uU+M9t1kKsea+tAmtl9QWhdtLo85Mg7V
 +3bMYMKNgyJz5aQlM5IgxWDW9WZnQHMph3BtMl07mskBrgUdUAZndAyBhx+tutr2033H
 USs7qYjeuxmZD/cgFlvg3zU1Aihxj+NwgBg6EH4NPeW4716rRAtuEBOZElnRUAGL4Yuh
 ASuFIZHVg6HtnyBL/UyZ0drRw6Ol2q/4bN2f2lUd9gHj85ziDhElLwzFQYfWx1Oyc6DP
 kMJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=msH7qg69hCRTFoTF2Q5gZeU9fIFrOr0593v5UHiptQg=;
 b=XniidTwaPjFFBmrc48DEp8edtfkf2d2qXIGYSNlPTNFuvsY2zkK4ad9+XXq9d7lI9s
 x1go7dOPSqHad+Dg+KYlYF4UtCYgve4QU4lPnu0qvGOFkAffw5rinGlBbUSQnEAsN0uE
 HObzGbPddzBOAc4nGKU0lpIo9eVbuk7D3G6ckm3NBSRnBinx6C66Ln9Hm60RUCTcXJpJ
 SURqogaNicmdIy197rJe+nU8okKOXHT3YsnbhsM4dwkwqpPOhIk8kKEHUSEuOhFSnRCJ
 j/nHkgEhAVtRL4FkRXSAF2T22emF5PQGWBKb7VMTFgUSC24VYQzM7ocgD3D5UYEf2yXt
 wuQQ==
X-Gm-Message-State: AOAM530e/O5DdTBCWA9yAhEZY1S/KvjUMJknxJiU92ENZVI/SmoSe5v3
 AENdGpspykYWiSac8CJkfwst+kKrcqY=
X-Google-Smtp-Source: ABdhPJxdh68txC3Y4IBrDhLkSmxE6TgVO6FT9aSiAoftQCzb1+3GgJkOEd2ReSoyBUfCodYEXszQ7A==
X-Received: by 2002:a17:902:d4ce:: with SMTP id
 o14mr37545383plg.39.1643916059493; 
 Thu, 03 Feb 2022 11:20:59 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id l26sm37134129pgm.73.2022.02.03.11.20.57
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 03 Feb 2022 11:20:59 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v2 20/21] softmmu: Add qemu_init_arch_modules()
Date: Thu,  3 Feb 2022 20:18:13 +0100
Message-Id: <20220203191814.45023-21-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220203191814.45023-1-f4bug@amsat.org>
References: <20220203191814.45023-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1033
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

module_allow_arch() is the single target-specific call in the
whole vl.c file. Move the module initialization out to arch_init.c,
that way we'll be able to build vl.o once for all targets (the
next commit).

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/sysemu/arch_init.h | 2 ++
 softmmu/arch_init.c        | 9 +++++++++
 softmmu/vl.c               | 5 +----
 3 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/include/sysemu/arch_init.h b/include/sysemu/arch_init.h
index 70c579560a..79c2591425 100644
--- a/include/sysemu/arch_init.h
+++ b/include/sysemu/arch_init.h
@@ -28,4 +28,6 @@ enum {
 
 extern const uint32_t arch_type;
 
+void qemu_init_arch_modules(void);
+
 #endif
diff --git a/softmmu/arch_init.c b/softmmu/arch_init.c
index 8919405c7b..79716f959b 100644
--- a/softmmu/arch_init.c
+++ b/softmmu/arch_init.c
@@ -22,6 +22,7 @@
  * THE SOFTWARE.
  */
 #include "qemu/osdep.h"
+#include "qemu/module.h"
 #include "sysemu/arch_init.h"
 
 #ifdef TARGET_SPARC
@@ -39,3 +40,11 @@ int graphic_depth = 32;
 #endif
 
 const uint32_t arch_type = QEMU_ARCH;
+
+void qemu_init_arch_modules(void)
+{
+#ifdef CONFIG_MODULES
+    module_init_info(qemu_modinfo);
+    module_allow_arch(TARGET_NAME);
+#endif
+}
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 5e1b35ba48..08ff97f4e0 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2814,10 +2814,7 @@ void qemu_init(int argc, char **argv, char **envp)
     error_init(argv[0]);
     qemu_init_exec_dir(argv[0]);
 
-#ifdef CONFIG_MODULES
-    module_init_info(qemu_modinfo);
-    module_allow_arch(TARGET_NAME);
-#endif
+    qemu_init_arch_modules();
 
     qemu_init_subsystems();
 
-- 
2.34.1


