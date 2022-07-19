Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A80855793D8
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 09:09:16 +0200 (CEST)
Received: from localhost ([::1]:33170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDhM3-0002Uz-Pz
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 03:09:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oDhHM-00023k-W8
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 03:04:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43246)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oDhHJ-0002yA-Ja
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 03:04:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658214260;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Om8H4JbQKPJXC/JfPn/zQVuYTh7qW9DwJLKqK2dmGgo=;
 b=UIjKJeM+GvYdu6AG9fsff7h8Ep5jDJdkKcnzxF/2YF8X0zzkxKhMukc5IevoSkCfbnH4/k
 nEdSQintIy3s2tu7c9CWFznSmVVL2L/EPSfwnVsa6nqWAbh9q+wYTuhg2L+qRQSj/p6gnw
 ORbuwtChrJEGUMc5lCSdHUvSHdSLYwQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-421-xAFgZsbeOwaspeiSL2dwyQ-1; Tue, 19 Jul 2022 03:04:19 -0400
X-MC-Unique: xAFgZsbeOwaspeiSL2dwyQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 00F4E8037A9;
 Tue, 19 Jul 2022 07:04:19 +0000 (UTC)
Received: from thuth.com (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4435240CFD0A;
 Tue, 19 Jul 2022 07:04:18 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PULL 05/14] tests/vm: upgrade Ubuntu 18.04 VM to 20.04
Date: Tue, 19 Jul 2022 09:04:03 +0200
Message-Id: <20220719070412.16757-6-thuth@redhat.com>
In-Reply-To: <20220719070412.16757-1-thuth@redhat.com>
References: <20220719070412.16757-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: John Snow <jsnow@redhat.com>

18.04 has fallen out of our support window, so move ubuntu.aarch64
forward to ubuntu 20.04, which is now our oldest supported Ubuntu
release.

Notes:

This checksum changes periodically; use a fixed point image with a known
checksum so that the image isn't re-downloaded on every single
invocation. (The checksum for the 18.04 image was already incorrect at
the time of writing.)

Just like the centos.aarch64 test, this test currently seems very
flaky when run as a TCG test.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220708153503.18864-6-jsnow@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/vm/ubuntu.aarch64 | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/tests/vm/ubuntu.aarch64 b/tests/vm/ubuntu.aarch64
index b291945a7e..666947393b 100755
--- a/tests/vm/ubuntu.aarch64
+++ b/tests/vm/ubuntu.aarch64
@@ -32,9 +32,13 @@ DEFAULT_CONFIG = {
 class UbuntuAarch64VM(ubuntuvm.UbuntuVM):
     name = "ubuntu.aarch64"
     arch = "aarch64"
-    image_name = "ubuntu-18.04-server-cloudimg-arm64.img"
-    image_link = "https://cloud-images.ubuntu.com/releases/18.04/release/" + image_name
-    image_sha256="0fdcba761965735a8a903d8b88df8e47f156f48715c00508e4315c506d7d3cb1"
+    # NOTE: The Ubuntu 20.04 cloud images are periodically updated. The
+    # fixed image chosen below is the latest release at time of
+    # writing. Using a rolling latest instead would mean that the SHA
+    # would be incorrect at an indeterminate point in the future.
+    image_name = "focal-server-cloudimg-arm64.img"
+    image_link = "https://cloud-images.ubuntu.com/focal/20220615/" + image_name
+    image_sha256="95a027336e197debe88c92ff2e554598e23c409139e1e750b71b3b820b514832"
     BUILD_SCRIPT = """
         set -e;
         cd $(mktemp -d);
-- 
2.31.1


