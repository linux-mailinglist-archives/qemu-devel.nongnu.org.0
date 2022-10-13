Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BBA75FDD9F
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 17:54:13 +0200 (CEST)
Received: from localhost ([::1]:56326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oj0XE-0003xH-AX
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 11:54:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oj0QW-0006B0-Dh
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 11:47:16 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:40775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oj0QT-0006oS-5X
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 11:47:15 -0400
Received: by mail-wr1-x42c.google.com with SMTP id w18so3479782wro.7
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 08:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2ry1wU/BfM74+fJh+toSsnwKNvrVGaycYMZ3hF8weMU=;
 b=F8ozOcJFNhyTF+udriPACXXa/EOgB4FhHBwsfkuz7RrBP4/2cetoBM4ybJGEPLD1UQ
 diCjRZ2LyLhkr2OwM4tHLh61JRrfH+E6Cq1qzCKanG0mXDohxU8ZHBKTBcGz62/1d3j6
 tJtzIWVHIJRZKAZQw+wVWy7Thbv6fiuo8gA938l1iXuVgYsvOb5MAoIBtVRb1dbgYN2g
 5jwIN5QkVAp4A4c+GSi2AHLH4cn0SHlkon19zWupI6JyVOasT5SxQAse4jtfc7p25dN3
 8tHE0IrUw5XFtDtOMzvQBEdG8YHUm987fRliQ1+dOY8ZRGoA1nuXuM0o/AB7csPJgB5C
 /zcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2ry1wU/BfM74+fJh+toSsnwKNvrVGaycYMZ3hF8weMU=;
 b=KQGFynjIkzFSpMc1o6bsD6tXVq/imZ2ZmcITgot4qVUj8VnUArW9dHG7jcyZgHx/J5
 1nwHiAx5T3MF7F0thBrf3AVygaBgQATWDDu19Yxz4zFXBKmrGEOAWbHg141euOU4rfz2
 aZyKzeUKn0lws5VzBN6bgj8hy2wL9rTPrEAQjclZ8yiyZ6wjV8qCKcNK8XubYBmL3pPo
 McNgU5pktzrPr4HjD2ADflIWi8GeuUiAJ7W5HrKthTG7wPJH7wG4LkR4LMx5o81xDyUC
 Kw7k+YBPD3gtVWw33MweuSUmMURIQD6bn6DyCddiNLmvcUf9HzCGEou3a5UeVF4ApIuJ
 tmBg==
X-Gm-Message-State: ACrzQf3LQEuUFCcV5zZ6DTnw9+BC4IWRz9PUPxdQpcxxQhosLPx8Ix1U
 i2QsYHnNhTXueS9zLxXz4dMniQ==
X-Google-Smtp-Source: AMsMyM6t2awBfrLDY4KDENL/dnHd3RMA3fQqSvR8lLoLFt1969L3DARhCKmuhKx70SdYh43fJ6s09w==
X-Received: by 2002:adf:de11:0:b0:22e:32bf:73f0 with SMTP id
 b17-20020adfde11000000b0022e32bf73f0mr425723wrm.37.1665676031747; 
 Thu, 13 Oct 2022 08:47:11 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 r16-20020a05600c35d000b003a84375d0d1sm5245394wmq.44.2022.10.13.08.47.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 08:47:10 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 626591FFBE;
 Thu, 13 Oct 2022 16:47:06 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v2 6/7] configure: expose the direct container command
Date: Thu, 13 Oct 2022 16:47:04 +0100
Message-Id: <20221013154705.1846261-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221013154705.1846261-1-alex.bennee@linaro.org>
References: <20221013154705.1846261-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In the process of migrating away from using docker.py to build our
containers we need to expose the command to the build environment. The
script is still a useful way to probe which command works though.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 configure | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/configure b/configure
index bab4e6df9f..edac4f3577 100755
--- a/configure
+++ b/configure
@@ -1779,6 +1779,7 @@ fi
 # functions to probe cross compilers
 
 container="no"
+runc=""
 if test $use_containers = "yes"; then
     case $($python "$source_path"/tests/docker/docker.py probe) in
         *docker) container=docker ;;
@@ -1787,6 +1788,7 @@ if test $use_containers = "yes"; then
     esac
     if test "$container" != "no"; then
         docker_py="$python $source_path/tests/docker/docker.py --engine $container"
+        runc=$($python "$source_path"/tests/docker/docker.py probe)
     fi
 fi
 
@@ -2386,6 +2388,7 @@ fi
 
 if test "$container" != no; then
     echo "ENGINE=$container" >> $config_host_mak
+    echo "RUNC=$runc" >> $config_host_mak
 fi
 echo "ROMS=$roms" >> $config_host_mak
 echo "MAKE=$make" >> $config_host_mak
-- 
2.34.1


