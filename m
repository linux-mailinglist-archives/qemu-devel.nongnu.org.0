Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A6D38F24C
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 19:32:53 +0200 (CEST)
Received: from localhost ([::1]:36254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llERg-00052o-MI
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 13:32:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1llE0w-00027u-9W
 for qemu-devel@nongnu.org; Mon, 24 May 2021 13:05:14 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:36600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1llE0u-00045v-NI
 for qemu-devel@nongnu.org; Mon, 24 May 2021 13:05:14 -0400
Received: by mail-wr1-x42c.google.com with SMTP id n4so3355728wrw.3
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 10:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JGCm35wR+sSDjvNwlH4jC86gmJH/U5RiSisP7sgjn/8=;
 b=jMkPpgyd/aAWIGzQHDpc+JEjgsX9bgWg32ynCI5ISYj8ShMuxVSCaXQ0MWnnu36aPX
 gdQjI8gvflmA2CWLDZUJIArgO6JpFnpn0g6noKbK828qBdWW0tVonJeNVxuCrGz6pl/3
 dfP1nMgdLY4ZkcEwVlE3NvHzc3t3uIOIP+2avuuMilF6SgHtTye0YBXrwA0smvywAb92
 f+vyllIwD39Gg4R/6FvHSHU2QT273WrVh9LHjYvF7pn9t6vi2zNCpjvmmWdCaAPOgQRF
 wMPWpYhOzapCyKpxMRpHXfo3gR59jmzhk7iXO/X1bg0HCkq2EhvwINEYlNjr1RREynci
 cqfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=JGCm35wR+sSDjvNwlH4jC86gmJH/U5RiSisP7sgjn/8=;
 b=mg1hfEP2gJM05mwfS7n41afAjuFO0OmX7JQwc8aBwjleL3m95L5uUHuze5kIx1JprW
 pElPncGJYuef/4o2w1OFcZsO2FGDSDZofQs1C+b8/JlLcOfJWBePzW601FxjU/IL5sQc
 XusY2BHQnrYwV/4KqWHZLcjMyfL11/Y5nj1/6oNJE7iSoAu+cIJlqasCvxS5sh2kCbyl
 rAYmwLpiOn1S2pDqHwg8rA4OLrQwXlzypKQedtfYE2ASM3rdhAo+jJqq15mEWxz4+HuO
 tVfDAOrAqzBxIu6aOtaTdpyEP1EwER0Kl87/vb1bBxH8k0SZZff8omww/sfP5nHOzWsx
 vdIw==
X-Gm-Message-State: AOAM533V3EbC/ll9mgYzI0baMtYVABcLeyGnXo4//Phzl5H4xNKPKIgc
 I3xOpKR4ufdND8A+f1g0/uj8XXtAfJEirQ==
X-Google-Smtp-Source: ABdhPJzeI5nvyYWDvECII21DQr/RvS8ydfKGH9ApgQhKA5S2WlYtTy6qTW67vNnbqShJh9pTA+mt5A==
X-Received: by 2002:a5d:62cb:: with SMTP id o11mr24164918wrv.28.1621875910563; 
 Mon, 24 May 2021 10:05:10 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id c7sm12810058wrs.23.2021.05.24.10.05.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 10:05:10 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] accel/tcg: Reduce 'exec/tb-context.h' inclusion
Date: Mon, 24 May 2021 19:04:52 +0200
Message-Id: <20210524170453.3791436-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210524170453.3791436-1-f4bug@amsat.org>
References: <20210524170453.3791436-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Only 2 headers require "exec/tb-context.h". Instead of having
all files including "exec/exec-all.h" also including it, directly
include it where it is required:
- accel/tcg/cpu-exec.c
- accel/tcg/translate-all.c

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/exec/exec-all.h   | 1 -
 include/tcg/tcg.h         | 1 -
 accel/tcg/cpu-exec.c      | 1 +
 accel/tcg/translate-all.c | 1 +
 4 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 6b036cae8f6..657e756ba44 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -21,7 +21,6 @@
 #define EXEC_ALL_H
 
 #include "cpu.h"
-#include "exec/tb-context.h"
 #ifdef CONFIG_TCG
 #include "exec/cpu_ldst.h"
 #endif
diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 0f0695e90da..74cb3453083 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -27,7 +27,6 @@
 
 #include "cpu.h"
 #include "exec/memop.h"
-#include "exec/tb-context.h"
 #include "qemu/bitops.h"
 #include "qemu/plugin.h"
 #include "qemu/queue.h"
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 0dc5271715e..10e11f27bbe 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -31,6 +31,7 @@
 #include "qemu/rcu.h"
 #include "exec/tb-hash.h"
 #include "exec/tb-lookup.h"
+#include "exec/tb-context.h"
 #include "exec/log.h"
 #include "qemu/main-loop.h"
 #if defined(TARGET_I386) && !defined(CONFIG_USER_ONLY)
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 640ff6e3e70..e9f4de5190d 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -48,6 +48,7 @@
 
 #include "exec/cputlb.h"
 #include "exec/tb-hash.h"
+#include "exec/tb-context.h"
 #include "exec/translate-all.h"
 #include "qemu/bitmap.h"
 #include "qemu/error-report.h"
-- 
2.26.3


