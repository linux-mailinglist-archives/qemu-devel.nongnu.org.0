Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE582D31BD
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 19:09:21 +0100 (CET)
Received: from localhost ([::1]:43244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmhQO-00055x-V3
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 13:09:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmhIl-0007ST-T0
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 13:01:28 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:36429)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmhIh-0006Jx-Ty
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 13:01:27 -0500
Received: by mail-ot1-x342.google.com with SMTP id y24so16643069otk.3
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 10:01:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8XIA/+X37AvNazV2jisISm3ZiIWDvYr5zvekcj4Rlqc=;
 b=MEyfdmHyO5ZYzYpavTxAJgaKdPXfX0uLswewoIjU7PV5ffg2kHSDQLvWX5AOIngtdV
 EGltvz0+Lu9jW/ILjtYAHvKcHJA0BDOawSzUiJOdt7b/Wbe0xJioYpy6/t1tcfY1kMEB
 ipWbwChENe/xXJJF8IZvm4Vj9lDYkl0UpIjTpq/QZP+TqTWhLWZQe9BfThCufKt79PdW
 KRQuMGERdePhh0hQ0elY44i1gmzNrAtHgOYywR+AQuCaaFyQJlxd6A2S1mKNP7ROI/tO
 RKkUSZtv+KLj/5YDcONEaNI6qD29desxcsThKTQDzqvJgSNG/jJlVW8R9v2vQiZQ+yOE
 KIXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8XIA/+X37AvNazV2jisISm3ZiIWDvYr5zvekcj4Rlqc=;
 b=b38LzA+6WPMzLL3Jt52mfJUjENThSic6EdDAhDzUBr0g2v7jKaR3MaT0BmJu4SWVK1
 B4ilp0Bjc7i5qt9JCXvfZfQp7PAj/ZfDAYeRSCwGRW0an9bm726LJiZTD6JrTlsWUXTO
 znHr3LM+3CFL1fNr9D0JDyNTqOSiG3zFP1bDWokHz7yXLB7dYNcbMhYDnihxB5Cn/A3/
 Wq5snlPGH2LmX+Nv6L7AenbiFKW05EYeQ+PwgZ55ehIIKpHB1bDSpUHnwgFM556sBNNq
 SR1OZPvFWFc1XviWAeqWaZWmeHhFy6YI5+a2qHn7xVR4frI/CP3Q348Bs6dGBam6bO0K
 aU3g==
X-Gm-Message-State: AOAM531IyClpUpLgDkR7zYjVK48HLnEe0usnnovT/rdcjEALtLQnuUTV
 1397WqL9Tre2TQ62Sh6tzrXyexmqOWHw+bhW
X-Google-Smtp-Source: ABdhPJxX1ox/32eXbkRrjoawpmn8B1b9jsKe0IMJ1o29h47h8yo2MyPyqIlrKh4cyMJTeZDmHqRoCw==
X-Received: by 2002:a05:6830:10c3:: with SMTP id
 z3mr12056061oto.143.1607450482176; 
 Tue, 08 Dec 2020 10:01:22 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id k20sm3886805oig.35.2020.12.08.10.01.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 10:01:21 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 01/24] target/arm: Fix decode of align in VLDST_single
Date: Tue,  8 Dec 2020 12:00:55 -0600
Message-Id: <20201208180118.157911-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201208180118.157911-1-richard.henderson@linaro.org>
References: <20201208180118.157911-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x342.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The encoding of size = 2 and size = 3 had the incorrect decode
for align, overlapping the stride field.  This error was hidden
by what should have been unnecessary masking in translate.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/neon-ls.decode       | 4 ++--
 target/arm/translate-neon.c.inc | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/arm/neon-ls.decode b/target/arm/neon-ls.decode
index c17f5019e3..0a2a0e15db 100644
--- a/target/arm/neon-ls.decode
+++ b/target/arm/neon-ls.decode
@@ -46,7 +46,7 @@ VLD_all_lanes  1111 0100 1 . 1 0 rn:4 .... 11 n:2 size:2 t:1 a:1 rm:4 \
 
 VLDST_single   1111 0100 1 . l:1 0 rn:4 .... 00 n:2 reg_idx:3 align:1 rm:4 \
                vd=%vd_dp size=0 stride=1
-VLDST_single   1111 0100 1 . l:1 0 rn:4 .... 01 n:2 reg_idx:2 align:2 rm:4 \
+VLDST_single   1111 0100 1 . l:1 0 rn:4 .... 01 n:2 reg_idx:2 . align:1 rm:4 \
                vd=%vd_dp size=1 stride=%imm1_5_p1
-VLDST_single   1111 0100 1 . l:1 0 rn:4 .... 10 n:2 reg_idx:1 align:3 rm:4 \
+VLDST_single   1111 0100 1 . l:1 0 rn:4 .... 10 n:2 reg_idx:1 . align:2 rm:4 \
                vd=%vd_dp size=2 stride=%imm1_6_p1
diff --git a/target/arm/translate-neon.c.inc b/target/arm/translate-neon.c.inc
index f6c68e30ab..0e5828744b 100644
--- a/target/arm/translate-neon.c.inc
+++ b/target/arm/translate-neon.c.inc
@@ -606,7 +606,7 @@ static bool trans_VLDST_single(DisasContext *s, arg_VLDST_single *a)
     switch (nregs) {
     case 1:
         if (((a->align & (1 << a->size)) != 0) ||
-            (a->size == 2 && ((a->align & 3) == 1 || (a->align & 3) == 2))) {
+            (a->size == 2 && (a->align == 1 || a->align == 2))) {
             return false;
         }
         break;
@@ -621,7 +621,7 @@ static bool trans_VLDST_single(DisasContext *s, arg_VLDST_single *a)
         }
         break;
     case 4:
-        if ((a->size == 2) && ((a->align & 3) == 3)) {
+        if (a->size == 2 && a->align == 3) {
             return false;
         }
         break;
-- 
2.25.1


