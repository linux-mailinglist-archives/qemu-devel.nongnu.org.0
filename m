Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 316065EF403
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 13:11:46 +0200 (CEST)
Received: from localhost ([::1]:43734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odrSC-00042x-Un
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 07:11:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odrD5-0005Gy-W6
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 06:56:10 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:41708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odrD0-0007r7-9J
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 06:56:07 -0400
Received: by mail-wr1-x42b.google.com with SMTP id r6so1559179wru.8
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 03:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=ONmCnmmHOBIVWgO4Af9yJZAGNu1d1RIBUZ/c+XiDAY8=;
 b=Lf2KNGd99Lehj6LABtoCYcWO8YGJWjveUTxvzp/MZedWmQB1Fctb4rqM16/jy06QzT
 gtGPj3VZ9nzgTaK108L5M7OjNHZxkAC86BJaMV9Zkq4MC4W3roGfLezNZrVAC/mFhJpD
 MUt6wTYhibBbvqvFAUh0Fff+RqEKsJ5XBqvWv15VwOYKC0agKCP63c0ZM7Crm6kyN4RX
 R38Flez5b8uTcHvDLej0G9ATTnVxDWAALuU49Rnbm9P80huMmqF6DfO0Q10+P+3vfgQJ
 5N8HMcOYDJdxiU3tROeolJB1VFqL4LQw4HhLjmvpdJyZCOz10skRcaE92BzLboN7kdrD
 nDQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=ONmCnmmHOBIVWgO4Af9yJZAGNu1d1RIBUZ/c+XiDAY8=;
 b=NLQ0JsjSHIL55UbirUwGOMNibXEgTMUaczFQWb2dCFVIAC3MoT64AuFS9svFfd0iRY
 KLPuIQSKRfkeNfK1PwzS9Y9w0WsfdgYp2SArOPAl368SVb32tWnRauOFNNfsommfozxr
 KdIClTbYoQ/wjzGELONu5ht3ZasA2crfGfRMdkhnpQCJFEhejPmBZOe3jBf/dbrgSJgw
 cKH27Byz/FxS/x8XN9/nLz+C84t6tlq6rgp2kC1bbTCLggUO5wLOwxOV3TJnaAwxNjVM
 ium1M97ddw7Sqz8KusM0uUJ0sHC8NOzCtWl7m4hf7BKJIMJScQh+Rlj5usG9sCtmIL5A
 K7jw==
X-Gm-Message-State: ACrzQf0EXgo7euQb4V6whPPaiTVgFGcbNtaXdYZQiRGmLCiWImqs48td
 VnV06W5f4BFMhLYjhvfouQzFxg==
X-Google-Smtp-Source: AMsMyM7NmlrWTT/zEVPB6h1QoNGgvpPvBzRVX48T1Zgxo3MnGzTJn9YQGXtod5wMZ9q6aH/ffD6dVQ==
X-Received: by 2002:a5d:5963:0:b0:22a:47ed:f98f with SMTP id
 e35-20020a5d5963000000b0022a47edf98fmr1718851wri.155.1664448958472; 
 Thu, 29 Sep 2022 03:55:58 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 q63-20020a1c4342000000b003b4bd18a23bsm4151788wma.12.2022.09.29.03.55.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 03:55:57 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E8B5D1FFB7;
 Thu, 29 Sep 2022 11:55:56 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: berrange@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [RFC PATCH] tests/docker: move alpine from edge to tagged release
Date: Thu, 29 Sep 2022 11:55:48 +0100
Message-Id: <20220929105548.542555-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
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
However as alpine presents a musl based and provides useful extra
coverage lets track a release branch instead to avoid random
breakages.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
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


