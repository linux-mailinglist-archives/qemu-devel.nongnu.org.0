Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 731605F43FD
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 15:13:41 +0200 (CEST)
Received: from localhost ([::1]:55228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofhjw-0003Eb-If
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 09:13:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofhYZ-0008G9-J9
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 09:01:56 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:42887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofhYV-0007P9-Ct
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 09:01:52 -0400
Received: by mail-wr1-x42d.google.com with SMTP id b7so13595811wrq.9
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 06:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=+ctSIgYDmkKQSBMUMssIqhbHvoTOeaqBn4W9+UBmASc=;
 b=pVPI46SNfpBEm6dtDGX+N2rfUlefuy/6K7xqRh8pgm3wYfX3ST7H9TO1H+0ICjw+qr
 3gBFRJdT6CENu1NRJ+S7bCyau4SEy3gd2KQ1BP+04bjeF2K8cOlQQHG44fy++5Jh8czJ
 nPhqFV7GGewmDYim3Kdc0J0v0vot3Tv/vazYfpP2cSNGWAt/w82YWGEezhfkRBr/UzGg
 iKu+4pwHyAwdDgqp/6BmgVVR6X3ZNS+hOiyHPQnljGudpp8fsJOLeHZHEKSX3kb6ZQPo
 curPvpistWxbsEYiGVIFOJbSkQxHlOof8CAzR6zuSUmTcWmR53Z5iZWSM15unVxeglNV
 2m5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=+ctSIgYDmkKQSBMUMssIqhbHvoTOeaqBn4W9+UBmASc=;
 b=zxD3SmbmHwRMYtGEmNtxcfQPvco9sK8IP/z5RDgUsvZu6L7DuvKNwj9x8AqLapW1Vq
 QNCtmMciHeDlQJRJMd/ImngAQ+uMFk45NEuAh+OLR33EKLlcehwLrAXBky8QrJ3pCGkG
 B04hrfnGUeb2fqqnBpIuoWVTa9pte/UoPtdaboM2K+BZvZYKb22eib7MG648OMa2JQNe
 brIK5frM1kxyVr/YwvxAz9+QNocgBBic2a4/vfZb99TIFohn8/F9/sCbhnKTeZ7mHN6i
 S83paFtdBpfVv2vSYCLAEGH8t5kWkXYeouYCzFQD82aExc6Tws98mTuxpqqtCiBNvAJo
 txzw==
X-Gm-Message-State: ACrzQf0HmoseZnnjXmL159dD8o39RSzjJSqp4tYTsRoRqRZPir3fLg87
 aXtJDC8l9wQnXtsTmOM+ErBA0j/7x2IlrQ==
X-Google-Smtp-Source: AMsMyM6BHA71uCcK+wvttNCs03dse++2QdtFw3+8RBnem5UuYauL5flVi6E7hPjyDhyoE+pXmF/1Vw==
X-Received: by 2002:adf:d0d0:0:b0:22d:f735:4730 with SMTP id
 z16-20020adfd0d0000000b0022df7354730mr12510924wrh.297.1664888509930; 
 Tue, 04 Oct 2022 06:01:49 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 e18-20020adff352000000b0022cdb687bf9sm15755154wrp.0.2022.10.04.06.01.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 06:01:43 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 855951FFC2;
 Tue,  4 Oct 2022 14:01:39 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL 10/54] tests/docker: move alpine from edge to tagged release
Date: Tue,  4 Oct 2022 14:00:54 +0100
Message-Id: <20221004130138.2299307-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221004130138.2299307-1-alex.bennee@linaro.org>
References: <20221004130138.2299307-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Tracking alpine-edge like debian-sid is a moving target. Usually such
rolling releases are marked as "allow_failure: true" in our CI.
However as alpine presents a musl based distro and provides useful
extra coverage lets track a release branch instead to avoid random
breakages.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20220929114231.583801-11-alex.bennee@linaro.org>

diff --git a/tests/docker/dockerfiles/alpine.docker b/tests/docker/dockerfiles/alpine.docker
index 7d6e95275a..9b7541261a 100644
--- a/tests/docker/dockerfiles/alpine.docker
+++ b/tests/docker/dockerfiles/alpine.docker
@@ -1,10 +1,10 @@
 # THIS FILE WAS AUTO-GENERATED
 #
-#  $ lcitool dockerfile --layers all alpine-edge qemu
+#  $ lcitool dockerfile --layers all alpine-316 qemu
 #
 # https://gitlab.com/libvirt/libvirt-ci
 
-FROM docker.io/library/alpine:edge
+FROM docker.io/library/alpine:3.16
 
 RUN apk update && \
     apk upgrade && \
diff --git a/tests/lcitool/refresh b/tests/lcitool/refresh
index 783497a989..ce0b24c0b1 100755
--- a/tests/lcitool/refresh
+++ b/tests/lcitool/refresh
@@ -107,7 +107,7 @@ try:
     #
     # Standard native builds
     #
-    generate_dockerfile("alpine", "alpine-edge")
+    generate_dockerfile("alpine", "alpine-316")
     generate_dockerfile("centos8", "centos-stream-8")
     generate_dockerfile("debian-amd64", "debian-11",
                         trailer="".join(debian11_extras))
-- 
2.34.1


