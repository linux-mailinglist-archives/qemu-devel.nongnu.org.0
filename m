Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B936521FE74
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jul 2020 22:22:08 +0200 (CEST)
Received: from localhost ([::1]:41454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jvRRH-0004Z2-Op
	for lists+qemu-devel@lfdr.de; Tue, 14 Jul 2020 16:22:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jvRQA-0003C0-9a
 for qemu-devel@nongnu.org; Tue, 14 Jul 2020 16:20:58 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:44804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jvRQ8-0006Tu-7g
 for qemu-devel@nongnu.org; Tue, 14 Jul 2020 16:20:57 -0400
Received: by mail-wr1-x444.google.com with SMTP id b6so24552060wrs.11
 for <qemu-devel@nongnu.org>; Tue, 14 Jul 2020 13:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PrgOAuZeHBitof8zxZBYoRqFGXasEypHSQh2bG/rT7w=;
 b=j9cumUEIZ4wYq6O6fauu6rZh0QLH2PGcWmCDZe7Lx0iFqItWLmCvCBC1vrtvw88ccN
 O5Zoknw10jEFuBjE3+8EG5u7UH24Q7QCsAsl9mJMi2lxUsgk4pwxzGENfEeCPwKBFAkN
 sx2SvH8LcjxWKCVFqEV9F5W/fxPE4P6naK6tYCYDNQ+QNJlbEVlTsmIcAOkMcs6btxXE
 fTt3HTNQ1hs2XRJqjvMJUBnK60IBWd6LFcsJYvho4fvYUfKvMlpUouq7F+zdqHV8lzKb
 4mrt8/B0BsZ6QoJ+bgbiVrfXZfzrlZrrQcYcOPlRSnKmkIafSx6zgqh1VlcrG57kAiFN
 +zqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=PrgOAuZeHBitof8zxZBYoRqFGXasEypHSQh2bG/rT7w=;
 b=qHAdQNHHV7a6SqeOlJBr2Cx1V7Fkp2oK6XDv3QmwQyE8g2R1eztDU+WKuERwsm1juI
 8uqKYl3KSXgCBQ7TvCvIzCBKjt3rYdZdgyqL7544OX1Fs6JNF46LPbM1hYW9ivyMPSez
 DMoyJjjmYPrX7LxxYoX7qTdlVug1+g9JVr5qB7Wevs5NOyBgW3Z+BOK10mlb2/RuxR1Q
 Q7MMcb2XfWb9pYxZhAvXpopIorItodeQzp4Gtyo0Jq0yEdnLiQxro7Jtkhyt6m/ueygr
 +k7HKg5utLw9i4wbkYedx1rgihfzdjaG0yNSW2oo2HnXvZ0ePWnA6TMjj9O7Nss2bqTi
 2zPg==
X-Gm-Message-State: AOAM533X7mrahkgxz954AbOnSv3gOtCmqmRFdCfmUUIq8tvSJpU5+9aH
 eE/S429ruVe5S8H+Ejxcdm0RKGFz0Nc=
X-Google-Smtp-Source: ABdhPJwXUAH1URVSsSw9U3r4WYgOo8bGvLJMjon1mz3Gn/RVWRWed3J8QAgym3taWc8gk1adHMOFaQ==
X-Received: by 2002:a5d:470c:: with SMTP id y12mr8384057wrq.340.1594758054515; 
 Tue, 14 Jul 2020 13:20:54 -0700 (PDT)
Received: from localhost.localdomain
 (138.red-83-57-170.dynamicip.rima-tde.net. [83.57.170.138])
 by smtp.gmail.com with ESMTPSA id 138sm7245217wmb.1.2020.07.14.13.20.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2020 13:20:53 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 1/3] target/mips: Remove identical if/else branches
Date: Tue, 14 Jul 2020 22:20:49 +0200
Message-Id: <20200714202051.13549-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200714202051.13549-1-f4bug@amsat.org>
References: <20200714202051.13549-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Huacai Chen <chenhc@lemote.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>

Remove the segment:

      if (other_tc == other->current_tc) {
          tccause = other->CP0_Cause;
      } else {
          tccause = other->CP0_Cause;
      }

Original contributor can't remember what was his intention.

Fixes: 5a25ce9487 ("mips: Hook in more reg accesses via mttr/mftr")
Buglink: https://bugs.launchpad.net/qemu/+bug/1885718
Signed-off-by: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Message-Id: <20200701182559.28841-2-aleksandar.qemu.devel@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/cp0_helper.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/target/mips/cp0_helper.c b/target/mips/cp0_helper.c
index bbf12e4a97..de64add038 100644
--- a/target/mips/cp0_helper.c
+++ b/target/mips/cp0_helper.c
@@ -375,16 +375,9 @@ target_ulong helper_mftc0_entryhi(CPUMIPSState *env)
 target_ulong helper_mftc0_cause(CPUMIPSState *env)
 {
     int other_tc = env->CP0_VPEControl & (0xff << CP0VPECo_TargTC);
-    int32_t tccause;
     CPUMIPSState *other = mips_cpu_map_tc(env, &other_tc);
 
-    if (other_tc == other->current_tc) {
-        tccause = other->CP0_Cause;
-    } else {
-        tccause = other->CP0_Cause;
-    }
-
-    return tccause;
+    return other->CP0_Cause;
 }
 
 target_ulong helper_mftc0_status(CPUMIPSState *env)
-- 
2.21.3


