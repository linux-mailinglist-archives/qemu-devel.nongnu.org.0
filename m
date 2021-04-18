Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F055363897
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 01:48:11 +0200 (CEST)
Received: from localhost ([::1]:43122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYH98-0004Et-CN
	for lists+qemu-devel@lfdr.de; Sun, 18 Apr 2021 19:48:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYGxP-0001b5-Nc
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 19:36:03 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:45629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYGxO-0003Wh-4T
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 19:36:03 -0400
Received: by mail-wr1-x433.google.com with SMTP id h4so23047681wrt.12
 for <qemu-devel@nongnu.org>; Sun, 18 Apr 2021 16:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=T8BFfTvY4m5j6dkvWFL9bHoXXUlACw5KgYibCTJPKfE=;
 b=KECAzo4PStC4QmVUws8joqGntRt0CzRGmyeriXfUGsW2Rp4FDvTMeb3qblEy2dpGWc
 sVe8C+48r4JwYAbFR8EQoV0zh71DT60QP0alHk1gQ4sJijO1ZN//w3aQah8xgtcJlLkX
 8sF0RczNoYtUICMcSMeQBQlsIPIcd/ekHKb4a+q/tAYxql4fxkipJpjh+Xkr1QMI7HQ0
 dHqNGGFSLEko2IATvJsuudkDpaoo+VyebFArly5nT+PDbnqqUcDXCO2qoEhT5rddogKO
 aDJG1BbUE2OC/440imrcxlCj8FoM+C/XHnA57oKnG6g47JvmkfxLq5ixKzBmCuJsUmeY
 X3NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=T8BFfTvY4m5j6dkvWFL9bHoXXUlACw5KgYibCTJPKfE=;
 b=dTA+ovaG3ePSTFeKpYq9/lsOswa906/Nqi0+91UqwWvswJhiJFGwkdfTorZeUMZM9p
 S9tbDzRx2m27MAuGzKlCV+edG9WCIOiCidHT1FHbAC9HqzhE/122ThxTlNhuIC1HQUe8
 wVU5Ifx2vfVGSRvVOKuM0iJY6Z3jYvtifSMSsXAyQIB18CEgZc4GcUCqDQ/cx7vxzX9m
 LhiM3fZWVNtJ7Ynx3wYUqmaG+hPAMZT9OewGiSMtNG6MD3aH5neyA0J62z5GQ2NhWQ70
 EGgfT7TvLdc/PraX0SF5nrFmUlYR49/n/7CRBSzTpqweZQHyKzzQwBCRONxWES6nfsgr
 bJbA==
X-Gm-Message-State: AOAM5312tntPy/kmOruNNxi+fKnx/wSCBj92Z8TxxwgIG34diwmBafQ8
 LKOpW6jSEEX6traJNP9UY+wKN/Sp1QURJQ==
X-Google-Smtp-Source: ABdhPJxKiKasbtPDMgubFBvX3xBtC524VvxPj7cx33k438Exr0ZqGJT0Q/Zrs9eU5/6h7vFJoml8xQ==
X-Received: by 2002:a05:6000:154e:: with SMTP id
 14mr11332072wry.24.1618788960772; 
 Sun, 18 Apr 2021 16:36:00 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id l20sm17925605wmg.33.2021.04.18.16.35.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Apr 2021 16:36:00 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 14/15] gitlab-ci: Allow forks to use different set of jobs
Date: Mon, 19 Apr 2021 01:34:47 +0200
Message-Id: <20210418233448.1267991-15-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210418233448.1267991-1-f4bug@amsat.org>
References: <20210418233448.1267991-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
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

Forks run the same jobs than mainstream, which might be overkill.
Allow them to easily rebase their custom set, while keeping using
the mainstream templates, and ability to pick specific jobs from
the mainstream set.

To switch to your set, simply add your .gitlab-ci.yml as
.gitlab-ci.d/${CI_PROJECT_NAMESPACE}.yml (where CI_PROJECT_NAMESPACE
is your gitlab 'namespace', usually username). This file will be
used instead of the default mainstream set.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 .gitlab-ci.yml | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 718c8e004be..35fd35075db 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -9,7 +9,12 @@ generate-config:
     paths:
       - generated-config.yml
   script:
-    - cp .gitlab-ci.d/qemu-project.yml generated-config.yml
+    - if test -e .gitlab-ci.d/${CI_PROJECT_NAMESPACE}.yml ;
+      then
+        cp .gitlab-ci.d/${CI_PROJECT_NAMESPACE}.yml generated-config.yml ;
+      else
+        cp .gitlab-ci.d/qemu-project.yml generated-config.yml ;
+      fi
 
 generate-pipeline:
   stage: test
-- 
2.26.3


