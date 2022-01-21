Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF2B495DF5
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 11:54:21 +0100 (CET)
Received: from localhost ([::1]:47368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nArYi-0002dc-Fh
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 05:54:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nArHq-0003bC-7s; Fri, 21 Jan 2022 05:36:54 -0500
Received: from [2a00:1450:4864:20::32d] (port=35831
 helo=mail-wm1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nArHo-0004Yr-J8; Fri, 21 Jan 2022 05:36:53 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 q9-20020a7bce89000000b00349e697f2fbso28097065wmj.0; 
 Fri, 21 Jan 2022 02:36:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4Tjd8wVbUrFFk0Vv7+6+0PlH5zCkrfjOZaloy1pivCI=;
 b=mP8Z1L4xDevRjk4Kr4aFjvQqtG2E70lhT5oYBlcJzUlRsSdKPXcctpS0CAITaA37XC
 5ZQzhZZZdUetdSVMMUIbY3HqIIEEvvmcBBvHGb2rTlcfQhamKYCOPysUSLpwtwy2ELaK
 daWREy/jWGPW6gJ08luzX3jpWfzoaue/dutOw1/RWuHgrLksIBoAqR8rGKxhtlIzRC8n
 ngQ85Tnmk84orGNVMN8OgvwYCUKT9AtN/yD0eGqOjQVuNRdBDq20cqEtrTgkhr2zma6e
 9Am2/oi4JtFe+6l2B/wCGNXAky5RSKPSQ5FArhro30SeKOmJv1A443uQUnurxtdvYjv1
 tK8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=4Tjd8wVbUrFFk0Vv7+6+0PlH5zCkrfjOZaloy1pivCI=;
 b=gb2O6WifWKqLiVdcaeol2g5K/ZIhQD0a08WuCfHxmEksklV5HpWhAxznUbPOfHkbY2
 gQoK0E7JofwJ3Kom23vNZy+r7MxxkAU/zDIilx7ZzBrHAeMUe+tSPs2Pn3X+FqCkGaUY
 5YEAReS0DNGcafuiD7tIa76S4rF8CV+ez/8PfBzlCt7yvqVEul9IppgBraiXqZGKq9YY
 zVwrU376UHqCrVlqT0Ldr0XvnyXE0mNeCPFcyLZQBWvlwxBoCDlrZxJ4m71EjGUh2zY9
 uhFiudsIdhn3xd4GuKkgWJXGd0PzjzGFL/x6Bg45ePJb83IksChM6tchsOKUvjKcajOF
 x+3A==
X-Gm-Message-State: AOAM532fbYUcf7bUmVyiF2A2onL1/68euu7d/XSiquFtS2n9MxDJ8imo
 DSdJm/Yi+XM+wS1Jgp2Urin0EkqcAgw=
X-Google-Smtp-Source: ABdhPJyd5V/ktkKDDwzWvqXkjmzvJJc5jMlbpXcsZPwi7imH/sItfoe/OYe7KRThJv8HnrRvaJHwGw==
X-Received: by 2002:adf:f9c5:: with SMTP id w5mr3386692wrr.362.1642761410063; 
 Fri, 21 Jan 2022 02:36:50 -0800 (PST)
Received: from nuc.. (154.red-83-50-83.dynamicip.rima-tde.net. [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id
 m187sm4581501wme.25.2022.01.21.02.36.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jan 2022 02:36:49 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yonggang Luo <luoyonggang@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v4 5/8] tests/lcitool: Install libibumad to cover RDMA on
 Debian based distros
Date: Fri, 21 Jan 2022 11:36:20 +0100
Message-Id: <20220121103623.288054-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220121103623.288054-1-f4bug@amsat.org>
References: <20220121103623.288054-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
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


