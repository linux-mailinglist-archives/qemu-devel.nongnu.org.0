Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 151CC257E8E
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Aug 2020 18:20:41 +0200 (CEST)
Received: from localhost ([::1]:36670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kCmXw-0006ll-1z
	for lists+qemu-devel@lfdr.de; Mon, 31 Aug 2020 12:20:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kCmKV-0004bH-7A
 for qemu-devel@nongnu.org; Mon, 31 Aug 2020 12:06:47 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:37657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kCmKQ-00060S-Fs
 for qemu-devel@nongnu.org; Mon, 31 Aug 2020 12:06:46 -0400
Received: by mail-pg1-x52f.google.com with SMTP id 5so838634pgl.4
 for <qemu-devel@nongnu.org>; Mon, 31 Aug 2020 09:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eBuYjOca47LEZmSV1uuh9RJRYYiGMfYcTJpeBHPz1GU=;
 b=zkkg6TU0P3yF09nRqOhGKhvfKddqJKa1Mq36VYO9CDKF159O66olqiy1+Chd1Y0vBY
 lF9wlTxknYTJK6xcgNOAB4e8LsZpLqsJXWq8F8rES90kNsKTfUsUncEt231kdwA86ckR
 4GG4/e7F3U8PCIhEP9OJyg0TcIMV1cM70AgFs4vqAXcn33RpYFzV13WgNtWT0xbPgBb4
 Uw2owhQ+waBVb7YobxDhjDYuwtVmGKH2Sm1VavhgJVdoLIpJj5O/2Fa0pqwVOotWd4oW
 QRu9id3N0jGYU5Ae8/VpAqdIEpbSx5GhB3QTb6uMKSo4M1OfT+S5fv7Rd/+YT3871igz
 VxIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eBuYjOca47LEZmSV1uuh9RJRYYiGMfYcTJpeBHPz1GU=;
 b=ZNXb7MaGupsrVLmQMUi6cl+MfWxU/cMUwM6BJNPWex73TTsVSQDKLZzBykQKhiU+x3
 rW3Qn6pttttWtoTAb4hgLEzS/1uCWk3X+vMjJpx7YKkbiCPxcPyAElt9y4EI8XGmWWXi
 BITxl114wvBEL/av00aJe/gvMmJbzmMSKf6KQDcEgxNt1PoKe04jDZisl+t3lQwV6EV9
 /7pqdKGN2kgs9HGFqx82eadgsHq/KCbtJ5nxo9FrYY7+s/OmdS5RLE/Pa8NVmwkwj91B
 0G4RvbSgyc3I0VYIihp4EWPpzrvf+y8JwN8Jq7UCR/XLuomgRKPO7aW1/2luX1fpboR+
 7KFA==
X-Gm-Message-State: AOAM530+K7cBarUSdCUEabzKlAj2Uz4hQmE5LBMz4CL7kGQM8KNlXyxN
 3PGEnbIwLwZb0jt6XUWLF6rYRAvBuL9WtQ==
X-Google-Smtp-Source: ABdhPJxpp8RfSgMH39rdDZjhYdPl5qMCXUQ6sHJdLvUwKnzuJE8AfUveuQatqj8olVxxbTkw3YNMDw==
X-Received: by 2002:a65:4183:: with SMTP id a3mr1697519pgq.448.1598890000252; 
 Mon, 31 Aug 2020 09:06:40 -0700 (PDT)
Received: from localhost.localdomain ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id gt13sm17218pjb.43.2020.08.31.09.06.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Aug 2020 09:06:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 27/76] target/microblaze: Check singlestep_enabled in
 gen_goto_tb
Date: Mon, 31 Aug 2020 09:05:12 -0700
Message-Id: <20200831160601.833692-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200831160601.833692-1-richard.henderson@linaro.org>
References: <20200831160601.833692-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Do not use goto_tb if we're single-stepping.

Tested-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/microblaze/translate.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/target/microblaze/translate.c b/target/microblaze/translate.c
index 53ca0bfb38..2e753fa621 100644
--- a/target/microblaze/translate.c
+++ b/target/microblaze/translate.c
@@ -140,7 +140,12 @@ static inline bool use_goto_tb(DisasContext *dc, target_ulong dest)
 
 static void gen_goto_tb(DisasContext *dc, int n, target_ulong dest)
 {
-    if (use_goto_tb(dc, dest)) {
+    if (dc->singlestep_enabled) {
+        TCGv_i32 tmp = tcg_const_i32(EXCP_DEBUG);
+        tcg_gen_movi_i32(cpu_pc, dest);
+        gen_helper_raise_exception(cpu_env, tmp);
+        tcg_temp_free_i32(tmp);
+    } else if (use_goto_tb(dc, dest)) {
         tcg_gen_goto_tb(n);
         tcg_gen_movi_i32(cpu_pc, dest);
         tcg_gen_exit_tb(dc->tb, n);
-- 
2.25.1


