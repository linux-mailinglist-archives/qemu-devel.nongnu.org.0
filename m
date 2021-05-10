Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6C03792AD
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 17:28:17 +0200 (CEST)
Received: from localhost ([::1]:47790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg7pQ-0001qP-Mx
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 11:28:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lg7kT-0000Ew-FO
 for qemu-devel@nongnu.org; Mon, 10 May 2021 11:23:09 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:39767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lg7kS-0003he-3O
 for qemu-devel@nongnu.org; Mon, 10 May 2021 11:23:09 -0400
Received: by mail-ed1-x535.google.com with SMTP id g14so19190337edy.6
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 08:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pHMQm29tLL67H5oQpTA9QLqlgbtLlPJFehMRIAIMyLw=;
 b=uvg7klp7OJ48MviKGyqtd0jzPZIXStlSVDUXIODeT1lCzob6q4Z1V52dRVKM6kvsUD
 yLep41If8WApMgloIOkpNhM/nN3S3WF7AsiWqHhyrFMd2amYle/dtCE1yNXFM0omB7n6
 NNoDY/JChhhIdPCjRYMj8L4uOMNznMjM8CE5N57F9AFXQBHzA6IKXWADky6yfEclyd4c
 7qkzbRTfBNl2QPris+WenjUwEyDrwMhwRUmnkY9Oe8I7scM0rL/H2eNZ/7Q48IZRNx7M
 8ObbjR9CPGeeG7E++47EqaGRbHm/CGc+kEPHwJQKwVS0R3a4mBxUtthTZ6iBJvxW6nbx
 I4xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=pHMQm29tLL67H5oQpTA9QLqlgbtLlPJFehMRIAIMyLw=;
 b=PVg0cjic+QCkHQ4etGNFvwDvP3jScYWeIlKy8K05K8eMASjrICtsoIW+fm/VjFXii3
 TjxlTT+NnFS1tGRQhfRHsi7LA43qqwSO1t0rz9U4Fm+Ra1svH53QABJ2b+oj4P9ztfVk
 MQmlwvTfUUwj3N0bbyTiSH8b/ZEn0hIPDI0BFgH0iHuGerwzi5jGUBd6t60KX9q1Deo6
 xoHzHB/foRsE71edHl8bVvMlKAgxC03LUTkDcRaTxJrkFmn6f2f71y7rWs+GpBQFPP2u
 gzzY4YES+8t4cVrF8ZJzFCT5sHYyeNFhz58oyaYzHbUhptKN/c+tCxRqys/ursw7pN+9
 yJNw==
X-Gm-Message-State: AOAM5335yOhwxLaPzM+XSlnNy0us4oNKlHgo8IQgFKpaGjSSlB7aNWXO
 1iTBLJtTJBRDBzH6FtxY5/Ndjiw2FSm4xg==
X-Google-Smtp-Source: ABdhPJydc5n3hMOw1/abOWegvbIfVRSWlfrj0EzL0lnwPU1yWq0EiGuqTJMaBNuj4hZiN9Ewjga+/Q==
X-Received: by 2002:a05:6402:8da:: with SMTP id
 d26mr30184982edz.161.1620660186599; 
 Mon, 10 May 2021 08:23:06 -0700 (PDT)
Received: from x1w.redhat.com (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id gn31sm9039814ejc.124.2021.05.10.08.23.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 May 2021 08:23:06 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/4] gitlab-ci: Adapt JOBS variable for FreeBSD runners
Date: Mon, 10 May 2021 17:22:52 +0200
Message-Id: <20210510152254.2543047-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210510152254.2543047-1-f4bug@amsat.org>
References: <20210510152254.2543047-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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

'nproc' is not available on FreeBSD:

  $ JOBS=$(expr $(nproc) + 1)
  bash: line 119: nproc: command not found
  expr: syntax error

Instead, use 'sysctl -n hw.ncpu'.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 .gitlab-ci.yml | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 598a8fb096f..aceaac5a398 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -15,7 +15,17 @@ include:
 
 .environment_variables_template:
   before_script:
-    - JOBS=$(expr $(nproc) + 1)
+    - if
+        test $(uname) = "FreeBSD"
+        ;
+      then
+        JOBS=$(sysctl -n hw.ncpu)
+        ;
+      else
+        JOBS=$(expr $(nproc) + 1)
+        ;
+      fi
+    - echo "=== Using $JOBS simultaneous jobs ==="
 
 .native_build_job_template:
   stage: build
-- 
2.26.3


