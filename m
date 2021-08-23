Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 880D23F5092
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 20:44:56 +0200 (CEST)
Received: from localhost ([::1]:39610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIEwJ-00036Z-HU
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 14:44:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mIEuO-0000DY-Op
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 14:42:56 -0400
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132]:43003)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mIEuM-0004PW-KP
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 14:42:56 -0400
Received: by mail-lf1-x132.google.com with SMTP id j4so4986314lfg.9
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 11:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull-eu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lH+u7XNg8hdRaHs+LHf31CZbappX/W4Ry1la3tvwM+A=;
 b=HzN9YkE7TrNW30XgQv6uIX4WCklDhIrLppa7cnB73x1x6WxTpUbip0ERE8CB76Dujh
 FVzAPbV9QnBWXk5jGCKzEbz8jWGm/C9Ke5OkIcVUnaJvVR/l1LFooBwblZM287BUOvsO
 rI9QY6PbamAoMk2lF57U/UjTOhbuKiO/4gm+SykF4CItk7JI2jZKVcVoUGRlH6IYzb3A
 2fH37LcdWFzipS+0TSCBips3nODRgI8UF1urX2kUklucK8TULpw7t+aGXe336sv9ltF8
 HWJ55wpi52UyyoSO89qPrOQKyVwOJCoQcqm1pi3OAoKyE1ZtiFN/L6qo7/M3zCkJqq2X
 BdzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lH+u7XNg8hdRaHs+LHf31CZbappX/W4Ry1la3tvwM+A=;
 b=q5Bjh9GTItpnSq2+otxm82zHJBHpG32+Zk2syL3TEITJGaDy78gYzxzkVAbnl/dlot
 ZmQO2EH6/WeBDRbr93Y2eqznD5HgLpqBSNGgan1QKPm9/wixaKHpr3nRmehpPNpB2NVl
 xlPsd2qnVr8rt9rSMJ5KS3UzBILe2d/kfi4CLcGbourHYq1DLs28tIl0KhoqNqRQXLu1
 GhHuMeEOBqYrrQoar3i1xk1HjKb4IlpRWXQY5rQ7PM2kw+Wg+9ZGpb+T04ZAUcRyp0cw
 8zdVRtf/p1WKbpNBv7mc7Ew0ifr3biJDTZ8RO/5GXvjSm14aCAh3KKYym92zlVlcsp0f
 UFVQ==
X-Gm-Message-State: AOAM531PxLiKcduebaGYICPa8F6Xwlk90jCazaEBw5ngqRnKoExyZZMK
 OriLH/D8ATFkHoibkLANBPw7hCTgpYy70+CU
X-Google-Smtp-Source: ABdhPJx6WeVPqcGHjXUmxDuNZI7mtUtN1iGUsAZ7pBSDlKFksHK3RNIeZ3d63y1hkwDk7OQJ1t0SHw==
X-Received: by 2002:ac2:5b46:: with SMTP id i6mr25102189lfp.500.1629744172559; 
 Mon, 23 Aug 2021 11:42:52 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id 25sm1443794ljw.31.2021.08.23.11.42.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 11:42:52 -0700 (PDT)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 01/14] target/riscv: Add x-zba, x-zbb,
 x-zbc and x-zbs properties
Date: Mon, 23 Aug 2021 20:42:35 +0200
Message-Id: <20210823184248.2209614-2-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210823184248.2209614-1-philipp.tomsich@vrull.eu>
References: <20210823184248.2209614-1-philipp.tomsich@vrull.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::132;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lf1-x132.google.com
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


