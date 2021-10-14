Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C3C42E467
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 00:48:27 +0200 (CEST)
Received: from localhost ([::1]:52846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mb9WU-0000E6-4m
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 18:48:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mb9Ss-0002lY-Ca
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 18:44:42 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:42531)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mb9Sq-0004Jc-S5
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 18:44:42 -0400
Received: by mail-pf1-x429.google.com with SMTP id m14so6711939pfc.9
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 15:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TLXzZWfNaYKwqtM1Kn97ZLYqBJk/lPUwe18as3UZkwQ=;
 b=qPE7KVm6luMvi8IJZf0Jl4+4lWrUf4WFHJWDZE74b4ckq5bYsPgQ5Qk8EKRdJlXskx
 RSpkBJba/hR6RRUI8gfkpmhvhYopsbRmaZqUow9RKT9YrysddssYaNyrJu1eB4sw31Ij
 NR3Ds1P94F2I3LCE7oaNkDm+MEhG0qv4z2F19t/LJK0I665e1Ga04ruHND/C4BXF34ty
 FtT5fuIs3sEOVziP7zzSnDksslJGEUYljQki7luKromWzql8q1ql+KGP6NrontFDp95Q
 h2rTZ3GXEYUbKSRng7U73K5pEaNf/i7JiJSM8FzRq6L7VRPqWO65HkB9z4/d/jAaFwNN
 0NaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TLXzZWfNaYKwqtM1Kn97ZLYqBJk/lPUwe18as3UZkwQ=;
 b=MRkNCdtSIlJgKrnQKhbR6H3u6GKlZTs1vyqzts4VoM59djFZcVEC0GWL5Bl0PZ8QsG
 gc20tRr5Fpt9Ez9Go5y+uOLDRv53RPuxlRY3PHPe/HHRa6hdEEzBDTWRwzjsZjiRaWQk
 zpSWDaJ9vAsVAyrFE4dlpNd/4k7bys1ldleLw1F+9N6Mn3l7Ey++sVxYyGp+hzNX4Kyp
 i5J5VmOsbsniqIIzBmXcRHP3TX68nj3rIArhJisxU1nUURxuJsay4IuyWohYAq4MRGG7
 AW4JKSe1VbwSyyW+XoFvcaPFOm7LpzoCABiRFyhMBxS6IDPOn+YQaxi1LiLe5T4oWWD6
 LQaA==
X-Gm-Message-State: AOAM532N9YTkN3fnWYcGzVhym8/Ou+zQzJH7LldxCcZVHe5tGHt0dBNY
 CmCEqx6lw+KD1SNh5oGvKJOR20fyrH0yJA==
X-Google-Smtp-Source: ABdhPJwJ1gM2iaqAtdUEkg5ujnq83tFPcH+39VnkENqB4CKR002h5OSVL80rjNw0J0084RrWgU33FQ==
X-Received: by 2002:a62:8284:0:b0:44c:6490:4a2d with SMTP id
 w126-20020a628284000000b0044c64904a2dmr7836194pfd.38.1634251479269; 
 Thu, 14 Oct 2021 15:44:39 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id m10sm9506208pjs.21.2021.10.14.15.44.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 15:44:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/7] tests/docker: Use apt build-dep in debian10
Date: Thu, 14 Oct 2021 15:44:29 -0700
Message-Id: <20211014224435.2539547-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211014224435.2539547-1-richard.henderson@linaro.org>
References: <20211014224435.2539547-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replace the complex apt-get subshell with apt build-dep.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/docker/dockerfiles/debian10.docker | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/tests/docker/dockerfiles/debian10.docker b/tests/docker/dockerfiles/debian10.docker
index b414af1b9f..d3bbb90c64 100644
--- a/tests/docker/dockerfiles/debian10.docker
+++ b/tests/docker/dockerfiles/debian10.docker
@@ -14,7 +14,8 @@ RUN cat /etc/apt/sources.list | sed "s/^deb\ /deb-src /" >> /etc/apt/sources.lis
 
 # Install common build utilities
 RUN apt update && \
-    DEBIAN_FRONTEND=noninteractive apt install -yy eatmydata && \
+    DEBIAN_FRONTEND=noninteractive \
+    apt install -yy eatmydata && \
     DEBIAN_FRONTEND=noninteractive eatmydata \
     apt install -y --no-install-recommends \
         bc \
@@ -33,5 +34,7 @@ RUN apt update && \
         psmisc \
         python3 \
         python3-sphinx \
-        python3-sphinx-rtd-theme \
-        $(apt-get -s build-dep --arch-only qemu | egrep ^Inst | fgrep '[all]' | cut -d\  -f2)
+        python3-sphinx-rtd-theme
+
+RUN DEBIAN_FRONTEND=noninteractive eatmydata \
+    apt build-dep -yy qemu
-- 
2.25.1


