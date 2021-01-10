Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B04672F0866
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Jan 2021 17:29:43 +0100 (CET)
Received: from localhost ([::1]:54338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kydb4-0007tj-Nv
	for lists+qemu-devel@lfdr.de; Sun, 10 Jan 2021 11:29:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kydZG-0006TQ-J9
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 11:27:50 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:36340)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kydZF-00056B-3k
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 11:27:50 -0500
Received: by mail-wr1-x42c.google.com with SMTP id t16so13969366wra.3
 for <qemu-devel@nongnu.org>; Sun, 10 Jan 2021 08:27:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0+4vsOPmrQO4utyVrt8o/jV8z8vNVPPVZFmm8srnerg=;
 b=hvP9c+JVznCJAn8SCw7UM1yCaAatXMVA8pubf8dZNedDOwcPW44Q8ipjTratoNTz32
 TwdFdOrlr6EcVpGaKXawVFW+/r03hJgp64sV4rQWB2fcQSh9sx1VO90bOd/Pd1KJCRDA
 CqPvHH1ubLBdBemFydK5gn7ngN+wvULCOvRXo+z+CZfBTIRl90PR74+UE2QZ6C0ABVMU
 0wKKoXimxA5RUvqC4z1GLljUZhdDNCiipf9Czd7YVTPLnkcDlM2EaNhhgjBfNnADJzIc
 zBvSWPy7HTifneCMkb0Kx8K4LEeupRj3V2JNlHDPJ9MSM9QzE2jX3BjwtzeylFltE6MX
 wdtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=0+4vsOPmrQO4utyVrt8o/jV8z8vNVPPVZFmm8srnerg=;
 b=Ejvq8fYHzdvTXT/D+uicYwS+C/IClT2tuUe+abu62X2WaAGemIptsb8c8lDv14VjH5
 u+zZSlOeDJom9tAM1KGXRtBo5PERJyFx/pphGQImFUyL3KX8pqYBRBE47c3Dqv7pkWQ0
 +UGMWOYDNGQ7X4CN6DES6+BkiP2xZ52YEKCYPyIRGKw68QmgAiqrg7qPf6Vx5yVY4Zjs
 2E4LJFujdmVPLitcHDZ9ONPbo9hTyFdMV5VFT0rNReFm6wdAGzqehpLrKeq9C8qTQ6e0
 qDZQ5tq8526XK3XXmhMd5tYghH6DbcYjs01KG6X8TJY5bAdcuqjzA1RZDZyTn09wkUEn
 Jl+g==
X-Gm-Message-State: AOAM531K0JFBRjpgrU4NS/8xyxYxTg/AD9VPDZfxG5WgtghW7Q720OQc
 C7w8fqlY1o2aoppj2ic1yE8jBJ2+Zb0=
X-Google-Smtp-Source: ABdhPJw/yf4ZPS35rOCQ6jsL51zpHvEEACkLto8VQFocNIG5JwaFkGeQViKbAzNu6Z2NUgBWcynYhg==
X-Received: by 2002:a5d:4f82:: with SMTP id d2mr12655827wru.87.1610296067517; 
 Sun, 10 Jan 2021 08:27:47 -0800 (PST)
Received: from localhost.localdomain (129.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.129])
 by smtp.gmail.com with ESMTPSA id v7sm19238555wma.26.2021.01.10.08.27.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Jan 2021 08:27:46 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] tcg: Mark more tcg_out*() functions with attribute
 'unused'
Date: Sun, 10 Jan 2021 17:27:38 +0100
Message-Id: <20210110162739.858087-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210110162739.858087-1-f4bug@amsat.org>
References: <20210110162739.858087-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wataru Ashihara <wataash@wataash.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The tcg_out* functions are utility routines that may or
may not be used by a particular backend. Similarly to commit
4196dca63b8, mark them with the 'unused' attribute to suppress
spurious warnings if they aren't used.

This fixes the build with --enable-tcg-interpreter:

  [98/151] Compiling C object libqemu-arm-softmmu.fa.p/tcg_tcg.c.o
  FAILED: libqemu-arm-softmmu.fa.p/tcg_tcg.c.o
  clang [...] -o libqemu-arm-softmmu.fa.p/tcg_tcg.c.o -c ../tcg/tcg.c
  ../tcg/tcg.c:136:20: error: unused function 'tcg_out_dupi_vec' [-Werror,-Wunused-function]

Reported-by: Wataru Ashihara <wataash@wataash.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tcg/tcg.c | 30 +++++++++++++++++++++---------
 1 file changed, 21 insertions(+), 9 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 472bf1755bf..a7fc2043cbf 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -123,24 +123,36 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc, unsigned vecl,
                            unsigned vece, const TCGArg *args,
                            const int *const_args);
 #else
-static inline bool tcg_out_dup_vec(TCGContext *s, TCGType type, unsigned vece,
-                                   TCGReg dst, TCGReg src)
+static __attribute__((unused)) inline bool tcg_out_dup_vec(TCGContext *s,
+                                                           TCGType type,
+                                                           unsigned vece,
+                                                           TCGReg dst,
+                                                           TCGReg src)
 {
     g_assert_not_reached();
 }
-static inline bool tcg_out_dupm_vec(TCGContext *s, TCGType type, unsigned vece,
-                                    TCGReg dst, TCGReg base, intptr_t offset)
+static __attribute__((unused)) inline bool tcg_out_dupm_vec(TCGContext *s,
+                                                            TCGType type,
+                                                            unsigned vece,
+                                                            TCGReg dst,
+                                                            TCGReg base,
+                                                            intptr_t offset)
 {
     g_assert_not_reached();
 }
-static inline void tcg_out_dupi_vec(TCGContext *s, TCGType type,
-                                    TCGReg dst, tcg_target_long arg)
+static __attribute__((unused)) inline void tcg_out_dupi_vec(TCGContext *s,
+                                                            TCGType type,
+                                                            TCGReg dst,
+                                                            tcg_target_long arg)
 {
     g_assert_not_reached();
 }
-static inline void tcg_out_vec_op(TCGContext *s, TCGOpcode opc, unsigned vecl,
-                                  unsigned vece, const TCGArg *args,
-                                  const int *const_args)
+static __attribute__((unused)) inline void tcg_out_vec_op(TCGContext *s,
+                                                          TCGOpcode opc,
+                                                          unsigned vecl,
+                                                          unsigned vece,
+                                                          const TCGArg *args,
+                                                          const int *const_args)
 {
     g_assert_not_reached();
 }
-- 
2.26.2


