Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D5B3BD773
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 15:08:42 +0200 (CEST)
Received: from localhost ([::1]:32918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0koa-0004n1-Ac
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 09:08:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m0knR-000438-9f
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 09:07:29 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:41875)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m0knP-0002Uk-BL
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 09:07:28 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 a5-20020a7bc1c50000b02901e3bbe0939bso2244560wmj.0
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 06:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=N4Mkk4HcfCBX+03rpOfdfjtVELcj4qAp73XXxF7B4uc=;
 b=Jz/hMGdOrkTreJ13bp4yBXGNTKauor98dOY20lzs/eq0FzMq89bTIYh1Y0irK2nu/t
 X2EzOCTAAdaVeq4v5KOI09hETGHM/DUK/n7VAmc1171cQkshoPEljy8c55DP88CWHkMY
 ElBYcQPJrxJ+sUOuLjoTDEPz1KItkFtrhdV7ciU73Ur9CAD/tdwpmKmhWs1JIXfDTv/8
 hrTda/umrKTxrHl+maBmmKl/DJBOEOJpMkI7tONDgkXSGKhTXlNrs5E4bqlal+oJrXzC
 scGpjcB/LEGCVYSZTSjkHUQoln3wOjyaBj5j7Tc8zBxSU7/Ro7TrwX63cuqU3HcPlzpA
 WVQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=N4Mkk4HcfCBX+03rpOfdfjtVELcj4qAp73XXxF7B4uc=;
 b=ZrlZf9JO/Y3wEzHFMsWgTNNsJvNusTVi3pdwSANPui89ydoz9SWfe1pk68pxbfTSWv
 xN9TwC+CR9ajvGckOvIVEL4/GOtijUhtej2O2A9N63ZdkimyDwV00x/NZd2/QPkAy294
 LrFPqNs+h5Slurbt2JF0kLLa7+yO2UiL+x8eUUSrI6ILEw2SDBN0ek/X3SaH8FsO1ibt
 K1hpPWED81av01PeyzobsHCk8AYE+PoYbdCGzYrWOkWhLJtGpcstsAN5u1WAXD4mPlHQ
 PwtqGt1JAtsxAaLVP9khURtdVnD5miO54ZoAVQS2Pld0dOZFZH6ym66mAUSW945/mdta
 XIWw==
X-Gm-Message-State: AOAM5332SE9OnsvSCZcKDwaMg/8zJRy5YOoQbZGGDm3F/a1Ws9lM3J5i
 MIkXJle0thJItoymmdOtOU31tMTPkoU=
X-Google-Smtp-Source: ABdhPJwPg4HBDcELcJP2UKlYCxn6YCikrlsyFW4+76umN87/bk9Mc3nW3z52V6wVhzMipiWrpgjHVA==
X-Received: by 2002:a05:600c:246:: with SMTP id 6mr593503wmj.133.1625576845558; 
 Tue, 06 Jul 2021 06:07:25 -0700 (PDT)
Received: from x1w.redhat.com (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id x18sm16371998wrw.19.2021.07.06.06.07.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 06:07:24 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] target/mips: Rewrite UHI errno_mips() using switch
 statement
Date: Tue,  6 Jul 2021 15:07:23 +0200
Message-Id: <20210706130723.1178961-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Alexander von Gluck IV <kallisti5@unixzen.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Zak <richard.j.zak@gmail.com>, Leon Alrae <leon.alrae@imgtec.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Linking on Haiku OS fails:

  /boot/system/develop/tools/bin/../lib/gcc/x86_64-unknown-haiku/8.3.0/../../../../x86_64-unknown-haiku/bin/ld:
  error: libqemu-mips-softmmu.fa.p/target_mips_tcg_sysemu_mips-semi.c.o(.rodata) is too large (0xffff405a bytes)
  /boot/system/develop/tools/bin/../lib/gcc/x86_64-unknown-haiku/8.3.0/../../../../x86_64-unknown-haiku/bin/ld:
  final link failed: memory exhausted
  collect2: error: ld returned 1 exit status

This is because the host_to_mips_errno[] uses errno as index,
for example:

  static const uint16_t host_to_mips_errno[] = {
      [ENAMETOOLONG] = 91,
      ...

and Haiku defines [*] ENAMETOOLONG as:

   12 /* Error baselines */
   13 #define B_GENERAL_ERROR_BASE              INT_MIN
   ..
   22 #define B_STORAGE_ERROR_BASE              (B_GENERAL_ERROR_BASE + 0x6000)
  ...
  106 #define B_NAME_TOO_LONG                   (B_STORAGE_ERROR_BASE + 4)
  ...
  211 #define ENAMETOOLONG                      B_TO_POSIX_ERROR(B_NAME_TOO_LONG)

so the array ends up beeing indeed too big.

Since POSIX errno can't be use as indexes on Haiku,
rewrite errno_mips() using a switch statement.

[*] https://github.com/haiku/haiku/blob/r1beta3/headers/os/support/Errors.h#L130

Reported-by: Richard Zak <richard.j.zak@gmail.com>
Suggested-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Supersedes: <20210704170736.617895-4-f4bug@amsat.org>
---
 target/mips/tcg/sysemu/mips-semi.c | 24 +++++++++---------------
 1 file changed, 9 insertions(+), 15 deletions(-)

diff --git a/target/mips/tcg/sysemu/mips-semi.c b/target/mips/tcg/sysemu/mips-semi.c
index 77108b0b1a9..b4a383ae90c 100644
--- a/target/mips/tcg/sysemu/mips-semi.c
+++ b/target/mips/tcg/sysemu/mips-semi.c
@@ -74,25 +74,19 @@ enum UHIOpenFlags {
     UHIOpen_EXCL   = 0x800
 };
 
-/* Errno values taken from asm-mips/errno.h */
-static const uint16_t host_to_mips_errno[] = {
-    [ENAMETOOLONG] = 78,
+static int errno_mips(int host_errno)
+{
+    /* Errno values taken from asm-mips/errno.h */
+    switch (host_errno) {
+    case 0:             return 0;
+    case ENAMETOOLONG:  return 78;
 #ifdef EOVERFLOW
-    [EOVERFLOW]    = 79,
+    case EOVERFLOW:     return 79;
 #endif
 #ifdef ELOOP
-    [ELOOP]        = 90,
+    case ELOOP:         return 90;
 #endif
-};
-
-static int errno_mips(int err)
-{
-    if (err < 0 || err >= ARRAY_SIZE(host_to_mips_errno)) {
-        return EINVAL;
-    } else if (host_to_mips_errno[err]) {
-        return host_to_mips_errno[err];
-    } else {
-        return err;
+    default:            return EINVAL;
     }
 }
 
-- 
2.31.1


