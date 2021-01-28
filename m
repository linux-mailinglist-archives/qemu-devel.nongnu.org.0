Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 756E130789B
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 15:51:46 +0100 (CET)
Received: from localhost ([::1]:45310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l58e9-000505-HD
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 09:51:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l58Uy-000175-0S
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 09:42:16 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:42167)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l58Uw-0007Qf-8L
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 09:42:15 -0500
Received: by mail-ej1-x630.google.com with SMTP id r12so8105522ejb.9
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 06:42:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/NZWiNgrL0JvRHxnsj+sLTCD94H0+awi3rBlYAhZllE=;
 b=sQRQnZ0f6zWUSS81H381TlTKF2dRHT/G4HDbhc55wGazqCANc5fuk+qDwxs711hyqH
 M1IZhMvoiFKX0cGPahynB6b6q3PONhCiY2KWFxZhLgUhZbhstLFeumdHKoXUKDkgidQZ
 JdEEGVFcMd3Ucej25yZIRQpCY2lwNHy+6WXYMP42d1E13X/Ezr394VstWWB/S9ZKb/vQ
 WQEXmmJfqNg7ymXVOUdRLDrAzQFxpNdtxYQXf117SYLRBs3y7o8mItBFc0kuAnvqYC34
 AsJSPETaNjlsij2K7dNdW8ZuhlsoxXGLh3RdMDgJo8wLGuSQG9jr9Zp0idt+u8g/Lmcd
 eVQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=/NZWiNgrL0JvRHxnsj+sLTCD94H0+awi3rBlYAhZllE=;
 b=eDrGjzoLUX8JRT+z3odd0L4+PO/VN+FWkbqhTQQ+D640iN3cNtgJ1rV9146LyZWVzH
 EO2SF2nu9XLuOwHoXKqgtltecgI7cvDMSbX3SHbRrwxa39QJweLihVE7DyodfeLavnCa
 XONOsOU3ApZ8l5hekGBtU0MlrmJjpgidna2aDfCzqKuvX7aZWp5utfY2wOGcqeS+XA53
 3RJGhGZom2XQ/AS/IpWij38P1BOjnKUF41gczMzXotaJYPK6lS5LLKFkNSCF6+OHHMHy
 qXtWNxwyVdeUpAJ+S1IwyOGjvLRq4GO9STgslDBdcu0mvvkqMpMQIHH3XT9GZmsamnov
 0sEQ==
X-Gm-Message-State: AOAM532bbjFMkoSjybOuImCqmdWof9rIssxgyiUhdqLXQ1OyLsapuMiO
 Rr3WBp5e80aP4XuWz3J/ftEImE91VPo=
X-Google-Smtp-Source: ABdhPJy3o+AJiJGeNYhKyIKqxs5gAhMp5E8chbD2YoPI/iBd7pXmmXnLOjobdH3esf8zYEhHWrtzcw==
X-Received: by 2002:a17:906:e09:: with SMTP id
 l9mr11586525eji.196.1611844931184; 
 Thu, 28 Jan 2021 06:42:11 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id x21sm2372578eje.118.2021.01.28.06.42.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 06:42:10 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/13] target/mips: Let do_translate_address() take
 MMUAccessType argument
Date: Thu, 28 Jan 2021 15:41:20 +0100
Message-Id: <20210128144125.3696119-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210128144125.3696119-1-f4bug@amsat.org>
References: <20210128144125.3696119-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x630.google.com
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
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Joe Komlodi <komlodi@xilinx.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The single caller, HELPER_LD_ATOMIC(), passes MMUAccessType to
do_translate_address(). Let the prototype use it as argument,
as it is stricter than an integer.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/op_helper.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/target/mips/op_helper.c b/target/mips/op_helper.c
index 9fce0194b3e..b80e8f75401 100644
--- a/target/mips/op_helper.c
+++ b/target/mips/op_helper.c
@@ -288,13 +288,14 @@ target_ulong helper_rotx(target_ulong rs, uint32_t shift, uint32_t shiftx,
 #ifndef CONFIG_USER_ONLY
 
 static inline hwaddr do_translate_address(CPUMIPSState *env,
-                                                      target_ulong address,
-                                                      int rw, uintptr_t retaddr)
+                                          target_ulong address,
+                                          MMUAccessType access_type,
+                                          uintptr_t retaddr)
 {
     hwaddr paddr;
     CPUState *cs = env_cpu(env);
 
-    paddr = cpu_mips_translate_address(env, address, rw);
+    paddr = cpu_mips_translate_address(env, address, access_type);
 
     if (paddr == -1LL) {
         cpu_loop_exit_restore(cs, retaddr);
-- 
2.26.2


