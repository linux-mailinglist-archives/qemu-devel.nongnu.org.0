Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D4D5EF615
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 15:09:35 +0200 (CEST)
Received: from localhost ([::1]:59634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odtIE-00070K-Ba
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 09:09:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odrw9-0004Qp-BS
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:42:41 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:37849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odrw7-0001Dk-6F
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:42:41 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 z13-20020a7bc7cd000000b003b5054c6f9bso3057391wmk.2
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 04:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=tKgPLnostqoY4L/p2DucxUV0/Pq8eRS4n+qkjOj2vjo=;
 b=cZAwXsXiG8G6gmcWVtx4GoTSyZi2vo4fgCiIX0zZkTWPHCg+lBmvotxC1kTJ3H4Gpb
 5OOTvq05IUYxUFb+kMIxF1PEIRxCag895EgjZqY4Mni9pujFgHinjvwHt5kkVmP3VgL9
 XQpiSMs/ajwpK2HQ/rWAIK2QbpKOvy8MQFMP+o/LD1MSa3sbpoy+XVVfDD8RnndQ7kai
 1l1ZI2MlF7q2dIAWxJzcMfFTakB3cHriWTjyJM1Ke5/faFZHXJI66vtt27cxO6xy2b48
 sdLuDaq5xAB6xFGxiVpu6rhuWF6+dMoyyS77vm639gaic684a6zWuhZfj5Z/e76wAY8T
 1XDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=tKgPLnostqoY4L/p2DucxUV0/Pq8eRS4n+qkjOj2vjo=;
 b=4xNTk+JwJ4KphtTKKIy7G5F8XIWWgdm5HVxuCjM8dLDstvunLH4wFnB/hAk7rqpkfZ
 Dgv7UpHWic/5yLwPps6Ztem9xTg1SJEDnqNiHCJK47rlzVP3f132Os3DbQw+BfjjXkFu
 Y95tefoCPrzMfEcsUa5aZTrTaS0iMbUS+9oUJcI8gs4mgegVFHvaGDhxvhgv4ZJPKcc0
 xR/GNBzmAY1DfMtnKU0LG54ke/fIGBHcZvpHYM/JqdS3Pq954T/KCjtvtQWYvAL+FOSe
 s98Qh2xP9MwHBp7KzFbXdF+e5deyI/uyA3u0/1XZuyxVMWOpofxspoistbMmaJFr9EFf
 67Yg==
X-Gm-Message-State: ACrzQf3Ma+hQKCYExbmqPWll7CQpmnRy5OjKOgQwkvZRvr7pMWbBPkX2
 qgz/7m9TaQ1c/XDwVLE9yiCpMQ==
X-Google-Smtp-Source: AMsMyM6qCJouxZH5/C/yKqJyL2GZk1ol65IXa+NunUM5cGdDvL106St5aup22FiV1lqiTgo+K0NePA==
X-Received: by 2002:a05:600c:1e13:b0:3b4:74c3:620b with SMTP id
 ay19-20020a05600c1e1300b003b474c3620bmr10551359wmb.168.1664451757635; 
 Thu, 29 Sep 2022 04:42:37 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 o9-20020a05600c510900b003a845621c5bsm4725676wms.34.2022.09.29.04.42.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 04:42:34 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7D0E21FFC2;
 Thu, 29 Sep 2022 12:42:32 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 minyihh@uci.edu, ma.mandourr@gmail.com, Luke.Craig@ll.mit.edu,
 cota@braap.org, aaron@os.amperecomputing.com, kuhn.chenqun@huawei.com,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH v1 10/51] tests/docker: move alpine from edge to tagged release
Date: Thu, 29 Sep 2022 12:41:50 +0100
Message-Id: <20220929114231.583801-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220929114231.583801-1-alex.bennee@linaro.org>
References: <20220929114231.583801-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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
Message-Id: <20220929105548.542555-1-alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 tests/docker/dockerfiles/alpine.docker | 4 ++--
 tests/lcitool/refresh                  | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

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


