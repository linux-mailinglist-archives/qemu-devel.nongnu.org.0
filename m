Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB0C6738BF
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 13:37:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIU8g-0006Mq-VF; Thu, 19 Jan 2023 07:35:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=w1SB=5Q=kaod.org=clg@ozlabs.org>)
 id 1pIU8c-0006L6-3N; Thu, 19 Jan 2023 07:35:26 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=w1SB=5Q=kaod.org=clg@ozlabs.org>)
 id 1pIU8a-0007YM-BG; Thu, 19 Jan 2023 07:35:25 -0500
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4NyMXn26tlz4xN4;
 Thu, 19 Jan 2023 23:35:21 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4NyMXl3dhMz4xN1;
 Thu, 19 Jan 2023 23:35:19 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 06/25] tests/avocado/machine_aspeed.py: update buildroot tests
Date: Thu, 19 Jan 2023 13:34:30 +0100
Message-Id: <20230119123449.531826-7-clg@kaod.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230119123449.531826-1-clg@kaod.org>
References: <20230119123449.531826-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=w1SB=5Q=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Use buildroot 2022.11 based images plus some customization :

  - Linux version is bumped to 6.0.9 and kernel is built with a custom
    config similar to what OpenBMC provides.
  - U-Boot is switched to the one provided by OpenBMC for better support.
  - defconfigs includes more target tools for dev.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 tests/avocado/machine_aspeed.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/avocado/machine_aspeed.py b/tests/avocado/machine_aspeed.py
index 1fc385e1c8..773b1ff3a9 100644
--- a/tests/avocado/machine_aspeed.py
+++ b/tests/avocado/machine_aspeed.py
@@ -123,8 +123,8 @@ def test_arm_ast2500_evb_buildroot(self):
         """
 
         image_url = ('https://github.com/legoater/qemu-aspeed-boot/raw/master/'
-                     'images/ast2500-evb/buildroot-2022.05/flash.img')
-        image_hash = ('549db6e9d8cdaf4367af21c36385a68bb465779c18b5e37094fc7343decccd3f')
+                     'images/ast2500-evb/buildroot-2022.11-2-g15d3648df9/flash.img')
+        image_hash = ('f96d11db521fe7a2787745e9e391225deeeec3318ee0fc07c8b799b8833dd474')
         image_path = self.fetch_asset(image_url, asset_hash=image_hash,
                                       algorithm='sha256')
 
@@ -151,8 +151,8 @@ def test_arm_ast2600_evb_buildroot(self):
         """
 
         image_url = ('https://github.com/legoater/qemu-aspeed-boot/raw/master/'
-                     'images/ast2600-evb/buildroot-2022.05/flash.img')
-        image_hash = ('6cc9e7d128fd4fa1fd01c883af67593cae8072c3239a0b8b6ace857f3538a92d')
+                     'images/ast2600-evb/buildroot-2022.11-2-g15d3648df9/flash.img')
+        image_hash = ('e598d86e5ea79671ca8b59212a326c911bc8bea728dec1a1f5390d717a28bb8b')
         image_path = self.fetch_asset(image_url, asset_hash=image_hash,
                                       algorithm='sha256')
 
-- 
2.39.0


