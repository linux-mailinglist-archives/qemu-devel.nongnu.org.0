Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23DED6A43FD
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:15:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWe69-0007BG-R7; Mon, 27 Feb 2023 09:03:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWe5p-0006pB-Qg
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:03:13 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWe5o-0007oR-0b
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:03:05 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 j19-20020a05600c191300b003eb3e1eb0caso2597366wmq.1
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:03:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Euo1mVZ9KQXkgUiufbSnGXc0i86rjJnd2lRq6TKk/1o=;
 b=E0RRjZnrRwwziaI2CnaIHuFEfLmr2FzdKF3m86mnBPsxHTyAWUK/5NOAdFJ03Exx2r
 ozBH+VpHJplyJyWqCSxXmkAP1nskiaZuSW+Lg5WjBJBe6Iyi3vESMwHtBDT0i7jP2YS7
 UW6rrtY/Knvp5PnM+3Dw8dx6bhpW+cS7BHQO/XJ8BnZfRs4X0CSB+IJKWhn1L8Tbq0uN
 WFlm1VCWwC6XbB/StvwXz8ZrHt1ZhHpHbSmWwKpDXccfgqWZGq5xK6fK3IVfzuj6irju
 Xf/YX+qIay2AbDHD0jtPJgVy/9L40Dwx1QhLZQ0ERrZ0t22DSpPl7GOg2l77j8pwHFfH
 eRlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Euo1mVZ9KQXkgUiufbSnGXc0i86rjJnd2lRq6TKk/1o=;
 b=Y8uCK5nku5SaR3aH24hn2AruXe+XjfxD33HNDmwlrT7R7WZKJrkSGyANHmGv8sDesT
 hI3tQ1eb461JRrHVyeUf5vhPo5lRkp8j9BhBddb/i6Xtvv6BJwkyWo5RQnm9tZZdIp5K
 Max/5sknqHzj//DxfY1+sFR29szlkuOBy3mXa0nlipFWB3cf/WMkk+WH0cL5bOrIYt2V
 2FqC/ndmoogk4oGzr2Mfm9MuHizJ3weJZItguwhARk4U25XOBzPUrSb5FsPCK8i6t/pm
 CZPeydLiLV/OJgZX3dwhZkyAzxbLflP2kCHNa2LySIwis4QHq7JpHwN2IeBw1dprmfYu
 Xhaw==
X-Gm-Message-State: AO0yUKVA7mAd2Mk/b30rYLRCmp5qVVUvVUYVImNiDhR8n/xgnSp7lKuM
 KcTdM7pt7fK15Jk1GHgpJxrJlmP7Mj08r18L
X-Google-Smtp-Source: AK7set8uRw1G5jc9O0eHPg2G942XBERfGjd8u0gyxf0gqpWk8ZmxAVloTt6q4r+CgTw9UTR5B8jXqw==
X-Received: by 2002:a05:600c:331b:b0:3df:e4b4:de69 with SMTP id
 q27-20020a05600c331b00b003dfe4b4de69mr18232984wmp.27.1677506582217; 
 Mon, 27 Feb 2023 06:03:02 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 o19-20020a05600c379300b003e2052bad94sm12628345wmr.33.2023.02.27.06.03.01
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 06:03:01 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 018/126] target/riscv/cpu: Move Floating-Point fields closer
Date: Mon, 27 Feb 2023 15:00:25 +0100
Message-Id: <20230227140213.35084-9-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227140213.35084-1-philmd@linaro.org>
References: <20230227140213.35084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20221217172907.8364-7-philmd@linaro.org>
---
 target/riscv/cpu.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index d8e72c3e7c..31537fc05f 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -148,7 +148,6 @@ typedef struct PMUCTRState {
 struct CPUArchState {
     target_ulong gpr[32];
     target_ulong gprh[32]; /* 64 top bits of the 128-bit registers */
-    uint64_t fpr[32]; /* assume both F and D extensions */
 
     /* vector coprocessor state. */
     uint64_t vreg[32 * RV_VLEN_MAX / 64] QEMU_ALIGNED(16);
@@ -163,7 +162,10 @@ struct CPUArchState {
     target_ulong load_res;
     target_ulong load_val;
 
+    /* Floating-Point state */
+    uint64_t fpr[32]; /* assume both F and D extensions */
     target_ulong frm;
+    float_status fp_status;
 
     target_ulong badaddr;
     target_ulong bins;
@@ -379,8 +381,6 @@ struct CPUArchState {
     target_ulong cur_pmmask;
     target_ulong cur_pmbase;
 
-    float_status fp_status;
-
     /* Fields from here on are preserved across CPU reset. */
     QEMUTimer *stimer; /* Internal timer for S-mode interrupt */
     QEMUTimer *vstimer; /* Internal timer for VS-mode interrupt */
-- 
2.38.1


