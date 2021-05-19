Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24980389678
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 21:20:03 +0200 (CEST)
Received: from localhost ([::1]:41278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljRje-000437-3L
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 15:20:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ljRD5-0000SP-C7
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:46:23 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:34528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ljRD0-0005H8-Th
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:46:20 -0400
Received: by mail-wr1-x430.google.com with SMTP id r12so15095172wrp.1
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 11:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3SkTTNfbgrgPZRsbTajuJ3tzgEyu0ZeYqUT1Kjom0eE=;
 b=kFF4R7Cem/qf1QxILFeMqttHYRR9hyQNSpW2Gh1mskOSZTlXXSaiArXIYdVywxd/nk
 WyNEMBKrgxVwTyS740ESbGZMTKdZlNFK5MZ0fhAWIMSl/nPycAKq64FOThAV2tGk+Cek
 Qysx3N0Cul1qqcquIkhoqWsYCjfnix5+vj7r3OfGEaCokNHxgopRxg4vw9OHoaZ/B0AS
 08onmKOh5x9i18pULenBgqzsCN9syBUCg+IVascrjh8dqqS8aWTvmZjcW7Q0bdOY9KiE
 kcjDqmSV0d4Q4BnzdPYq/gXAvRzD9+DAmg2Emw6k6qPwAZqb1MPCFGOywsMlTAB849bQ
 NhBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=3SkTTNfbgrgPZRsbTajuJ3tzgEyu0ZeYqUT1Kjom0eE=;
 b=JiBpmv5WEP2lsgEMJG4Eq1UFv2ciyr5k/2BrlASX/MjU9RlqQmg8+WC1y9fwxbFrkZ
 RjD0/naWwNNz+i0YlwLeBKTqihwBgfsQRmQgrh0LcVJGNtzEyDJ1jODOptEAGdBkXgLg
 clpCy4Uyh/4YboZnEwcOFucRXwSv6EmbvWxIlwepmeVoEptoyNuEfLbtEmZMnQyGwESt
 adEhsfUvnqcWxb9nGThxj5bibO33/l2vV9mdS7HXa9Dsqb2Lr9toCLtmsObz0rxi7g1t
 ZwtDPaBjcNJ73cAy+hMaL1HUkIhpDn87e10q5diNefyQVW8IpxFlARTsFRRDafk/fvT2
 Ma2Q==
X-Gm-Message-State: AOAM530gNTt4/k+KmHFtbdfXPi9uWHTwPFFZsjDvf+pn8b5IE5n60i9m
 OdS6qnMBWLFtcHm36T3Jutnt/wHgCCPiAA==
X-Google-Smtp-Source: ABdhPJykWaRlBReyfgx3Yts2YqRxaVjNoTkhAMhrZm6+Pb/rLSpBY1r5HCrpoZZWIy6rJ4bRzRAkrA==
X-Received: by 2002:adf:aad8:: with SMTP id i24mr385205wrc.0.1621449976437;
 Wed, 19 May 2021 11:46:16 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id v20sm270550wmj.15.2021.05.19.11.46.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 11:46:15 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 5/6] gitlab-ci: Simplify before/after script for Avocado
 based jobs
Date: Wed, 19 May 2021 20:45:48 +0200
Message-Id: <20210519184549.2192728-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210519184549.2192728-1-f4bug@amsat.org>
References: <20210519184549.2192728-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 .gitlab-ci.d/buildtest-template.yml | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/.gitlab-ci.d/buildtest-template.yml b/.gitlab-ci.d/buildtest-template.yml
index a625c697d3b..f968fa1ad99 100644
--- a/.gitlab-ci.d/buildtest-template.yml
+++ b/.gitlab-ci.d/buildtest-template.yml
@@ -74,7 +74,7 @@
       - build/tests/results/latest/test-results
     reports:
       junit: build/tests/results/latest/results.xml
-  before_script:
+  script:
     - mkdir -p ~/.config/avocado
     - echo "[datadir.paths]" > ~/.config/avocado/avocado.conf
     - echo "cache_dirs = ['${CI_PROJECT_DIR}/avocado-cache']"
@@ -85,6 +85,9 @@
         du -chs ${CI_PROJECT_DIR}/avocado-cache ;
       fi
     - export AVOCADO_ALLOW_UNTRUSTED_CODE=1
-  after_script:
     - cd build
+    - find . -type f -exec touch {} +
+    # Avoid recompiling by hiding ninja with NINJA=":"
+    - $MAKE NINJA=":" $MAKE_CHECK_ARGS
+  after_script:
     - du -chs ${CI_PROJECT_DIR}/avocado-cache
-- 
2.26.3


