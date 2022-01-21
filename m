Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA4049604A
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 15:03:36 +0100 (CET)
Received: from localhost ([::1]:60728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAuVq-0001vO-VW
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 09:03:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nAtZJ-0008QF-Bf
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 08:03:11 -0500
Received: from [2a00:1450:4864:20::32a] (port=37804
 helo=mail-wm1-x32a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nAtZG-0000xy-J3
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 08:03:03 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 l12-20020a7bc34c000000b003467c58cbdfso28866189wmj.2
 for <qemu-devel@nongnu.org>; Fri, 21 Jan 2022 05:03:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BSvX07XSbcj+uZJduxG3G9nv8iqDtt86eLgBT/T23uA=;
 b=LsVyVpARggJnq4Ych+rYkhIjSEmyvj2Q7Cld425/GY8OizCSz4aB9g0rtin+1RR52r
 C0IC08hfC2u+fHQk/CSuJp1rRtJQ26VtlsGcB53QXlF8PWswNuUY4CcKacqP4PKQbQFr
 JLE5Y94TgSfYMKwj1j3a1LYHzVySz3MfGaKEt+9YfI0UNcj5qCHXdab/mWHnBEr4313X
 iCSTOc9XP1/vJd3fV5R1SQVXq9+6kt00Jp1YIUFrjxOKpfT63UNdtZ0y0lidyuRe1cst
 2Q8tSQtHPFxX0GXC9odti0nyT3Ky12eD1UYyvrdxAm55aYXNH9fbahJdrD29M40CJ6tb
 vtWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=BSvX07XSbcj+uZJduxG3G9nv8iqDtt86eLgBT/T23uA=;
 b=r3Sp+uecCbf1kTiFK2qWtU644rOTzOdnoKe/uiCdsUtrXWZRPKUdl5CQNRVmPeH/qp
 VOAzf/rvqaqFefYJ4cT0CVBIr4Z25JhZo4KO7UsMxKlXx7cIcaWcf/PRMb+7EraDnwQZ
 HVojC4w5HLAJiLslgyVeXBzSmYgQYfXcrTByqm9yz46Mj9SYTaRDkVH8vOEagD6PcLDj
 wlLa3dC4wb5Mac8+VlCnp6dMJtkOOqy0vfFbKnGIfisv1v4VDWaEvzs+hPSM97KvNg8h
 jlVdgi6ga+UcuZc+q7Kac0EotVQIPfzNHyjmxTORHGW4Pt27kT6Q8cowpYQvhhiVjueb
 qW4g==
X-Gm-Message-State: AOAM530SVNr8QCdEg+NQPJBBPExJy9W1mTI+iamaCPl/rXPts+hwtKuE
 Fz29oXQ7FCWd5pUoa+YCmn6pYluF8Y8=
X-Google-Smtp-Source: ABdhPJxV1ewJntTVOCHnNHc9reDOxoHKn2PvSu3I3vQr+Vv0ptqsYHeHfAwErP2SF6Ko8CajYhtTfw==
X-Received: by 2002:a05:600c:3c92:: with SMTP id
 bg18mr700952wmb.106.1642770180277; 
 Fri, 21 Jan 2022 05:03:00 -0800 (PST)
Received: from nuc.. (154.red-83-50-83.dynamicip.rima-tde.net. [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id
 g30sm6059436wrb.29.2022.01.21.05.02.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jan 2022 05:02:59 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v5 7/7] tests/lcitool: Install libibumad to cover RDMA on
 Debian based distros
Date: Fri, 21 Jan 2022 14:02:22 +0100
Message-Id: <20220121130222.302540-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220121130222.302540-1-f4bug@amsat.org>
References: <20220121130222.302540-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

On Debian we also need libibumad to enable RDMA:

  $ ../configure --enable-rdma

  ERROR:  OpenFabrics librdmacm/libibverbs/libibumad not present.
          Your options:
           (1) Fast: Install infiniband packages (devel) from your distro.
           (2) Cleanest: Install libraries from www.openfabrics.org
           (3) Also: Install softiwarp if you don't have RDMA hardware

Add the dependency to lcitool's qemu.yml (where librdmacm and
libibverbs are already listed) and refresh the generated files
by running:

      $ make lcitool-refresh

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/docker/dockerfiles/ubuntu1804.docker | 1 +
 tests/docker/dockerfiles/ubuntu2004.docker | 1 +
 tests/lcitool/projects/qemu.yml            | 1 +
 3 files changed, 3 insertions(+)

diff --git a/tests/docker/dockerfiles/ubuntu1804.docker b/tests/docker/dockerfiles/ubuntu1804.docker
index 003ee2cfedd..699f2dfc6a9 100644
--- a/tests/docker/dockerfiles/ubuntu1804.docker
+++ b/tests/docker/dockerfiles/ubuntu1804.docker
@@ -52,6 +52,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
             libglib2.0-dev \
             libgnutls28-dev \
             libgtk-3-dev \
+            libibumad-dev \
             libibverbs-dev \
             libiscsi-dev \
             libjemalloc-dev \
diff --git a/tests/docker/dockerfiles/ubuntu2004.docker b/tests/docker/dockerfiles/ubuntu2004.docker
index 8993d2d9e05..87513125b8e 100644
--- a/tests/docker/dockerfiles/ubuntu2004.docker
+++ b/tests/docker/dockerfiles/ubuntu2004.docker
@@ -53,6 +53,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
             libglusterfs-dev \
             libgnutls28-dev \
             libgtk-3-dev \
+            libibumad-dev \
             libibverbs-dev \
             libiscsi-dev \
             libjemalloc-dev \
diff --git a/tests/lcitool/projects/qemu.yml b/tests/lcitool/projects/qemu.yml
index de51a2f1dd4..958868a6ee9 100644
--- a/tests/lcitool/projects/qemu.yml
+++ b/tests/lcitool/projects/qemu.yml
@@ -43,6 +43,7 @@ packages:
  - libfdt
  - libffi
  - libgcrypt
+ - libibumad
  - libibverbs
  - libiscsi
  - libjemalloc
-- 
2.34.1


