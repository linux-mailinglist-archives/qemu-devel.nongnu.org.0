Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 636E54C4D0D
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 18:58:38 +0100 (CET)
Received: from localhost ([::1]:51630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNerV-0007hZ-6E
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 12:58:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nNeH3-0004Ft-UE
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 12:20:58 -0500
Received: from [2a00:1450:4864:20::630] (port=44777
 helo=mail-ej1-x630.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nNeGz-0002QA-3G
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 12:20:57 -0500
Received: by mail-ej1-x630.google.com with SMTP id p14so12122956ejf.11
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 09:20:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o5SIw7t9pKeEYOX/Stnikqz/Ht/WWQptkfxwqxvKhEE=;
 b=f3W0gDEHu5jzgvJAyw8hnfDvCzDcMy7XRPZtP7ha2YCeutwxUhgZAb5jRe/w8MnQqb
 jWb9gERcA3Nzmg4wGVHhsxGugH6y6M/A8y6wKwhqMKcWBcBEeLL4hGvDYEsFgltmTIq7
 uTE6Lz1rNqPfxKahawf/KUQJFOp/9rmyAwVEdMeUfOlny3lclhYaq/P6xgzDKCQtobZB
 MIFUeEQgH230uLQSt9SHVInu+qZIaOUGuCZm6VovrJRlEwHy1HRzme6IVcdVGeX50BXq
 BxzS6BZuKaMsdu2m3KUwSGTSJb4IYGa71868aaVF+cDLqez8LVoHgMOTmmvzzdamElKq
 IruQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o5SIw7t9pKeEYOX/Stnikqz/Ht/WWQptkfxwqxvKhEE=;
 b=HvP8HRpTuTcfSZQ0GTw1HkexjXL/xbWeAvBxmxDLWwvGa0wDOTRAQB81RSCK1gd9Aj
 cpnfIsJd6BHCQyj3CxYbhgXsCQX5CrlIskAqu9LJZhlzuIWWAiIRJrOC8E6k6BQjbogy
 ruNYZ03nGLcANUd3O7S4Ma9MOOn5ptOtOP6JtkziMSz5mvqT9P7dUlT/icPRmEPatVoV
 yEYuzyXTfiC4qivPs+H9ga2AmR1O9f/8IPlt7NnkRzDZzzOELii6Gn8WOeT9Ns6oeNWb
 Vuxxec4UyLqeaPqSRXChY8hcQpHnJWP176nGnbMCJnRAJvNA96no/NCnL8M/gKkESJUJ
 eUdQ==
X-Gm-Message-State: AOAM531IE1TmEPHiKpBKp8VJR9L/xzbmtAhEv+o1GVxo5NjGy/W1WKiO
 s/x/p5ofNflTJJtEV/6Sh/sk0Q==
X-Google-Smtp-Source: ABdhPJw/n/BDzEOTQjBv3xnyqKEO+yZiwvv1aVUyBoKx3bhoEMYpP4iRgKlyq87qsqQGBJKitFblKg==
X-Received: by 2002:a17:906:3ac7:b0:6ce:c3a1:3dcf with SMTP id
 z7-20020a1709063ac700b006cec3a13dcfmr6869625ejd.182.1645809645029; 
 Fri, 25 Feb 2022 09:20:45 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 bd3-20020a056402206300b00410a4ac2802sm1597170edb.66.2022.02.25.09.20.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 09:20:38 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 648D61FFC6;
 Fri, 25 Feb 2022 17:20:23 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 14/18] travis.yml: Update the s390x jobs to Ubuntu Focal
Date: Fri, 25 Feb 2022 17:20:17 +0000
Message-Id: <20220225172021.3493923-15-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220225172021.3493923-1-alex.bennee@linaro.org>
References: <20220225172021.3493923-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::630
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x630.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 Beraldo Leal <bleal@redhat.com>, sw@weilnetz.de,
 Cornelia Huck <cohuck@redhat.com>, richard.henderson@linaro.org,
 f4bug@amsat.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 "open list:S390 general arch..." <qemu-s390x@nongnu.org>, qemu-arm@nongnu.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

QEMU will soon drop the support for Ubuntu 18.04, so let's update
the Travis jobs that were still using this version to 20.04 instead.

While we're at it, also remove an obsolete comment about Ubuntu
Xenial being the default for our Travis jobs.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220221153423.1028465-1-thuth@redhat.com>
---
 .travis.yml | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/.travis.yml b/.travis.yml
index 41010ebe6b..c3c8048842 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -1,6 +1,3 @@
-# The current Travis default is a VM based 16.04 Xenial on GCE
-# Additional builds with specific requirements for a full VM need to
-# be added as additional matrix: entries later on
 os: linux
 dist: focal
 language: c
@@ -190,7 +187,7 @@ jobs:
 
     - name: "[s390x] GCC check-tcg"
       arch: s390x
-      dist: bionic
+      dist: focal
       addons:
         apt_packages:
           - libaio-dev
@@ -233,7 +230,7 @@ jobs:
 
     - name: "[s390x] GCC (other-softmmu)"
       arch: s390x
-      dist: bionic
+      dist: focal
       addons:
         apt_packages:
           - libaio-dev
@@ -263,10 +260,11 @@ jobs:
 
     - name: "[s390x] GCC (user)"
       arch: s390x
-      dist: bionic
+      dist: focal
       addons:
         apt_packages:
           - libgcrypt20-dev
+          - libglib2.0-dev
           - libgnutls28-dev
           - ninja-build
       env:
@@ -274,7 +272,7 @@ jobs:
 
     - name: "[s390x] Clang (disable-tcg)"
       arch: s390x
-      dist: bionic
+      dist: focal
       compiler: clang
       addons:
         apt_packages:
-- 
2.30.2


