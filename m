Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6BD33F7B06
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 18:58:35 +0200 (CEST)
Received: from localhost ([::1]:54522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIwEK-0006Nk-RA
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 12:58:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mIwCl-0003lQ-TT
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 12:56:47 -0400
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b]:35579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mIwCe-0007Ca-Mf
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 12:56:47 -0400
Received: by mail-lf1-x12b.google.com with SMTP id i28so388761lfl.2
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 09:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull-eu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lH+u7XNg8hdRaHs+LHf31CZbappX/W4Ry1la3tvwM+A=;
 b=r3QsLqMkG8irADAVv/hBvM81DLNjcdki1jTChdyl/drdmK4qOXwSrodpFrIA+fRA4O
 REJaeTp09lcyTtUIx+pcjV8w7CVtWlm9w8SHkUuSwAB42aJwWY4ISekHur5eCHr3MLC4
 8o/enGYuNntcayKKs5YqEozFDQ9LyM6GSh3uvhxMr8+td5HFgHxijkcES5ZfYOzUKZgU
 ENzst2yNhYJHxdQnbRzrsjb2D9K/QDOdXrBmdZsDUsCF73uOD2EnnoBdZhjZGQ9uqd+p
 ZlEk5nYz4Ba9/MeHeaxV58QvADprpf938K0YzCh8pPcZygMHNBPuo088s26PBgut5FAB
 swTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lH+u7XNg8hdRaHs+LHf31CZbappX/W4Ry1la3tvwM+A=;
 b=GqJIjdbkpo2r4+yFz1ESG9LMnk/S5LQ0Pzc9Vz751z+ss4S4kg0cRjh6rcxhYOuzcY
 QpedS+eFYcKBmZHnORVJLYJnzAXTVJi4Gdm+Kwjt37hkvK0T+DDX3ao4dP7U9Ytgz4MX
 +k+nZUJMkZw+CKI/0yXEs0vWTHrNyYSdLQZEz79b3gW3Ad8RlgEVjJoe1XZl7gSqVhn5
 7b3zy288y6Ay0/jXu+A65xrcZCtNwcMe0YD9NlSfQIbmbs3eKvk98//XRm2P7jKAG4Pf
 +cOtJS7k5kdsrUZOxiVdO2LHq8c5UJf1oJZh/m8fZ2caD7hhyKwj53drylLahTWCoZTa
 fxQA==
X-Gm-Message-State: AOAM530VYmuZxzchriW2ofgxblBtvfuFjtQm0NI5UHW1VnFWYUS9Vf49
 LfdPGSeatw9Kn4uerMi+6wgxH7e0iKh/PS4Q
X-Google-Smtp-Source: ABdhPJxH1oPf3XoWtfsIfK35buACdfXISy5/rpJBQA61a47Gid6Z2veacy+bnFu/SGSzptr3BrMRBw==
X-Received: by 2002:a05:6512:3a8b:: with SMTP id
 q11mr33109755lfu.582.1629910597679; 
 Wed, 25 Aug 2021 09:56:37 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id i8sm55686lfl.280.2021.08.25.09.56.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 09:56:37 -0700 (PDT)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 01/14] target/riscv: Add x-zba, x-zbb,
 x-zbc and x-zbs properties
Date: Wed, 25 Aug 2021 18:56:21 +0200
Message-Id: <20210825165634.32935-2-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210825165634.32935-1-philipp.tomsich@vrull.eu>
References: <20210825165634.32935-1-philipp.tomsich@vrull.eu>
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


