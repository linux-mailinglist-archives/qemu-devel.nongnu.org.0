Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15BA73AF946
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 01:25:47 +0200 (CEST)
Received: from localhost ([::1]:47954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvTIX-0006G4-Tm
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 19:25:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvTBz-0000Zo-Pg
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 19:18:59 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:45819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvTBw-0005uh-JW
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 19:18:59 -0400
Received: by mail-pf1-x42a.google.com with SMTP id k6so14835514pfk.12
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 16:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nkUwvYz/H7E5G0Q9SrKLVPmT+1u2d8aWX4+EJ+0VG1o=;
 b=TlW25Pj+rrZeDYjy6WR9MNZD5M5RaDY9Ydz/ZTSwGDSNfJRWcDPuPD3F5NH7kXYgJf
 cYOV0xfH+QvWOx9bGizSExhxSLCmXxlQ6qOLzdUPe5FeixvrL/aSvHI7R/KHdNWPMaE8
 05YGOB38laz6e6zEoR2wuI8ZBeVK+ZQwnx1OJ6yyuxu0ah7tTBZpHulrbV38GHaVhesA
 qPB4pVap4JxXfRrJWX8D/5Qi+IvzAOrVZUw18EM/xG6cOV3VZxDH3rcC4DboZWzSXbB6
 B3s/Son7ay8i+lBWSiEiiz8NL0xbtBGVrfckCHT2rQF0wk1+sX07HnnW+cJypHN7XXsu
 xcGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nkUwvYz/H7E5G0Q9SrKLVPmT+1u2d8aWX4+EJ+0VG1o=;
 b=eYVlQG+cOGLMR4JAV8P8hoSRBEpKwRJ0EO6V2yndvE11aLZZjDFjQvD5YNaaj6Da7m
 L53T40Uim89MXKCw9mEimpsQT+uoeBNbMlRORtM35qcM41ITceNe6WRHHLj82sWFI0S1
 oqZsFzjkrztuJOkmrUog3aphZ+kbrTzPctA8vPbq5RTQhgjGWNIy54WjYBnLcznLFNws
 xtebUCOiCblidN2O40pDezyYomClvGGNzg61BgSamq4VUUpFZKk8p4jrpEF005gABhwL
 IRcut3Mfm6s5KxsZ7RksPKDa4/yfGo2MDD+1ugpSNAS5PL95hKT4JTJy06jzK/VtNieq
 nAiQ==
X-Gm-Message-State: AOAM531vga3LzGHjNxvDVwA8joZQDYnmkWOpziy4tTZPGuDC0OkwFaWV
 VVQ6kCo1EUbxqmLLhOFF1AT6qjcbsZeT9w==
X-Google-Smtp-Source: ABdhPJyp+PV9sLp6331F0ZdW+yoXGaCpPDYAUxdyQUwLi7bzh7dZl8OISg3TQ/jWo/8QA4zknw+iIg==
X-Received: by 2002:aa7:8392:0:b029:2db:4a7:d866 with SMTP id
 u18-20020aa783920000b02902db04a7d866mr595156pfm.66.1624317535343; 
 Mon, 21 Jun 2021 16:18:55 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id 135sm14429952pgf.20.2021.06.21.16.18.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 16:18:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 06/29] tcg/ppc: Split out tcg_out_ext{8,16,32}s
Date: Mon, 21 Jun 2021 16:18:26 -0700
Message-Id: <20210621231849.1871164-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210621231849.1871164-1-richard.henderson@linaro.org>
References: <20210621231849.1871164-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We will shortly require these in other context;
make the expansion as clear as possible.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/ppc/tcg-target.c.inc | 31 +++++++++++++++++++++----------
 1 file changed, 21 insertions(+), 10 deletions(-)

diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index 795701442b..aa35ff8250 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -738,6 +738,21 @@ static inline void tcg_out_rlw(TCGContext *s, int op, TCGReg ra, TCGReg rs,
     tcg_out32(s, op | RA(ra) | RS(rs) | SH(sh) | MB(mb) | ME(me));
 }
 
+static inline void tcg_out_ext8s(TCGContext *s, TCGReg dst, TCGReg src)
+{
+    tcg_out32(s, EXTSB | RA(dst) | RS(src));
+}
+
+static inline void tcg_out_ext16s(TCGContext *s, TCGReg dst, TCGReg src)
+{
+    tcg_out32(s, EXTSH | RA(dst) | RS(src));
+}
+
+static inline void tcg_out_ext32s(TCGContext *s, TCGReg dst, TCGReg src)
+{
+    tcg_out32(s, EXTSW | RA(dst) | RS(src));
+}
+
 static inline void tcg_out_ext32u(TCGContext *s, TCGReg dst, TCGReg src)
 {
     tcg_out_rld(s, RLDICL, dst, src, 0, 32);
@@ -2322,7 +2337,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
                        const int const_args[TCG_MAX_OP_ARGS])
 {
     TCGArg a0, a1, a2;
-    int c;
 
     switch (opc) {
     case INDEX_op_exit_tb:
@@ -2390,7 +2404,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ld8s_i32:
     case INDEX_op_ld8s_i64:
         tcg_out_mem_long(s, LBZ, LBZX, args[0], args[1], args[2]);
-        tcg_out32(s, EXTSB | RS(args[0]) | RA(args[0]));
+        tcg_out_ext8s(s, args[0], args[0]);
         break;
     case INDEX_op_ld16u_i32:
     case INDEX_op_ld16u_i64:
@@ -2728,18 +2742,15 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
 
     case INDEX_op_ext8s_i32:
     case INDEX_op_ext8s_i64:
-        c = EXTSB;
-        goto gen_ext;
+        tcg_out_ext8s(s, args[0], args[1]);
+        break;
     case INDEX_op_ext16s_i32:
     case INDEX_op_ext16s_i64:
-        c = EXTSH;
-        goto gen_ext;
+        tcg_out_ext16s(s, args[0], args[1]);
+        break;
     case INDEX_op_ext_i32_i64:
     case INDEX_op_ext32s_i64:
-        c = EXTSW;
-        goto gen_ext;
-    gen_ext:
-        tcg_out32(s, c | RS(args[1]) | RA(args[0]));
+        tcg_out_ext32s(s, args[0], args[1]);
         break;
     case INDEX_op_extu_i32_i64:
         tcg_out_ext32u(s, args[0], args[1]);
-- 
2.25.1


