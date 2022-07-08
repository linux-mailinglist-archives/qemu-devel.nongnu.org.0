Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A007C56BE0C
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 18:12:02 +0200 (CEST)
Received: from localhost ([::1]:46614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9qaH-00019L-Ig
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 12:12:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1o9q0h-0006c5-QF
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:35:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1o9q0e-0007Mb-Cj
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:35:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657294509;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9rRe/xaTDFO/D/Ffq/ZpCxC/tjZVK1ZsrtYJrHHqTb4=;
 b=QZIMgoa0ECqHFFAbxD+peTtz4vRbiEs5qkwsYlKdB2RylLiuV/7hmxWRZS/PT+zqU4vWE6
 7CJKbZOassOhSKz4U2bU3+vsT2V/rU4+jyg0VwbmjYDqNF2qS9VLdOroAsP7mQMa81mWUw
 vjRcuENcyoL8AVH+GjwTGiV2r9S1lq0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-64-zmbF7v4iMlipRYfn6CARKA-1; Fri, 08 Jul 2022 11:35:08 -0400
X-MC-Unique: zmbF7v4iMlipRYfn6CARKA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 06A2683397C;
 Fri,  8 Jul 2022 15:35:08 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8DBE78A4D1;
 Fri,  8 Jul 2022 15:35:07 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Daniel Berrange <berrange@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 John Snow <jsnow@redhat.com>
Subject: [PATCH v4 05/12] tests/vm: upgrade Ubuntu 18.04 VM to 20.04
Date: Fri,  8 Jul 2022 11:34:56 -0400
Message-Id: <20220708153503.18864-6-jsnow@redhat.com>
In-Reply-To: <20220708153503.18864-1-jsnow@redhat.com>
References: <20220708153503.18864-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
---
 tests/vm/ubuntu.aarch64 | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/tests/vm/ubuntu.aarch64 b/tests/vm/ubuntu.aarch64
index b291945a7e9..666947393bd 100755
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
2.34.3


