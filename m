Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9BA6F0895
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 17:46:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps3oj-0002RN-GO; Thu, 27 Apr 2023 11:45:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ps3oA-0001rA-4f
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 11:45:22 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ps3o6-0004ls-RT
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 11:45:21 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-2f4214b430aso5481352f8f.0
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 08:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682610317; x=1685202317;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BZ/8ey82+JXDwq7XVHlAwGozyCogXibvNckafjptj/k=;
 b=PT587HoWNj6m2phYFQqCQJuNsqTEndmVRQMMh6SH+wMlV3/8KCqV7FRcAP1uK8Md3v
 il8Y+SKmAtUQeuf0apcn8XHrv3SVw6Cs/dQXV7AdDrk4pNCQLMu8bJYcg9x9bOhX5RjV
 SuwU3xYfBbNflc8A3gCbQw/MZ6KxD8AUqgd0OXugyZBlfupwYabfLbASH7TpaUihzlLe
 s3gKAr2HnBNdeucBvVDbwhqw/GlLBO8q4wm84F5vg3YMYBhgxJKVuwb+ok/shHxlCv2P
 oqImzt9ihs/toj3oqOPPvKm/10nq0BI5Sm0CsbRghrIS4IxYU/FwwAn4TjVOnWMqQNez
 g+jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682610317; x=1685202317;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BZ/8ey82+JXDwq7XVHlAwGozyCogXibvNckafjptj/k=;
 b=BQjXhwg6GkkBCE7wsWL56sTGReJ5nL6Cxz4f/NTYlPUNBYBuHFIZCrSuflnufoFznt
 tmzYgDWX1ODW+qKOKlg0uQg1yWMG6wSXjekcQOH9SqaUMGUf7TYMmSCbcDeRcyfxa5fj
 7sJg9RvL6KszoLN47kTqhplnyJece6c+wSY9JXaXwGf9QFxh5zHY5h6ftfottdlm5as0
 Qz8JHDawtpTFCw1N+IpTCFKuAYYz4PHWxqo3MBunhHpTB4jTuZkYagbm2BsLy6aKLbkb
 3oaCh5gO2Aop6k6DM++BQAINy7i6m50a0gfzL6mLsCOCftczySq9JOEOMPeHXJLE3f78
 60EQ==
X-Gm-Message-State: AC+VfDzjIRa8sSvB3exEgJ2wlEUytY2I/hDQJjJ7yBY6CLifxv+HUbF9
 U4gTX0OkZXcqdQAD3M3jtEa4lA==
X-Google-Smtp-Source: ACHHUZ7yPv00Y4yNGBT4WZDxUUYyGXWCVDcuV7zw3H24vEfdWlJAgbJq7nAxCgjMCHGKp3IlLmjfPA==
X-Received: by 2002:a5d:460f:0:b0:2d8:47c7:7b50 with SMTP id
 t15-20020a5d460f000000b002d847c77b50mr1613453wrq.1.1682610317039; 
 Thu, 27 Apr 2023 08:45:17 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 v12-20020adfe28c000000b0030497b3224bsm5707007wri.64.2023.04.27.08.45.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Apr 2023 08:45:16 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C15A81FFB7;
 Thu, 27 Apr 2023 16:45:11 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, Kautuk Consul <kconsul@linux.vnet.ibm.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL 11/18] avocado_qemu/__init__.py: factor out the qemu-img finding
Date: Thu, 27 Apr 2023 16:45:03 +0100
Message-Id: <20230427154510.1791273-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230427154510.1791273-1-alex.bennee@linaro.org>
References: <20230427154510.1791273-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Message-Id: <20230424092249.58552-12-alex.bennee@linaro.org>

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


