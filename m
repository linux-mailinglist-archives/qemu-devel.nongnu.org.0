Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4FD4B2A89
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 17:39:04 +0100 (CET)
Received: from localhost ([::1]:40196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIYwo-0002Yy-6f
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 11:39:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nIYsp-0008CK-NK
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 11:34:59 -0500
Received: from [2607:f8b0:4864:20::102f] (port=53070
 helo=mail-pj1-x102f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nIYso-0001y9-3x
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 11:34:55 -0500
Received: by mail-pj1-x102f.google.com with SMTP id v4so8585999pjh.2
 for <qemu-devel@nongnu.org>; Fri, 11 Feb 2022 08:34:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J3na8susHmby8TR4jzyryoU+uoSEfyt40zPtMqoq/L4=;
 b=R2Jy/a+n1d0UyuOpO7XkzFNqJi0X97lK4MG3oSTc63N+UvZ+M5rqN93cIbz/DhJnZq
 49y0Fy/jifkqYZX3O1s32O8YKcC3Z+XNG6Z2O1WU8L9tcE0ZQ3tMOnQEpGOqXoMi9SYx
 2oObH5UDdJ3CiFG686fMWjVuYFUXXQjCjq7bz+20VIFxceGTpvJhnvcDXV7+0pvqwz+/
 uGBhzhCbxRtn1HLjP10I6vObJaLhQsB2f6NTQ9hpAZJgvIgJpIKNgPjSTiIQy4Kqn7gV
 pZq9lFAy6gFgr06KPzHf78LyRgTQGasJl1eJgKKmlujIH8hjfABsNgYPj3OUe3hhYHTc
 CoLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=J3na8susHmby8TR4jzyryoU+uoSEfyt40zPtMqoq/L4=;
 b=tHQhNv8ushsml/k6uFLvZHbXha4Yq/J/6ALnudb5hrxbe+Qq6eE0tEzbbhu8i7JwiF
 OVktRmwTdgI4tCWLPczDL+e9ludwC4IRqcWTy7IqwE0qKS6sDR5iiwdtP9/MxD+An4PZ
 0BSE88TCbktucOGI11fVUN6D0Ti+kRGAlpdS28SB8tO+70e0w/dvC1HdILAi6etdnuwD
 dElpu1ukm7Tp5REuSYom4f+aPtVOZpH3h6LvKifEa9wRhDdYmaZwrhjHK9DOEvoK9keS
 kOizyDYyK1LNiHZauwFXe5frR3Dj4EFGwlAOIfFwrkzDY6iB0oqHiD/962o7f0L9Nc6s
 jibA==
X-Gm-Message-State: AOAM531kXIOb/Ka+ER+ZVGfop4SbEEnDtegLPHzej2oY+1/v9tkIqDar
 oeyLn/W7UDPGR0vNMi2dCEgJe65+Odw=
X-Google-Smtp-Source: ABdhPJxhrJFPPwts+zPl7bVsLfmYRdsOzORr7B5xgQjdCFenDP1U5IbxS9HrAs50TK7og8y51+PMYg==
X-Received: by 2002:a17:902:ab1c:: with SMTP id
 ik28mr2404619plb.58.1644597291138; 
 Fri, 11 Feb 2022 08:34:51 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id a20sm22050395pfv.150.2022.02.11.08.34.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 11 Feb 2022 08:34:50 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Cameron Esfahani <dirty@apple.com>,
 Peter Maydell <peter.maydell@linaro.org>, Will Cohen <wwcohen@gmail.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Li Zhang <lizhang@suse.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v4 01/13] lcitool: refresh
Date: Fri, 11 Feb 2022 17:34:22 +0100
Message-Id: <20220211163434.58423-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220211163434.58423-1-f4bug@amsat.org>
References: <20220211163434.58423-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/docker/dockerfiles/ubuntu1804.docker | 2 --
 tests/docker/dockerfiles/ubuntu2004.docker | 2 --
 2 files changed, 4 deletions(-)

diff --git a/tests/docker/dockerfiles/ubuntu1804.docker b/tests/docker/dockerfiles/ubuntu1804.docker
index 699f2dfc6a..040938277a 100644
--- a/tests/docker/dockerfiles/ubuntu1804.docker
+++ b/tests/docker/dockerfiles/ubuntu1804.docker
@@ -65,7 +65,6 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
             libpam0g-dev \
             libpcre2-dev \
             libpixman-1-dev \
-            libpmem-dev \
             libpng-dev \
             libpulse-dev \
             librbd-dev \
@@ -89,7 +88,6 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
             libvdeplug-dev \
             libvirglrenderer-dev \
             libvte-2.91-dev \
-            libxen-dev \
             libzstd-dev \
             llvm \
             locales \
diff --git a/tests/docker/dockerfiles/ubuntu2004.docker b/tests/docker/dockerfiles/ubuntu2004.docker
index 87513125b8..159e7f60c9 100644
--- a/tests/docker/dockerfiles/ubuntu2004.docker
+++ b/tests/docker/dockerfiles/ubuntu2004.docker
@@ -66,7 +66,6 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
             libpam0g-dev \
             libpcre2-dev \
             libpixman-1-dev \
-            libpmem-dev \
             libpng-dev \
             libpulse-dev \
             librbd-dev \
@@ -91,7 +90,6 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
             libvdeplug-dev \
             libvirglrenderer-dev \
             libvte-2.91-dev \
-            libxen-dev \
             libzstd-dev \
             llvm \
             locales \
-- 
2.34.1


