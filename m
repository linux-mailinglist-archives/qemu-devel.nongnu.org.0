Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6B43D0944
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 08:56:47 +0200 (CEST)
Received: from localhost ([::1]:52520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m669u-0003xh-ND
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 02:56:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m65vo-0005AW-1P
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 02:42:12 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:44564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m65vm-0005Wf-Iq
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 02:42:11 -0400
Received: by mail-pf1-x42f.google.com with SMTP id p36so1469124pfw.11
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 23:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=R6dlxti+/N1vnkKixu8IUh/Zl8M8i7vv7yb2sO8QtGA=;
 b=BOALdA3f4TKska56I97TBbU7NVNb5c6vDuySWwK+y0FmaDdppdr9Si1W8XrhsvyXJa
 sda9v8+vZ3l/eEjNRmyzEEjF1aTZRWNvPSh09ATtZEXv2c41Y9Ily7XKsqFcPxYJ/qFZ
 j9PMmzhjwn1ExX/v/eltoeHw6jFePDdhCP9Lz3AE+2WmM6Ggu3eVGv+3FJOcnuTh4QBQ
 s3PrzLdmjJsn3dNnkQX0FxLx350fLQcMLCwJNQqUJ9AYQ1opEwHSf3xF9ikF5MdVLMsA
 WOqbcIOAqXOHlLNEwPBrDY/eXSu9Hw5IQSPBM6s2eNJRDY8p6SaHesdNnBdtVE7lwECk
 b++g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R6dlxti+/N1vnkKixu8IUh/Zl8M8i7vv7yb2sO8QtGA=;
 b=c6sKeivKfkr9LJDe24id6VNL4DUHZvazOpRbKZ2h7X8PDBXZgsWep3gek8VrMk5q8Q
 6tZRwKF5eHx/LEaiYcwczqgCoydZtmoDPGwVGDvuefI+FTW09AzHgkBfRYPc5Cut+R+5
 e+kywJGrYkeX3xUyQMzk5m4LOq8jTUGfEGHxW0tXSZhX3GETIqXC2Cgry4Wys0TU/bx6
 X84yELg7ukyiYDMHDIIriKK+FJcEUv09xjEchgKT5fPyv89M+VA+q0dViu8vOupXX8Zx
 wOvFsqlq0/MKfauVgkGkQ/MO1Nr78+jrHjVHn7chDYQXewyrva5bNoN5gS2oDdFGxuwY
 weWg==
X-Gm-Message-State: AOAM530LTUDe53yJq4EV8q8qcuSy8vCS2qJkq0Tjc7rCf4ythtMx1esI
 UGKRRKOGWSUjOW+iWF+NZ0GA5aoCa6alWg==
X-Google-Smtp-Source: ABdhPJyAjc8ztGnwj7FzQAhoTaAxcYknq/elC5EGU0Rgs9EtUx/m1AfwapQJBrRE51s4fBL5NrX6BA==
X-Received: by 2002:a62:7ac1:0:b029:329:77f5:8ffa with SMTP id
 v184-20020a627ac10000b029032977f58ffamr34871869pfc.36.1626849729325; 
 Tue, 20 Jul 2021 23:42:09 -0700 (PDT)
Received: from localhost.localdomain (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id q17sm21146132pjd.42.2021.07.20.23.42.08
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 23:42:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 11/23] target/microblaze: Check CF_NO_GOTO_TB for
 DISAS_JUMP
Date: Tue, 20 Jul 2021 20:41:43 -1000
Message-Id: <20210721064155.645508-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210721064155.645508-1-richard.henderson@linaro.org>
References: <20210721064155.645508-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We were using singlestep_enabled as a proxy for whether
translator_use_goto_tb would always return false.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/microblaze/translate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/microblaze/translate.c b/target/microblaze/translate.c
index a14ffed784..7e465b629a 100644
--- a/target/microblaze/translate.c
+++ b/target/microblaze/translate.c
@@ -1779,7 +1779,7 @@ static void mb_tr_tb_stop(DisasContextBase *dcb, CPUState *cs)
         break;
 
     case DISAS_JUMP:
-        if (dc->jmp_dest != -1 && !cs->singlestep_enabled) {
+        if (dc->jmp_dest != -1 && !(tb_cflags(dc->base.tb) & CF_NO_GOTO_TB)) {
             /* Direct jump. */
             tcg_gen_discard_i32(cpu_btarget);
 
@@ -1804,7 +1804,7 @@ static void mb_tr_tb_stop(DisasContextBase *dcb, CPUState *cs)
             return;
         }
 
-        /* Indirect jump (or direct jump w/ singlestep) */
+        /* Indirect jump (or direct jump w/ goto_tb disabled) */
         tcg_gen_mov_i32(cpu_pc, cpu_btarget);
         tcg_gen_discard_i32(cpu_btarget);
 
-- 
2.25.1


