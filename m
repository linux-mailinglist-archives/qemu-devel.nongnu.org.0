Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1583F7B21
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 19:04:53 +0200 (CEST)
Received: from localhost ([::1]:43972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIwKa-0001Yf-5X
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 13:04:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mIwFd-0004LK-Hc
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 12:59:45 -0400
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b]:33631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mIwFb-0000Zb-Mp
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 12:59:45 -0400
Received: by mail-lf1-x12b.google.com with SMTP id p38so494700lfa.0
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 09:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull-eu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lH+u7XNg8hdRaHs+LHf31CZbappX/W4Ry1la3tvwM+A=;
 b=Cg+6p9zZqzWRAXzRT3F/bIXzNRCIz3ypz4lsesD0iSwioIGwFai+HDKj+j1t+3zyzg
 lM1M+y/MmRXO5y35Vnr75y+WdUX25PH8jyVNqewLBrpZP745NXYGx3X44HMbeHwWGGR0
 vZDBXoQCnCOwxWQfu53sBPWYYAZgCMDy5PhwXs3+IUa/SOngxEPV5vIK/STocVnBy0W2
 fqZwSBmflR+bdiZwZus4IP9/50hsenFQ2UAOT4SOnQh1PCK9JMy6aIDBDAYeeKxtNnJy
 dywVR2DFD6uGiIhKKuhjfNSf4YWSwXyGpXkpKwWHZI1xCtTYYKKEcftpRNyL3wxS80SW
 L+hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lH+u7XNg8hdRaHs+LHf31CZbappX/W4Ry1la3tvwM+A=;
 b=oDWMboE1B+3Rxul0JmCOfWRwFXSVijJHJO0V2ONDSouL/xPihUkmqBCvwbMCRUhRGO
 MLbiryC/fqEnJSu1A7EmX40QAtuuFoDJ62mMtWihp3gdIVpI0ezOjfodUlnFW+D2kr0b
 +QGAFDOb1C3iUV73wnpu/5wFdigXPH1wpz0QsoPN2AWtum/+hjLnSCCnGmV33mX3XLfX
 3P6mRT8sWbk1vWB7jQsp7u3ksaHW4HHeB/wg4txQCeo+AeLDDQLsTolzi015WzErA1qJ
 DtycdX+hREA03FUbpR2Tg1dfxiNi0S6sPS62/KdZmgPbNbB5v5MW0Kgu5EE2nxFH0D6Y
 r4EQ==
X-Gm-Message-State: AOAM532FNwLLiRBrIl/TC+LnVuY6zsQcmWRzcQrgU/h2LYLR2n8lq5kD
 OXL/I2Q5GTSlCHzoWyFLUxrTasV3Iyf5HqFX
X-Google-Smtp-Source: ABdhPJxi0sCMmplNH1xjDpeFVPs/5s3g5M2r4D+vWgVAjeQyu+J22MgIishVvJpHvHb3+pG747iXlA==
X-Received: by 2002:a05:6512:3ef:: with SMTP id
 n15mr11248445lfq.184.1629910781679; 
 Wed, 25 Aug 2021 09:59:41 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id r2sm59619ljj.14.2021.08.25.09.59.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 09:59:41 -0700 (PDT)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 01/14] target/riscv: Add x-zba, x-zbb,
 x-zbc and x-zbs properties
Date: Wed, 25 Aug 2021 18:58:54 +0200
Message-Id: <20210825165907.34026-2-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210825165907.34026-1-philipp.tomsich@vrull.eu>
References: <20210825165907.34026-1-philipp.tomsich@vrull.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12b;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lf1-x12b.google.com
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


