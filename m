Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8843933764B
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 15:58:43 +0100 (CET)
Received: from localhost ([::1]:42048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKMlu-0002wy-Go
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 09:58:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKMUG-0003Tm-4T
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:40:28 -0500
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f]:39898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKMUE-0006Rj-G0
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:40:27 -0500
Received: by mail-qv1-xf2f.google.com with SMTP id h13so2639416qvu.6
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 06:40:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7AU7AuzkprD1DzoX758oP/Mpq/Dm/wXzaoKexxvkWBk=;
 b=taIYp6GIXruXuOpTyExN9I1E8oiXiNbd84BuAjb0FjXOEfOvweHULJEliy2i8YQKNI
 EBHe4ClPfcgdTzE6h/VrAmhme9vcaSqR3z+QWYuw8AEDh/sqOgPaFBqfaFM5B1zA50kc
 PkRi/uk1Wq4qdszcQYHBVpX82XpnrVuqVlaaQMHCAd4c7/UToKsj317BCCoJMXlhY2P2
 /To33MGq6uL0kNgx8YBxqXMXLNcYJJTQ3m+wREAFBAd4fyE2kiKxbG5GUWW0/q8AHe88
 wmWP5ClpEVbLW2OhkUR5Gmo/RYh74vFbsbKTu9pI0Mm1FNINKWgtN2ip4cxPA8eBeucL
 aR/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7AU7AuzkprD1DzoX758oP/Mpq/Dm/wXzaoKexxvkWBk=;
 b=IF478/8xGA7KPZqftMjH/YuUhrE1qLleDYPBThk3Ec+lSwlhGIGQWXD/ZQl2Lnr3nf
 S2ypWVJrd67fST4C/YostliZkQWh7T0QDbGx668grVgEJZnxz3NHWLz1xrDr4GFo/0Nw
 SifZdZ5+Sl1cDwv+SY4uCy6qnQQnNE2zdtuSqpKdGKY9+IchdNd4fku58snYv9gMz+7v
 BZoBQUVPZ9+h2lpHe6iKFFQsJU7GFgbBAfz4qedWAdwtlW9hT6XfEj9PhwI6h13gH0yJ
 Q/KOZDv/NrB2YwHzhsb5ls522CH5cH26O8L9ukBgNinGn3YdNe/1r+2SJJYjQ7hxh5WR
 kLGQ==
X-Gm-Message-State: AOAM530KzeigyzUcLSEhkibWzRbJgNWxbpdRLEtCLcaHvrCNprwwm502
 BLa2nUpUT4skzrxJaxBCyLz/KMl0kkgL2Bm2
X-Google-Smtp-Source: ABdhPJzKDTuNW4HQklq9XNBA8RJ7UQPmzStymYgwoujr8Wye2RrZds8DgMGQfEUZ0I5FwNCWe3gPeg==
X-Received: by 2002:a05:6214:c27:: with SMTP id
 a7mr7756881qvd.54.1615473625345; 
 Thu, 11 Mar 2021 06:40:25 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id d84sm2070324qke.53.2021.03.11.06.40.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 06:40:25 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 20/57] tcg/tci: Remove tci_disas
Date: Thu, 11 Mar 2021 08:39:21 -0600
Message-Id: <20210311143958.562625-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210311143958.562625-1-richard.henderson@linaro.org>
References: <20210311143958.562625-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2f;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2f.google.com
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


