Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E7E36388B
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 01:38:05 +0200 (CEST)
Received: from localhost ([::1]:48482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYGzM-0002uU-Vm
	for lists+qemu-devel@lfdr.de; Sun, 18 Apr 2021 19:38:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYGx0-00019x-Th
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 19:35:38 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:40648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYGwz-0003JE-D6
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 19:35:38 -0400
Received: by mail-wr1-x434.google.com with SMTP id e5so3431766wrg.7
 for <qemu-devel@nongnu.org>; Sun, 18 Apr 2021 16:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ub4Z4KuEsuOp57bzjB7PNdaoI3pNBoAGYQv//w2NMwY=;
 b=iNeXxebXFZDbNhLOAbwVbyVoIeT1MWUuN2X3mQqvoxbgjf9CSrUJZl/isPdjAwD6Nb
 ehKxmKPZ4TEZGDhkNWG6KuTY+k0YOOVYOsmFmWfwIiYkQ/ETK5XSz/a1/gVKbXbn0TQw
 JtUBJEFMDOc7j9qpA+CY7tNSCLuF38r4KIa+4qx0Iq/DzbaNiVOY3TAHfvrUQ7S291ZY
 NfwBoHR6iA1D4Irmq7OjCvVr4yM+yp1u0CdSKoamYH1sQrutjEow2fAo6ACGZoCW8IUY
 lTEmBQ08rb+lsxMGGyxIAHOQ8FhOsPhS5qanSsBRs3AbkiMNGvXcKQM7XGaq527vWUki
 j1TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ub4Z4KuEsuOp57bzjB7PNdaoI3pNBoAGYQv//w2NMwY=;
 b=akfd4zNPJdM6LFbIocvWsd+KsofcFC+HThy+qBvSafuSo1rkYIRLQfi8DS7AlRyT2/
 A+l1odmVBNJ9aq9ENg140kRDbu5P19+WGCZW+4DUNUlMEMqSksL0y2FCPBxD07kCodo0
 b5/OdZJtwCVefAYskZDCt+Q5jMr4B2OVuJoMtuKYLXRstWltzvkxoY97J4Rut96V9Kh0
 5lTrHxXyEpjcSCdopjKIgWmo+kWQh35RZtrqXCOGst5eFqbx75aSXMFN4cEzEAxV/J56
 SwKPgveSqZVm1waUXRLatjIUaOKTwRtaFs5Fyotdxmtyy6Fx8/IzPzefosW1lZGz6Xn1
 EWow==
X-Gm-Message-State: AOAM533n+NmsO2SJovdLbFvABhnHwxcEJhFEomkaaTLdIFbiHxNzrTIJ
 JxJqUh2qp8aZDzAKeXB0R4hH1bC/HizxKQ==
X-Google-Smtp-Source: ABdhPJyt8tZ7RzLX1OglFDMKOCkUTlmK22B45ni7TAKx7cc5JA8/Ajv9f9BkINuqBZGHHGoMVj0cVA==
X-Received: by 2002:adf:e901:: with SMTP id f1mr10686915wrm.44.1618788935828; 
 Sun, 18 Apr 2021 16:35:35 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id p17sm16851681wmq.47.2021.04.18.16.35.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Apr 2021 16:35:35 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/15] gitlab-ci: Extract build stages to stages.yml
Date: Mon, 19 Apr 2021 01:34:42 +0200
Message-Id: <20210418233448.1267991-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210418233448.1267991-1-f4bug@amsat.org>
References: <20210418233448.1267991-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
 Erik Skultety <eskultet@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Miroslav Rezanina <mrezanin@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Extract the build stages used by our job templates to a new file
(stages.yml) to be able to include it with the other templates,
without having to run all the jobs included in the default
.gitlab-ci.yml, which are mainly useful for mainstream CI.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 .gitlab-ci.d/stages.yml |  8 ++++++++
 .gitlab-ci.yml          | 10 +---------
 2 files changed, 9 insertions(+), 9 deletions(-)
 create mode 100644 .gitlab-ci.d/stages.yml

diff --git a/.gitlab-ci.d/stages.yml b/.gitlab-ci.d/stages.yml
new file mode 100644
index 00000000000..f50826018df
--- /dev/null
+++ b/.gitlab-ci.d/stages.yml
@@ -0,0 +1,8 @@
+# Currently we have two build stages after our containers are built:
+#  - build (for traditional build and test or first stage build)
+#  - test (for test stages, using build artefacts from a build stage)
+stages:
+  - containers
+  - containers-layer2
+  - build
+  - test
diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index ba35b3917e7..c367d42977c 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -1,13 +1,5 @@
-# Currently we have two build stages after our containers are built:
-#  - build (for traditional build and test or first stage build)
-#  - test (for test stages, using build artefacts from a build stage)
-stages:
-  - containers
-  - containers-layer2
-  - build
-  - test
-
 include:
+  - local: '/.gitlab-ci.d/stages.yml'
   - local: '/.gitlab-ci.d/edk2.yml'
   - local: '/.gitlab-ci.d/opensbi.yml'
   - local: '/.gitlab-ci.d/containers.yml'
-- 
2.26.3


