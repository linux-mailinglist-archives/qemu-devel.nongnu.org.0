Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1A74443FA
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 15:56:46 +0100 (CET)
Received: from localhost ([::1]:51046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miHgz-00069i-7A
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 10:56:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1miHaj-0005UR-BU
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 10:50:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37332)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1miHah-0003tn-40
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 10:50:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635951014;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pRBumbU8OS/Vbvszx5F0bt297UTtlVIFT4VSYQF4kUY=;
 b=aDUtJ17GBjm+uA467RWQTVOyqreSkCtcSTF8NDCYRRZVlHPDRE3IS70yHBmCbTQr0vkHMZ
 VOCSPTWtcHc3+D8iCdtQv2KdjjKspx87uHIESdV56Cq51mjt4hLgfQEDcVjJ4epmelZd8C
 FfNaVsHb5UaICNnzFMj7IiTBP8LsBnU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-147-acm15EonNXyYof5-VapIoA-1; Wed, 03 Nov 2021 10:50:12 -0400
X-MC-Unique: acm15EonNXyYof5-VapIoA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 82FAA9F936;
 Wed,  3 Nov 2021 14:50:11 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.11.175])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 81B38196F1;
 Wed,  3 Nov 2021 14:50:10 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/6] docker: update Fedora-based cross-compiler containers to
 Fedora 34
Date: Wed,  3 Nov 2021 10:48:42 -0400
Message-Id: <20211103144844.1285634-5-jsnow@redhat.com>
In-Reply-To: <20211103144844.1285634-1-jsnow@redhat.com>
References: <20211103144844.1285634-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, John Snow <jsnow@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Similarly to the last patch, Fedora 33 will be EOL by the time QEMU 6.2
releases, so bump the version for all of the other Fedora containers,
too.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/docker/dockerfiles/fedora-cris-cross.docker  | 2 +-
 tests/docker/dockerfiles/fedora-win32-cross.docker | 2 +-
 tests/docker/dockerfiles/fedora-win64-cross.docker | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/docker/dockerfiles/fedora-cris-cross.docker b/tests/docker/dockerfiles/fedora-cris-cross.docker
index 91c373fdd3..b6787dc572 100644
--- a/tests/docker/dockerfiles/fedora-cris-cross.docker
+++ b/tests/docker/dockerfiles/fedora-cris-cross.docker
@@ -2,7 +2,7 @@
 # Cross compiler for cris system tests
 #
 
-FROM registry.fedoraproject.org/fedora:33
+FROM registry.fedoraproject.org/fedora:34
 ENV PACKAGES gcc-cris-linux-gnu
 RUN dnf install -y $PACKAGES
 RUN rpm -q $PACKAGES | sort > /packages.txt
diff --git a/tests/docker/dockerfiles/fedora-win32-cross.docker b/tests/docker/dockerfiles/fedora-win32-cross.docker
index aad39dd97f..1b800921e8 100644
--- a/tests/docker/dockerfiles/fedora-win32-cross.docker
+++ b/tests/docker/dockerfiles/fedora-win32-cross.docker
@@ -1,4 +1,4 @@
-FROM registry.fedoraproject.org/fedora:33
+FROM registry.fedoraproject.org/fedora:34
 
 # Please keep this list sorted alphabetically
 ENV PACKAGES \
diff --git a/tests/docker/dockerfiles/fedora-win64-cross.docker b/tests/docker/dockerfiles/fedora-win64-cross.docker
index 9a224a619b..d4e12fbdfc 100644
--- a/tests/docker/dockerfiles/fedora-win64-cross.docker
+++ b/tests/docker/dockerfiles/fedora-win64-cross.docker
@@ -1,4 +1,4 @@
-FROM registry.fedoraproject.org/fedora:33
+FROM registry.fedoraproject.org/fedora:34
 
 # Please keep this list sorted alphabetically
 ENV PACKAGES \
-- 
2.31.1


