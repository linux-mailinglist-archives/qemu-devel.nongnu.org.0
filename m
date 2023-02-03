Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A4B689C4A
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 15:56:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNxSj-00019h-Rc; Fri, 03 Feb 2023 09:54:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1pNxSg-00019L-Jj
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 09:54:46 -0500
Received: from doohan.uni-paderborn.de ([2001:638:502:c003::16])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1pNxSc-0005Cs-Tk
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 09:54:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mail.uni-paderborn.de; s=20170601; h=Content-Transfer-Encoding:Content-Type
 :MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bXpBpZyJUrVtDNPcb4dTjj1Oj4qmEuv5FTBiMXYpc48=; b=oIJdW/bPRaDzxUuSDFNEWRHyYn
 yQgWYF3U1wN9Sc3uOg5o7/y+FFFLC2RPEEbAJbJz38w7AuXduAb9e9vnttUZZVGhCo/RYNzPqVAHy
 Kx2KW1t3iJW+pT45Udkd5LFgqMEIgnQ70pkFWHES7Q9uVwgQ2zDCjCz2GyrlVVjWTJA0=;
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	philmd@linaro.org
Subject: [PATCH] tests/docker: Use binaries for debian-tricore-cross
Date: Fri,  3 Feb 2023 15:54:04 +0100
Message-Id: <20230203145404.1043301-1-kbastian@mail.uni-paderborn.de>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-IMT-Source: Intern
X-IMT-Spam-Score: 0.0 ()
X-PMX-Version: 6.4.9.2830568, Antispam-Engine: 2.7.2.2107409,
 Antispam-Data: 2023.2.3.144217, AntiVirus-Engine: 5.96.0,
 AntiVirus-Data: 2023.1.24.5960001
X-IMT-Authenticated-Sender: uid=kbastian,ou=People,o=upb,c=de
Received-SPF: pass client-ip=2001:638:502:c003::16;
 envelope-from=kbastian@mail.uni-paderborn.de; helo=doohan.uni-paderborn.de
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, RCVD_IN_DNSWL_MED=-2.3,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

since binutils is pretty old, it fails our CI repeatedly during the
compilation of tricore-binutils. We created a precompiled version using
the debian docker image and download it instead of building it ourself.

Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
---
Peter, I was having trouble with the new version of binutils, I mentioned. I
think this needs more time to sort out. So for now, let's just use a precompiled
version of the current binutils.

 .../dockerfiles/debian-tricore-cross.docker    | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/tests/docker/dockerfiles/debian-tricore-cross.docker b/tests/docker/dockerfiles/debian-tricore-cross.docker
index 5ae58efa09..4abcf07e68 100644
--- a/tests/docker/dockerfiles/debian-tricore-cross.docker
+++ b/tests/docker/dockerfiles/debian-tricore-cross.docker
@@ -16,32 +16,20 @@ MAINTAINER Philippe Mathieu-Daudé <f4bug@amsat.org>
 RUN apt update && \
     DEBIAN_FRONTEND=noninteractive apt install -yy eatmydata && \
     DEBIAN_FRONTEND=noninteractive eatmydata apt install -yy \
-       bison \
+       curl \
        bzip2 \
        ca-certificates \
-       ccache \
-       flex \
-       g++ \
-       gcc \
-       git \
        libglib2.0-dev \
        libpixman-1-dev \
        locales \
-       make \
        ninja-build \
        pkgconf \
        python3-pip \
        python3-setuptools \
        python3-wheel
 
-RUN git clone --single-branch \
-        https://github.com/bkoppelmann/tricore-binutils.git \
-        /usr/src/binutils && \
-    cd /usr/src/binutils && chmod +x missing && \
-    CFLAGS=-w ./configure --prefix=/usr/local --disable-nls --target=tricore && \
-    make && make install && \
-    rm -rf /usr/src/binutils
-
+RUN curl -#SL https://github.com/bkoppelmann/tricore-binutils/raw/master/release/tricore-binutils.2.13.tar.gz \
+    | tar -xzC /usr/local/
 # This image can only build a very minimal QEMU as well as the tests
 ENV DEF_TARGET_LIST tricore-softmmu
 ENV QEMU_CONFIGURE_OPTS --disable-user --disable-tools --disable-fdt
-- 
2.39.1


