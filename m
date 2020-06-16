Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF7F1FB422
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jun 2020 16:22:58 +0200 (CEST)
Received: from localhost ([::1]:35954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlCUK-0000Xh-Uk
	for lists+qemu-devel@lfdr.de; Tue, 16 Jun 2020 10:22:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <flukshun@gmail.com>)
 id 1jlCPE-00019N-UO; Tue, 16 Jun 2020 10:17:40 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:45176)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <flukshun@gmail.com>)
 id 1jlCPD-0006XU-C1; Tue, 16 Jun 2020 10:17:40 -0400
Received: by mail-oi1-x243.google.com with SMTP id p70so19330255oic.12;
 Tue, 16 Jun 2020 07:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=zGag6QG3Qt4gKhYHnTWrY2G1J3/1QkOIEOU6VeQ7vrk=;
 b=L0rzGLJ8aJEimBxgA4fPbmoAtq/qqfkafavPcWH/sXXc34SZF+kr3JHnrADHYKl/nU
 HQOyGDOliSpz6u/477sKwNMhnPAssFpgIg73RgxrFjGC2gc4fa4UO6/Vppr5yWbfIo6J
 6iD0vlEQtzGAbXzRdH5b2sOgYWIgCdgidyJP8BMqRp0Ml4U2LoVYJ1e3VJE3s9I3+bPw
 O+3FHTYLdOJf3ygS/4BsdXQUI/ALB7szgw2w2Cr+rXTIFXoyCJMrRNs2JBYhQDttZEJD
 jpJ6cA8Dve4WkCa/AAyEJH4VhXePjSq0kvIUjtvcbalDL9FJQy9wbf1W8RogkCJDj9JB
 zD+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=zGag6QG3Qt4gKhYHnTWrY2G1J3/1QkOIEOU6VeQ7vrk=;
 b=uXXN0GMpzNGpgduH/H4Gy3cncS6SVEPO+53y8ZrH2nqWyTaR63i2QDLAW7w3J8X6Yu
 7oU6x+WWCz5Szg48URnaLCILzKwYL8gB28RQLpQEdzqQXkiu6JA4KpTyO3gwv1I4951d
 SIZK3U/tOTSwExKxydAIIkhC4mrxYFcFtIqg3etFgnHWz3JV3cuL0CngG3awL9joAyIV
 kPqv/cvUvN9RzLqfjHKo3s+j6S2qDJ9xZCphhNMELphmjDqGjQ+u6ZFYqJXsh3YQ5SUm
 0CslVD55EorrR/lsdXIhZJn4+SO7QYYuYT1E88FkSiwpzL/YyjmlhWjMX0NXA4Ln7Xf1
 ioRg==
X-Gm-Message-State: AOAM530nlXed5b3KtdjydyOZuy30v8Pc7VKKgsFcD4Xi/pgGbbLTuFzq
 medfzP9PKVjYnuIZti1jgimAEhMG
X-Google-Smtp-Source: ABdhPJyqEGa7oosChgwaMTKDoeChFAm9EGYaw2KjbmmhGIO/Cw+SrNcXHMNxGqpcYsKMc1qu5goS+g==
X-Received: by 2002:aca:c448:: with SMTP id u69mr3517692oif.104.1592317057644; 
 Tue, 16 Jun 2020 07:17:37 -0700 (PDT)
Received: from localhost (76-251-165-188.lightspeed.austtx.sbcglobal.net.
 [76.251.165.188])
 by smtp.gmail.com with ESMTPSA id f1sm4092478ool.16.2020.06.16.07.17.36
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 16 Jun 2020 07:17:36 -0700 (PDT)
From: Michael Roth <mdroth@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 12/78] arm/arm-powerctl: rebuild hflags after setting CP15
 bits in arm_set_cpu_on()
Date: Tue, 16 Jun 2020 09:14:41 -0500
Message-Id: <20200616141547.24664-13-mdroth@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200616141547.24664-1-mdroth@linux.vnet.ibm.com>
References: <20200616141547.24664-1-mdroth@linux.vnet.ibm.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::243;
 envelope-from=flukshun@gmail.com; helo=mail-oi1-x243.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Niek Linnenbank <nieklinnenbank@gmail.com>

After setting CP15 bits in arm_set_cpu_on() the cached hflags must
be rebuild to reflect the changed processor state. Without rebuilding,
the cached hflags would be inconsistent until the next call to
arm_rebuild_hflags(). When QEMU is compiled with debugging enabled
(--enable-debug), this problem is captured shortly after the first
call to arm_set_cpu_on() for CPUs running in ARM 32-bit non-secure mode:

  qemu-system-arm: target/arm/helper.c:11359: cpu_get_tb_cpu_state:
  Assertion `flags == rebuild_hflags_internal(env)' failed.
  Aborted (core dumped)

Fixes: 0c7f8c43daf65
Cc: qemu-stable@nongnu.org
Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
(cherry picked from commit c8fa6079eb35888587f1be27c1590da4edcc5098)
Signed-off-by: Michael Roth <mdroth@linux.vnet.ibm.com>
---
 target/arm/arm-powerctl.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/arm/arm-powerctl.c b/target/arm/arm-powerctl.c
index b064513d44..b75f813b40 100644
--- a/target/arm/arm-powerctl.c
+++ b/target/arm/arm-powerctl.c
@@ -127,6 +127,9 @@ static void arm_set_cpu_on_async_work(CPUState *target_cpu_state,
         target_cpu->env.regs[0] = info->context_id;
     }
 
+    /* CP15 update requires rebuilding hflags */
+    arm_rebuild_hflags(&target_cpu->env);
+
     /* Start the new CPU at the requested address */
     cpu_set_pc(target_cpu_state, info->entry);
 
-- 
2.17.1


