Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E837E30EA20
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 03:24:56 +0100 (CET)
Received: from localhost ([::1]:49452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7UKG-000764-1K
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 21:24:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7TjZ-0005wy-GR
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:47:01 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:38869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7TjX-00045z-Q6
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:47:01 -0500
Received: by mail-pj1-x102a.google.com with SMTP id l18so824947pji.3
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 17:46:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7AU7AuzkprD1DzoX758oP/Mpq/Dm/wXzaoKexxvkWBk=;
 b=er7akT1nwqQmv9gBfhPzwA2Qz2X1af1C8ChA5dliWRYIEb3EgF+tE7QwpDr2MVV+xa
 atdQ01XyDp6MtdOvorUfVt1WStdfs71x2SrNabmdyl9UN75aJOKFPMVm9r/3162lfPCB
 8IvS/ciutaD0bJIoXyKo8CW2tA+egMUv7vNDxp2snaxYPwprn2w1ETvt7kAbnALbcSb7
 Y9tuOcOG951gi18ZSRdtd8JKqcbU3fag6TepWk4mTNEA6GXLud26C8WFdCRoDul7JTPW
 lgItfaGAfjtQHLtXw4vJBcSAgyq5dQIyCgZXpkMYFd85HM/vZRg/QMZ5MjYOtxRYajB0
 8MSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7AU7AuzkprD1DzoX758oP/Mpq/Dm/wXzaoKexxvkWBk=;
 b=owCqR0YHJ/yl2RcR4PdPHzNDvd4FpIMjGg0uE8ZckOEH72jsehDEFBljUdPXlJZ/cy
 5SV0/T24w7Ot3Hf8kPjyE4nMFCSqHjJJbab43nK9FvcSfcnt+w26fMcHRi2yPUCS1g5X
 eLYpc6pfSQ6s9KxmcUzAir5pcLrOeTIb9GDpBXOkooPwNpV6C5PTikNodxOWtJDfoYVq
 Y6OGDX6Am34MTB2xtQB96nQRwkDfXmL4jDJlVBSHhT9EZL002g3sG1ex4FJZPbHkLPDz
 63TX4JuxYRvQyz3mXuZ5VMn0+x46xN0lGfbisjnIfRr0+WFvLDgbp9PutYsUu7uETjpF
 fG0g==
X-Gm-Message-State: AOAM532kZ2ceoDxR/4BGPZa+ysDwRJhaxqQQbtP4wdrMLSVwmx1caDIk
 xtSn97G2oVnvDi0aH97HcF9WmV998gBW8l0I
X-Google-Smtp-Source: ABdhPJyV0ydIVe37K6KNXBznSkLnVL2uNtmr8wZnAzKMw2GijOAuW0dbgey18xk9w+QfG7F+64+zFw==
X-Received: by 2002:a17:902:9b95:b029:df:d859:42bb with SMTP id
 y21-20020a1709029b95b02900dfd85942bbmr5952535plp.2.1612403218185; 
 Wed, 03 Feb 2021 17:46:58 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id q132sm3835462pfq.171.2021.02.03.17.46.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 17:46:57 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 60/93] tcg/tci: Remove tci_disas
Date: Wed,  3 Feb 2021 15:44:36 -1000
Message-Id: <20210204014509.882821-61-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210204014509.882821-1-richard.henderson@linaro.org>
References: <20210204014509.882821-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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


