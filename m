Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E08303F5032
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 20:14:06 +0200 (CEST)
Received: from localhost ([::1]:43036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIEST-000086-Ca
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 14:14:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mIEQE-0006Oe-2k
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 14:11:49 -0400
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136]:39692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mIEQ8-0008I5-0L
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 14:11:45 -0400
Received: by mail-lf1-x136.google.com with SMTP id f10so24903004lfv.6
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 11:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull-eu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lH+u7XNg8hdRaHs+LHf31CZbappX/W4Ry1la3tvwM+A=;
 b=AfqYjYH9DseLcigSSVBOt87Y/Ouv2pp7HFpIwRvp4ZRfRRsH6Xd9gzg6JU4siT8h3/
 gxwroRqc4kC6iXagXc0f8Nt810GGehBsEYWgAYZfO3KRx2P1M8aSwZxIlzsAtqonQMzN
 zdqoIoAb1jDuAG/CeBUIz4CblJ4RK8kY0V1BHK5nuoiQk7Wh3d0z6zKCQo9Ay60iKt4m
 4dXlWx5xKCsFlqRjdZ+s0pfD3o6y1776lLKuMlAlC7fQ75ZAg43KkFaaEsac7ykmn+au
 CSmPiGBpXn98rhPwKl/8x4sqX++Xp1jdBi1870J/cBLa+I0NWjguAp7B9o5jMYDrpnjv
 16kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lH+u7XNg8hdRaHs+LHf31CZbappX/W4Ry1la3tvwM+A=;
 b=HrXUEj2Qy9/b1LYDjn56O9Lx91Gl+/duM+EcSNJUFRFyiOItGLch8F+GmYb67eHA7K
 ypdYovsVZYQUVdn8Qd3EhP9YIPyr7HD0T/otdk/9nmkXia3QVjboTenhpvnask8BRXSy
 nNDbt3s3+bNKbyR6/UIuh5cupwUF6m09NEmdSd+PT1nL/YQg1rzDZGQKsLOZPZihmbrx
 4sGh2FpflgTpfpAkzQizDbvDWJ3O0UehIY5Rvl+6FjgtEoGvHG1Hed613rWseE1BR22M
 E0d6z3fOkyKfyBnABbJl+h/Ftk5+zajYAwJ4tF7LzJtAuPRLYauSokMGgxIt6Q1Ln9w9
 InQw==
X-Gm-Message-State: AOAM531r97qHY++XXyKc7SILEu7G2frTA0kCKtk+WtGLES69+3PuuN8u
 D+bNeDHjKj3WbBsKGWI4155FXmaxPkdRkw4U
X-Google-Smtp-Source: ABdhPJz8/UZfrkloJNP52uyHSr8I8QQKv5WKI3+/+2T4E778bdtTkWNuZvRkQYTiRYSQpumoyR5GhA==
X-Received: by 2002:a19:4941:: with SMTP id l1mr22019524lfj.544.1629742297345; 
 Mon, 23 Aug 2021 11:11:37 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id w26sm1511739lfk.223.2021.08.23.11.11.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 11:11:36 -0700 (PDT)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 01/14] target/riscv: Add x-zba, x-zbb,
 x-zbc and x-zbs properties
Date: Mon, 23 Aug 2021 20:11:19 +0200
Message-Id: <20210823181132.2205367-2-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210823181132.2205367-1-philipp.tomsich@vrull.eu>
References: <20210823181132.2205367-1-philipp.tomsich@vrull.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lf1-x136.google.com
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


