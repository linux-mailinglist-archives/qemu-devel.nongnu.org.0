Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C569407EF8
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 19:32:35 +0200 (CEST)
Received: from localhost ([::1]:38444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPTLG-0005Ee-2y
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 13:32:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mPTGi-0005SF-1o
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 13:27:52 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:42949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mPTGf-0004LH-MS
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 13:27:50 -0400
Received: by mail-wr1-x432.google.com with SMTP id q11so10903993wrr.9
 for <qemu-devel@nongnu.org>; Sun, 12 Sep 2021 10:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Vx2dmg3HFxd0D29HGrTm+o8SOv+3wRTwCa15ndCgeUM=;
 b=CdpGLLLIauIILzY+gDflOxH0zd8W+Y/c1l3T5g4yp+yg/x2QzLuOp1KFHHzzyHzxsu
 6wy7y2EPe/KFYFraPRIWj8rWiv/8tCOZ2inzIJ3mHjB9x3269uGsrdTSaQWIfjMAR0J6
 KIj1ueOgOQ59PN0qziIK8XTV95TmpOqnX/oMmkpFQCWEqlcOx7stePNme7Gl5RBChZOr
 jlymxg7fyy5NHye/09IuGoW46ta5TZnD+Bh1glPJaCKLB/cZCXLf0tp1HBTQ6GySTf0x
 CwvGiIS2BPys+jcyAhVHJNiWdVz6vkgZ1j3F8hJe8Afk4excQOFgXWUuGZLWW6Zey7zD
 FeYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Vx2dmg3HFxd0D29HGrTm+o8SOv+3wRTwCa15ndCgeUM=;
 b=m/r1R6FJvS22v7HEonzafnSfDr67V/ZTyK2CghICDxozWFK7OLvOnWz0EV2fxTO9bq
 ma2TnEgys1osBfbWmTK7QO6Rs46Dr073917oZIew7zEwAtPIngxDiPJIYjre0DT7NH/x
 qH2GEQlW8mBYSv+mD7VO3PUIgg8afioQzRg2PBNCbDKAKW94IBFbPXqyK6hTA6sJdXRu
 +mjHkE6s1/yeFxEeVmjwSg5OVD7R98WaN+pgnQxZi32T/ROhXHOLkj5Vs9CNGG6PLFdb
 Hb6+6xrWfiQN0Qww769ApCvTobFhpJeG4dZ5MVKnjC6phKlT3p//Zaw7zjh3rJa13ecU
 cxJA==
X-Gm-Message-State: AOAM532ACtecN2ALqwSNkJ1f8cCavg3bs3q7c9XRiZyuEw4GOMREEJGg
 IKnxJeUCP75sUfoNs2CIcbjxGfepVWA=
X-Google-Smtp-Source: ABdhPJxMI5P1nRhl2s2UG4W304VZTmV90blCJfu6rQCk8SxbpEUw0FjwdYEeJwK1sCMnSxuFiUBHsg==
X-Received: by 2002:adf:eb81:: with SMTP id t1mr8574084wrn.245.1631467667988; 
 Sun, 12 Sep 2021 10:27:47 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id o8sm3181727wrm.9.2021.09.12.10.27.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 10:27:47 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 03/30] hw/core: Un-inline cpu_has_work()
Date: Sun, 12 Sep 2021 19:27:04 +0200
Message-Id: <20210912172731.789788-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210912172731.789788-1-f4bug@amsat.org>
References: <20210912172731.789788-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 David Gibson <david@gibson.dropbear.id.au>
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


