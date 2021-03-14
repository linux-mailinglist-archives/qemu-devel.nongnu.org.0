Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B7D833A8D0
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 00:34:31 +0100 (CET)
Received: from localhost ([::1]:55038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLaFi-0004sZ-6w
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 19:34:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLaBC-0008Im-CE
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 19:29:50 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:35631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLaBA-0003fI-VQ
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 19:29:50 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 c76-20020a1c9a4f0000b029010c94499aedso19205529wme.0
 for <qemu-devel@nongnu.org>; Sun, 14 Mar 2021 16:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PKZDm7LBM+uCSZ92Wt+YMih/9De/7VVZu7v4tDHJtE8=;
 b=p5v+x/1QlWlHY0VY8mBhtjnEIZCtCoTnIOACAX692stBUd1U0Ai+43He3mGlWHXEsb
 C6VrwhzXYl5eZ+8YeecOJbu5vqOrvIF8hM7QqceLjRwUd6xpOjgtd+PyXmLa+x5h9yOp
 URhXsCdGhkRgpfHfkXeE0pI1d95cNXUPD31RHgcnQgAEdUX0TphU9zexk6p6Ax6f8VpA
 c2I9UE3GRKoVULQVkKIRDnlwMnShMYiTxRbd5MviLIU3SA+NJTjvHdDLXqxLfb8OHzkO
 CmZayf46ovUI3yAHLEuthtQ7q4g81a/TSYT3JrJcRRcO1Aniut5ThdW8F7ntM3zkwWfo
 1aTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=PKZDm7LBM+uCSZ92Wt+YMih/9De/7VVZu7v4tDHJtE8=;
 b=OEQnGkbCPiLsmkepb8S10mIzgfjw4jfr9u3wWRBdYe5QG5r8VvZsceQNEym3kJDj1U
 xUW5zaDDPXh8QjBsKrIIumx4cICZQk6BzQkZEK3HOygV0BQRdvH07AH7qIiOJ0osC/B5
 aGAO//3AhisPzc61oAGG0U2TkkNhu5GXngQnPegCmQ4s8ori7M7wcmsJpN8LY5ARTuhM
 Ko25FmGnsstgYJ2k3wlyEBWV5QMUSCeJ9NGIfX2UrT7kQvAydJ1oijE5D+fd+tfEOa79
 uXXXoa6QR6UekLV6to55HnuJ03QzJFeNnSGYT9PX8YAfNi5jML1eG2kHVJtiIvqdTgrj
 xIig==
X-Gm-Message-State: AOAM531dQ7ligYozkBkpTyGxid5wd18rPnpCVtiG/MetvVbK70hF3PHq
 9qIDEc5OkL6KuP24sHWqOXN+2DujtbBlWw==
X-Google-Smtp-Source: ABdhPJx8Xw1Sf+WDisRX3hjPlqSZUXSLTBbDNSX495xW79OqhGHaCl9RPKAASeduWqbTUCCAhic2KA==
X-Received: by 2002:a7b:ce16:: with SMTP id m22mr23974993wmc.65.1615764587452; 
 Sun, 14 Mar 2021 16:29:47 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id d204sm10785054wmc.17.2021.03.14.16.29.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 16:29:47 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 6/8] qtest: Restrict CPU I/O instructions
Date: Mon, 15 Mar 2021 00:29:11 +0100
Message-Id: <20210314232913.2607360-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210314232913.2607360-1-f4bug@amsat.org>
References: <20210314232913.2607360-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Restrict CPU I/O instructions to architectures providing
I/O bus.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 softmmu/qtest.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/softmmu/qtest.c b/softmmu/qtest.c
index ff253068657..51fe256297a 100644
--- a/softmmu/qtest.c
+++ b/softmmu/qtest.c
@@ -31,7 +31,9 @@
 #ifdef CONFIG_PSERIES
 #include "hw/ppc/spapr_rtas.h"
 #endif
+#ifdef TARGET_HAS_IOPORT
 #include "exec/cpu-io.h"
+#endif
 
 #define MAX_IRQ 256
 
@@ -462,7 +464,9 @@ static void qtest_process_command(CharBackend *chr, gchar **words)
         qemu_set_irq(irq, level);
         qtest_send_prefix(chr);
         qtest_send(chr, "OK\n");
-    } else if (strcmp(words[0], "outb") == 0 ||
+    }
+#ifdef TARGET_HAS_IOPORT
+    else if (strcmp(words[0], "outb") == 0 ||
                strcmp(words[0], "outw") == 0 ||
                strcmp(words[0], "outl") == 0) {
         unsigned long addr;
@@ -506,7 +510,9 @@ static void qtest_process_command(CharBackend *chr, gchar **words)
         }
         qtest_send_prefix(chr);
         qtest_sendf(chr, "OK 0x%04x\n", value);
-    } else if (strcmp(words[0], "writeb") == 0 ||
+    }
+#endif /* TARGET_HAS_IOPORT */
+    else if (strcmp(words[0], "writeb") == 0 ||
                strcmp(words[0], "writew") == 0 ||
                strcmp(words[0], "writel") == 0 ||
                strcmp(words[0], "writeq") == 0) {
-- 
2.26.2


