Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CDD56EC5C1
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 07:57:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqp2I-0007dq-6h; Mon, 24 Apr 2023 01:46:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqoxr-00060x-VQ
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 01:42:33 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqox5-0004Sh-Lc
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 01:42:14 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3f173af665fso24579665e9.3
 for <qemu-devel@nongnu.org>; Sun, 23 Apr 2023 22:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682314885; x=1684906885;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Bq2h9X5UNDb637fCQb6pFT3eLaF1A8JaUegXUakX2qE=;
 b=MmzPiVw94/N8GP4MBrx0ngHM6fB5+bNR233hk9HXByztg2TeGlyGyzGvN9k5d1Fz23
 gREr4amY5/u9J/J79xv9RJhqRGC+v+of4sNJc0ZFCMggq6xBY/Z+dTA9MLeOZKhhhN2j
 OTrnuIfPx/x+szg7bGgoiGA36QogtHUxzEd0C68TCLwpKsKweAGF3PwAZl+cO47HrzZh
 HT7cQtboY1PittCOfcHXzdbzUZ/ZnwxGzFtJpEUDmgME0TDkaba/gwCw75MvFsmHQn59
 heX39jqf9vF05Lpv7r0xBs6YlNqUYBbgq7KCzpZ9/y4UvaHrQo60GE/b42MHgZTAI9Px
 S+4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682314885; x=1684906885;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Bq2h9X5UNDb637fCQb6pFT3eLaF1A8JaUegXUakX2qE=;
 b=joyah9mx9akFoWa0W5YXE1nQVre2O7y55sOWWMx2mVuj4N26gRzfs+SeHqKd+CvNZi
 k0bKfbIF9u8vx6z+/PTPn/7+WZUuvYy/6Ew6MmNsr+DU13hagx0KKUY/VXQ259oB+iCq
 b5XPWgbO6P9WSFCgoJJp6PRDmdKJACnjN9AJrqxZvCgbgQRELmFk+oJfkWu6AJCthxp/
 py+68K4u8wLvIFdzEySDRsuxXUNjFx4Ry5DIK1wBd1BbOP0j0idZ+XsNiltzk7zddaC+
 Tb/R49qHn4a+D0SXBf7uAJnEaRp+0aiSuZzWlLZ3eMPg8rJW5WXq1H3gD8rzxfZRd3PX
 OoPQ==
X-Gm-Message-State: AAQBX9e4rSiT5NC3gC8wY6tNJWNkxIxnLedZ4KZXFy9IQ7NGfIQe0maK
 gn+Q+fJlWpRx4lszp0T2MzEiIJtA0AtnSWFzs4PHMw==
X-Google-Smtp-Source: AKy350aKDnfwWYyiUwxjo7pw3dPPoA+kXHN67ng9feGDS8QyKBcGD6KeQTlRYJz3t07kiPK7GWTIpg==
X-Received: by 2002:adf:f5cc:0:b0:2ff:89d6:3561 with SMTP id
 k12-20020adff5cc000000b002ff89d63561mr8193563wrp.64.1682314885538; 
 Sun, 23 Apr 2023 22:41:25 -0700 (PDT)
Received: from stoup.c.hoisthospitality.com
 (cust-west-loneq8-46-193-226-34.wb.wifirst.net. [46.193.226.34])
 by smtp.gmail.com with ESMTPSA id
 j22-20020a5d6e56000000b002fbb285b01fsm9997852wrz.25.2023.04.23.22.41.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Apr 2023 22:41:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 33/57] tcg/sparc64: Pass TCGType to tcg_out_qemu_{ld,st}
Date: Mon, 24 Apr 2023 06:40:41 +0100
Message-Id: <20230424054105.1579315-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230424054105.1579315-1-richard.henderson@linaro.org>
References: <20230424054105.1579315-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

We need to set this in TCGLabelQemuLdst, so plumb this
all the way through from tcg_out_op.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/sparc64/tcg-target.c.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
index dbe4bf96b9..7e6466d3b6 100644
--- a/tcg/sparc64/tcg-target.c.inc
+++ b/tcg/sparc64/tcg-target.c.inc
@@ -1178,7 +1178,7 @@ static const int qemu_st_opc[(MO_SIZE | MO_BSWAP) + 1] = {
 };
 
 static void tcg_out_qemu_ld(TCGContext *s, TCGReg data, TCGReg addr,
-                            MemOpIdx oi, bool is_64)
+                            MemOpIdx oi, TCGType data_type)
 {
     MemOp memop = get_memop(oi);
     tcg_insn_unit *label_ptr;
@@ -1636,10 +1636,10 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         break;
 
     case INDEX_op_qemu_ld_i32:
-        tcg_out_qemu_ld(s, a0, a1, a2, false);
+        tcg_out_qemu_ld(s, a0, a1, a2, TCG_TYPE_I32);
         break;
     case INDEX_op_qemu_ld_i64:
-        tcg_out_qemu_ld(s, a0, a1, a2, true);
+        tcg_out_qemu_ld(s, a0, a1, a2, TCG_TYPE_I64);
         break;
     case INDEX_op_qemu_st_i32:
         tcg_out_qemu_st(s, a0, a1, a2, TCG_TYPE_I32);
-- 
2.34.1


