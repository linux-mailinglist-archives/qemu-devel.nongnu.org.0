Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2FB931B1BE
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Feb 2021 19:02:59 +0100 (CET)
Received: from localhost ([::1]:39996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBLjV-0000NR-Sy
	for lists+qemu-devel@lfdr.de; Sun, 14 Feb 2021 13:02:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBLg3-0006fT-KZ
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 12:59:23 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:40886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBLg2-00048C-7q
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 12:59:23 -0500
Received: by mail-wm1-x334.google.com with SMTP id o24so5805882wmh.5
 for <qemu-devel@nongnu.org>; Sun, 14 Feb 2021 09:59:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nZcxXspqBVewQw4ag1OM8gZofSFOcA5bVtXjShnotnE=;
 b=ryonp6mwGlI96r9ocK87n767HHxVObCorP2xdMsXWoVLsiDW3yY6yhnSIxQzcDBC+m
 W1bnRyLY6YpNHUvOSfaUo+Swy4u/DHVbsWtVx82M9ZmZwffCLgjwrEOhLAEAlnLpv8WN
 BjdKHpSendFgrAruBNzy2H3PLJgHBdHruxXIAetenhFHLBS9NWQYjswz6gc0eLiIy3P9
 tgwDnwhMGIJKKi+vl/xijFJTh+9rxIWTr5xGjnVllqLzyY4jWpjf5reZkesiAOwODXuG
 B4JRBsaMqYUqnP/19vCyisVW55K1d7E6n9h6pdO19FO9SdTk/v6tGbtutOFjJaNRDZy7
 Y5Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=nZcxXspqBVewQw4ag1OM8gZofSFOcA5bVtXjShnotnE=;
 b=sKIfoMT0C9etNf2a/Kbt78C6pGDjkkf6kSWQBA0KQMJeKegf4YflvSevjDiilKCZAc
 BP8MIrwfUwVH0WiyGj922Odv9Has23mVEbSkwO1YDIPZ9rLEDeO7HMg5L/ahC46cyXvf
 EX7krsKVvPaRFYedImGAZ0xQh6rP0W/F0wMXyX3aysbzl0qnoZWM9z82YG7CuKlzj+nv
 /+BRxbyDEopXp2Slz6+APbg0YJ+wUzkXW3EMiMidjX1iHi/VgXZoNkEQG/IVLoCf5QHW
 kqy8o80WLU1OxsMPgzDn3Ib6P1yBqT9aoLY1UY8rBt59MurB16WeUisLd26qI9yQ0ojm
 EhSA==
X-Gm-Message-State: AOAM533kvneiDyn131Y6x9X/U/ZPbEyF3Df67esXjRr8EkSe8/IQ1wGm
 fiu3f1ddSoOz00Gx9BYzHItGqtFqbBk=
X-Google-Smtp-Source: ABdhPJy4wN4YIBejaHvMV/LDjG9AjzDJMBQozHqmhMqTJxj20esK8wlFC55JMT91AACaCZr9K7b82Q==
X-Received: by 2002:a05:600c:2210:: with SMTP id
 z16mr11051007wml.50.1613325560655; 
 Sun, 14 Feb 2021 09:59:20 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id g62sm21881331wmf.46.2021.02.14.09.59.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Feb 2021 09:59:20 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 01/42] linux-user/mips64: Restore setup_frame() for o32 ABI
Date: Sun, 14 Feb 2021 18:58:31 +0100
Message-Id: <20210214175912.732946-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210214175912.732946-1-f4bug@amsat.org>
References: <20210214175912.732946-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
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
Cc: Fredrik Noring <noring@nocrew.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, "Maciej W. Rozycki" <macro@orcam.me.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

64-bit MIPS targets lost setup_frame() during the refactor in commit
8949bef18b9. Restore it declaring TARGET_ARCH_HAS_SETUP_FRAME, to be
able to build the o32 ABI target.

Fixes: 8949bef18b9 ("linux-user: move mips/mips64 signal.c parts to mips directory")
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 linux-user/mips64/target_signal.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/linux-user/mips64/target_signal.h b/linux-user/mips64/target_signal.h
index 799f7a668cd..f1f0ed7f706 100644
--- a/linux-user/mips64/target_signal.h
+++ b/linux-user/mips64/target_signal.h
@@ -67,4 +67,8 @@ typedef struct target_sigaltstack {
 #define TARGET_MINSIGSTKSZ    2048
 #define TARGET_SIGSTKSZ       8192
 
+#if defined(TARGET_ABI_MIPSO32)
+/* compare linux/arch/mips/kernel/signal.c:setup_frame() */
+#define TARGET_ARCH_HAS_SETUP_FRAME
+#endif
 #endif /* MIPS64_TARGET_SIGNAL_H */
-- 
2.26.2


