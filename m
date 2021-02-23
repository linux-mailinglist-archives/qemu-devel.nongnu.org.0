Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64EB1322F5B
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 18:10:15 +0100 (CET)
Received: from localhost ([::1]:50090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEbCQ-0002u6-Ew
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 12:10:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEbBU-00024L-SS
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 12:09:17 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:32931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEbBS-0007Zz-Uu
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 12:09:16 -0500
Received: by mail-ed1-x52a.google.com with SMTP id c6so26818139ede.0
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 09:09:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qK1ZHWaQwSItrhdTsE7NLFhqgiQfhqszet17MwUmTbI=;
 b=mIpY9fAcKKrpEwBeR/+LAdxh7jXGG/HgksEdTM4jdGcqmHDP3JbsPNaoDQyvvb8m77
 r53JEbxi0puuyw8GuuRc3Zt9t3aCT1hOH4QaQ6H1HC2a6IxRNEBFvsiAE5qABnSxIwDf
 jexNPXqkGmQ67sxJYGWX3dVwe1SJAO2fqhDBDTeCj4SDEtVNN5XQPXKWLjYWqKsQQIXl
 V5m0uDr/OP5xhIZUsYzr4lJ0c1zbtlLI1uh5jG6T6af9kKcJIAKbrcI6aQ7yZKK7UYtT
 GSiyz53yuOSYabXv8sVhsj6eI25MEZf+l2Krdz7tH33Hmc5RZuIDKhRui/UtUGi9+ib0
 F+fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=qK1ZHWaQwSItrhdTsE7NLFhqgiQfhqszet17MwUmTbI=;
 b=IdUn8ZQDpATINafiJIJbQDecXutxNvxjQeNUoD1bwm/VoLF6M7HWhYU6G7XgoAV6b/
 QFn5trYIz5IaEPRk7UC5waWw9JuWNLy2rx9laBCamXKY1FsgPsuRtEkNlKuREFkpWhFP
 BRyZdT2fHbXLU2f5vrxjhDsY2f+O+c4flvKwnjDtkp4RSXuItScBQO/+DPCKM3vdOxlv
 6YD386svS7UrR2Y8brDNKsJt25R8SeFSfg5k/iWtznkV0U/SYly2boQefb8/pO5E62Da
 a4IpeIAtCbkiXlGyKyLPnp4dYdApwTuvoogOMVdTkyrZINFUBvdIHA829fteTQZ1/8SR
 gkCw==
X-Gm-Message-State: AOAM532s0Uww4mg7wz7MIdKskb180oKMKuDB0uPhaXTRxOid5b5Ze7fj
 6GaB+rYc8BzjKiYxMc1VDiNeEm5M0QM=
X-Google-Smtp-Source: ABdhPJyKITHfkwRfkNJGOo4GBdUkyD98gfE+W7LeevEDB1yb41QYrBmLtq9OCaceqRIq844Z4ekkww==
X-Received: by 2002:aa7:c645:: with SMTP id z5mr3960326edr.126.1614100153000; 
 Tue, 23 Feb 2021 09:09:13 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id lj13sm12722541ejb.123.2021.02.23.09.09.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Feb 2021 09:09:12 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] tests/docker: Use --arch-only when building Debian cross
 images
Date: Tue, 23 Feb 2021 18:09:10 +0100
Message-Id: <20210223170910.2916721-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52a.google.com
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
Cc: Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Christian Ehrhardt <christian.ehrhardt@canonical.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When building a Docker image based on debian10.docker on
a non-x86 host, we get:

 [2/4] RUN apt update &&     DEBIAN_FRONTEND=noninteractive eatmydata     apt build-dep -yy qemu
 Reading package lists... Done
 Building dependency tree
 Reading state information... Done
 Some packages could not be installed. This may mean that you have
 requested an impossible situation or if you are using the unstable
 distribution that some required packages have not yet been created
 or been moved out of Incoming.
 The following information may help to resolve the situation:

 The following packages have unmet dependencies:
  builddeps:qemu : Depends: gcc-s390x-linux-gnu but it is not installable
                   Depends: gcc-alpha-linux-gnu but it is not installable
 E: Unable to correct problems, you have held broken packages.

Fix by using the --arch-only option suggested here:
https://bugs.launchpad.net/ubuntu/+source/qemu/+bug/1866032/comments/1

Suggested-by: Christian Ehrhardt <christian.ehrhardt@canonical.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/docker/dockerfiles/debian-all-test-cross.docker | 2 +-
 tests/docker/dockerfiles/debian10.docker              | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/docker/dockerfiles/debian-all-test-cross.docker b/tests/docker/dockerfiles/debian-all-test-cross.docker
index dedcea58b46..593b7ef1023 100644
--- a/tests/docker/dockerfiles/debian-all-test-cross.docker
+++ b/tests/docker/dockerfiles/debian-all-test-cross.docker
@@ -11,7 +11,7 @@ FROM qemu/debian10
 # What we need to build QEMU itself
 RUN apt update && \
     DEBIAN_FRONTEND=noninteractive eatmydata \
-    apt build-dep -yy qemu
+    apt build-dep --arch-only -yy qemu
 
 # Add the foreign architecture we want and install dependencies
 RUN DEBIAN_FRONTEND=noninteractive eatmydata \
diff --git a/tests/docker/dockerfiles/debian10.docker b/tests/docker/dockerfiles/debian10.docker
index 9d42b5a4b81..d034acbd256 100644
--- a/tests/docker/dockerfiles/debian10.docker
+++ b/tests/docker/dockerfiles/debian10.docker
@@ -32,6 +32,6 @@ RUN apt update && \
         psmisc \
         python3 \
         python3-sphinx \
-        $(apt-get -s build-dep qemu | egrep ^Inst | fgrep '[all]' | cut -d\  -f2)
+        $(apt-get -s build-dep --arch-only qemu | egrep ^Inst | fgrep '[all]' | cut -d\  -f2)
 
 ENV FEATURES docs
-- 
2.26.2


