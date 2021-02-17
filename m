Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C65CF31E113
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 22:13:06 +0100 (CET)
Received: from localhost ([::1]:54970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCU89-0008HO-Qw
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 16:13:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTLr-0000Gf-Sv
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:23:11 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:39835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTLq-0007RX-9A
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:23:11 -0500
Received: by mail-pl1-x629.google.com with SMTP id k22so8037857pll.6
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 12:23:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YQBNB7jLXwaZJSYBL0BvoU6n3wPE6zwxayv+Hpeg13U=;
 b=CrIcLrHZ0Rh52t2wb7GUyu+5r8ddJfmHxQCpdvw75u/7d0Y7QkeJBtG6pmP4ckjNDi
 FleiHPCx5dlDiZbLkXYnjeL6YLCBjNszg3Sokb/3G2f++HyCAwgnc6EtU0YzRzKroRrB
 01KJ4M0/ygEpUtWEX/UNMQcvf5vHwjtq4aAifon4be2hPX1arYCuuJcXLqhcp9dp5jvM
 A/3QUROtzBQIsQaabIL4ZzlO1TS/IWsSy5YfT4m4GmHohxDMLG3bLKnElNdUWLnw+yBo
 rEmbMnBVV4vSBYwvtqvXJcI1MqBgtB9Xb7/d+AxWmmlTUWDy8h6HtM/wWHtwyx77eOXI
 SExQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YQBNB7jLXwaZJSYBL0BvoU6n3wPE6zwxayv+Hpeg13U=;
 b=n5fKuK19npEtgMjFl6R7LH6LYsDkJZj2gqWO0Nn9dNMuv55VQ4C1ilT5eBCUYBg6GZ
 elcWCe/c/BMk8pVuva7eui9fnxd4w2j0kssAeDP2uckGtR/rahrzutV22THv4L9ou/52
 gsVK9g7KZdxVomSpuixO8IccTnV9bWubsigWY08ETonQ6IfH8hvcMeA4DtLlN5Rh7CQK
 OFRQC9PPdk6QlJm5AvUE/sgAr0gsuE/+u5H9ndjJC157alfzlgyL4SiqfblhWp075tBb
 6xTB+g04ePJO8313ciU8jEecs5ay3epzXb7udry0ZymyPI1MlVFuHdz1iolbg6GDhHnn
 3dpA==
X-Gm-Message-State: AOAM531331APzPLMCF28ivoSpLzgHeITqgaup/28f2slmUo3+MwIe3fH
 apoSCu8RC5TloiqeXkLpzfzgnwsi5zc5jA==
X-Google-Smtp-Source: ABdhPJxcne1Cug68p6O1gvazKjRXUyy2WzSgXSoDbhBy4lDwOSgLzOqI8pd6A1OU/UD++zvHGXxUew==
X-Received: by 2002:a17:90a:9414:: with SMTP id
 r20mr528915pjo.222.1613593389107; 
 Wed, 17 Feb 2021 12:23:09 -0800 (PST)
Received: from localhost.localdomain (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id 3sm3001576pjk.26.2021.02.17.12.23.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 12:23:08 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 39/71] tcg/tci: Improve tcg_target_call_clobber_regs
Date: Wed, 17 Feb 2021 12:20:04 -0800
Message-Id: <20210217202036.1724901-40-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210217202036.1724901-1-richard.henderson@linaro.org>
References: <20210217202036.1724901-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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
Cc: sw@weilnetz.de, alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The current setting is much too pessimistic.  Indicating only
the one or two registers that are actually assigned after a
call should avoid unnecessary movement between the register
array and the stack array.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci/tcg-target.c.inc | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 8d75482546..4dae09deda 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -623,8 +623,14 @@ static void tcg_target_init(TCGContext *s)
     tcg_target_available_regs[TCG_TYPE_I32] = BIT(TCG_TARGET_NB_REGS) - 1;
     /* Registers available for 64 bit operations. */
     tcg_target_available_regs[TCG_TYPE_I64] = BIT(TCG_TARGET_NB_REGS) - 1;
-    /* TODO: Which registers should be set here? */
-    tcg_target_call_clobber_regs = BIT(TCG_TARGET_NB_REGS) - 1;
+    /*
+     * The interpreter "registers" are in the local stack frame and
+     * cannot be clobbered by the called helper functions.  However,
+     * the interpreter assumes a 64-bit return value and assigns to
+     * the return value registers.
+     */
+    tcg_target_call_clobber_regs =
+        MAKE_64BIT_MASK(TCG_REG_R0, 64 / TCG_TARGET_REG_BITS);
 
     s->reserved_regs = 0;
     tcg_regset_set_reg(s->reserved_regs, TCG_REG_CALL_STACK);
-- 
2.25.1


