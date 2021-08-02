Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C023A3DE28C
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 00:36:25 +0200 (CEST)
Received: from localhost ([::1]:36298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAgXn-00043h-5K
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 18:36:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <email@aabouzied.com>)
 id 1mAgLz-0007EE-2T
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 18:24:11 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:33616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <email@aabouzied.com>)
 id 1mAgLw-0004PH-RQ
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 18:24:10 -0400
Received: by mail-wr1-x431.google.com with SMTP id k4so12333298wrc.0
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 15:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aabouzied-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=u/vjRXtntVPVd+FW3MUJ70Lgm6SDavAH3r08KdyFmdI=;
 b=HZ9TOpjOORd3jYK9KVHWwpF9U1DD61PmPJ5Mk7G/fvmGHul9bHc6SSWQVC6c2b+imL
 RBQ4EMfQwW2n6a/4xrw2pTBpjusFT860og220LNOZTHF+RbCzdLSEPW/rq/Ecn3MOGTU
 d8Cp51SUg2xy9ZnFHeMwfGAdUBtDbPtDVRXAwn/IKZfVJkH/RJlO6zCgOzAELvibLN29
 Q3ckMSDq4WiyiaHphvneQyZuoHhj+zTfB5zbW2so8tQXGbXQmkM/BgqGvcOQYXs6sjXm
 +/vQCXs24FuIQYMND0HtfSc1XBULFjFGw6Yp1kQbVO4IPLzw/MsS+k/bSdsmVcMMWjQu
 iwPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=u/vjRXtntVPVd+FW3MUJ70Lgm6SDavAH3r08KdyFmdI=;
 b=qhEgRi5Sb09A9wMxK4HzhaipvHF7sAxmc5DqKDrlc85CJEEvW6pLiY19NU/De492yp
 a+jIcAbwqWscCAAtZNP2MLL0uKXY0EJiHT2on0nSP5oFuSW1YJWetebf/04IFtXj3Cke
 QyLFFIO+4d79StSmIX9qzs3Pm+ZkO12zvGj/yN+q/GHycZKAAhUj47GCL7+fvH/Os6rl
 HuJTH4NbGDioNluyG0l1Ttzmy+4bBeeuo4e6QF+vTg541q3JdctM7/VAGOHm7jwx3jp5
 5hSo4CxqgXuJCB0zbJPTtENf1xhdF4kCdgqK1cBP5N4gMkcPYzUdclM2HMJjVkpe56JJ
 3vfQ==
X-Gm-Message-State: AOAM532Wl4ujn4tQnwkIbR4q8CWXF5QjnOmaXJ/Ntih+f+DN8j6RpC0/
 N0sXsq9KayeeI0flDdUv9QZ4Gu8GQ/9jhgoue1k=
X-Google-Smtp-Source: ABdhPJyMOFJUNcyJmSKCBbhvzp8kAH0FTVylJFxaMBKvON42QS7xzfjkk6J6RbrCAibHiahIPP8X/w==
X-Received: by 2002:adf:d1e4:: with SMTP id g4mr6398107wrd.371.1627943046050; 
 Mon, 02 Aug 2021 15:24:06 -0700 (PDT)
Received: from localhost.localdomain ([154.187.38.176])
 by smtp.gmail.com with ESMTPSA id d7sm6111198wrs.39.2021.08.02.15.24.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 15:24:05 -0700 (PDT)
From: Ahmed Abouzied <email@aabouzied.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] tests/acceptance: Allow overwrite smp and memory
Date: Tue,  3 Aug 2021 00:22:57 +0200
Message-Id: <20210802222257.50946-1-email@aabouzied.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::431;
 envelope-from=email@aabouzied.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NO_DNS_FOR_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Ahmed Abouzied <email@aabouzied.com>, philmd@redhat.com,
 wainersm@redhat.com, crosa@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Removes the hard-coded values in setUp(). Class inheriting from
avocado_qemu.LinuxTest can overwrite the default smp and memory instead.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/453
Signed-off-by: Ahmed Abouzied <email@aabouzied.com>
---
 tests/acceptance/avocado_qemu/__init__.py | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
index 2c4fef3e14..2639b89c84 100644
--- a/tests/acceptance/avocado_qemu/__init__.py
+++ b/tests/acceptance/avocado_qemu/__init__.py
@@ -441,6 +441,8 @@ class LinuxTest(Test, LinuxSSHMixIn):
     distro = None
     username = 'root'
     password = 'password'
+    smp = '2'
+    memory = '1024'
 
     def _set_distro(self):
         distro_name = self.params.get(
@@ -471,8 +473,8 @@ def _set_distro(self):
     def setUp(self, ssh_pubkey=None, network_device_type='virtio-net'):
         super(LinuxTest, self).setUp()
         self._set_distro()
-        self.vm.add_args('-smp', '2')
-        self.vm.add_args('-m', '1024')
+        self.vm.add_args('-smp', self.smp)
+        self.vm.add_args('-m', self.memory)
         # The following network device allows for SSH connections
         self.vm.add_args('-netdev', 'user,id=vnet,hostfwd=:127.0.0.1:0-:22',
                          '-device', '%s,netdev=vnet' % network_device_type)
-- 
2.25.1


