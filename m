Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C51AC31E0B2
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 21:46:10 +0100 (CET)
Received: from localhost ([::1]:46110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCTi5-0005cn-QV
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 15:46:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTLm-0008Ui-54
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:23:06 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:46407)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTLk-0007PE-LL
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:23:05 -0500
Received: by mail-pf1-x42c.google.com with SMTP id k13so9142882pfh.13
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 12:23:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7AU7AuzkprD1DzoX758oP/Mpq/Dm/wXzaoKexxvkWBk=;
 b=LS6rtZx+4ivLf4VFVAv5uhE44x1uSydEJwQUaVSYdDG+vhvKBpPHfTypHN3WzcMTnE
 2DgxBIfMp6oGGoerAXvVYzQ/uMz3E/heS/gvV55zXG1mk9vcA2L7I80AGhFkxmaxeKI+
 hzOkJ1dlvR6PgAQ81N7inMCPqnokVPGaU4AMFGUodcokwr1R4lpNlBoVVwigxreFUhPC
 PH7x3KV0C8vwsY5rctqPqZQuxF8F8HWQNPxqKL+QECF6eg8hNAy+QwhkqAp37ios5gb/
 hKJaECYku3iXv+2zGbM5TX8GbD+98Fjlz3LiufEXzxFgdNbWEwoQH00pFLeTIEYQVr/V
 +OqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7AU7AuzkprD1DzoX758oP/Mpq/Dm/wXzaoKexxvkWBk=;
 b=eEqVZ26vbvaRdFvLYkAb0SNhQhCUnhZ0mFABAz7ystN7dv2xOT9BjDq8zfeh3HtDvV
 65QKVYUX+15FVe0rPQZov5BY3JeRbv7g+lmFz6iFBmCpKUEaUNPvCCcYGzl+zKA6uIOh
 v5W2yD8O00zsIBwhjRWTkJeEWR+Wx1H+pMmuosWlDqWcC7Wj0nepGKf578xucAUyXPez
 RhW3yeiilGmIb33PhQpy13ULPHFyyO1Mt2XWj0zg+G4lko2CM57M4VWER8YmmB2LAIga
 ZYT/OhbLH/C54Kye5g15EYLePqAK3vPMYjp50TMq4XOyCtfJ7h7Punh1hJW2J+pGpd5d
 GT7A==
X-Gm-Message-State: AOAM530Du5NO2cZaFfO2oIVTln7vD5rAlM0TsM6SEcur7Dc8mtG9JuSd
 XX27MFA5+yMrQAxPHSILCspLCUpw6O+aGw==
X-Google-Smtp-Source: ABdhPJxXEIdDpbjR37NIDnkJVMnpSlaGo0x59vkfgDg+XkXwrhRJ0/GT4iXvth0hBx+uttEaPoivfA==
X-Received: by 2002:a62:cd48:0:b029:1ec:deac:28cd with SMTP id
 o69-20020a62cd480000b02901ecdeac28cdmr911788pfg.75.1613593383416; 
 Wed, 17 Feb 2021 12:23:03 -0800 (PST)
Received: from localhost.localdomain (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id 3sm3001576pjk.26.2021.02.17.12.23.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 12:23:02 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 35/71] tcg/tci: Remove tci_disas
Date: Wed, 17 Feb 2021 12:20:00 -0800
Message-Id: <20210217202036.1724901-36-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210217202036.1724901-1-richard.henderson@linaro.org>
References: <20210217202036.1724901-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FUZZY_BITCOIN=0.001,
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


