Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C14E12D916C
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 01:36:50 +0100 (CET)
Received: from localhost ([::1]:38402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kobr7-0001r8-QU
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 19:36:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kobmt-0004yQ-2e
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 19:32:27 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:52588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kobmq-0003HM-JF
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 19:32:25 -0500
Received: by mail-wm1-x343.google.com with SMTP id a6so12244396wmc.2
 for <qemu-devel@nongnu.org>; Sun, 13 Dec 2020 16:32:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zSlFyG+azHlf1O1jZlNYMT5Vr3wLituVoG139gBOWj0=;
 b=XKJfOFdxlDeW2hX0Xvu3h7Ewv2obYJoe+cWleezjRtaqY+7fy6D8uMb9DN5IN/CVe2
 SNoYx3vcySQRFyAgr8xTaF7oCDxHj0zY8a1OiDweHnhQEd1VJuXuWXabc08MbCZV++lq
 Ik7fApL8xFUgU+p9Q7fBI0FFo+sPWn6Wmsv4CZCRiUM/VrUBTI7K14t9LLuzPmNrKbD4
 T8evlsL8ETdCBTwg8L4BxVNEPmDtC+mQaTbTULLbMimiYcxQtjN6HnKE99FBV3sOSgkH
 oXgh5XMCvozytQpp7f294YwwJ6TYhs5inqZDjzoyQxyh8FIOo8AUxTaaUI4is4pZiKDc
 qLTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=zSlFyG+azHlf1O1jZlNYMT5Vr3wLituVoG139gBOWj0=;
 b=R9Ml2Tnefl1P6nUTm/bZvNSNV2n4P0PQsX0PiJi0LZGTrDjWBLJ5IJFLfpNi9/IhCp
 wTHGO8UwngmlKTin+BYNcYYjb2jc5RlnqY8mmTkzytLNro12Zf2Br+982LVN+Y7yPUIu
 kevSLXDWDTRYHqOTmGvg7Xnp/2k/QsGIsNC981zI7qkGK7BUngY/TUb6jYEtWhGRUo3H
 2aUdRPw1aKHwW7hgEpHU7OIlErdzuJX90zMO75HcjzgScfOAooLHGdkarI/t2xtOx50a
 Lp7PSjoN4crCGWkFyIsFK+jCqOP6+C/X9HfwZ4bBt8C/83gSOAR1vhhpVeH030I6vP3R
 IkgQ==
X-Gm-Message-State: AOAM531I5Pzs4cvGscS8640h107ld0sztyhZ6MaW47h4sr7V2rHKRqme
 0MinuOnLCvGoDal/VwgvTXffCISVZAQ=
X-Google-Smtp-Source: ABdhPJxEJ5Aj99bx/6yfKVl2nNZ/OAm4ud1e0s8T/HmQ2Azv4uxYv60gsDoBJUS+lUS3ZOn1q60Zrw==
X-Received: by 2002:a1c:4e0a:: with SMTP id g10mr25263288wmh.51.1607905942745; 
 Sun, 13 Dec 2020 16:32:22 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id w17sm30143283wru.82.2020.12.13.16.32.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Dec 2020 16:32:22 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 1/6] linux-user/elfload: Move GET_FEATURE macro out of
 get_elf_hwcap() body
Date: Mon, 14 Dec 2020 01:32:10 +0100
Message-Id: <20201214003215.344522-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201214003215.344522-1-f4bug@amsat.org>
References: <20201214003215.344522-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x343.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As we are going to add more macros, keep the function body clear.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 linux-user/elfload.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 0b02a926025..aae28fd929d 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -989,22 +989,22 @@ enum {
 
 #define ELF_HWCAP get_elf_hwcap()
 
+#define GET_FEATURE(_flag, _hwcap) \
+    do { if (cpu->env.insn_flags & (_flag)) { hwcaps |= _hwcap; } } while (0)
+
 static uint32_t get_elf_hwcap(void)
 {
     MIPSCPU *cpu = MIPS_CPU(thread_cpu);
     uint32_t hwcaps = 0;
 
-#define GET_FEATURE(flag, hwcap) \
-    do { if (cpu->env.insn_flags & (flag)) { hwcaps |= hwcap; } } while (0)
-
     GET_FEATURE(ISA_MIPS32R6 | ISA_MIPS64R6, HWCAP_MIPS_R6);
     GET_FEATURE(ASE_MSA, HWCAP_MIPS_MSA);
 
-#undef GET_FEATURE
-
     return hwcaps;
 }
 
+#undef GET_FEATURE
+
 #endif /* TARGET_MIPS */
 
 #ifdef TARGET_MICROBLAZE
-- 
2.26.2


