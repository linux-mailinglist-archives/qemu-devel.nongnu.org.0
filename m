Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3EB4128B4
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 00:14:55 +0200 (CEST)
Received: from localhost ([::1]:49388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSRYr-0001I6-8t
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 18:14:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mSR66-00038N-Qb
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 17:45:10 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:42965)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mSR65-0001aZ-2e
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 17:45:10 -0400
Received: by mail-wr1-x42b.google.com with SMTP id q11so33568309wrr.9
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 14:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Vx2dmg3HFxd0D29HGrTm+o8SOv+3wRTwCa15ndCgeUM=;
 b=m8ziF40J52/u1yKDfbYFuuNaThXb7y64HCXEw8Z8Bv8HKSynWACPyzJSRFIJ7Es3o+
 gYOAz3fk4gEb5gLKJiXekdQJF2F66HlddC/BOu3lHr+ZWQADGT2vkWLE9xFsjIU3V2GU
 sxgYdsq1P+DItLZ6MW7qn3xDMLA+epovCcjkAJnx5MUY7wn8NO7wUj1I5zAwYmjNAewk
 ocJnyYzCflwZd7Z7kiEUIwEvdBF+1KLyj2+5m2fIvYDt18o3u2m2LGAo7YvFmuo/SliW
 /M0ASkqoqx0F8vm4SQ5vWNJY6FUjkhycqgSNtr4/jUmzdKU10ofdrrn9XNFtGPrFJ31r
 tE5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Vx2dmg3HFxd0D29HGrTm+o8SOv+3wRTwCa15ndCgeUM=;
 b=MAk8xQFRrEgXxh8xeRMUyrYp0IA6C7WXAPtqhW2IiZIuZ1U2AUYfwS2Qy90QDUy9rT
 ICElDs3HgVWP8E6b7nA6LngLqlZl4Xc8lB9+KaGP//JGejPu3j4ADgOxurnWuowedLIc
 LHhzriSdwHvtt9GNZDi5tyh7tXPOexBLlf7ECHj4/D+lHjnwuTOug0G7aL5ytwj/Wy+I
 2xhVHrTx9Ono0ZEjUXmK9hVEG7/WKdawqBef33GcHGe/f2mUMBVlAOt2XgeMcEixmDTA
 vT33cx1Li2SA0xzyzBiiBJA9LcaOjgvMl9NHjco/E4lKmtd3Yhx35hGequ/s/HLPUfjw
 4Qfg==
X-Gm-Message-State: AOAM532wQj0Agfhtccgjd8qNLIWrxHxXcNJLlmnbDep06oqn6kvDSaq0
 GYL10YolWRCKuUxS8FszKYznz7Ww2A0=
X-Google-Smtp-Source: ABdhPJxR6+L3F4UHhDgi/bqh4LNq9zga4al+3z9thIBUPK6X+INQKQq4/nEmmRt689ybzTrYpdYTrA==
X-Received: by 2002:a5d:530c:: with SMTP id e12mr31000085wrv.81.1632174307559; 
 Mon, 20 Sep 2021 14:45:07 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 t1sm17188996wrz.39.2021.09.20.14.45.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 14:45:07 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 04/31] hw/core: Un-inline cpu_has_work()
Date: Mon, 20 Sep 2021 23:44:20 +0200
Message-Id: <20210920214447.2998623-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210920214447.2998623-1-f4bug@amsat.org>
References: <20210920214447.2998623-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We want to make cpu_has_work() per-accelerator. Only declare its
prototype and move its definition to softmmu/cpus.c.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/core/cpu.h | 8 +-------
 softmmu/cpus.c        | 8 ++++++++
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 2bd563e221f..e2dd171a13f 100644
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
index 071085f840b..7e2cb2c571b 100644
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
2.31.1


