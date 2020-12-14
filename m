Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0206F2D9167
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 01:34:16 +0100 (CET)
Received: from localhost ([::1]:55998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kobod-0005ph-Hj
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 19:34:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kobkJ-0001ug-KF
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 19:29:47 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:55949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kobkI-0002N1-5h
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 19:29:47 -0500
Received: by mail-wm1-x342.google.com with SMTP id x22so12233218wmc.5
 for <qemu-devel@nongnu.org>; Sun, 13 Dec 2020 16:29:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uPRexVPkDjCG4AyHRPKefAxhlHzd9mlDS2Ak1Dn5wzA=;
 b=KsGQ4KxuPuwCOcYZOBfJuYSkSQFJ+s5a9tB+f6VJAQqiX+YFiCb0G059Tga8+VrAOE
 pcqAMQQCt7l0E6zZE69zRKLQH6NrqSN4iYi2w4XyETjZbBbfHsAmVynL5wCFSz6bBIAo
 O/Fz0KKbF/HjqWVVmjDCDEKjfP5goNA1zcB+6GpqLj4fhK3wMF6SsNjqRN9XC9dlDb3O
 6dlLyF324/qVWv+O5T5ZV0KrU1JEN9bidxG92CZ3mTaspPrLT5RPQeqgj3MZA2weJoy9
 X6yZrMnUS2A4n7H8/+rzZEQbFPavATKi8Q7wetWhYT7mw9E8u//OD70oH8MvcgdIorp+
 WP+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=uPRexVPkDjCG4AyHRPKefAxhlHzd9mlDS2Ak1Dn5wzA=;
 b=OQY23x0UK4MHLovcWoimdSIlo0CyulOsgoLrrVsOIJ7w0xBM5dgAg9tOICKqGFRqeU
 a5jc6Co2xr/2AFlyYJNUdRBQaMbnulgEONbp69bz6V0sWS8hptzfs6ABkx81y2HD4Fom
 iRCu0rmr7pG2cEooA3FKGoY0P6dyrOsdFxUbNn7z24j8gc8YBuM+DqXGIBh77g8xZ3gO
 3qmGIKQfDZF/rtplpdQKLX0td9ykrhX15xY5PCLLns2D9nOS4XQqx8uytdVzeeG871z+
 ExFiB8SfMtoQe0YewDiX7TRnBGcQLfHeVgWam3Rq5+ONmsxgJibPR6E1T8dVeACXOlOw
 fXWA==
X-Gm-Message-State: AOAM5309FuvPCMR2+P0t21XOvPAXUgU+ziJwC0IshAVGrehfZEu6SQEd
 SHZyCjwQb0Fskm9Vj/QH09wSXHH37O8=
X-Google-Smtp-Source: ABdhPJz0vLg1dHYIFYCW8IHnH92vbID6VMSm6pGEf9qPMhDIcPw50CVVn53Y+nSJworZ2wc0vfpsDA==
X-Received: by 2002:a7b:c930:: with SMTP id h16mr25226062wml.175.1607905784732; 
 Sun, 13 Dec 2020 16:29:44 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id a144sm28112767wmd.47.2020.12.13.16.29.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Dec 2020 16:29:44 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 3/7] linux-user/elfload: Rename MIPS GET_FEATURE() as
 GET_FEATURE_INSN()
Date: Mon, 14 Dec 2020 01:29:24 +0100
Message-Id: <20201214002928.343686-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201214002928.343686-1-f4bug@amsat.org>
References: <20201214002928.343686-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x342.google.com
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
 Laurent Vivier <laurent@vivier.eu>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We want to add macros similar to GET_FEATURE().
As this one use the 'insn_flags' field, rename it
GET_FEATURE_INSN().

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 linux-user/elfload.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index aae28fd929d..0e1d7e7677c 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -989,7 +989,7 @@ enum {
 
 #define ELF_HWCAP get_elf_hwcap()
 
-#define GET_FEATURE(_flag, _hwcap) \
+#define GET_FEATURE_INSN(_flag, _hwcap) \
     do { if (cpu->env.insn_flags & (_flag)) { hwcaps |= _hwcap; } } while (0)
 
 static uint32_t get_elf_hwcap(void)
@@ -997,13 +997,13 @@ static uint32_t get_elf_hwcap(void)
     MIPSCPU *cpu = MIPS_CPU(thread_cpu);
     uint32_t hwcaps = 0;
 
-    GET_FEATURE(ISA_MIPS32R6 | ISA_MIPS64R6, HWCAP_MIPS_R6);
-    GET_FEATURE(ASE_MSA, HWCAP_MIPS_MSA);
+    GET_FEATURE_INSN(ISA_MIPS32R6 | ISA_MIPS64R6, HWCAP_MIPS_R6);
+    GET_FEATURE_INSN(ASE_MSA, HWCAP_MIPS_MSA);
 
     return hwcaps;
 }
 
-#undef GET_FEATURE
+#undef GET_FEATURE_INSN
 
 #endif /* TARGET_MIPS */
 
-- 
2.26.2


