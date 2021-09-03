Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D084003CE
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 19:05:37 +0200 (CEST)
Received: from localhost ([::1]:41868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMCdE-0004Jx-If
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 13:05:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mMCYy-0007HA-92
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 13:01:12 -0400
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133]:46979)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mMCYv-0004z4-8o
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 13:01:11 -0400
Received: by mail-lf1-x133.google.com with SMTP id t19so12967610lfe.13
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 10:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull-eu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gw4LvlnxnnY6EO7Y13J17phqBUMt7B/+5TuFjvc41YA=;
 b=HlXsjpi3wJFwDqWVolQAC7/Q+8Qqf9yltQ+pCIN35IrvwYkxKselHnKw559B6DIXjA
 R+soXKPqgO2NT2xbV2Ihg8tgVElguN9zHhVSNZ9/btdhzlORkLDJd0Yd22JLMdPSFsHx
 tJ7yuq/328V2EvlEv9Oy0UOCrx9OGu9i3pTiPVYziHbpy/2shAeWcgs1WyWxEPhXSPqY
 9aTAR1hMrrJ3PXuk2e7itktKSChksWsYCgn9rDsXhyU0mZFWZU7sgT6CHURlrEu5oPK4
 cTae43NMjxrBE5L4cBBG7BBEjQKRLbNfJHHefDnJ3f4L/gVljPn3hCDkZj3Eg1RFB7Bj
 yTDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gw4LvlnxnnY6EO7Y13J17phqBUMt7B/+5TuFjvc41YA=;
 b=NMzdVKy9mI+YQeNN/RZH8DDdEI2ujKBw4fAskvbf3Y3frOKyjaqrqh5SnRp3OASbjA
 hSLv0YXvMA4jk/W7Dwoyw3ogwhIZVmfrW5wdm5Jvsg3zt1O/bbiLb5o3sq/SDwABBNL1
 WqZiGScppLNNWhRCjqidYztLANZ2J/kprFftTFjm8NCCecDZXdSVp72iWgeuQMAFge1r
 61CBeLHf1ytCrOE+d8W4kXl2xnVR/YrkK/02dUi3fiJ/ePjNtcUGDcIiX/hcQs/7bIJE
 QLCJpqs+M+691R1M82O5bFXf0E4pWNsJn6nbxR+pU7R5ocsIMl9y8JOWISq+piDJ7T81
 qYaA==
X-Gm-Message-State: AOAM530MoUh5cfrRjmXfaPhtQIItNKzjgflFoyF/eqCm7DlApyyBWiYl
 2mjQYmcvv9lMAp9EfQfRDg9cIsBQBl7LTBm6xvQ=
X-Google-Smtp-Source: ABdhPJwu3awEr901GQ6OXdcHMaQkKIey8RFnxVgZDXvsG8fNSRozc6iFdnx8jz+33q0T4PmnYCCXaw==
X-Received: by 2002:ac2:4d10:: with SMTP id r16mr3050772lfi.546.1630688465846; 
 Fri, 03 Sep 2021 10:01:05 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id c3sm628401ljj.77.2021.09.03.10.01.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 10:01:05 -0700 (PDT)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 01/14] target/riscv: Add x-zba, x-zbb,
 x-zbc and x-zbs properties
Date: Fri,  3 Sep 2021 19:00:47 +0200
Message-Id: <20210903170100.2529121-2-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210903170100.2529121-1-philipp.tomsich@vrull.eu>
References: <20210903170100.2529121-1-philipp.tomsich@vrull.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::133;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lf1-x133.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Kito Cheng <kito.cheng@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The bitmanipulation ISA extensions will be ratified as individual
small extension packages instead of a large B-extension.  The first
new instructions through the door (these have completed public review)
are Zb[abcs].

This adds new 'x-zba', 'x-zbb', 'x-zbc' and 'x-zbs' properties for
these in target/riscv/cpu.[ch].

Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---

(no changes since v3)

Changes in v3:
- Split off removal of 'x-b' property and 'ext_b' field into a separate
  patch to ensure bisectability.

 target/riscv/cpu.c | 4 ++++
 target/riscv/cpu.h | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 1a2b03d579..ceb7e01810 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -587,6 +587,10 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
     /* This is experimental so mark with 'x-' */
     DEFINE_PROP_BOOL("x-b", RISCVCPU, cfg.ext_b, false),
+    DEFINE_PROP_BOOL("x-zba", RISCVCPU, cfg.ext_zba, false),
+    DEFINE_PROP_BOOL("x-zbb", RISCVCPU, cfg.ext_zbb, false),
+    DEFINE_PROP_BOOL("x-zbc", RISCVCPU, cfg.ext_zbc, false),
+    DEFINE_PROP_BOOL("x-zbs", RISCVCPU, cfg.ext_zbs, false),
     DEFINE_PROP_BOOL("x-h", RISCVCPU, cfg.ext_h, false),
     DEFINE_PROP_BOOL("x-v", RISCVCPU, cfg.ext_v, false),
     DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index bf1c899c00..7c4cd8ea89 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -293,6 +293,10 @@ struct RISCVCPU {
         bool ext_u;
         bool ext_h;
         bool ext_v;
+        bool ext_zba;
+        bool ext_zbb;
+        bool ext_zbc;
+        bool ext_zbs;
         bool ext_counters;
         bool ext_ifencei;
         bool ext_icsr;
-- 
2.25.1


