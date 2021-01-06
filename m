Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79FA62EBD4C
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 12:44:03 +0100 (CET)
Received: from localhost ([::1]:59302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kx7EQ-00070f-Dn
	for lists+qemu-devel@lfdr.de; Wed, 06 Jan 2021 06:44:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kx7Cj-0006BZ-FY
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 06:42:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54258)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kx7Cf-0008AZ-GA
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 06:42:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609933331;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=5LX2bFbNgCGFa7fpBNqCtvCfhl6Fk8WgOQf+M/Pchxs=;
 b=UAXPGDb9GycfJPj4/GJcMqqXzPnHRnirAMxu8Ra4ueG/3qtbyinS4pOYvW1mGg8WSZqEE4
 yca4YBIgx17va4kq2mQJnPEWYzpFo49yBy/UqT57o9EtsoBI5Z237iKlUVWg0CCDzc2jRP
 WomhJtMa9qHSy8Z3Jev6HzVkYpptn7g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-368-_-9-_D7NOwS73aRinS0bDg-1; Wed, 06 Jan 2021 06:42:08 -0500
X-MC-Unique: _-9-_D7NOwS73aRinS0bDg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C8BA38049C0;
 Wed,  6 Jan 2021 11:42:07 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-114-197.ams2.redhat.com
 [10.36.114.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B570B100AE2E;
 Wed,  6 Jan 2021 11:42:05 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] cirrus: don't run full qtest on macOS
Date: Wed,  6 Jan 2021 11:41:59 +0000
Message-Id: <20210106114159.981538-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Ed Maste <emaste@freebsd.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The Cirrus CI macOS build hosts have exhibited a serious performance
degradation in recent months. For example the "qom-test" qtest takes
over an hour for only the qemu-system-aarch64 binary. This is as much
20-40 times slower than other environments. The other qtests all show
similar performance degradation, as do many of the unit tests.

This does not appear related to QEMU code changes, since older git
commits which were known to fully complete in less than 1 hour on
Cirrus CI now also show similar bad performance. Either Cirrus CI
performance has degraded, or an change in its environment has exposed
a latent bug widely affecting all of QEMU. Debugging the qom-test
showed no easily identified large bottleneck - every step of the
test execution was simply slower.

macOS builds/tests run outside Cirrus CI show normal performance.

With an inability to identify any obvious problem, the only viable
way to get a reliably completing Cirrus CI macOS job is to cut out
almost all of the qtests. We choose to run the x86_64 target only,
since that has very few machine types and thus is least badly
impacted in the qom-test execution.

With this change, the macOS jobs complete in approx 35 minutes.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 .cirrus.yml | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/.cirrus.yml b/.cirrus.yml
index 62a9b57530..3907e036da 100644
--- a/.cirrus.yml
+++ b/.cirrus.yml
@@ -18,7 +18,6 @@ freebsd_12_task:
     - gmake -j$(sysctl -n hw.ncpu) check V=1
 
 macos_task:
-  timeout_in: 90m
   osx_instance:
     image: catalina-base
   install_script:
@@ -30,10 +29,13 @@ macos_task:
                    --extra-cflags='-Wno-error=deprecated-declarations'
                    || { cat config.log meson-logs/meson-log.txt; exit 1; }
     - gmake -j$(sysctl -n hw.ncpu)
-    - gmake check V=1
+    - gmake check-unit V=1
+    - gmake check-block V=1
+    - gmake check-qapi-schema V=1
+    - gmake check-softfloat V=1
+    - gmake check-qtest-x86_64 V=1
 
 macos_xcode_task:
-  timeout_in: 90m
   osx_instance:
     # this is an alias for the latest Xcode
     image: catalina-xcode
@@ -45,7 +47,11 @@ macos_xcode_task:
     - ../configure --extra-cflags='-Wno-error=deprecated-declarations' --enable-modules
                    --enable-werror --cc=clang || { cat config.log meson-logs/meson-log.txt; exit 1; }
     - gmake -j$(sysctl -n hw.ncpu)
-    - gmake check V=1
+    - gmake check-unit V=1
+    - gmake check-block V=1
+    - gmake check-qapi-schema V=1
+    - gmake check-softfloat V=1
+    - gmake check-qtest-x86_64 V=1
 
 windows_msys2_task:
   timeout_in: 90m
-- 
2.29.2


