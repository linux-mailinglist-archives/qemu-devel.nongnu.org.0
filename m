Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C21C3FB481
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 13:25:15 +0200 (CEST)
Received: from localhost ([::1]:51550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKfPU-0000JQ-82
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 07:25:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mKfGf-0006z6-EY
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 07:15:57 -0400
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130]:44616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mKfGc-0004YS-K6
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 07:15:57 -0400
Received: by mail-lf1-x130.google.com with SMTP id s10so5600226lfr.11
 for <qemu-devel@nongnu.org>; Mon, 30 Aug 2021 04:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull-eu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iFrdZ0kMv+PZ8RQYkPNFa0LTHTFe0e6o8JJ2FLkYzDY=;
 b=R3EFplDuo24WAwu7I716Oo5JsiOwWcVBGeU920ApiBwbNzQyZyW8Qe5/Q8ks9F7zQ8
 Ivo04DXrCIY19h9OBQ2JeI/xJbtYQFsXF21xM+NjB7dFw7igVSk+aL2gtO485zi/0hIT
 m1wFCYFHqvA9HQ1tsfZ/RU4napL/5m6uensCmpVlb8iTp+YQ6AXiUwP77qnVF28OTLaI
 Xs5hHF2KBNHktYk4nt1Md5PJ8UeDDQYXOvzUdbXc+8mKOi4KX8qsxaZCc9L4e0WPkE+Q
 TCpeLvTng74Ioo5sZzBxKEVIZ+39BxBHagBZ1eC8PWGGvea6B2wbt1aKKfcO893ZZ8lA
 wAaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iFrdZ0kMv+PZ8RQYkPNFa0LTHTFe0e6o8JJ2FLkYzDY=;
 b=qePTuFxnB/KfCkAlb9gsLrhMCWRWMpyLtQZI2SloiXjCZu+Tjo9cTSQ56hedjqAupi
 y+VX4AWwvbcLal+gu5/vJmXPQBky3MmbdRcQs3ZEc/iT8J/UZD9kNzQuBMEzEmyEskh0
 kyil/YIn8Tf+G01+63a0h6EiEtrGjzqVoWcGGXehIYaezzN1h694xekUCbao8qT+CSma
 4eONB036GLN3xzpVpFl439GhzXNnJA+/PGQz/9dXyDW7bQtoispKRElPp7QTt+qofSUZ
 /TaXogywjC4JfSraly3DYMbZG/C0TMv7IGND6ymdeSzVqmEmbshEm5beU0L50gkvRzz1
 Or+Q==
X-Gm-Message-State: AOAM531zYaNRMT19u/uBcNsA6ac8UCTHwpulzfOx8Mp9urSda1kGDAqn
 gmaUoOQ3V0sXqs/z/9bHPn6NL2ZbUP35HZqj
X-Google-Smtp-Source: ABdhPJzEKbE3dlfgulfXNec+w+yDA8N24bjhf234Ed60zfgXkANW4dWCns9W74vkqyPC10rksZFSKg==
X-Received: by 2002:a05:6512:c3:: with SMTP id
 c3mr6471961lfp.364.1630322152803; 
 Mon, 30 Aug 2021 04:15:52 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id j3sm1790129ljq.84.2021.08.30.04.15.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Aug 2021 04:15:52 -0700 (PDT)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 10/14] target/riscv: Add a REQUIRE_32BIT macro
Date: Mon, 30 Aug 2021 13:15:08 +0200
Message-Id: <20210830111511.1905048-11-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210830111511.1905048-1-philipp.tomsich@vrull.eu>
References: <20210830111511.1905048-1-philipp.tomsich@vrull.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::130;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lf1-x130.google.com
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

With the changes to Zb[abcs], there's some encodings that are
different in RV64 and RV32 (e.g., for rev8 and zext.h). For these,
we'll need a helper macro allowing us to select on RV32, as well.

Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---

(no changes since v3)

Changes in v3:
- Moved the REQUIRE_32BIT macro into a separate commit.

 target/riscv/translate.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 5c099ff007..aabdd44663 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -417,6 +417,12 @@ EX_SH(12)
     }                              \
 } while (0)
 
+#define REQUIRE_32BIT(ctx) do { \
+    if (!is_32bit(ctx)) {       \
+        return false;           \
+    }                           \
+} while (0)
+
 #define REQUIRE_64BIT(ctx) do { \
     if (is_32bit(ctx)) {        \
         return false;           \
-- 
2.25.1


