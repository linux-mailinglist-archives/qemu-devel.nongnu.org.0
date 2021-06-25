Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C873B4112
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 12:01:54 +0200 (CEST)
Received: from localhost ([::1]:52718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwien-0004Ue-Ft
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 06:01:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lwi4C-0004m8-QS
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 05:24:04 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:43571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lwi4B-0001n5-6K
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 05:24:04 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 p8-20020a7bcc880000b02901dbb595a9f1so5386516wma.2
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 02:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=n82fAnsfNr3VVPFp6ddOKhLvaXiXpM82IkFTfD/mycg=;
 b=ktc/ouPj74Bn1eGoCjam2EgCUs++p0NV+C5Ve/5kQ8Nbp9t9+bTmKauOctJp50JycY
 tIh+fVc2lhj83Hmn8C2Fo22IJeLzQZkG5RrFF8h8d7yPmsE7E2/6p/bF1BMgo9eDSetQ
 8IIyjKTOkXxnebQ4Ud+55WvBq9B0oxXEVWYPAaaVEg+6AxtUipvsEDOIF7gfQvicNlqq
 8bqzn8Tuerl9YvLNKiheECmGGiANwHI4/rghbQQnIE3NwmIbVF2cnJMX0W2P7TM7Yicq
 Nc1ngVOJbvwWgxIctGyAGPl+62uAXtCsv0pc/rXQv009XXKv3tQdXC6z9UBaw3m2x19R
 Qjig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=n82fAnsfNr3VVPFp6ddOKhLvaXiXpM82IkFTfD/mycg=;
 b=X4we0tFnSrB5xs7WOpRO+u0qYkXkJwfU/HXFgmX+kcDab09S5GJj3/SxBuutV3fxys
 7+zhtf94UsEWoHkH0DS6Dl0UvUkBdp6fWzu2LHw55c7y2loUiw93vwM7DG4zg9zGvM56
 RTZqjqNMpc0+ADDFzhqt8HKiPQK/bgthmLxc60f56W7MHsxXtASUaiAHvlvu8ue5xAyL
 +9QaE53jM69r2NgC8ClqIeztguWMiQ5bIBOaG2tuU1/Yj4NdV+pXOHHqmsOplkpaCMnA
 JPqT4Pf0yMH9JtMZ40agA/g58Wt45huNxmWhaRI0pmvoKTr7dGx798uY9tBQsHtiy/36
 wJXg==
X-Gm-Message-State: AOAM532umFv5eYU9rShvYLOeCO6duBcSlP+tktRCDwDPE4F0JNCe+LVz
 n6rPXGNs3C7NaRR2lehm2fITVnBKzvnA7Q==
X-Google-Smtp-Source: ABdhPJxa5ZpMqqshjsYj6nsHZ9j6MofibKvky/6IRCRArfS48PNgsoX0OW+cK22s4FOw+rh54yqz8g==
X-Received: by 2002:a05:600c:198f:: with SMTP id
 t15mr9568639wmq.27.1624613041120; 
 Fri, 25 Jun 2021 02:24:01 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id e12sm5595440wrw.34.2021.06.25.02.24.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 02:24:00 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 06/15] target/mips: Move TCG trace events to tcg/ sub directory
Date: Fri, 25 Jun 2021 11:23:20 +0200
Message-Id: <20210625092329.1529100-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210625092329.1529100-1-f4bug@amsat.org>
References: <20210625092329.1529100-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit a2b0a27d33e ("target/mips: Move TCG source files under
tcg/ sub directory") forgot to move the trace-event file.
As it only contains TCG events, move it for consistency.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210617174323.2900831-4-f4bug@amsat.org>
---
 meson.build                        | 2 +-
 target/mips/tcg/trace.h            | 1 +
 target/mips/trace.h                | 1 -
 target/mips/tcg/translate.c        | 2 +-
 target/mips/{ => tcg}/trace-events | 0
 5 files changed, 3 insertions(+), 3 deletions(-)
 create mode 100644 target/mips/tcg/trace.h
 delete mode 100644 target/mips/trace.h
 rename target/mips/{ => tcg}/trace-events (100%)

diff --git a/meson.build b/meson.build
index d8a92666fbc..a91b39465c7 100644
--- a/meson.build
+++ b/meson.build
@@ -1882,7 +1882,7 @@
     'target/hppa',
     'target/i386',
     'target/i386/kvm',
-    'target/mips',
+    'target/mips/tcg',
     'target/ppc',
     'target/riscv',
     'target/s390x',
diff --git a/target/mips/tcg/trace.h b/target/mips/tcg/trace.h
new file mode 100644
index 00000000000..b8c6c4568ec
--- /dev/null
+++ b/target/mips/tcg/trace.h
@@ -0,0 +1 @@
+#include "trace/trace-target_mips_tcg.h"
diff --git a/target/mips/trace.h b/target/mips/trace.h
deleted file mode 100644
index f25b88ca6f9..00000000000
--- a/target/mips/trace.h
+++ /dev/null
@@ -1 +0,0 @@
-#include "trace/trace-target_mips.h"
diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index 4b7229a868a..0a4257db2a9 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -31,7 +31,7 @@
 #include "exec/helper-gen.h"
 #include "semihosting/semihost.h"
 
-#include "target/mips/trace.h"
+#include "trace.h"
 #include "trace-tcg.h"
 #include "exec/translator.h"
 #include "exec/log.h"
diff --git a/target/mips/trace-events b/target/mips/tcg/trace-events
similarity index 100%
rename from target/mips/trace-events
rename to target/mips/tcg/trace-events
-- 
2.31.1


