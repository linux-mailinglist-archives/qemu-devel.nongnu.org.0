Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D53F13C3F6A
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Jul 2021 23:11:11 +0200 (CEST)
Received: from localhost ([::1]:58764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2gjG-0004iT-Uj
	for lists+qemu-devel@lfdr.de; Sun, 11 Jul 2021 17:11:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m2gZx-0007cw-MP
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 17:01:33 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:41794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m2gZv-00015S-Qv
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 17:01:33 -0400
Received: by mail-wr1-x432.google.com with SMTP id k4so15762942wrc.8
 for <qemu-devel@nongnu.org>; Sun, 11 Jul 2021 14:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=d+7RhiNspFr8WZ3/u/l/wkKuuJwU+47lX6JtRyEtS3w=;
 b=hAfKykcoQfNJ9IUmqDiXDl1tQgM9pKtXg55tgGaRpBS/om3/6JXf4byuR7LTZLJtJh
 sCXypeQ5bj/xr8Xcb0Bs9rKB6VoXBTpFaMwepMt7MJccGueUX9PiWtKBV9pMF7YwogQu
 4rkiUwclQ03MIUcyNQtdSUT6dND35KYcCIgijkJbEzhv3rh/pm9jg9iGqiJxH6T7NU3S
 ZfRKsjJn/ppBy4T6RKDfkOPzIW216q/nvXhU5F9wpycUH7bCoKEVaDa0wHeYmAdrYa5n
 KhSGHxNJ2NLrAZA8AuG3PGlTLz9CyNVJJ1us3us8X+WehpvpAWEUx/2r11hgNQL5kwW9
 GjYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=d+7RhiNspFr8WZ3/u/l/wkKuuJwU+47lX6JtRyEtS3w=;
 b=tAaz6JGqrw6uoSIChpzbIxr87Csa4fkSy9odWpCer73qsvpq/Gj7B+xxPMFkBE1q+8
 qzKSdU0suRhuTECjXYIqDMWwYXNS3SQ/53xQiHUor5kRy8HPknMsL8VUp72QL3BNmREm
 nMaMe1RnoVRTIrQO7xgKmUWrlhRqMEBthfNkgDzfTh1oVuwUXV9bZa2iUF2ySuKG5r/1
 dBgf97hADQ8hXC+MXM8Re0lgzIAfZBJr0oz3yEwx4AJbBEe4olql4+z698gLHjN0coK1
 YnSlvC2mvMgrBjvw+OcTwtFTdNBJThjsmhib9WHaxXM9BAfPUPA+BeK8W0vH8gsTOUms
 +tYQ==
X-Gm-Message-State: AOAM53028EiCdZP+SPRsxhmixcdGv+ftRi3XnTitku3GQAqacdCxSOUF
 nbp5RkJfaxzS7PRvoZHAtdW9x1daGj/Kg5wB
X-Google-Smtp-Source: ABdhPJx2dP0cMoFUYFupVhzIF/GmWApTY2PYiWyaER/uU13GD9QtR9JkkMulKOS3dh2VhNP6gCHFoQ==
X-Received: by 2002:adf:8069:: with SMTP id 96mr10745150wrk.56.1626037290295; 
 Sun, 11 Jul 2021 14:01:30 -0700 (PDT)
Received: from localhost.localdomain
 (abayonne-654-1-142-116.w86-222.abo.wanadoo.fr. [86.222.93.116])
 by smtp.gmail.com with ESMTPSA id 12sm19111828wme.28.2021.07.11.14.01.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Jul 2021 14:01:29 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 13/19] target/mips: Rewrite UHI errno_mips() using switch
 statement
Date: Sun, 11 Jul 2021 23:00:10 +0200
Message-Id: <20210711210016.2710100-14-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210711210016.2710100-1-f4bug@amsat.org>
References: <20210711210016.2710100-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Cc: Thomas Huth <thuth@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Fredrik Noring <noring@nocrew.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Zak <richard.j.zak@gmail.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>
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
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20210706130723.1178961-1-f4bug@amsat.org>
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


