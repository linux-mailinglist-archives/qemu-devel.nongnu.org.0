Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB9AA312930
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 04:09:26 +0100 (CET)
Received: from localhost ([::1]:44000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8wvV-0000DZ-My
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 22:09:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wRp-0001lb-Ry
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:38:45 -0500
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:35303)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wRj-0005sw-K9
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:38:45 -0500
Received: by mail-pg1-x52e.google.com with SMTP id t25so9272278pga.2
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 18:38:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7AU7AuzkprD1DzoX758oP/Mpq/Dm/wXzaoKexxvkWBk=;
 b=uMn0beYeaB+5lQdHNlFqUIk37mVB0MKh01C34RfNp8vdNo8pAFzbd6zLDL2Tj5sM/Q
 YSLa4iWE1pIYtYn0I8XmjP6Av1o/smEU6LyfdvOW+Xm0kTc0k+6Pujp4euif9TCNeIC8
 QLdpOIV9b3+IrVKFGIB6GdUnTqQvqHU7tMtDLh1sq0TFM6aJDXfIdbLf9QJV8GR30vGM
 Bz3hN8pdNSaWbRrHD8beMOfwViz88xX90ldtJR6gkBEPI0DnxrASsYl4TullTxkTwV94
 l+hAy5o2rv1Ii9BAsATVeRJPg8e2r8SZ/w7xZ22DxTo2AxxV7omg0ziIT89B4o0vWjNH
 09jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7AU7AuzkprD1DzoX758oP/Mpq/Dm/wXzaoKexxvkWBk=;
 b=FOWMXhOsOJl408/g5TUFLDpC+xMBl9RseWYNcW4QtlLb8atyOwuJnumbgdW9j1vRAY
 cLi1IPSxez+XY7/D1DvjidnuwnHtTsmonqqaf+CxBeyEDLrXiU3esY6kG0pWqo40Rrr/
 wWQKYvAxgrUyt3ChzAEiybvh7AvAJvbfWRDTkZ7qg3/serLEQ7Y88ATLKTQKC36LADmT
 Au3IYEuLAVDM2dWD9ZQXwvIXwA+4E3gf7DKw+xDKYO9M17DhumrikhZ70/wRseov+5u6
 Nbm5apZ0l1Jtr+LVlCca1C6N6Eri/sDVV1Jna0RRfgjuUiq1yzSN1JcEP3eFbnasF6td
 kHig==
X-Gm-Message-State: AOAM532JHSTH7Y8Nn4lVJiJq2Uu9FiMvfQkRPvtUiPkYChkAK5/96IsN
 p/Z6pfjE0CtSWywYYBodmAFb4MSdmWrbmQ==
X-Google-Smtp-Source: ABdhPJx4LEejdjmYERTaZsE/OqMsCd//+vm2+BkLbvcHqidAPVGBWUzzIX7f09/+iTiprodE93HxCw==
X-Received: by 2002:a63:884a:: with SMTP id l71mr14735259pgd.75.1612751917403; 
 Sun, 07 Feb 2021 18:38:37 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id j17sm16158689pfh.183.2021.02.07.18.38.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 18:38:36 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 35/70] tcg/tci: Remove tci_disas
Date: Sun,  7 Feb 2021 18:37:17 -0800
Message-Id: <20210208023752.270606-36-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210208023752.270606-1-richard.henderson@linaro.org>
References: <20210208023752.270606-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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
Cc: sw@weilnetz.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This function is unused.  It's not even the disassembler,
which is print_insn_tci, located in disas/tci.c.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci/tcg-target.h     |  2 --
 tcg/tci/tcg-target.c.inc | 10 ----------
 2 files changed, 12 deletions(-)

diff --git a/tcg/tci/tcg-target.h b/tcg/tci/tcg-target.h
index 9285c930a2..52af6d8bc5 100644
--- a/tcg/tci/tcg-target.h
+++ b/tcg/tci/tcg-target.h
@@ -163,8 +163,6 @@ typedef enum {
 #define TCG_TARGET_CALL_STACK_OFFSET    0
 #define TCG_TARGET_STACK_ALIGN          16
 
-void tci_disas(uint8_t opc);
-
 #define HAVE_TCG_QEMU_TB_EXEC
 
 /* We could notice __i386__ or __s390x__ and reduce the barriers depending
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 6c187a25cc..7fb3b04eaf 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -253,16 +253,6 @@ static bool patch_reloc(tcg_insn_unit *code_ptr, int type,
     return true;
 }
 
-#if defined(CONFIG_DEBUG_TCG_INTERPRETER)
-/* Show current bytecode. Used by tcg interpreter. */
-void tci_disas(uint8_t opc)
-{
-    const TCGOpDef *def = &tcg_op_defs[opc];
-    fprintf(stderr, "TCG %s %u, %u, %u\n",
-            def->name, def->nb_oargs, def->nb_iargs, def->nb_cargs);
-}
-#endif
-
 /* Write value (native size). */
 static void tcg_out_i(TCGContext *s, tcg_target_ulong v)
 {
-- 
2.25.1


