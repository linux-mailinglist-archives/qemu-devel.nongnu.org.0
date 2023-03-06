Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E346AB3BA
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 01:41:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYytW-0004Md-QV; Sun, 05 Mar 2023 19:40:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYytU-0004Lp-0H
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:40:00 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYytS-0006Md-8z
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:39:59 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 qa18-20020a17090b4fd200b0023750b675f5so11558169pjb.3
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 16:39:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678063197;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tw4O2DvbAu9SMXsAPu4aoqukwc2y/CW2+dH8E22nZx8=;
 b=grVS1GxD+zvHdfzO9yuRx6WNiErWhJLH9D/m9zRdpzja/YQ7EPOkFiBvBvr8nEsRK0
 Rtzfd7EyL5To5F0WoSfV1uOEQSBGL19/DPQJLU0M0bgq/3dfz7IxDZKLFUNVMyU8bXBd
 IjtIE49ZsMKHiRiE3Jm8yeT8eAzgk5lskN8NTOsd1ETsHio7f5nuAsIuM1YJWYBxgdlt
 nUL9bpG2pw/jWoEXfEbEm1silyfgwcbsXq37mhjnhGBCD93fwnCOIcEKVf7jap33ux9J
 e1s6pPbR1ZgcPiDdfOIll8CrQ2Jp02yIwx5I3P7cMb5DMcfN4d5mhKRknOR+zsY5jBtK
 S5pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678063197;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tw4O2DvbAu9SMXsAPu4aoqukwc2y/CW2+dH8E22nZx8=;
 b=WRHxNkbUFRY2bGy23Ek+ETW08a3gIxMGZvpofbsSgZJtFhcQeMHX3gem6HOhTDis6v
 X/xXDLK4Fr2WneMQPUMFpQf/Ma4iiOcqhXcQkeOjKy0pT1rzQf9d7X0UqCh58vl7UIEw
 hwwPS1QeRDRB/7e/i1XCKQh+1P1awUH8nAe1kjqSO/4Rx+8d/YslA4zD2jFuJpth6mPM
 lbj5tB7Qh0FeOn/J/UQXNzeoemDLw/M0YP+uv5Oj1k4U3/WI1etIqHbfhnnTpIOrCHAm
 8ptGw9bqLegMqsORXexvrEwJV66ezMqtZ7VkfKwGhml5zOgB4Cy9qHSusaERhAoB1rYP
 LdYw==
X-Gm-Message-State: AO0yUKWHpbM+o0KuKV4QATxXM7NV/qY+n0QAYG3EgexUti/xxfR1Ccw1
 /rzWQH0dWTMe5Qohxk0ylwYwFcyLmy5A3ZPbUZrDyA==
X-Google-Smtp-Source: AK7set+nRUpak0AoFp5kAKd8P2UiafD7K7VWUHCz1AMFtYgyA94S9Uszf75ABvJEQJ+8SdCggGeMfg==
X-Received: by 2002:a17:90a:1a5c:b0:237:9896:3989 with SMTP id
 28-20020a17090a1a5c00b0023798963989mr9813663pjl.34.1678063196941; 
 Sun, 05 Mar 2023 16:39:56 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:87cc:49bb:2900:c08b])
 by smtp.gmail.com with ESMTPSA id
 r13-20020a17090b050d00b002372106a5c2sm6567901pjz.37.2023.03.05.16.39.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Mar 2023 16:39:56 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, "Richard W.M. Jones" <rjones@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 01/84] tcg: Include "qemu/timer.h" for profile_getclock
Date: Sun,  5 Mar 2023 16:38:31 -0800
Message-Id: <20230306003954.1866998-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230306003954.1866998-1-richard.henderson@linaro.org>
References: <20230306003954.1866998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: "Richard W.M. Jones" <rjones@redhat.com>

When CONFIG_PROFILER is set there are various undefined references to
profile_getclock.  Include the header which defines this function.

For example:

../tcg/tcg.c: In function ‘tcg_gen_code’:
../tcg/tcg.c:4905:51: warning: implicit declaration of function ‘profile_getclock’ [-Wimplicit-function-declaration]
 4905 |     qatomic_set(&prof->opt_time, prof->opt_time - profile_getclock());
      |                                                   ^~~~~~~~~~~~~~~~

Signed-off-by: Richard W.M. Jones <rjones@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230303084948.3351546-1-rjones@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/tcg-accel-ops.c | 1 +
 accel/tcg/translate-all.c | 1 +
 softmmu/runstate.c        | 1 +
 tcg/tcg.c                 | 1 +
 4 files changed, 4 insertions(+)

diff --git a/accel/tcg/tcg-accel-ops.c b/accel/tcg/tcg-accel-ops.c
index aeb1cbaf65..af35e0d092 100644
--- a/accel/tcg/tcg-accel-ops.c
+++ b/accel/tcg/tcg-accel-ops.c
@@ -31,6 +31,7 @@
 #include "sysemu/cpu-timers.h"
 #include "qemu/main-loop.h"
 #include "qemu/guest-random.h"
+#include "qemu/timer.h"
 #include "exec/exec-all.h"
 #include "exec/hwaddr.h"
 #include "exec/gdbstub.h"
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 4b5abc0f44..a5bea8f99c 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -51,6 +51,7 @@
 #include "qemu/qemu-print.h"
 #include "qemu/main-loop.h"
 #include "qemu/cacheinfo.h"
+#include "qemu/timer.h"
 #include "exec/log.h"
 #include "sysemu/cpus.h"
 #include "sysemu/cpu-timers.h"
diff --git a/softmmu/runstate.c b/softmmu/runstate.c
index f9ad88e6a7..9b3611d56d 100644
--- a/softmmu/runstate.c
+++ b/softmmu/runstate.c
@@ -46,6 +46,7 @@
 #include "qemu/module.h"
 #include "qemu/plugin.h"
 #include "qemu/sockets.h"
+#include "qemu/timer.h"
 #include "qemu/thread.h"
 #include "qom/object.h"
 #include "qom/object_interfaces.h"
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 5cccc06ae3..6b830ade4c 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -36,6 +36,7 @@
 #include "qemu/qemu-print.h"
 #include "qemu/cacheflush.h"
 #include "qemu/cacheinfo.h"
+#include "qemu/timer.h"
 
 /* Note: the long term plan is to reduce the dependencies on the QEMU
    CPU definitions. Currently they are used for qemu_ld/st
-- 
2.34.1


