Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F874412BC3
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 04:29:58 +0200 (CEST)
Received: from localhost ([::1]:44096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSVXh-0005hT-G2
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 22:29:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSVTf-0005f5-Uu
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 22:25:47 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:34687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSVTd-0006Iy-Qs
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 22:25:47 -0400
Received: by mail-pl1-x632.google.com with SMTP id a7so3726985plm.1
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 19:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hlOyEAtfEuXg6jlGIwDkdTLizNAydX6cMaz9s5D70Jg=;
 b=J2LK2ACHDoyCMOiBxV3llSrFHP+OzcCSJRk7qWLs1XAYm91aGHUuG/BV59uxZiD+DE
 Ikk6volAGr5ejLgpq1d+4FGgSIUQTgYPNARbOsWCGS9KTFEQlo0MKg83IgUlyv2QK7GX
 mhbdTYKBwfkTauGWV3FtBguNMVjUG0Yrk6f3hQ4ZLfjfGg81J/ajrdHOWVhxGSmfRFz8
 FRU0NkWwxR9QSRucUqzxYgX1evK/t9nuZiUyl8F+2pm6HjxVPhzhL70ioSTvf1ckr7MC
 4Ow9yzeKYiwFmZpczr6d/FKEO1uOufvpioALGdIRmtj+ww1IZK5w73eO8lcQT4nSaqeC
 ucXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hlOyEAtfEuXg6jlGIwDkdTLizNAydX6cMaz9s5D70Jg=;
 b=NpX8h1nCYSCRWojduELUwz+SzH8Lzo07SgYvtJ4NIB7rcjVRtBoiIhAO1cetmWFDGQ
 oSHGNySIOs6jaeKgf1EI8v2Ep2G0+x0fyiFts5xt7tzvl9D1QI6g208ZN/eiCPuzmsZ+
 ZKQbjWTJSyLyx3lDaf8oVf3RSsqcCpcwA3T2+v+RQ/gSf/mLxJbqqWSLoojxH5L4AckJ
 qC+THq8r4n0C9ziOsB1kit411KpMDoTY5qWuD2F+i1gIXki281jNxSbYMhraIcAjpj/+
 dmRYvmEJIgiZVJ0CVhYibyUFXyO2PtvRN1GMBfzvVcxLQGWgSvPnCkb8J4Di5rVCJ3Df
 BSHQ==
X-Gm-Message-State: AOAM533M/xj0SxeP5jC71BRuqHPs5RMNJ7Vxy5G4TAhl0BGPhRnPryi5
 wSfwNphO8tc/ggaR4LKkgt5vsK7nogKb8g==
X-Google-Smtp-Source: ABdhPJxvn1WQUin15RlNWG9ZogPZ04Zts6dX8Dah7VSnQdXcXMIQmt6QWKnUQhklYmwK4kNpwoWCPQ==
X-Received: by 2002:a17:90a:b78d:: with SMTP id
 m13mr2421753pjr.17.1632191143269; 
 Mon, 20 Sep 2021 19:25:43 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id n9sm15297621pff.37.2021.09.20.19.25.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 19:25:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 10/10] tcg/riscv: Remove add with zero on user-only memory
 access
Date: Mon, 20 Sep 2021 19:25:34 -0700
Message-Id: <20210921022534.365291-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210921022534.365291-1-richard.henderson@linaro.org>
References: <20210921022534.365291-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/riscv/tcg-target.c.inc | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index c16f96b401..dc8d8f1de2 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -1130,10 +1130,7 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is_64)
         tcg_out_ext32u(s, base, addr_regl);
         addr_regl = base;
     }
-
-    if (guest_base == 0) {
-        tcg_out_opc_reg(s, OPC_ADD, base, addr_regl, TCG_REG_ZERO);
-    } else {
+    if (guest_base != 0) {
         tcg_out_opc_reg(s, OPC_ADD, base, TCG_GUEST_BASE_REG, addr_regl);
     }
     tcg_out_qemu_ld_direct(s, data_regl, data_regh, base, opc, is_64);
@@ -1199,10 +1196,7 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is_64)
         tcg_out_ext32u(s, base, addr_regl);
         addr_regl = base;
     }
-
-    if (guest_base == 0) {
-        tcg_out_opc_reg(s, OPC_ADD, base, addr_regl, TCG_REG_ZERO);
-    } else {
+    if (guest_base != 0) {
         tcg_out_opc_reg(s, OPC_ADD, base, TCG_GUEST_BASE_REG, addr_regl);
     }
     tcg_out_qemu_st_direct(s, data_regl, data_regh, base, opc);
-- 
2.25.1


