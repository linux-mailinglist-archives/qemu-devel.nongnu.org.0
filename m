Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D470D36CB82
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 21:13:20 +0200 (CEST)
Received: from localhost ([::1]:48934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbT91-0007ih-QI
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 15:13:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lbT7n-0007GM-MI
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 15:11:59 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:41845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lbT7l-0007cJ-Su
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 15:11:59 -0400
Received: by mail-wr1-x430.google.com with SMTP id d11so2713906wrw.8
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 12:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qu24o0esFGFk85wZi/RmTBhqz+vFHCBsju4uOG1HE5Q=;
 b=G11yu1jqNzUuxUP8hfQ3TlUhBtuytdBG41bgUN9gMJtNX1IlTS2I/zBkT54HmcF+yu
 jRd5vBGNQMQ8vJt5A6KWn9rM8wtyX4dfVkAIWW1E7FaxVhOvSabCmwcI+TADnhmIrebz
 btQ1qMwJsNjEjnsl/Ut2L33zeqLQWTl3cOrAlTRqccSG4vSXD67MwK604GNBx62cbgyG
 yVC7glemY2QQHOGu/PYgEextxWOaXMfqDYoZRESEtZ4T8Rs78DLvcYrwhm/qf2ktCLN9
 KvXTsjRURwEJ7UR9ZPBbkh7jSlAAhYUFfDmU18uFyDpvYbl500Nu3KSIKbpC7HHV201x
 rS/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=qu24o0esFGFk85wZi/RmTBhqz+vFHCBsju4uOG1HE5Q=;
 b=oxe0Ho7WRXwLEHLgQ70n2yGLcU9RrhTMEUmFYGaNllM+PhNoyaZnOyplvbSHLgSuzU
 Nm2FQ92xN+cWAR0oOIU4W0tXa5jsqyk/rzPOoUzHnkskZPHEngMFFQ0NHgkHNLB1Gde8
 INMTq9OeQuqvI0bJTXdVfgxqAJ+7X7+ZeIZ0i74U8MWbrUtrYHxL82y+cIiaKF//aStW
 gvba575VYZk/R0J2b0/IyVPLqz/GYiKXz+TsVtrWdi+lVELUPFCbOHTWmkfaXj9GDGXG
 4Ml93lcQeqmW1Ya373eloPZ0xzRMqf8lCL0Np05Brkd4JTBFHbWizg7EPs0DDi8CLHJe
 9VrQ==
X-Gm-Message-State: AOAM530nrUqtLu/yNG9VM5rANxiLUhjrpQX/cDNoWY3819iyTYHcpRiv
 oMrW5vvmRai8ugkbtH+UYngM6E3gpZ0v8w==
X-Google-Smtp-Source: ABdhPJyE7aEMdHeVlnaXqe6RI7uMnroest7YD33bKvO0GMP7tf4HSuYIzPgA+aFXuAiHC28XllGaRA==
X-Received: by 2002:a05:6000:362:: with SMTP id
 f2mr31479375wrf.141.1619550714845; 
 Tue, 27 Apr 2021 12:11:54 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id w22sm3740135wmc.13.2021.04.27.12.11.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Apr 2021 12:11:54 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH] target/mips: Allow building without Inter-Thread
 Communication hardware
Date: Tue, 27 Apr 2021 21:11:52 +0200
Message-Id: <20210427191152.260421-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The Inter-Thread Communication unit (TYPE_MIPS_ITU) is an optional
device that is only selected by a few machines. However it goes
deep into the translation code, as the MTC0/MTHC0 SAAR helpers
call itc_reconfigure().

When building with no machine selecting the ITU component (which
is implemented in hw/misc/mips_itu.c), we get the following link
failure:

  /usr/bin/ld: target_mips_cp0_helper.c.o: in function `helper_mtc0_saar':
  target/mips/cp0_helper.c:1118: undefined reference to `itc_reconfigure'
  /usr/bin/ld: target_mips_cp0_helper.c.o: in function `helper_mthc0_saar':
  target/mips/cp0_helper.c:1135: undefined reference to `itc_reconfigure'

Fix by adding a stub, built when the ITU isn't selected.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
RFC because too much Meson machinery to my taste.
But how to deal with such architectural devices else?

To reproduce:

$ echo CONFIG_JAZZ=y > default-configs/devices/mips64el-softmmu.mak
$ echo CONFIG_SEMIHOSTING=y >> default-configs/devices/mips64el-softmmu.mak
$ configure --without-default-devices
$ ninja qemu-system-mips64el
$ ./qemu-system-mips64el -M magnum -S
---
 target/mips/cp0_itu-stub.c | 15 +++++++++++++++
 target/mips/meson.build    |  3 +++
 2 files changed, 18 insertions(+)
 create mode 100644 target/mips/cp0_itu-stub.c

diff --git a/target/mips/cp0_itu-stub.c b/target/mips/cp0_itu-stub.c
new file mode 100644
index 00000000000..995b5a09ff8
--- /dev/null
+++ b/target/mips/cp0_itu-stub.c
@@ -0,0 +1,15 @@
+/*
+ * QEMU Inter-Thread Communication Unit emulation stubs
+ *
+ *  Copyright (c) 2021 Philippe Mathieu-Daudé
+ *
+ * SPDX-License-Identifier: LGPL-2.1-or-later
+ */
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "hw/misc/mips_itu.h"
+
+void itc_reconfigure(MIPSITUState *tag)
+{
+    /* nothing? */
+}
diff --git a/target/mips/meson.build b/target/mips/meson.build
index 3b131c4a7f6..a631688fae0 100644
--- a/target/mips/meson.build
+++ b/target/mips/meson.build
@@ -45,6 +45,9 @@
   'cp0_helper.c',
   'mips-semi.c',
 ))
+mips_softmmu_ss.add(when: 'CONFIG_MIPS_ITU', if_false: files(
+  'cp0_itu-stub.c',
+))
 
 mips_ss.add_all(when: 'CONFIG_TCG', if_true: [mips_tcg_ss])
 
-- 
2.26.3


