Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B751E43D0BF
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 20:29:58 +0200 (CEST)
Received: from localhost ([::1]:37640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfngT-0007q8-Rt
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 14:29:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfnLB-0003XG-Ef
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 14:07:58 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:39489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfnL8-0003w2-SW
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 14:07:56 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 y205-20020a1c7dd6000000b0032cc8c2800fso6122865wmc.4
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 11:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w1WlsmvsxrgkCAUcSauJsghkKBvyVMTDwpkFjialjgo=;
 b=bPy5lemmKeRXFUW+DmRo4st0ui6UCkx/H1jRlJZtsVrQ+u85vCx+9RpJqyot0CJwYP
 uu3WHtOIO841tPijZEE6a6KJ/qGVjl6nGFh81iVaLSNv6M8bCgQN8DdXhnQeQHHZLplS
 Z1VsM/8hGSSFNAjurbDc1GM2l+nacXpyyThp1GD64BR8CfjNHPAdlFq8LV/0qZD1eJ62
 Hf8ZaSN/uQ4aJ48LHDk5teCv3Bq3PSMtVEBhPrGKI4Iv5RCIfF/KuonjVNbz2ELDn1D1
 k4D87U+WbHW0Kv5Czy/iLfSytbdOn84AlYpFpcSQiJ/oTZNn6PdwJGbU+AyKbsc9qwcr
 9OYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=w1WlsmvsxrgkCAUcSauJsghkKBvyVMTDwpkFjialjgo=;
 b=p+us7hoaSOYP/ed2eygXlhl/4fPHHDBTobSLuFmHVjazchMfPMIRRqSzx/+td/4OK+
 okwjdPoJCFnEjWwHK84NVhIaClm9kY4R0o3ljeWBkKIshyd8P/MXshKNlsKbZSrwC/sO
 ajGeLEu+35pChwLIV3QhQesTlxjBJiE5v/JrnXkNMZ9EZHVEZUOd9figRtbzLT0gnGjN
 nrH0fq35nZbCV0trEbalKpzHvTPehkN+wRy7Yrm0x1cYjhcb32aD0fI4JF5m/+e4iMqu
 d2+KuTo0RynwqGh9sCJjwQF3tZlHuok8/DOscY+voXzOgheDL+oFrWihYlgDFEYY/K72
 /pPw==
X-Gm-Message-State: AOAM5327PLNOVCztIhDjmFmChljSsREmfSlHo9uHBljoO6rKtO/unZof
 0/LLEZmK1fFtip/5JZkeNZ0u5iZq+Hk=
X-Google-Smtp-Source: ABdhPJwj7ei661WUAceyBFYCC+HmqQ4IPO7yEjITfI0I/UMCSu57fmKDD1z6MFIMLN2gvDXd5AZ22Q==
X-Received: by 2002:a7b:c103:: with SMTP id w3mr7349823wmi.145.1635358072231; 
 Wed, 27 Oct 2021 11:07:52 -0700 (PDT)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id g19sm527171wmg.34.2021.10.27.11.07.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 11:07:51 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 04/32] target/mips: Use dup_const() to simplify
Date: Wed, 27 Oct 2021 20:07:02 +0200
Message-Id: <20211027180730.1551932-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211027180730.1551932-1-f4bug@amsat.org>
References: <20211027180730.1551932-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The dup_const() helper makes the code easier to follow, use it.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/msa_translate.c | 23 +++--------------------
 1 file changed, 3 insertions(+), 20 deletions(-)

diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
index 3ef912da6b8..bc57e06d923 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -313,28 +313,11 @@ static void gen_check_zero_element(TCGv tresult, uint8_t df, uint8_t wt,
 {
     /* generates tcg ops to check if any element is 0 */
     /* Note this function only works with MSA_WRLEN = 128 */
-    uint64_t eval_zero_or_big = 0;
-    uint64_t eval_big = 0;
+    uint64_t eval_zero_or_big = dup_const(df, 0x01);
+    uint64_t eval_big = dup_const(df, 0x80);
     TCGv_i64 t0 = tcg_temp_new_i64();
     TCGv_i64 t1 = tcg_temp_new_i64();
-    switch (df) {
-    case DF_BYTE:
-        eval_zero_or_big = 0x0101010101010101ULL;
-        eval_big = 0x8080808080808080ULL;
-        break;
-    case DF_HALF:
-        eval_zero_or_big = 0x0001000100010001ULL;
-        eval_big = 0x8000800080008000ULL;
-        break;
-    case DF_WORD:
-        eval_zero_or_big = 0x0000000100000001ULL;
-        eval_big = 0x8000000080000000ULL;
-        break;
-    case DF_DOUBLE:
-        eval_zero_or_big = 0x0000000000000001ULL;
-        eval_big = 0x8000000000000000ULL;
-        break;
-    }
+
     tcg_gen_subi_i64(t0, msa_wr_d[wt << 1], eval_zero_or_big);
     tcg_gen_andc_i64(t0, t0, msa_wr_d[wt << 1]);
     tcg_gen_andi_i64(t0, t0, eval_big);
-- 
2.31.1


