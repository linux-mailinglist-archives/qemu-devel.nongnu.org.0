Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E62033F4CF
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 16:59:13 +0100 (CET)
Received: from localhost ([::1]:39986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMYZk-0007RB-6R
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 11:59:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMYCT-0005FO-D6
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 11:35:10 -0400
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c]:41575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMYCR-0007EB-75
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 11:35:09 -0400
Received: by mail-ot1-x32c.google.com with SMTP id
 l23-20020a05683004b7b02901b529d1a2fdso2165103otd.8
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 08:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8xPoOWc8JEXoubwWfAX3Ujreq35vzVqrQT2B+bRqWlk=;
 b=vPI+T4YICMZA92qvFhaXvYm9eRuv90PxJ6K6KYqrQ195tF7kDzwlZ8SzYhrbuW1V5r
 VmMmXtvPMg/ORFwBmEoB8eE8uD4NJUc4l9iwcbbHD5oTcqTs4FauEeVej2py6duSvHB6
 /o8YJqSbPaqvBjTEgAsmuFIGl/7+Ncbs+jh0fGVrXwpHbe/c13oKeaeSg0sk72Wj5ra7
 VzsYrsBQ9MxLnrEZn/gQUoN17veihOXh9fvFV1uk83jowobws2gXtK6SFccyI8+xlR4K
 xPcRrm8pYliBtdFRhxkGyk8YerWPonO4YuZjy1wmBL9nwxBGLg/lZ8sZaHvqXpRLyNsK
 rdYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8xPoOWc8JEXoubwWfAX3Ujreq35vzVqrQT2B+bRqWlk=;
 b=oz650xh7PbFdt6YR0PiwhmwoYfnb9fTn1hLH1ensz9RxVziAYJiOOHV6pYFAopLxjU
 t2SmFVG6HH5BCuXTdgMEVYZl7DLSow53xcpvmrfvS/yeoV+ljLVwvHG38B2GwTWEM98Q
 788s9epzgTRUBc6EX+Ada3WoyFRvct7XIOKT8kjgBbcWz5VnSVrzuTfDBXbk0pmqzOlE
 hD/csE6HyWEY2ksc+k5hqvhj9TKYt+30PW01lpWO+pB8kgz5L0GFcbA3FH+NrWDIvaai
 +JaE7MUNlqQE9ICn+OM79KFufgHsCGQjfc+uIhNnF3TbrjmWpxW62+Mx8Uzhilr4GG6/
 mExQ==
X-Gm-Message-State: AOAM533c1JN0RATkadz4sskmuvifUQzEeseDOnoagvrEueKI/1LSx8CG
 suMA6kvohJ/kFKQoRINmtj4Yy8Z7+7JjDPk5
X-Google-Smtp-Source: ABdhPJw2Ty5vJQM9O8Eyuu6EH5QPhQXP9W8m1ovoQHimCmmSh7vwF27tUNTYsFDb2b9m1cRZlFJMWQ==
X-Received: by 2002:a9d:65cf:: with SMTP id z15mr3727099oth.310.1615995306171; 
 Wed, 17 Mar 2021 08:35:06 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id i11sm8271154otp.76.2021.03.17.08.35.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 08:35:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 20/38] tcg/tci: Remove tci_disas
Date: Wed, 17 Mar 2021 09:34:26 -0600
Message-Id: <20210317153444.310566-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210317153444.310566-1-richard.henderson@linaro.org>
References: <20210317153444.310566-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FUZZY_BITCOIN=0.017,
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This function is unused.  It's not even the disassembler,
which is print_insn_tci, located in disas/tci.c.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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


