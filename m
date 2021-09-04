Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22811400CE6
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Sep 2021 22:37:40 +0200 (CEST)
Received: from localhost ([::1]:51496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMcPy-00005N-Ll
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 16:37:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mMcNr-0005tY-3z
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 16:35:28 -0400
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232]:35800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mMcNo-0002sW-2J
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 16:35:26 -0400
Received: by mail-lj1-x232.google.com with SMTP id y6so4323120lje.2
 for <qemu-devel@nongnu.org>; Sat, 04 Sep 2021 13:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull-eu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gw4LvlnxnnY6EO7Y13J17phqBUMt7B/+5TuFjvc41YA=;
 b=0VP609CLonjyTaItmx73CH6Ce4KdxljnFKerfAPvDNMGx3if/uUXSGRn4yU7y94aUx
 cvGq0kYPxFFMkSRELlZT9HT77u4NIDV3zNKLk7U7zt3m73DXbXYiPlOOB6z6GailsMxl
 rTg26Ydz7Hw9FeERjDBVkb/Hi6EVjFsUBwzr/5XyOWWiSTY/wZubKoEhvWP5s5takmv4
 5mZwAjw30B/LPn6RVNb3clyr6XEYDqtnp6zn04NBv4mb4T/y70uB0oOj5mW6fBikniXA
 vsxn/EDgNLOhED/QN1rWRFENgKsZxrnj591SF+tX1B2QKgaJbxIiJ7FHuy85PlobkaYx
 vKrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gw4LvlnxnnY6EO7Y13J17phqBUMt7B/+5TuFjvc41YA=;
 b=OvTwjveH8f87gG937qzpAS/MjZqcHpkrtBX9EKCY69dfxtpqSlxbMh9Jc/2Qftp4TC
 P/MAUVa/1OGpFnoPoaqYG1mBJAJXIoiuja7cNwEbcxvA9SXFETA26taKKIsKQAi4lZT7
 wlsLjopUxZbv9kNGtSGvq8GeF+4WKYNiHOGIdrPKn+m0WaxaaI8VP8jf1N8dltshrznT
 UU0P+GvCjvC0oECNIo+tjahJBNDq44pg6EQ15x2ghRrKZ5j0pZxKVqQvK+Tuhl+pLlJU
 4n1zrVwiw9zjGqHBJPLlHU9DGtfdcX4ouLAjBY1vOj0JFQJmk7CVwtMOOuae/MDWcxkN
 +sow==
X-Gm-Message-State: AOAM531WQjf8MNFsdWvtHsaS5o+pN1C2JMZx4LnSQH/yPQ8a6DCga2rL
 rIWaZCj7x+Dn27egqagqMSLLh625rQi8qkTGYXQ=
X-Google-Smtp-Source: ABdhPJwA2t2cRXZ55AwqeEJfUXExOAZJJXNaWTwncYuTmo49Ex3igwMDhNAH5q+xH+DrPCpozMJRVw==
X-Received: by 2002:a2e:bf0d:: with SMTP id c13mr4028281ljr.101.1630787722425; 
 Sat, 04 Sep 2021 13:35:22 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id v15sm326304lfq.142.2021.09.04.13.35.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 13:35:22 -0700 (PDT)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v10 04/16] target/riscv: Add x-zba, x-zbb,
 x-zbc and x-zbs properties
Date: Sat,  4 Sep 2021 22:35:03 +0200
Message-Id: <20210904203516.2570119-5-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210904203516.2570119-1-philipp.tomsich@vrull.eu>
References: <20210904203516.2570119-1-philipp.tomsich@vrull.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::232;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lj1-x232.google.com
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


