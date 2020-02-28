Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5132B173D6B
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Feb 2020 17:47:41 +0100 (CET)
Received: from localhost ([::1]:50524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j7inc-0006g3-7B
	for lists+qemu-devel@lfdr.de; Fri, 28 Feb 2020 11:47:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56723)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j7ifU-0008AO-FN
 for qemu-devel@nongnu.org; Fri, 28 Feb 2020 11:39:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j7ifT-00024s-83
 for qemu-devel@nongnu.org; Fri, 28 Feb 2020 11:39:16 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:39593)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j7ifT-00024L-1P
 for qemu-devel@nongnu.org; Fri, 28 Feb 2020 11:39:15 -0500
Received: by mail-wm1-x334.google.com with SMTP id c84so3871855wme.4
 for <qemu-devel@nongnu.org>; Fri, 28 Feb 2020 08:39:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=deB/lxPKVSLn1ypxY7579PxrzfoDtHNbi+JWV5TUv2w=;
 b=F7O+cBQJSbxljWBlBDC7IKP6gOcKhptKS2MtgYikp8W5ewT2oCm0d2BetfQD4vdXQQ
 p2+Lg49R49sOJqJQex3OVjAHI7/RdYLi4UH3J1NqefekI7o88AjcZqivCYw6L/pBeLLL
 IJEEBXnXmEtXsXhWd3+2dlPLYnXjg1/sjlId1QQIPCM0I62k17vOpVh7lkMO2Z2igFnm
 R36/oY5+sjvED4ch7JTrykwSlPvyiPZzTYYnGlkKEB5AiCaJPrRuhA+BBttpRiGRSVas
 UMVIkocRuxkPumx8QbZSe/sYdP45DGogAoflq6f91xY5z+WkerB3XP9faCML5TEvyUsQ
 H9Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=deB/lxPKVSLn1ypxY7579PxrzfoDtHNbi+JWV5TUv2w=;
 b=MxesmXY7jprNzXgh8tHYgm8R2fn53neAp9Ono8oFE80ZTf+QrHarnQgEYiGoxyxfcj
 ICSnMigEJQ9A08a/1wUco0gH9ye4VlKryD52Mkbv2IEbG5tdAlqJvycqYinyws4lRLTB
 UNJni7dZBoj2KEbRvcKme8upqf7epXTTKY2SlNPbr2dnIWZBPv/GWRSS/3Zg8Ws90frH
 v6PLznxU8rxlHw+LtLl+U3KwwkqUjSS3MEx5McpuOMEiG7NhMpA9+uL2ANo8c/1expAd
 lHn7domIR624AIu2xC3IZsYe7Vew/S7KS1vym2b+ftG3LGABBACuwcpSroJIijDpJZ/0
 CLMw==
X-Gm-Message-State: APjAAAXndCGsuB+/VMZ2mn7AOuXtTrkb5GovfCCVb0f9aDEIDysERUGz
 +FjEAREYRgUa2QjP+S0AUPalC13IDrPJJQ==
X-Google-Smtp-Source: APXvYqzjmIUCdGcOimhBmCoRZDXENAetD+QGvhY3WU7wip4NRHRi+sHXFkIDbQ1qUfUO6LtibraXJg==
X-Received: by 2002:a1c:a5c2:: with SMTP id o185mr3558677wme.173.1582907953570; 
 Fri, 28 Feb 2020 08:39:13 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id c9sm13335214wrq.44.2020.02.28.08.39.12
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2020 08:39:13 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 27/33] tests/acceptance: Extract boot_integratorcp() from
 test_integratorcp()
Date: Fri, 28 Feb 2020 16:38:34 +0000
Message-Id: <20200228163840.23585-28-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200228163840.23585-1-peter.maydell@linaro.org>
References: <20200228163840.23585-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::334
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

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

As we want to re-use this code, extract it as a new function.
Since we are using the PL011 serial console, add a Avocado tag
to ease filtering of tests.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20200225172501.29609-4-philmd@redhat.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 tests/acceptance/machine_arm_integratorcp.py | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/tests/acceptance/machine_arm_integratorcp.py b/tests/acceptance/machine_arm_integratorcp.py
index d928ed79b4c..22afd3b82a8 100644
--- a/tests/acceptance/machine_arm_integratorcp.py
+++ b/tests/acceptance/machine_arm_integratorcp.py
@@ -18,13 +18,7 @@ class IntegratorMachine(Test):
 
     timeout = 90
 
-    @skipUnless(os.getenv('AVOCADO_ALLOW_UNTRUSTED_CODE'), 'untrusted code')
-    def test_integratorcp_console(self):
-        """
-        Boots the Linux kernel and checks that the console is operational
-        :avocado: tags=arch:arm
-        :avocado: tags=machine:integratorcp
-        """
+    def boot_integratorcp(self):
         kernel_url = ('https://github.com/zayac/qemu-arm/raw/master/'
                       'arm-test/kernel/zImage.integrator')
         kernel_hash = '0d7adba893c503267c946a3cbdc63b4b54f25468'
@@ -40,4 +34,14 @@ class IntegratorMachine(Test):
                          '-initrd', initrd_path,
                          '-append', 'printk.time=0 console=ttyAMA0')
         self.vm.launch()
+
+    @skipUnless(os.getenv('AVOCADO_ALLOW_UNTRUSTED_CODE'), 'untrusted code')
+    def test_integratorcp_console(self):
+        """
+        Boots the Linux kernel and checks that the console is operational
+        :avocado: tags=arch:arm
+        :avocado: tags=machine:integratorcp
+        :avocado: tags=device:pl011
+        """
+        self.boot_integratorcp()
         wait_for_console_pattern(self, 'Log in as root')
-- 
2.20.1


