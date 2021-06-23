Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 095A33B1645
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 10:55:32 +0200 (CEST)
Received: from localhost ([::1]:36182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvyfS-0006E2-WA
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 04:55:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lvydA-0003yk-Nu
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 04:53:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lvyd8-0002Gx-TF
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 04:53:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624438386;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=53H6P7GPLKZUhOMSnr5GYtig7Uvva2qnOlmbtUzBXlU=;
 b=JfEr02kmmKrrNyB++4j6PAUUM0l00tnn6C3MHug9EdoMOAWEnSywIZDsPeTSwtfQJYesCX
 bNCGFJsy5NgftioN9zNj4RNKoNwvIRS9EWNBrfo2fDYaH9JKXXdjhefgUKeBjd12582ydp
 BqJ3mgiBRPUiokA7xoUQclgjLR7OcUo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-hwAhvniPOFGHhakP6O7AJA-1; Wed, 23 Jun 2021 04:53:04 -0400
X-MC-Unique: hwAhvniPOFGHhakP6O7AJA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DBF65362F8;
 Wed, 23 Jun 2021 08:53:03 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-38.ams2.redhat.com
 [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 85F91100AE35;
 Wed, 23 Jun 2021 08:53:03 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 650AD1800917; Wed, 23 Jun 2021 10:52:49 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] ci: add libusb for windows builds
Date: Wed, 23 Jun 2021 10:52:49 +0200
Message-Id: <20210623085249.1151901-3-kraxel@redhat.com>
In-Reply-To: <20210623085249.1151901-1-kraxel@redhat.com>
References: <20210623085249.1151901-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.223,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add CI coverage for usb passthrough on windows.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 tests/docker/dockerfiles/fedora-win32-cross.docker | 1 +
 tests/docker/dockerfiles/fedora-win64-cross.docker | 1 +
 2 files changed, 2 insertions(+)

diff --git a/tests/docker/dockerfiles/fedora-win32-cross.docker b/tests/docker/dockerfiles/fedora-win32-cross.docker
index a638afb525ce..2c87d70e4f57 100644
--- a/tests/docker/dockerfiles/fedora-win32-cross.docker
+++ b/tests/docker/dockerfiles/fedora-win32-cross.docker
@@ -23,6 +23,7 @@ ENV PACKAGES \
     mingw32-libjpeg-turbo \
     mingw32-libpng \
     mingw32-libtasn1 \
+    mingw32-libusbx \
     mingw32-nettle \
     mingw32-nsis \
     mingw32-pixman \
diff --git a/tests/docker/dockerfiles/fedora-win64-cross.docker b/tests/docker/dockerfiles/fedora-win64-cross.docker
index f53007ac865e..f0f9057c1baa 100644
--- a/tests/docker/dockerfiles/fedora-win64-cross.docker
+++ b/tests/docker/dockerfiles/fedora-win64-cross.docker
@@ -22,6 +22,7 @@ ENV PACKAGES \
     mingw64-libjpeg-turbo \
     mingw64-libpng \
     mingw64-libtasn1 \
+    mingw64-libusbx \
     mingw64-pixman \
     mingw64-pkg-config \
     perl \
-- 
2.31.1


