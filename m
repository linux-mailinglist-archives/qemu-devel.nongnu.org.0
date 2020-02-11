Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC8F159643
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Feb 2020 18:36:28 +0100 (CET)
Received: from localhost ([::1]:54024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j1ZSV-00046I-IS
	for lists+qemu-devel@lfdr.de; Tue, 11 Feb 2020 12:36:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44115)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1j1ZRR-0003YY-Re
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 12:35:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1j1ZRQ-0008Vp-IG
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 12:35:21 -0500
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:51629)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1j1ZRQ-0008UX-9Q
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 12:35:20 -0500
Received: by mail-wm1-x344.google.com with SMTP id t23so4686062wmi.1
 for <qemu-devel@nongnu.org>; Tue, 11 Feb 2020 09:35:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dw7N2pZR97SczE3s06dFGgzG7Il+TOoFxfQV5ikQgiw=;
 b=XPKoNhK3vaN3q237RSjRex30XintZwBkIN2DOGI+CtHRJLredCR3kcaGcrbedCk1vv
 xkeI6usPBaOi+ZkVDjB3OYZd48VCCwv2cos2sNbT2SfBOGz036t6mSJaHuUr/kZv07hN
 Ld/P79JPJLyNDvlSf+htEo8iCxPK4cTQuP24CASzki0e4fLwf+h3D5IDtgzYJCS1KlLI
 0d/SnvAK/Zqm0DFcm2+olXZt1IYBIefBbxVu4P2dcEHzqU22PswleyB+x2lt3RAroCU3
 f9xfi8SC5PAXyGeBj3Wxrd1LXGTomD9nfLNCDK4+x4hCSezApwV8eta/7wQlVk0NeuF9
 UlFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dw7N2pZR97SczE3s06dFGgzG7Il+TOoFxfQV5ikQgiw=;
 b=GPVYPRSs/2+v0tW+3K1EHoHwVh/xOVKZfp+d+jnezjiZdzvVhsgKeWCGggq2TNQHdj
 ayNGX1zeqHI4Etn981x1uayM41wZNnM7Z5JKlnX91gg4e6uz5hUsM/yzKReGLA4ooJ3i
 Me+s5RymcBW9/OxBK77pcSlAFQTDmZw+m9CvS/TeY4EUkyGWdrhQO8wH5GtLJIs2nhuv
 rIGsigD0oUQ1KtJEWCpHKB8cFf8BIzCcD6jwxy9oblm0FdQRxelDFfHHOHz0vhUnp61P
 oXnzhHsgInAgDIVKte84ufFz+WgYlHDos9DNLlzmf2CnMhYyyM9/t28LFJZemSIhatVg
 IcbA==
X-Gm-Message-State: APjAAAWRVRlAfEuc03XbzJo9ORnEJTMSpgFreJ/tjKev0Z+h7aQl/Gph
 LIhie542NbxiCeALGRasB7C7Ug==
X-Google-Smtp-Source: APXvYqzmvm3F45g8coUv49but7YWkaCmhCeQQj/xyRbouoaXVzL6Oiqr9yDiGTsAnrusg1v0Cp76RQ==
X-Received: by 2002:a7b:c8d7:: with SMTP id f23mr6572014wml.173.1581442518434; 
 Tue, 11 Feb 2020 09:35:18 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b10sm5914398wrw.61.2020.02.11.09.35.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2020 09:35:16 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 320941FF87;
 Tue, 11 Feb 2020 17:35:16 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] linux-user: un-register threads from RCU before exit
Date: Tue, 11 Feb 2020 17:35:10 +0000
Message-Id: <20200211173510.16347-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::344
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Riku Voipio <riku.voipio@iki.fi>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Through a mechanism I don't quite yet understand we can find ourselves
with a left over RCU thread when we exit group. This is a racy failure
that occurs for example with:

  alpha-linux-user running testthread
    with libhowvec.so plugin
    but only when run from make

This may not be the correct fix but it seems to alleviate the
symptoms.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>
---
 linux-user/exit.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/linux-user/exit.c b/linux-user/exit.c
index a362ef67d2c..1c7ce347324 100644
--- a/linux-user/exit.c
+++ b/linux-user/exit.c
@@ -28,12 +28,13 @@ extern void __gcov_dump(void);
 
 void preexit_cleanup(CPUArchState *env, int code)
 {
+    rcu_unregister_thread();
 #ifdef TARGET_GPROF
-        _mcleanup();
+    _mcleanup();
 #endif
 #ifdef CONFIG_GCOV
-        __gcov_dump();
+    __gcov_dump();
 #endif
-        gdb_exit(env, code);
-        qemu_plugin_atexit_cb();
+    gdb_exit(env, code);
+    qemu_plugin_atexit_cb();
 }
-- 
2.20.1


