Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C92ED6EC8C3
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 11:24:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqsQD-00087X-0Z; Mon, 24 Apr 2023 05:23:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pqsPj-0007JY-TE
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 05:23:25 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pqsPR-0004oG-RS
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 05:23:14 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-2fddb442d47so3817410f8f.2
 for <qemu-devel@nongnu.org>; Mon, 24 Apr 2023 02:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682328176; x=1684920176;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k3CcGFsLs0X/rcB8rUBi4/9QeDN/ZK8Y25q/vvmaz/M=;
 b=qQOz0BM1XgpF11Fnol50ZtckcMGGoW8Th7dj81dChwp5mcuZEIcf+pycRUOSdUlrOM
 iWQgJ6uNQX3P8gYYeWxzT6FEoNWIAUxeFkmAoq4ZXFe1dTzjsTTYXubo5VviaI4kzKf8
 2G3BAzjapoYztFOsY63lyDlskGe67zrWezoTgs7RZWvItkZxLNdz/TLFjXwIVKK04nbX
 nwLunfjzYOsKOQznvpcy8ZJRXPVygCsxGjfdMmG/6VRyd4frvr5tOlf9ibq28OocKioy
 k2kgR2FX/arBGUjMg954Dt5yFotrYNNFeU4OVyFlbtWX1HVausFJFHWlu1XI+SG7cixG
 zeAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682328176; x=1684920176;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k3CcGFsLs0X/rcB8rUBi4/9QeDN/ZK8Y25q/vvmaz/M=;
 b=KyrG3a2q+RsKTxEBOkxzu1Krfa5szDfizSdW83cf6NuKkJC935daM0fDsavY302Fpx
 eMx+t+dTC8M8B7ZGBWBVcILtNR8IJkMvbyYsv96EESN/qM+ZEbJ8+64vp9Y71gPPQ4+e
 jCd4H/B3/z2odHEKBGcYv8JcKno3XvpQ1o9v7OBH7zg48BLW5LMlFsYRqjmLIrE/rszf
 fLnKy9bFdA72Kq6o1HlsxUV4zGfJ32pAWMZ5qe5g9x6xEEe6TVdAJ76/ds4M8kRGhwas
 pkzOR8M1pnpzR0Sj9VT04mwE5eFq08r0vAeR6V+qik8pK9fdptj/UKPn/6JVRerypMfR
 rnMA==
X-Gm-Message-State: AAQBX9ejYd3RklmGevG6yeCjpfNdYuHTCVQjsbxWHXtstAp/pKFqA3IT
 x0vzW5/sqJ6nKHm8GGX1Vj5gCQ==
X-Google-Smtp-Source: AKy350YlXlZsisAX5eueqPGDzkatxqG0pEljPV2MsjpbT9juAri6cdkU+LlF2ae5t1UqRrCFe9dOeg==
X-Received: by 2002:adf:eacc:0:b0:2f4:867e:efaa with SMTP id
 o12-20020adfeacc000000b002f4867eefaamr9543892wrn.53.1682328176281; 
 Mon, 24 Apr 2023 02:22:56 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 r4-20020adfdc84000000b002f598008d50sm10341053wrj.34.2023.04.24.02.22.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Apr 2023 02:22:53 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A848B1FFB8;
 Mon, 24 Apr 2023 10:22:50 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Leif Lindholm <quic_llindhol@quicinc.com>,
 Markus Armbruster <armbru@redhat.com>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 John Snow <jsnow@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 David Hildenbrand <david@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-s390x@nongnu.org,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-arm@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Kautuk Consul <kconsul@linux.vnet.ibm.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>
Subject: [PATCH 11/18] avocado_qemu/__init__.py: factor out the qemu-img
 finding
Date: Mon, 24 Apr 2023 10:22:42 +0100
Message-Id: <20230424092249.58552-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230424092249.58552-1-alex.bennee@linaro.org>
References: <20230424092249.58552-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Kautuk Consul <kconsul@linux.vnet.ibm.com>

Factor out the code that finds the qemu-img binary in the
QemuSystemTest class and create a new get_qemu_img() function
with it. This function will get called also from the new code
in tuxrun_baselines.py avocado test-case.

Signed-off-by: Kautuk Consul <kconsul@linux.vnet.ibm.com>
Reviewed-by: Harsh Prateek Bora <harshpb@linux.ibm.com>
Suggested-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230421042322.684093-2-kconsul@linux.vnet.ibm.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/avocado/avocado_qemu/__init__.py | 27 +++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/tests/avocado/avocado_qemu/__init__.py b/tests/avocado/avocado_qemu/__init__.py
index 6788837e1b..33090903f1 100644
--- a/tests/avocado/avocado_qemu/__init__.py
+++ b/tests/avocado/avocado_qemu/__init__.py
@@ -330,6 +330,19 @@ def _new_vm(self, name, *args):
             vm.add_args(*args)
         return vm
 
+    def get_qemu_img(self):
+        self.log.debug('Looking for and selecting a qemu-img binary')
+
+        # If qemu-img has been built, use it, otherwise the system wide one
+        # will be used.
+        qemu_img = os.path.join(BUILD_DIR, 'qemu-img')
+        if not os.path.exists(qemu_img):
+            qemu_img = find_command('qemu-img', False)
+        if qemu_img is False:
+            self.cancel('Could not find "qemu-img"')
+
+        return qemu_img
+
     @property
     def vm(self):
         return self.get_vm(name='default')
@@ -602,17 +615,9 @@ def set_up_existing_ssh_keys(self):
         return (ssh_public_key, ssh_private_key)
 
     def download_boot(self):
-        self.log.debug('Looking for and selecting a qemu-img binary to be '
-                       'used to create the bootable snapshot image')
-        # If qemu-img has been built, use it, otherwise the system wide one
-        # will be used.  If none is available, the test will cancel.
-        qemu_img = os.path.join(BUILD_DIR, 'qemu-img')
-        if not os.path.exists(qemu_img):
-            qemu_img = find_command('qemu-img', False)
-        if qemu_img is False:
-            self.cancel('Could not find "qemu-img", which is required to '
-                        'create the bootable image')
-        vmimage.QEMU_IMG = qemu_img
+        # Set the qemu-img binary.
+        # If none is available, the test will cancel.
+        vmimage.QEMU_IMG = super().get_qemu_img()
 
         self.log.info('Downloading/preparing boot image')
         # Fedora 31 only provides ppc64le images
-- 
2.39.2


