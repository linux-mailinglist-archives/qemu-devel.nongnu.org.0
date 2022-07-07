Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3DA569903
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 06:12:05 +0200 (CEST)
Received: from localhost ([::1]:42474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9Is0-00051g-Et
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 00:12:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1o9Ijg-0003gv-IN
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 00:03:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38058)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1o9Ija-0008E7-66
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 00:03:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657166600;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BlS4nuHDSk+xz/TPcNnNuXIwz7cEjDyk1wvZa0fZC9o=;
 b=NkeRrrgX0LwfOMAKKa//Ieqpo0dKZZJ2P2ruprmx8i9iYJUCsxKVLm+/4+YJXowWtziM1m
 UrdHorUjGOm95vuKFyBX4RG/ddBAOSVcwmeqaSOEOBwWAnZPT0iccNfWLJ3gvcaiGrgyQR
 2kJZ697A6BiiL90hk9/Lg9d3WGt+1b4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-385-nosgbFuHMDCQMZFYkZVYEA-1; Thu, 07 Jul 2022 00:03:16 -0400
X-MC-Unique: nosgbFuHMDCQMZFYkZVYEA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5D7F789C8B9;
 Thu,  7 Jul 2022 04:03:16 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E00242EF97;
 Thu,  7 Jul 2022 04:03:15 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Daniel Berrange <berrange@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Michael Roth <michael.roth@amd.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 John Snow <jsnow@redhat.com>
Subject: [PATCH v3 09/13] tests/vm: upgrade Ubuntu 18.04 VM to 20.04
Date: Thu,  7 Jul 2022 00:03:06 -0400
Message-Id: <20220707040310.4163682-10-jsnow@redhat.com>
In-Reply-To: <20220707040310.4163682-1-jsnow@redhat.com>
References: <20220707040310.4163682-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

18.04 has fallen out of our support window, so move ubuntu.aarch64
forward to ubuntu 20.04, which is now our oldest supported Ubuntu
release.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/vm/ubuntu.aarch64 | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/tests/vm/ubuntu.aarch64 b/tests/vm/ubuntu.aarch64
index fc9c2ce22ff..666947393bd 100755
--- a/tests/vm/ubuntu.aarch64
+++ b/tests/vm/ubuntu.aarch64
@@ -32,13 +32,13 @@ DEFAULT_CONFIG = {
 class UbuntuAarch64VM(ubuntuvm.UbuntuVM):
     name = "ubuntu.aarch64"
     arch = "aarch64"
-    # NOTE: The Ubuntu 18.04 cloud images are updated weekly. The
-    # release below has been chosen as the latest at time of writing.
-    # Using the rolling latest release means the SHA will be wrong
-    # within a week.
-    image_name = "ubuntu-18.04-server-cloudimg-arm64.img"
-    image_link = "https://cloud-images.ubuntu.com/releases/bionic/release-20220610/" + image_name
-    image_sha256="0eacc5142238788365576b15f1d0b6f23dda6d3e545ee22f5306af7bd6ec47bd"
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


