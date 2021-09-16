Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 253D140DE4A
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 17:41:49 +0200 (CEST)
Received: from localhost ([::1]:60700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQtWF-000373-7M
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 11:41:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQtLR-0001IM-IL
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 11:30:37 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:53169)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQtLK-0002N6-W3
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 11:30:37 -0400
Received: by mail-pj1-x102f.google.com with SMTP id v19so4815288pjh.2
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 08:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VtxRpJ0CcK/sAEcE4Sv89p9y9iZvEmtHp37kJ5kh0xo=;
 b=cdUGAF2M5jMcbbKPmfEWnLrP/wNrAn1m6sjWJ1qT1HIjZi9uBpwSCq4AMoK+j47A6F
 7zD54D0SljmKQfUjR6VyZMkE8NmvIvHSrMc54Y2f6dvvbRW9Kt84neEDIWkzczDHOr0Q
 5emcudIeCY5igtl601Fg9Qjdk9G7RQxavm9RECRItP/KgMYha+bqm91eZkq81k/FAlBp
 2bt8LCFeGrvPGXWtKRTGw3pL1LJPJ9nZx5qovruHYboqoCwlH81Rf9INFzXHnByjKjXh
 iMR4xkxPFmNFeT9yBNrEmgyCe8BmrmVRsEQoT5oEpG/FW311WDaB3txsAFcjkW1RgWKO
 Iwlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VtxRpJ0CcK/sAEcE4Sv89p9y9iZvEmtHp37kJ5kh0xo=;
 b=zF9Fdb6HAvhKAmIQkVK7wQdN8xtga+tywJrBAoXZwBlYpbvBZyfq/VVvGkLVuxIezj
 r1epyfgtFz4rhSALi2KmIC1uTpGiWBrbvaSIi2+C6Z9SNAWGOpjk7X+0QaC3ZX8sloZF
 0go+UNibO4XI2sb039DZ5MYEQC+LcYwi+RR+8+ZKclUzefVfvhOPN1W9c5l8DDO9UMwL
 cahh3PC+UwU50CPRYfXpyBuaLTs0diptR0LnSB/bLM+1dvJxMOBumlusi14rpR77Rcud
 4x4aG+6WFCHhs3LFUkfYMAWvcuPX4NlK2ir0wQnpwE/47oOuqz4+ZTw/PaE2leXGdtqU
 4z0Q==
X-Gm-Message-State: AOAM533lIGnDsr7taCG5Rf2YzYB9B/yI+rLZfNW6l2XGaz6jrZIUJ0vG
 aGG7QqVoiPFxetaimBgkfSkFb6OMBg1wmA==
X-Google-Smtp-Source: ABdhPJy6f6OqWmd9/c9h//0IcfAVjb2mcB8O/fb1JGwwXpTgTLP8hju7zE5c98h326mHX9ZjKc+AbA==
X-Received: by 2002:a17:90a:d596:: with SMTP id
 v22mr15731489pju.51.1631806228967; 
 Thu, 16 Sep 2021 08:30:28 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id b7sm3779447pgs.64.2021.09.16.08.30.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 08:30:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 04/35] hw/core: Un-inline cpu_has_work()
Date: Thu, 16 Sep 2021 08:29:54 -0700
Message-Id: <20210916153025.1944763-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210916153025.1944763-1-richard.henderson@linaro.org>
References: <20210916153025.1944763-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

We want to make cpu_has_work() per-accelerator. Only declare its
prototype and move its definition to softmmu/cpus.c.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210912172731.789788-4-f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/core/cpu.h | 8 +-------
 softmmu/cpus.c        | 8 ++++++++
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 2bd563e221..e2dd171a13 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -546,13 +546,7 @@ void cpu_dump_state(CPUState *cpu, FILE *f, int flags);
  *
  * Returns: %true if the CPU has work, %false otherwise.
  */
-static inline bool cpu_has_work(CPUState *cpu)
-{
-    CPUClass *cc = CPU_GET_CLASS(cpu);
-
-    g_assert(cc->has_work);
-    return cc->has_work(cpu);
-}
+bool cpu_has_work(CPUState *cpu);
 
 /**
  * cpu_get_phys_page_attrs_debug:
diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index 071085f840..7e2cb2c571 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -251,6 +251,14 @@ void cpu_interrupt(CPUState *cpu, int mask)
     }
 }
 
+bool cpu_has_work(CPUState *cpu)
+{
+    CPUClass *cc = CPU_GET_CLASS(cpu);
+
+    g_assert(cc->has_work);
+    return cc->has_work(cpu);
+}
+
 static int do_vm_stop(RunState state, bool send_stop)
 {
     int ret = 0;
-- 
2.25.1


