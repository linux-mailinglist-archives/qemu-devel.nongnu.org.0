Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C08EC3FB46F
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 13:18:25 +0200 (CEST)
Received: from localhost ([::1]:56458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKfIs-00011i-7f
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 07:18:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mKfGY-0006lH-3z
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 07:15:50 -0400
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235]:39778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mKfGW-0004Uz-31
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 07:15:49 -0400
Received: by mail-lj1-x235.google.com with SMTP id q21so25180374ljj.6
 for <qemu-devel@nongnu.org>; Mon, 30 Aug 2021 04:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull-eu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UZI0NUZRO7vu+9LyPmqcshPjbI4d0gEmRAaBgXSjJvo=;
 b=DXRz53bQ89P74B0S+rvRHjFMWXEmUGyrNoYD7y+qv6yvGGFe/4552N01dLVSYgssyG
 jmHIWyR38h1m3bknqRaG4cY+ds+YoGtXK8LRE+lQ4q496+HxYHQIpp679MiN9p+ozMqU
 Fl48vTUWEdHyRKxTfMdyyQ49CoB+Nbc4YLq0iNNMFcKPvQpljVqYMtlwDD+MtQp2o7IR
 hajRpVznvI684XyR1OqrzHwFJFB1nShj0ufIeeC6INKGqqrRO+sSxulbQNjInhyL3MZC
 lMmULAN0BlDbiPRa4GrTmdPFzZzEXfn7z8WpbfJ0vM1fV/0JlkbamlYWdsVhkrtk3Vm3
 7ldQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UZI0NUZRO7vu+9LyPmqcshPjbI4d0gEmRAaBgXSjJvo=;
 b=UhRVIA0yn5r5jdqba0Om0R+QsHCvbx8yb38Jb3/HvnwUZ6WythUokBXImM8s7XT8i1
 fkUXConeny9NW/F0sA372y4fEYRpbquOCa0iWaaSxrsfLopBUiTK1TmZDYaxI5OGXyMS
 eHFijhd2IeXaxCESdh2NYsLSeU9X2DA6qTnZwbMeN8/OcLk/nMmelCMDVmhMXxRr3iNe
 sjPCZcNGH8Lrc+Z2Ki8U+wfkP4PXrX0Kk0Lzi+yOtG2iCXJimFle7r9ex6ten6eYU7iM
 bZkXg1lKnYb7lHS1HwgzIGQ7xnx6eeoRAhSkzBplt0xMg1AjpvDidoZtzh6dqYRqhiVU
 jR+g==
X-Gm-Message-State: AOAM530BP2EXp50M5gu1TavgLRQOWkSmFiNjtAmV6UXh+RN1/D30ThjG
 tZpsouoHClD+RWfRs0QyiysP3uj0oG8GwpoK
X-Google-Smtp-Source: ABdhPJygPfydvKLAaAB/TT4ag33WsnLVDLyxWSYZNEgrbGBdhfl0aiG9Z1hU0edxUfdrPNdEHS7lyQ==
X-Received: by 2002:a2e:a785:: with SMTP id c5mr19525350ljf.434.1630322145316; 
 Mon, 30 Aug 2021 04:15:45 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id j3sm1790129ljq.84.2021.08.30.04.15.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Aug 2021 04:15:45 -0700 (PDT)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 01/14] target/riscv: Add x-zba, x-zbb,
 x-zbc and x-zbs properties
Date: Mon, 30 Aug 2021 13:14:59 +0200
Message-Id: <20210830111511.1905048-2-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210830111511.1905048-1-philipp.tomsich@vrull.eu>
References: <20210830111511.1905048-1-philipp.tomsich@vrull.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::235;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lj1-x235.google.com
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
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Kito Cheng <kito.cheng@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
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
index 991a6bb760..c7bc1f9f44 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -585,6 +585,10 @@ static Property riscv_cpu_properties[] = {
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


