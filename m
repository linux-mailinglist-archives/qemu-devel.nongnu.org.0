Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3873B6AA092
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 21:27:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYByL-0006Ua-3w; Fri, 03 Mar 2023 15:25:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pYByJ-0006UI-HK
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 15:25:43 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pYByH-0006bx-Us
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 15:25:43 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 qa18-20020a17090b4fd200b0023750b675f5so7320458pjb.3
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 12:25:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677875140;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Iv6I5GXyuvdGYjQFlpilFrl6dNLsOJmMBDEG4Ft3O70=;
 b=Il/SAe2XkHLK7Q0sKew72yhP4HIB7iQjE5DQlb+PAoYAGkas9LErFmM3jq7z4/xbur
 lox4bhCbeMeeE2tvRBtrMHZ/ta5Tq98tbBSwMn78N//5h3Jjmwjs7FQO1UZ3VYn/EfO3
 YOHVs3ktesU+hISOGW8NOnNDqOL+xczTL08J6aB4HgqnhIBikz1envNd8Yt+viJuQucz
 AS1fPKKYjysnwi9imnIBG9vz0A5wB9ueiPTuIC3LnRQgph0TW0B9lL4KbJduPvNT7PT5
 mc2Uged5EOAzpbiXNyQ8LmUoVN+XtWyYAs05abQzTxWU+NfpUaMO8Jgcq6t/jk4dsSa4
 olEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677875140;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Iv6I5GXyuvdGYjQFlpilFrl6dNLsOJmMBDEG4Ft3O70=;
 b=2i92Pdn3hBwU6DLX31BwmcCwwreUP2Yy2UwgiD3htuGY8NYhdujQnUbv8Yzzulerbv
 w6Fz4z1XJJWU7ED3HrsYH++lA9DTq2w2cgS2PYvmy2Q1J1X0c7BHDi6EeD1EvwT07rNg
 xZmeWxfHLog4VbLWFkwjclH0lWj1GFDQkQ7BUcfs5pUUUAzUh1eHC3Eq8kIxYhftuhzT
 gtmlKZEaG0qEnspZOwPlj0KORTM90z+WCywSMyrmNhfAUPVbJYweN9E2m8z+LTh/AvmR
 cFVLK1jLAD3Uw47W/XCU23AhctstLmJe5d0o/1sYR/EahnBbUG9k5m3lguzw6A8KPRmb
 NtvA==
X-Gm-Message-State: AO0yUKW8wzKyQe19JtV1jH5gfAXrqC7JlZpxDc0zF243fGHOJf/YwPtZ
 QbJmt1OnG8WOE2bTbO5iP0JMLQ==
X-Google-Smtp-Source: AK7set/sXNW1nbproHmnci6I3eEC1WuN1E6cH4KAuwlx2w6soeR2YxmxFa/VrsUJ3eJDu/Pz8JGrYQ==
X-Received: by 2002:a17:902:d486:b0:19d:1230:439b with SMTP id
 c6-20020a170902d48600b0019d1230439bmr3777427plg.63.1677875140675; 
 Fri, 03 Mar 2023 12:25:40 -0800 (PST)
Received: from localhost ([50.221.140.188]) by smtp.gmail.com with ESMTPSA id
 ki13-20020a170903068d00b00194d2f14ef0sm1919611plb.23.2023.03.03.12.25.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 12:25:40 -0800 (PST)
Subject: [PATCH v2 1/2] gitlab/opensbi: Move to docker:stable
Date: Fri,  3 Mar 2023 12:24:47 -0800
Message-Id: <20230303202448.11911-2-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230303202448.11911-1-palmer@rivosinc.com>
References: <20230303202448.11911-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Bin Meng <bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=palmer@rivosinc.com; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The OpenSBI build has been using docker:19.03.1, which appears to be old
enough that v2 of the manifest is no longer supported.  Something has
started serving us those manifests, resulting in errors along the lines
of

    $ docker build --cache-from $IMAGE_TAG --tag $CI_REGISTRY_IMAGE:$CI_COMMIT_SHA --tag $IMAGE_TAG .gitlab-ci.d/opensbi
    Step 1/7 : FROM ubuntu:18.04
    18.04: Pulling from library/ubuntu
    mediaType in manifest should be 'application/vnd.docker.distribution.manifest.v2+json' not 'application/vnd.oci.image.manifest.v1+json'

This moves to docker:stable, as was suggested by the template.  It also
adds the python3 package via apt, as OpenSBI requires that to build.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 .gitlab-ci.d/opensbi.yml        | 4 ++--
 .gitlab-ci.d/opensbi/Dockerfile | 1 +
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/.gitlab-ci.d/opensbi.yml b/.gitlab-ci.d/opensbi.yml
index 04ed5a3ea1..9a651465d8 100644
--- a/.gitlab-ci.d/opensbi.yml
+++ b/.gitlab-ci.d/opensbi.yml
@@ -42,9 +42,9 @@
 docker-opensbi:
   extends: .opensbi_job_rules
   stage: containers
-  image: docker:19.03.1
+  image: docker:stable
   services:
-    - docker:19.03.1-dind
+    - docker:stable-dind
   variables:
     GIT_DEPTH: 3
     IMAGE_TAG: $CI_REGISTRY_IMAGE:opensbi-cross-build
diff --git a/.gitlab-ci.d/opensbi/Dockerfile b/.gitlab-ci.d/opensbi/Dockerfile
index 4ba8a4de86..2d151a6bc8 100644
--- a/.gitlab-ci.d/opensbi/Dockerfile
+++ b/.gitlab-ci.d/opensbi/Dockerfile
@@ -16,6 +16,7 @@ RUN apt update \
         git \
         make \
         wget \
+	python3 \
     && \
     \
     rm -rf /var/lib/apt/lists/*
-- 
2.39.2


