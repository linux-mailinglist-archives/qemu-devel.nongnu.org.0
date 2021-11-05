Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E1B44651B
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 15:37:08 +0100 (CET)
Received: from localhost ([::1]:54392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mj0L5-0005WJ-KK
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 10:37:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mj0Ih-0002ni-7T
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 10:34:39 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:33529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mj0Ic-00074q-W3
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 10:34:38 -0400
Received: by mail-wr1-x42f.google.com with SMTP id d24so14100776wra.0
 for <qemu-devel@nongnu.org>; Fri, 05 Nov 2021 07:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i7Uh9c2q7Auf6sUoXxHhubumuCyiIM9A6N1kq/ZvPUc=;
 b=RjgYpLz1ECJBbk/R3IcUy20ge+TLwrOXuM9MsJ9VL/hLgRlYOXiLFU9eRNUQBrbRN8
 nhH58Y012ECKzW/ShX0igg3bv6vzud7YyREEMImkoUCq6I7/Tymmag7hyQK42CHqq3mQ
 io9b1+/n/1AWcHkSePpYAIl//QJhIHa4kmTfWU/OqC/ijm6vrjaMRGMsw1EYUjBom+xn
 h6TahsHsuAWvAhkdj2+RuBoisAHZ60VlWAQymrAO6tCGHQ0eWaLobE+B7Pf7KWeRVmAp
 AUyC0L34v/lFlHMqAIlIcXuwVsHjezjgq5wjolfvNG06dfq2lazzz8afGp5CaWQzkivr
 dtcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=i7Uh9c2q7Auf6sUoXxHhubumuCyiIM9A6N1kq/ZvPUc=;
 b=dLYezn6e4jLS1N406jskvzJHqOIWTRe4AEM6etvO+nBomzzBGKSBJvPPIjoUKiNL1u
 DzGkgEMrQ1vfshKeFITW7FLsNEMqm47bxshtBdguOu3/g9ZZV5zTHHIroyuboPmwp7a6
 YDUfhM7L1Xi3LarPwmgY+gFNk5Pc+2RKOLQGXMuYvdS0yI97IsgH0jmDTG4THqi6XmyP
 x5arcqmykLHw2tiWEPYIENNEDBLfbCH88kRlt5suoZsVw0CQDQRolGx4ctOnfEEjepHh
 g9K+68ApJ9GfYS3bvr7EnDToXpr0Ex76RtKtYL0HbnmnnSv6J6kppPUoWgcF3DSwfRRU
 OCnA==
X-Gm-Message-State: AOAM530w31DbClPAXB/9bE+//1NRLWxtnmUZ8VUuFAn9QMQSdMIp31Km
 GpbILhuICcZ5Z6tnmqyp/QR9sXDddVE=
X-Google-Smtp-Source: ABdhPJx0v3YjCbizjNybGbmfoNqxtboay6vtGmkNUmD2g+K0bCeDgd9H2Iwme3hohNfG/4oaExoamg==
X-Received: by 2002:adf:c78d:: with SMTP id l13mr73169435wrg.134.1636122873419; 
 Fri, 05 Nov 2021 07:34:33 -0700 (PDT)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id y12sm8247266wrn.73.2021.11.05.07.34.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Nov 2021 07:34:32 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 3/6] tests/acceptance: Introduce QemuUserTest base class
Date: Fri,  5 Nov 2021 15:34:13 +0100
Message-Id: <20211105143416.148332-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211105143416.148332-1-f4bug@amsat.org>
References: <20211105143416.148332-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
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
Cc: Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Similarly to the 'System' Test base class with methods for testing
system emulation, the QemuUserTest class contains methods useful to
test user-mode emulation.

Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20211102084232.2965062-4-f4bug@amsat.org>
---
 tests/avocado/avocado_qemu/__init__.py | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/tests/avocado/avocado_qemu/__init__.py b/tests/avocado/avocado_qemu/__init__.py
index 984c554e7d6..e46b3ecb89e 100644
--- a/tests/avocado/avocado_qemu/__init__.py
+++ b/tests/avocado/avocado_qemu/__init__.py
@@ -17,7 +17,7 @@
 import uuid
 
 import avocado
-from avocado.utils import cloudinit, datadrainer, network, ssh, vmimage
+from avocado.utils import cloudinit, datadrainer, network, process, ssh, vmimage
 from avocado.utils.path import find_command
 
 #: The QEMU build root directory.  It may also be the source directory
@@ -295,6 +295,23 @@ def tearDown(self):
         super().tearDown()
 
 
+class QemuUserTest(QemuBaseTest):
+    """Facilitates user-mode emulation tests."""
+
+    def setUp(self):
+        self._ldpath = []
+        super().setUp('qemu-')
+
+    def add_ldpath(self, ldpath):
+        self._ldpath.append(os.path.abspath(ldpath))
+
+    def run(self, bin_path, args=[]):
+        qemu_args = " ".join(["-L %s" % ldpath for ldpath in self._ldpath])
+        bin_args = " ".join(args)
+        return process.run("%s %s %s %s" % (self.qemu_bin, qemu_args,
+                                            bin_path, bin_args))
+
+
 class LinuxSSHMixIn:
     """Contains utility methods for interacting with a guest via SSH."""
 
-- 
2.31.1


