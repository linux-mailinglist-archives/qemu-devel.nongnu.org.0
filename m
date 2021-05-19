Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C196338968E
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 21:23:47 +0200 (CEST)
Received: from localhost ([::1]:52578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljRnG-0003yI-N0
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 15:23:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ljRML-0008Gf-E8
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:55:59 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:42974)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ljRMH-0002YE-Kg
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:55:56 -0400
Received: by mail-wr1-x434.google.com with SMTP id x8so15096103wrq.9
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 11:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HRopQewtuLZOViqEaTD8BXlHJncJTww870DKUQGoAbQ=;
 b=MGPAyhZ9uWgff5Vy6CbfhaSYmmNrmWzYG0pqYzPn3wPAI5dlEbW0cg9UoNb2t9S39q
 gJk+o4iFWS9jstL7WW4Ucy3gY5l3T3kKndm1Tn/SntDcTB96qiTygDIImPWAjOB1soqm
 aKBT0TiwFD9ukkg5j7H4jfoRliOhIMIB4tZ4iR8vnODlA3nIUZj5+H1DpjpqPqs31UVC
 TuV3Y387xYE48GtZsDCGH32ji/x8g0AzndKjocPuc4LpjIZUX1Viy8gkb1pdmV4FqdJr
 8JFMeoxswOp1gzpg5yAo0/3zLk8zdTTPrfvGbMBTdpJbbIl3mnLGkI6HGlQT001YSCPB
 4m+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=HRopQewtuLZOViqEaTD8BXlHJncJTww870DKUQGoAbQ=;
 b=axPDnzjMl82QMJnjicvNIbU3DnTRq8g4lfy8NMS6zzmr1Tjmj8Y+nJjqzcbH4PtvBU
 FR4DQMa1AbNrWsP1uE4+pXb/K5SrfhG38UjolAw42t7K7Wy5C5oSlf5LkoOAK/DrWtOP
 6gXj+LFoH7RYNn4cwlwXIMw2blLSS2yycWkLGnzUY7hITZBlW+WjZChs8hiBsG+/rYoV
 WjqRkxZ0jbRMs32l4Nxhra2hcn4g1ztbGd48vsu2RrIhgXxSbvOuz2rYLvctMOVEbsAC
 YxZpY6qGuzbiobAuwcPdc+Nk2SvFsM/qJosjaOQM/HbEi9+t4OSyLEpA3jMvnanTpy8l
 MuJA==
X-Gm-Message-State: AOAM530GxqXsw4XeR3MIEXJ0kBouHufXiPJLV+Au4cwKAUFJfMoioqJ0
 v/IoZ28/HM21IWVG+AHIqgl6XYJx4DbMIw==
X-Google-Smtp-Source: ABdhPJwjQL2iNf+t5dIfFFwTjrQBUPX6f6K3H7sr2EUmDBf7JYpOz+kw3ORcWEtlsMX0Ln8spaTp4g==
X-Received: by 2002:adf:8b03:: with SMTP id n3mr355609wra.227.1621450552031;
 Wed, 19 May 2021 11:55:52 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id s83sm305114wms.16.2021.05.19.11.55.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 11:55:51 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 09/10] gitlab-ci: Extract core container jobs to
 container-core.yml
Date: Wed, 19 May 2021 20:55:03 +0200
Message-Id: <20210519185504.2198573-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210519185504.2198573-1-f4bug@amsat.org>
References: <20210519185504.2198573-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It is not possible to use the previously extracted templates
without this set of core containers. Extract them into a new
file (container-core.yml) to be able to build them without
having to build all the other containers by default.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 .gitlab-ci.d/container-core.yml | 17 +++++++++++++++++
 .gitlab-ci.d/containers.yml     | 17 +----------------
 2 files changed, 18 insertions(+), 16 deletions(-)
 create mode 100644 .gitlab-ci.d/container-core.yml

diff --git a/.gitlab-ci.d/container-core.yml b/.gitlab-ci.d/container-core.yml
new file mode 100644
index 00000000000..e8dd1f476a2
--- /dev/null
+++ b/.gitlab-ci.d/container-core.yml
@@ -0,0 +1,17 @@
+include:
+  - local: '/.gitlab-ci.d/container-template.yml'
+
+amd64-centos8-container:
+  extends: .container_job_template
+  variables:
+    NAME: centos8
+
+amd64-fedora-container:
+  extends: .container_job_template
+  variables:
+    NAME: fedora
+
+amd64-debian10-container:
+  extends: .container_job_template
+  variables:
+    NAME: debian10
diff --git a/.gitlab-ci.d/containers.yml b/.gitlab-ci.d/containers.yml
index 0bf4899df10..2c1380158f8 100644
--- a/.gitlab-ci.d/containers.yml
+++ b/.gitlab-ci.d/containers.yml
@@ -1,5 +1,5 @@
 include:
-  - local: '/.gitlab-ci.d/container-template.yml'
+  - local: '/.gitlab-ci.d/container-core.yml'
 
 amd64-alpine-container:
   extends: .container_job_template
@@ -11,16 +11,6 @@ amd64-centos7-container:
   variables:
     NAME: centos7
 
-amd64-centos8-container:
-  extends: .container_job_template
-  variables:
-    NAME: centos8
-
-amd64-debian10-container:
-  extends: .container_job_template
-  variables:
-    NAME: debian10
-
 amd64-debian11-container:
   extends: .container_job_template
   variables:
@@ -190,11 +180,6 @@ cris-fedora-cross-container:
   variables:
     NAME: fedora-cris-cross
 
-amd64-fedora-container:
-  extends: .container_job_template
-  variables:
-    NAME: fedora
-
 i386-fedora-cross-container:
   extends: .container_job_template
   variables:
-- 
2.26.3


