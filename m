Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E6F6A5F56
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 20:11:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX5KE-0002YA-R5; Tue, 28 Feb 2023 14:07:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pX5Jo-0002LT-5a
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 14:07:23 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pX5Ji-0002rl-Ll
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 14:07:18 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 ay29-20020a05600c1e1d00b003e9f4c2b623so10313085wmb.3
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 11:07:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NDTxxrNGSUpGKhcca6dgBnJPO0C06Ehas+Oy5hwwxR8=;
 b=eDA1G5AWVaSWAD6D2DDqSJhVG83H1GFv6hVKpsWkAlySE/p0JymrY0kHDajn+kKb8N
 YajCm5zeTWaJihWg53eYYBFUX62Z5k7eFCAH10B4pSd+GsCXZFuwicxR5Uoot3YQx27I
 omH+oAJ6pnCBvaUpmGT4kp4Ij9Rn2r/rU4H5QXtoUQ+8o2DzQFyHArbT52gL7WfbQIPF
 +hcy5KGuHpR/WT8QP2tAV5cUGgJgQhfclNxwmkH1pE8FEVfc95tIUFTpCAHVAI/aAcI8
 Vy4aUq48JEgRccB3TC7TGJWkmULuWazYSLPLzxHUvJjUrrq8qODkOuI3/zXgXzwy94MW
 v0hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NDTxxrNGSUpGKhcca6dgBnJPO0C06Ehas+Oy5hwwxR8=;
 b=hjN0UAbiLPjSaHGsZu+8lgG7zp1FbqrW0jbBE9zTZ4Wv2ZrJnlcPdFdQqKRX20b3Fc
 MV/gVb+D1zqivPGTS+hf4tKyE7d668iylPurZwv7O9wPnTNYfN9iPw/LscqKOB2JSvNS
 M+ESJx/jr8teo++Cz5T71k+qQIUNDrm+WaWC84dmVDC4qsbIrodE3PMUuSJDN5DbbE6u
 YW7Wnjuvo36rdZqXOJMNgJpU1lhVcg9tb+HKZGUyfWC/fG4n74zX+4tFjazNHnVeaq/a
 z52LhL/SN+bifD3vWtUGnzYyKUxC6zWkVFjXSjMQIGHhCL6RWCpZ11WiJY5ML2Ffp6cH
 Jqcw==
X-Gm-Message-State: AO0yUKXe6WXL/1G++IWxhz/YzwGfne2vdDqZgdLbX7WkqY8ziVd1zXk5
 Uk7KsGVhKIldmG59iAJgf1TV8RrDhFOxkvWB
X-Google-Smtp-Source: AK7set9VYYhFZ0IysMYtQYv0f4k/z6ez+y3Gx2zGMQ+KpJoSI3VaCmUMQD7I9y+R/vyNvOxAAO6gIQ==
X-Received: by 2002:a05:600c:3595:b0:3ea:c101:72b with SMTP id
 p21-20020a05600c359500b003eac101072bmr2809632wmq.17.1677611222333; 
 Tue, 28 Feb 2023 11:07:02 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 l4-20020a05600c1d0400b003db0ad636d1sm19450082wms.28.2023.02.28.11.06.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 11:07:01 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 048121FFC5;
 Tue, 28 Feb 2023 19:06:55 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 Peter Maydell <peter.maydell@linaro.org>, Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Darren Kenny <darren.kenny@oracle.com>, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>,
 Ed Maste <emaste@freebsd.org>, qemu-arm@nongnu.org,
 Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 Yonggang Luo <luoyonggang@gmail.com>, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Bandan Das <bsd@redhat.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Laurent Vivier <lvivier@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Fabiano Rosas <farosas@suse.de>
Subject: [PATCH v3 15/24] gitlab: Use plain docker in container-template.yml
Date: Tue, 28 Feb 2023 19:06:44 +0000
Message-Id: <20230228190653.1602033-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230228190653.1602033-1-alex.bennee@linaro.org>
References: <20230228190653.1602033-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Fabiano Rosas <farosas@suse.de>

Our dockerfiles no longer reference layers from other qemu images so
we can now use 'docker build' on them.

Also reinstate the caching that was disabled due to bad interactions
with certain runners. See commit 6ddc3dc7a8 ("tests/docker: don't use
BUILDKIT in GitLab either"). We now believe those issues to be fixed.

The COMMON_TAG needed to be fixed for the caching to work. The
docker.py script was not using the variable, but constructing the
correct URL directly.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
Tested-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20230227151110.31455-2-farosas@suse.de>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitlab-ci.d/container-template.yml | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/.gitlab-ci.d/container-template.yml b/.gitlab-ci.d/container-template.yml
index c434b9c8f3..519b8a9482 100644
--- a/.gitlab-ci.d/container-template.yml
+++ b/.gitlab-ci.d/container-template.yml
@@ -6,17 +6,16 @@
     - docker:dind
   before_script:
     - export TAG="$CI_REGISTRY_IMAGE/qemu/$NAME:latest"
-    - export COMMON_TAG="$CI_REGISTRY/qemu-project/qemu/$NAME:latest"
+    - export COMMON_TAG="$CI_REGISTRY/qemu-project/qemu/qemu/$NAME:latest"
     - apk add python3
     - docker info
     - docker login $CI_REGISTRY -u "$CI_REGISTRY_USER" -p "$CI_REGISTRY_PASSWORD"
   script:
     - echo "TAG:$TAG"
     - echo "COMMON_TAG:$COMMON_TAG"
-    - ./tests/docker/docker.py --engine docker build
-          -t "qemu/$NAME" -f "tests/docker/dockerfiles/$NAME.docker"
-          -r $CI_REGISTRY/qemu-project/qemu
-    - docker tag "qemu/$NAME" "$TAG"
+    - docker build --tag "$TAG" --cache-from "$TAG" --cache-from "$COMMON_TAG"
+      --build-arg BUILDKIT_INLINE_CACHE=1
+      -f "tests/docker/dockerfiles/$NAME.docker" "."
     - docker push "$TAG"
   after_script:
     - docker logout
-- 
2.39.2


