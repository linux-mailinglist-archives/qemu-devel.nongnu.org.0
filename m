Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB0C4A8CCC
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 20:56:58 +0100 (CET)
Received: from localhost ([::1]:55698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFiDx-0001Qi-EB
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 14:56:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nFhek-000349-DZ
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 14:20:36 -0500
Received: from [2607:f8b0:4864:20::102a] (port=56055
 helo=mail-pj1-x102a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nFheg-0002cc-9P
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 14:20:32 -0500
Received: by mail-pj1-x102a.google.com with SMTP id d5so3330217pjk.5
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 11:20:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hXuL5YKIALD9IBgRuEj91y6p+IaDzTghFwjHaE32qFw=;
 b=DeINhqlKP7iygqbYhir8vdgZuTz+ESlw43t9rFS61fr05BSzBGUl6BrDaT8q/jxj6R
 Z//hVpcz+wFUu2kjC4YlDMqFVV7NR3bTyR0Q8xOj4vOnovNJ2A0Ef+79s2CoefgGb6p9
 sCb/Xxx2ExQ0sq7WvVhixNWFtbMlkjPG/AY6D9D/vg40yDwSj0YaK5tMaDKzSfU+EQVa
 0XKe8YQMxXF3RFBl+ICZrncEGAqG5TH4wgA7Z6dJuQJWTx/BG0MPg7+UezpgRjWPr9+b
 UGUpR/K1JYw8WG4td8ZMsMOXssaIsyfkzRYcmDxw6jq/lFyB7gMDqmEG0S09DGi3LyUP
 lqFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=hXuL5YKIALD9IBgRuEj91y6p+IaDzTghFwjHaE32qFw=;
 b=Voa0ZjSKtX1atHW4Xp76O2xHQFWzdLCf8WUwqQVmBxe9dSREQg2II61q1EqITww9/r
 lCfNxO+lTAsGZdbeNFueNUjaCX4t1Zp8jDp5oRQhfgQOjrdNK1O5TOje91jm7pER7BHV
 Glr7l7Uk5c+VqFYv23y2NvEDOMClRHgq6nob1L3MAD09zOKtBxWxXDDfSvbU6OUsRQox
 1Rlz6AThfwsPQLC/vDPfL+I4OiAgrd4iQdcIRCho3WWq0mmoLCWpvBfCSQvqVJYugLus
 k9h/sSxwQCYmFiySjZLzyj5uf0/ZI12hPhmaBSAFC5Vxy/7xwuPhgk87wYYC4ZD2qXLu
 Ikng==
X-Gm-Message-State: AOAM530btr0D6sX9puCGAa6/19g+1HFC0ffSpq5hZ9/GyJ1ULbPWXfoJ
 hwEUw4MYBs1YitMxCh6tJlo4UCz+co0=
X-Google-Smtp-Source: ABdhPJwh5xUuinjAtLf8GVxxPX9YmhwaLWzoGpLW1BR59xmUxg773gH0yRPJ2dgDPy8tM5rl95uTHQ==
X-Received: by 2002:a17:902:ea09:: with SMTP id
 s9mr37297981plg.120.1643916027383; 
 Thu, 03 Feb 2022 11:20:27 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id q21sm31329890pfu.104.2022.02.03.11.20.25
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 03 Feb 2022 11:20:27 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v2 16/21] misc: Remove unnecessary "sysemu/cpu-timers.h"
 include
Date: Thu,  3 Feb 2022 20:18:09 +0100
Message-Id: <20220203191814.45023-17-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220203191814.45023-1-f4bug@amsat.org>
References: <20220203191814.45023-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102a.google.com
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

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 accel/qtest/qtest.c            | 1 -
 target/alpha/translate.c       | 1 -
 tests/unit/ptimer-test-stubs.c | 1 -
 3 files changed, 3 deletions(-)

diff --git a/accel/qtest/qtest.c b/accel/qtest/qtest.c
index 7e6b8110d5..f6056ac836 100644
--- a/accel/qtest/qtest.c
+++ b/accel/qtest/qtest.c
@@ -20,7 +20,6 @@
 #include "qemu/accel.h"
 #include "sysemu/qtest.h"
 #include "sysemu/cpus.h"
-#include "sysemu/cpu-timers.h"
 #include "qemu/guest-random.h"
 #include "qemu/main-loop.h"
 #include "hw/core/cpu.h"
diff --git a/target/alpha/translate.c b/target/alpha/translate.c
index ca78a0faed..66768ab47a 100644
--- a/target/alpha/translate.c
+++ b/target/alpha/translate.c
@@ -20,7 +20,6 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "sysemu/cpus.h"
-#include "sysemu/cpu-timers.h"
 #include "disas/disas.h"
 #include "qemu/host-utils.h"
 #include "exec/exec-all.h"
diff --git a/tests/unit/ptimer-test-stubs.c b/tests/unit/ptimer-test-stubs.c
index 2a3ef58799..f5e75a96b6 100644
--- a/tests/unit/ptimer-test-stubs.c
+++ b/tests/unit/ptimer-test-stubs.c
@@ -12,7 +12,6 @@
 #include "qemu/main-loop.h"
 #include "sysemu/replay.h"
 #include "migration/vmstate.h"
-#include "sysemu/cpu-timers.h"
 
 #include "ptimer-test.h"
 
-- 
2.34.1


