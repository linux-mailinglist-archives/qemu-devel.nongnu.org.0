Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6244AB6EA
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 10:00:35 +0100 (CET)
Received: from localhost ([::1]:48920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGzsv-00008V-Ux
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 04:00:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nGyst-00062E-Lo
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 02:56:29 -0500
Received: from [2a00:1450:4864:20::336] (port=35555
 helo=mail-wm1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nGysb-0002Fj-FN
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 02:56:23 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 l123-20020a1c2581000000b0037b9d960079so5049997wml.0
 for <qemu-devel@nongnu.org>; Sun, 06 Feb 2022 23:55:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aCwLmCq0oGKqIgeR/e8+TlnXEc3ReLPyFBhnpQgaQpo=;
 b=oprtYykjJ+12s0VXHPKXoUEI2cTWIT3/xjaqay5NeqwuPGopbwHFg/TUxuAgunk1w2
 NRV5AIn0KUmIcm9h9prP/Gh0P9kFBho8D4E8sdwJ3jJ97j8Qook1hiyy+QFNP0xPzZyo
 AAX+/kV4BVfr/yCOcGvwNHjYHA51R1pxC7dSqzEyloTkmRy4cfbfe7/1SyAosfo3G6K7
 kzZVvQr4rxexHXEIKQPFcbTzIQVCmi3VUeVIgA+ICLlNEGLnWmhfF6XvSXExpGEsOhYR
 jbGnW3aKLNT9IzxXwvN+d8aNVxiXoFLuDQxGfULEyGOtRCFwibFdpbaxVeD2Q5w1PsZV
 UPrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=aCwLmCq0oGKqIgeR/e8+TlnXEc3ReLPyFBhnpQgaQpo=;
 b=ff2bGtLeWiNKLPX4Q4rr1ST0cbwmQLRyQbuhuk2Znqya3OKkMr4QLQIUzgUX5Wj49z
 ohPdQDLXa9gIs9U9zvLFXLQOsk8GE3hlvP8tci/4jz6srW5mDGA0cpkLzQiNgD00vqWH
 +Q+8YeU6lgR+8sUJQPBNoH4LbT39F6Oaf42mwNinR7jEibsYkdjcoz1TRhNyK7M2AVBf
 6OVYHRxQE6RRsfw1h/FuAUOasSLrhXQgI6d/7b6QkrYsuj+vXtcYZTZBB4fr1rhWnS8b
 GKXAPsbqxacgp4Hh0L+olFBGIjevGlImZHiXRP3ZZNye8+jylInXB1kae8VpBIhSXUeM
 MB4g==
X-Gm-Message-State: AOAM532yGybzgtX4O5gn/LjO4CGPzAwCyrWLQjgWw7pLiXFgns8GHiKa
 Ye9x54ejDubpPQjUKI2+9R4+b0F9hMI=
X-Google-Smtp-Source: ABdhPJwNtqxd14RMmiUPyTq+cGK+cPuKd+Fzoo+T8PiJPdS9TfQV69xX6QRz7YOBQ8H9ma/+C5i7AA==
X-Received: by 2002:a7b:c402:: with SMTP id k2mr13418027wmi.188.1644220541174; 
 Sun, 06 Feb 2022 23:55:41 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id f8sm10750280wry.12.2022.02.06.23.55.40
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 06 Feb 2022 23:55:40 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v3 16/21] misc: Remove unnecessary "sysemu/cpu-timers.h"
 include
Date: Mon,  7 Feb 2022 08:54:21 +0100
Message-Id: <20220207075426.81934-17-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220207075426.81934-1-f4bug@amsat.org>
References: <20220207075426.81934-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::336
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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


