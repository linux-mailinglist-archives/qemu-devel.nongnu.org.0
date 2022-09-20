Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F47C5BEF0E
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 23:18:39 +0200 (CEST)
Received: from localhost ([::1]:33402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oakda-0007bd-BM
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 17:18:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oagqk-0000b6-L2
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:16:00 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:46914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oagqj-0000iy-2n
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:15:58 -0400
Received: by mail-ej1-x62d.google.com with SMTP id bj12so7712823ejb.13
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 10:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=pAX7EzPv2yIW/JjQbt45KialnMqV89oGUWLI/H7OpIY=;
 b=Gp+g3a/bpteYwODI0F+4/Uhd9HNY3fnEi+GRIhglVutVV4cpeQUcXKzXbTjfwAz+c8
 Q2xACP0c5GixiJGXgnBbYMYuwYZQOeyRg/cVayM4dwonz5A3bKFBhZrD1/woiIpoVAbx
 mkvloiop0f4pS36snRHXpO31pTTkUvQFZz6QLKjTuTGl/hVVo+fmErdCxh2DgYcbvxeR
 m32Ix0EtmzZZCtkn3wrS0CI1ZRPlheB8QuonWtZbuXGLPh7/h2v+RdOOuFsLt0KpxNkg
 wP6MJAfcrOPQI36TkImhqWzUFEjCFBCqN3ecq2WKXodqPib9hpaWUkIDRqQc/UHs+aMA
 YkcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=pAX7EzPv2yIW/JjQbt45KialnMqV89oGUWLI/H7OpIY=;
 b=005kf2N73t2ZMPd4kEMj4iegGxDvqfWdKILP/FZWh2KdgLWA9RoiPeD5l6aGkuAcvf
 Z4p6NPaOzAtdrLbW+ztC5nznGHgT05CHkCLLj58ES9XWn453ju+7Y8eot0CByZ4DBmQw
 gQcZf53E5ZJAZoBTnk8r7vEKaKvOfjRMEzpa65BBnQoBwMAbhei4UwU7gMrl9EVlPKb8
 TyNXoND33VCF/Zt8MSIWTMv2PS4as4wo+sMmeet2sQkOePjB53IHqKsvCNq1AHsnY2yQ
 +/hZxc4WqFxq+D8fyLVUav+ghEbRaVSSk77pR+TKuKEiX+/F4aF2tekmFjkcfnLqhUez
 hp1A==
X-Gm-Message-State: ACrzQf0t+t7n2/Lfb0hTaTqGrhXyCefpF6Rv53PlCMEY/iEtRbazgsir
 bnS1oZa+KajBuTC6ez+1ido6Rg==
X-Google-Smtp-Source: AMsMyM7Vmiv8Ux4Fyz9vmIbprvGwLAzQ/Ah72hy3v3RgnFeK6rqklCSNwTIlAuxRnyP3pxQeZMQMqQ==
X-Received: by 2002:a17:906:6a14:b0:774:a998:d9a2 with SMTP id
 qw20-20020a1709066a1400b00774a998d9a2mr17257101ejc.496.1663694155480; 
 Tue, 20 Sep 2022 10:15:55 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 x16-20020aa7dad0000000b004548dfb895asm213509eds.34.2022.09.20.10.15.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 10:15:45 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CB28F1FFC3;
 Tue, 20 Sep 2022 18:15:34 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PULL 11/30] tests/docker: update and flatten debian-mips64-cross
Date: Tue, 20 Sep 2022 18:15:14 +0100
Message-Id: <20220920171533.1098094-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220920171533.1098094-1-alex.bennee@linaro.org>
References: <20220920171533.1098094-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62d.google.com
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

Update to the latest stable Debian. While we are at it flatten into a
single dockerfile. We really don't need the rest of the stuff from
the QEMU base image just to compile test images.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20220914155950.804707-12-alex.bennee@linaro.org>

diff --git a/.gitlab-ci.d/container-cross.yml b/.gitlab-ci.d/container-cross.yml
index 15a5270f6d..a3bfa483bf 100644
--- a/.gitlab-ci.d/container-cross.yml
+++ b/.gitlab-ci.d/container-cross.yml
@@ -77,7 +77,6 @@ m68k-debian-cross-container:
 mips64-debian-cross-container:
   extends: .container_job_template
   stage: containers
-  needs: ['amd64-debian10-container']
   variables:
     NAME: debian-mips64-cross
 
diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index 95790e974e..6c2ee3b175 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -89,7 +89,6 @@ DOCKER_PARTIAL_IMAGES += fedora
 endif
 
 docker-image-debian-mips-cross: docker-image-debian10
-docker-image-debian-mips64-cross: docker-image-debian10
 docker-image-debian-sh4-cross: docker-image-debian10
 docker-image-debian-sparc64-cross: docker-image-debian10
 
diff --git a/tests/docker/dockerfiles/debian-mips64-cross.docker b/tests/docker/dockerfiles/debian-mips64-cross.docker
index 09c2ba584e..afcff9726f 100644
--- a/tests/docker/dockerfiles/debian-mips64-cross.docker
+++ b/tests/docker/dockerfiles/debian-mips64-cross.docker
@@ -1,12 +1,14 @@
 #
 # Docker cross-compiler target
 #
-# This docker target builds on the debian Buster base image.
+# This docker target builds on the Debian Bullseye base image.
 #
-FROM qemu/debian10
+FROM docker.io/library/debian:11-slim
 
-RUN apt update && \
-    DEBIAN_FRONTEND=noninteractive eatmydata \
-    apt install -y --no-install-recommends \
+RUN export DEBIAN_FRONTEND=noninteractive && \
+    apt-get update && \
+    apt-get install -y eatmydata && \
+    eatmydata apt-get dist-upgrade -y && \
+    eatmydata apt-get install --no-install-recommends -y \
         gcc-mips64-linux-gnuabi64 \
         libc6-dev-mips64-cross
-- 
2.34.1


