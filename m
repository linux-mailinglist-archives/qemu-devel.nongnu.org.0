Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C974182F1
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Sep 2021 16:56:19 +0200 (CEST)
Received: from localhost ([::1]:45806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mU96A-0006en-Pe
	for lists+qemu-devel@lfdr.de; Sat, 25 Sep 2021 10:56:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU91d-0007UK-EE
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 10:51:37 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:33486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU91b-0004wB-Ny
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 10:51:37 -0400
Received: by mail-wr1-x42a.google.com with SMTP id t18so36542537wrb.0
 for <qemu-devel@nongnu.org>; Sat, 25 Sep 2021 07:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q67ayF6mp3x5mowVghP1HWubdfr0XK9yIREcYkI/kjw=;
 b=K165AtI6L5PwQLpWjUgAWiQ96IxBA3jAdkl7OsVzbu9c0tekwJvDBKvzqSrhHpqIiT
 7G/lNrsC/MOUrZJr89jZUULetjLuPlol3FRXjdFVtrJT/qZ1TpQpIevD2fEhE+7KtOEs
 TjGBuEKzF2gTkzQf6zOOToEPYMo7ex1sBUDeNdBmoI6FMo0WgT0549JpdJYdSn7KzK1E
 THs7nob9bzgh4v+d2iF1XP/zjFHCsBrcVH1YCcra3GkHtx5Cn78kchA9xHS2j9QuSSnl
 VRCHNfICLFz35lLgaGgB0hpGsNSWJObzOPFHmazVZ2cHjxnQlbRCajxi5SO9B6oCETyY
 vZKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Q67ayF6mp3x5mowVghP1HWubdfr0XK9yIREcYkI/kjw=;
 b=cNh3MS6Wsr3o+tsOlupwKXlUhTth+REdYZhWl98chR7FyMVQuY3Rz+ftnrLw8+uU2s
 +XfMYvBbWDtWSgxwNqggZFSUtUYlVKgzgFMNQeBko1NI8U1oTXaZxCD+IrnVeuPlOQMr
 ioKHTk16TOsSu7I9phliji7BO/0VFgJRFzv2tyZlNGnVbngtygsX/EATWzehkzD+NI/g
 vxSmEfRt3KocBNwLUuiYLd9/MqtuJrhIwUndT00YGE6V2Xrc95WbUvcdCD8XHXJ2WuAC
 4rp1Y/OqN9GDyrIryagMgDAox31I9Stti9Y9mcLxkI07URMwV2up9SfhlI0/prpR2Eu+
 nP2A==
X-Gm-Message-State: AOAM533WOA17jJttCZ0kg76Qz0WcF4tw8HAPlt3UaIr/1VzuuF2h466S
 dYcLo6FYjQriv5vg1AuTd5GVMD9BkiQ=
X-Google-Smtp-Source: ABdhPJwoNo0yr9Xl5/g8pF7M2b4u7LMVRITjZFPwthVFeGjok2eci4VSyd/+f27acfMsyZXEgs3tfw==
X-Received: by 2002:adf:f486:: with SMTP id l6mr16934537wro.375.1632581494184; 
 Sat, 25 Sep 2021 07:51:34 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 z5sm17831428wmp.26.2021.09.25.07.51.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Sep 2021 07:51:33 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 03/40] hw/core: Un-inline cpu_has_work()
Date: Sat, 25 Sep 2021 16:50:41 +0200
Message-Id: <20210925145118.1361230-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210925145118.1361230-1-f4bug@amsat.org>
References: <20210925145118.1361230-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Eduardo Habkost <ehabkost@redhat.com>
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
index 646326b24fd..6a05860f7fe 100644
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


