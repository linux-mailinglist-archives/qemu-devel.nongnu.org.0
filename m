Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4A562E309
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 18:29:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovieI-0006R5-5p; Thu, 17 Nov 2022 12:26:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ovie5-0006LW-3k
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 12:25:49 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ovie2-0006Ex-2s
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 12:25:48 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 j5-20020a05600c410500b003cfa9c0ea76so2254671wmi.3
 for <qemu-devel@nongnu.org>; Thu, 17 Nov 2022 09:25:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qC/VoVqNlKC3sjWCOYbeWRAUuEITkY8ByQXqJYDIr5s=;
 b=HHJgyU1NDgzpyLbfiLzF/Ksi3Qeh7v6JkzLWhz+E4EEjTCSAGpp9wgX1TcXBlobrt9
 9eme352cQ1YfbGjocS4aSzur2e6UH+bRejS8u4uU9XR2xOZ52Qk1juIMQLSYDzy23UhE
 nW3txn70pLi9xPwoREeMkM8AaojWrN2n7wgjzBG0ImIFox8YxnB/KXdcnAoMq1yFuDnN
 82A4SJ2Di0+jVj2t8mNUqShbPZMpMRjZ4bTJnZMBufaFa3XqhbXg2QSYFcjpq0VJiVFr
 kyMMZhIzZeZEMEeZOEmcKAL5FV2SZSyWZgTM3Z6C8kShbjh8QCmAyfX6JomTsGR6Vcwp
 qqvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qC/VoVqNlKC3sjWCOYbeWRAUuEITkY8ByQXqJYDIr5s=;
 b=K0KQta/oMoy71URLSLAQtW8c7TEKFgat89Lh/q3FENw80IiecfdUXKtwrA2QCcovhQ
 gIVpr0WldZvAEjc3AOf4y3yJefzS6NpB2Zf1PHrJvaNSP+LBvr2HaJ++rw9swAGnMUee
 VBMWT6y0+vP+F6debixYKZMfoL+T8ZCgtM5Seva4COLs85ISzrqjcO87ld5cid1a7y47
 Z4jNFShZ8fAyV5e0w+5CZTpLXDOKqYt22jMuTZ7VEnbAuKWN94/mbGCWR1vBCNzI205Q
 U92MVQuZQ/944p3pp08vCDjVDSjO4voqSlFIZlBWauJI0Z1YY46ncXdt8L2RwkAqZ0kD
 HxmA==
X-Gm-Message-State: ANoB5plWim7h9JpSr7qMiSVRzLDxtJEDruv9lJxoVo/Q5IrQT9E+Dvgz
 kvVKMgW2DfRnk/Iwdvfqw61jWg==
X-Google-Smtp-Source: AA0mqf6l3sZDvl8yUPEKJkZoNzQos5e31e5E/p7ADJcYo0N5JnEM8bHxKUe5YcjZ4IBKdBbIZzHjZg==
X-Received: by 2002:a05:600c:3b0c:b0:3cf:8df2:63b7 with SMTP id
 m12-20020a05600c3b0c00b003cf8df263b7mr5907423wms.11.1668705939965; 
 Thu, 17 Nov 2022 09:25:39 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 o19-20020a1c7513000000b003b4a699ce8esm6006010wmc.6.2022.11.17.09.25.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Nov 2022 09:25:36 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C9B421FFC2;
 Thu, 17 Nov 2022 17:25:33 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH  v3 10/13] tests/avocado: skip aarch64 cloud TCG tests in CI
Date: Thu, 17 Nov 2022 17:25:29 +0000
Message-Id: <20221117172532.538149-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221117172532.538149-1-alex.bennee@linaro.org>
References: <20221117172532.538149-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

We now have a much lighter weight test in machine_aarch64_virt which
tests the full boot chain in less time. Rename the tests while we are
at it to make it clear it is a Fedora cloud image.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/avocado/boot_linux.py | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/tests/avocado/boot_linux.py b/tests/avocado/boot_linux.py
index 2be4be395d..79810be942 100644
--- a/tests/avocado/boot_linux.py
+++ b/tests/avocado/boot_linux.py
@@ -58,6 +58,9 @@ def test_pc_q35_kvm(self):
         self.launch_and_wait(set_up_ssh_connection=False)
 
 
+# For Aarch64 we only boot KVM tests in CI as the TCG tests are very
+# heavyweight. There are lighter weight distros which we use in the
+# machine_aarch64_virt.py tests.
 class BootLinuxAarch64(LinuxTest):
     """
     :avocado: tags=arch:aarch64
@@ -73,7 +76,8 @@ def add_common_args(self):
         self.vm.add_args('-device', 'virtio-rng-pci,rng=rng0')
         self.vm.add_args('-object', 'rng-random,id=rng0,filename=/dev/urandom')
 
-    def test_virt_tcg_gicv2(self):
+    @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
+    def test_fedora_cloud_tcg_gicv2(self):
         """
         :avocado: tags=accel:tcg
         :avocado: tags=cpu:max
@@ -86,7 +90,8 @@ def test_virt_tcg_gicv2(self):
         self.add_common_args()
         self.launch_and_wait(set_up_ssh_connection=False)
 
-    def test_virt_tcg_gicv3(self):
+    @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
+    def test_fedora_cloud_tcg_gicv3(self):
         """
         :avocado: tags=accel:tcg
         :avocado: tags=cpu:max
-- 
2.34.1


