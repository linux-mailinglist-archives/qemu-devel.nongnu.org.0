Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A807760AC1F
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 16:03:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omxSK-0003E7-0L; Mon, 24 Oct 2022 09:25:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1omxSE-0003Ao-Qk
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 09:25:22 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1omxS9-0003s1-HA
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 09:25:22 -0400
Received: by mail-pg1-x52a.google.com with SMTP id f9so4279124pgj.2
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 06:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=kp9LhfiuTjCmNa2oeYI903Zjr+KKaYkdyPt5aXd4y5k=;
 b=drBwzOMzv4NaVk3IbLYWl9TOEMQRyBsd6/pdSeCDbVi94/Sci3QaRclVGg3QmTvhme
 Fbycm9ol0Y37h8MGYmK+bQdkiyir6hein86YAGjEyoErGfsPajoWe3I+hdMEbjLMT929
 pIP+C3nUb/EOhFNG4dW/GNgwhCKkbj00KfTZK1yfCNpdUEPqquJ5IgP4CzDTw42AybPo
 MdAN9/33v9qfSau9yR1qbgW3/w3ZxaUWfmuB46rGuRl6GSyn130evPb1lI0WiLZZhHuv
 HKx3Kh7iQD7HlTgyMYTIc9YxvTsAJwZgUHw/nAaDv0j4ZOgAn3aAZ2LQcnyk688gLL3H
 b/aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kp9LhfiuTjCmNa2oeYI903Zjr+KKaYkdyPt5aXd4y5k=;
 b=wIMpM0IHVRTju2ogZRklIYAxLYc9ZU+gmNE9WT7FinUYhrdnISbPaOkilhavdZ1iDX
 ReXIpYJapYfI5o7DgvAYQHH1RBsgVhY9Utoxj1++WmB+jQomDn+MDQnm9RsF9fDHonBa
 3XgHQvubbG37IIiUkP/i9XM2egUStH6IDv3bHoID5ueN1YVWzVQyM0Bp2lq8RdEwRTJ2
 YtZsPBcbQsdmJNROz1FRm0+57fBeLqA0iDUSI0eS5jfCBP+3jx3E+U8k+6cG94HKzVCe
 bSZOWSLkMfx3edz57nZeqgNa86ilTHz6RUBtFO5KG4YiS6xG9WYHtcI357PUgQdKYH2G
 Se2Q==
X-Gm-Message-State: ACrzQf1JzeZ+qRDT9a4EzxkDy/AsolI87SEgxyWDeS8qOaaFERKVr4UG
 KrVdHAbY1O3Hp5mEf5bbIJYpKHMIhJqlOQ==
X-Google-Smtp-Source: AMsMyM7MMABIZ4EmDokCZWpjfCwjFn4AFrEBKTbi7gNH30wIxdx6hRRVc0X27gk8XY1w9bLeZCYbIw==
X-Received: by 2002:a65:6bd3:0:b0:42b:9117:b9d1 with SMTP id
 e19-20020a656bd3000000b0042b9117b9d1mr28067014pgw.238.1666617914720; 
 Mon, 24 Oct 2022 06:25:14 -0700 (PDT)
Received: from stoup.. ([103.100.225.182]) by smtp.gmail.com with ESMTPSA id
 b12-20020a1709027e0c00b00178ab008364sm17009216plm.37.2022.10.24.06.25.12
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 06:25:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] tests/tcg/nios2: Tweak 10m50-ghrd.ld
Date: Mon, 24 Oct 2022 23:24:31 +1000
Message-Id: <20221024132459.3229709-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221024132459.3229709-1-richard.henderson@linaro.org>
References: <20221024132459.3229709-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

More closely follow the default linker script for nios2.
This magically fixes a problem resolving .got relocs from
the toolchain's libgcc.a.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1258
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/nios2/10m50-ghrd.ld | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/tests/tcg/nios2/10m50-ghrd.ld b/tests/tcg/nios2/10m50-ghrd.ld
index 7db0d59ad7..71cdda450c 100644
--- a/tests/tcg/nios2/10m50-ghrd.ld
+++ b/tests/tcg/nios2/10m50-ghrd.ld
@@ -44,11 +44,15 @@ SECTIONS
     .data : ALIGN(4) {
         *(.shdata)
         *(.data .data.* .gnu.linkonce.d.*)
-        . = ALIGN(4);
-        _gp = ABSOLUTE(. + 0x8000);
-        *(.got.plt) *(.got)
-        *(.lit8)
-        *(.lit4)
+    } >ram :RAM
+
+    HIDDEN (_gp = ALIGN(16) + 0x7ff0);
+    PROVIDE_HIDDEN (gp = _gp);
+    .got : ALIGN(4) {
+        *(.got.plt) *(.igot.plt) *(.got) *(.igot)
+    } >ram :RAM
+
+    .sdata : ALIGN(4) {
         *(.sdata .sdata.* .gnu.linkonce.s.*)
     } >ram :RAM
 
-- 
2.34.1


