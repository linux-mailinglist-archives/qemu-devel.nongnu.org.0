Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2342E16F8A7
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Feb 2020 08:43:00 +0100 (CET)
Received: from localhost ([::1]:39280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6rLP-0005hQ-5H
	for lists+qemu-devel@lfdr.de; Wed, 26 Feb 2020 02:42:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46044)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1j6rIE-0000YM-1d
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 02:39:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1j6rIC-0002Z8-UK
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 02:39:41 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:37111)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1j6rIC-0002Wm-N8
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 02:39:40 -0500
Received: by mail-wm1-x32b.google.com with SMTP id a141so1057021wme.2
 for <qemu-devel@nongnu.org>; Tue, 25 Feb 2020 23:39:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fEux3C8dPQzhl755PYr6wGLyazKhJKG1reOpV5ZGmJE=;
 b=JYaue9JGgPvAkCai5358caVIMV96olUNvjQEZJmKUzam8yrAtOlORdXG8B+5eAXamN
 vN7mqUCECk1ivwtYyqRpHMqd6XUd0snb4m8PyDB6JXCq2j1UqB1HSPB6cHb1GB8d5yvE
 +s3ggheIcx2PjEA8OVhGadPUEtBnrqHrHQ+5v51/H5NWyYPYJduj92pReo70k4Oo9hIj
 uiibinNvktblB6sWqEd0vEQs8TjjBkkdaRzfhl1pwQjlpSr/XkZQz+C00/fbEKa+T5/Y
 tKx3PUQrj6K1o650wpb+Q8B6Ej+KyBwaY79GEPX5GXeKpwQ6c6tyX13dDqK3F3H+8xzv
 AICA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fEux3C8dPQzhl755PYr6wGLyazKhJKG1reOpV5ZGmJE=;
 b=fhf/IA4zPtmR/wufZFu8rNiM5+TA20S9t72nQuuYWYjglo6rHplqFeahM0Veh/bBnX
 enfkC3lh679MI8REhORZUYjcpDoQJYhGAVFlQR0f29ejJlZDpCd87Xv9UyKomlCB5cBC
 qnLX8X3djW+U/HKzichatemBCT0qJamMi5YHjT6D4flKF99GFrACEOPPj+YLWm6dW/Xi
 K4lPYWxsCEopKtT8Gv7NDLAHQyh0LaJrGNv8GXFtVQCeePNf3nU0VUki+vo/k8lB2y0H
 BjOn0Ho4qgnW2ETxo7v6tu0fuTZbi1maIS1AfVA0oebyluJO54E5wzOX9Jsie+e3RKUo
 aCXA==
X-Gm-Message-State: APjAAAWlVuoJqCoGohJWaj3QZovudfTJ6SVohE6sWj8pm+j4/ptHEzTG
 6s4d8GTUm/t0Zqzwe7/ySX9V3w==
X-Google-Smtp-Source: APXvYqymZOK9LaP4V4mszarT+MhO4qa2ZlNQFCGp8LTcqXaoKg5T0x4xciEOJS+GBhElSrneeC9nrQ==
X-Received: by 2002:a7b:c249:: with SMTP id b9mr3820878wmj.74.1582702779662;
 Tue, 25 Feb 2020 23:39:39 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n13sm1781751wmd.21.2020.02.25.23.39.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2020 23:39:36 -0800 (PST)
Received: from zen.home.arpa (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id ADAD11FF92;
 Wed, 26 Feb 2020 07:39:29 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 05/19] travis.yml: Test the s390-ccw build, too
Date: Wed, 26 Feb 2020 07:39:15 +0000
Message-Id: <20200226073929.28237-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200226073929.28237-1-alex.bennee@linaro.org>
References: <20200226073929.28237-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::32b
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 "open list:S390 general arch..." <qemu-s390x@nongnu.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

Since we can now use a s390x host on Travis, we can also build and
test the s390-ccw bios images there. For this we have to make sure
that roms/SLOF is checked out, too, and then move the generated *.img
files to the right location before running the tests.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: Cornelia Huck <cohuck@redhat.com>
Message-Id: <20200206202543.7085-1-thuth@redhat.com>
Message-Id: <20200225124710.14152-6-alex.bennee@linaro.org>

diff --git a/.travis.yml b/.travis.yml
index 58870559515..ea13e071795 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -509,6 +509,16 @@ matrix:
       env:
         - TEST_CMD="make check check-tcg V=1"
         - CONFIG="--disable-containers --target-list=${MAIN_SOFTMMU_TARGETS},s390x-linux-user"
+      script:
+        - ( cd ${SRC_DIR} ; git submodule update --init roms/SLOF )
+        - BUILD_RC=0 && make -j${JOBS} || BUILD_RC=$?
+        - |
+          if [ "$BUILD_RC" -eq 0 ] ; then
+              mv pc-bios/s390-ccw/*.img pc-bios/ ;
+              ${TEST_CMD} ;
+          else
+              $(exit $BUILD_RC);
+          fi
 
     # Release builds
     # The make-release script expect a QEMU version, so our tag must start with a 'v'.
-- 
2.20.1


