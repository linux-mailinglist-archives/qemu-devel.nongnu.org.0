Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE363DA37B
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 14:55:38 +0200 (CEST)
Received: from localhost ([::1]:55430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m95ZZ-0005Gg-Ns
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 08:55:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1m95VL-0004Ig-LJ
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 08:51:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1m95VK-0001is-4V
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 08:51:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627563073;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qyuop7hSSVDvOvhk/sxg2gRTv2orVJoMkzRtgZG5T7U=;
 b=g8qZ+W3NPb0f+ehKHVAWF33DGPSumGUW7mSmocpCfyUj5xk83XJG6+rJYUQjX25aDvPJMG
 p5WXGw3aeOOndrAXkUlfIqdpuqW3MDJQNRxb0hh1xsttgEcxhwBDRTLyVMRwd/MKhN8AVn
 Zse79ym0OIRyZfC5VBuH5rTGsDTIPD8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-264-6c5yS3-xNyKgL4Bc3C17kg-1; Thu, 29 Jul 2021 08:51:11 -0400
X-MC-Unique: 6c5yS3-xNyKgL4Bc3C17kg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D517192502;
 Thu, 29 Jul 2021 12:51:10 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-106.ams2.redhat.com
 [10.36.114.106])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EBF471002D71;
 Thu, 29 Jul 2021 12:50:57 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 9FC25180063A; Thu, 29 Jul 2021 14:50:44 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/7] ci: add libusb for windows builds
Date: Thu, 29 Jul 2021 14:50:39 +0200
Message-Id: <20210729125044.3531457-3-kraxel@redhat.com>
In-Reply-To: <20210729125044.3531457-1-kraxel@redhat.com>
References: <20210729125044.3531457-1-kraxel@redhat.com>
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
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
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Message-Id: <20210623085249.1151901-3-kraxel@redhat.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 tests/docker/dockerfiles/fedora-win32-cross.docker | 1 +
 tests/docker/dockerfiles/fedora-win64-cross.docker | 1 +
 2 files changed, 2 insertions(+)

diff --git a/tests/docker/dockerfiles/fedora-win32-cross.docker b/tests/docker/dockerfiles/fedora-win32-cross.docker
index 5a03e1af43ac..aad39dd97ff4 100644
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
index d3f13666e82e..9a224a619bd4 100644
--- a/tests/docker/dockerfiles/fedora-win64-cross.docker
+++ b/tests/docker/dockerfiles/fedora-win64-cross.docker
@@ -23,6 +23,7 @@ ENV PACKAGES \
     mingw64-libjpeg-turbo \
     mingw64-libpng \
     mingw64-libtasn1 \
+    mingw64-libusbx \
     mingw64-pixman \
     mingw64-pkg-config \
     perl \
-- 
2.31.1


