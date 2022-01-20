Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B457495084
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 15:50:21 +0100 (CET)
Received: from localhost ([::1]:56000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAYlY-0007Mw-J0
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 09:50:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nAVey-0005c5-Pm; Thu, 20 Jan 2022 06:31:23 -0500
Received: from [2a00:1450:4864:20::330] (port=53891
 helo=mail-wm1-x330.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nAVep-0006ao-I0; Thu, 20 Jan 2022 06:31:16 -0500
Received: by mail-wm1-x330.google.com with SMTP id n8so11384489wmk.3;
 Thu, 20 Jan 2022 03:30:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4Tjd8wVbUrFFk0Vv7+6+0PlH5zCkrfjOZaloy1pivCI=;
 b=DnnEpnBu/UCGE7O4FQ22zV4Vt0qNNXRrwRVTsn3yGTTTLKr4rt9vtRi/xPWdxfyJ+v
 ab44jKtKGms39A1RhNpXaj6CAzfmgpPMXvL/4U5E2yOzhxbPyLt/qWGaAWZ+svCDJxk0
 fSzBcgWt2qZkUSw36rVR+po/Xyw7zpX4Dteg2ZlDR0beUunhR8V2q/Np0hcWZ0TcB5uJ
 j8mAomelVUyfzxnSqJSW94c19ojzY5X8/C4cKMHue+JavBI8kO0NqZStwzFZ2x8KS8cd
 k1EVMUiXRN0HPy9rCM8BZAEPCKGZCsebkpOoWV4I65kxVWw6677j8ED2/885rgdjF1B5
 w47A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=4Tjd8wVbUrFFk0Vv7+6+0PlH5zCkrfjOZaloy1pivCI=;
 b=CAInc+lmNojnWCrZRMPY/7i8Xa2x4PJYlTQUF81ccxBpas8tug2Y+5Hb7amUa81uC1
 iPapu0lJ+KqvZtONl8zvGWIOa95DTmDuXnLh6hX3NE/shbS8YW+yZhCeHPsd6MY32fFj
 Iw9lomg4zIktylcTANA6TRMN3KD9WB7HOaghQxctPoY0TCxePcSZmHTAyJx1xnsnIBiJ
 F/4jFMtn6RIRbeq60QZZpRPSmEfjNQ2IjluEMR1nQBNYLykIxI8I6AoxOxpVFd6Olxoe
 6wm8qCYOZm/NGO8OMfW+OjPzmqkPiYMGDyEjPFomTJzuD+gcyacmD1M8gP3OHH/ycyGQ
 19YA==
X-Gm-Message-State: AOAM533GREsp/2uTk3osQThypRBUIcIu409wjhYMwA/tllEz0nmrEZWP
 bXhCH532u8fbwOw8O9KGbCwVFJa1uK4=
X-Google-Smtp-Source: ABdhPJwzJ/1PHf1uI+fR7TIi/ilHgXiUoFwuDLk91Z8nLGG+2zOweiZqxRS6ckJcjK+tnQIvizPtnA==
X-Received: by 2002:adf:f2c5:: with SMTP id d5mr32392614wrp.90.1642678238732; 
 Thu, 20 Jan 2022 03:30:38 -0800 (PST)
Received: from nuc.. (154.red-83-50-83.dynamicip.rima-tde.net. [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id
 k37sm8968471wms.0.2022.01.20.03.30.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 03:30:38 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Ed Maste <emaste@freebsd.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Yonggang Luo <luoyonggang@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 4/7] tests/lcitool: Install libibumad to cover RDMA on
 Debian based distros
Date: Thu, 20 Jan 2022 12:30:13 +0100
Message-Id: <20220120113016.268265-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220120113016.268265-1-f4bug@amsat.org>
References: <20220120113016.268265-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::330
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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

Note, librdmacm and libibverbs are already listed in lcitool's qemu.yml.

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/docker/dockerfiles/ubuntu1804.docker | 1 +
 tests/docker/dockerfiles/ubuntu2004.docker | 1 +
 tests/lcitool/projects/qemu.yml            | 1 +
 3 files changed, 3 insertions(+)

diff --git a/tests/docker/dockerfiles/ubuntu1804.docker b/tests/docker/dockerfiles/ubuntu1804.docker
index 4ea272d143b..7ebaab82b97 100644
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
index 90988b2bc53..b93707b70d4 100644
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
index ed5ab1407a9..948b9912579 100644
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


