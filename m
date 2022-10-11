Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E85245FB361
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 15:24:43 +0200 (CEST)
Received: from localhost ([::1]:58936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiFFR-0000bm-Tc
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 09:24:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oiDWi-0004dx-3v
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 07:34:24 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:55048)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oiDWf-0004Ku-IA
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 07:34:22 -0400
Received: by mail-wm1-x32d.google.com with SMTP id iv17so8414349wmb.4
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 04:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ux7WwgBmVw/vJ3sl2dviENLYf0GhlklJxjYn9aMfJVY=;
 b=jO+a2ZDRS6aVoJR9oNZDjnifpeIu4NjbqyBOwGlD4ilQDjRgfwSvSPW1hBMRbbMCxx
 BCok4YnOkBjaa3LLFnVFuRK/HR2B71AYGau/9/Dfu2mmklJtMIqI65fKG4qrioak374z
 JfLHfZTezpI9WfBqY6qK/yjFpxpKdLvVALmnxfzoEzNi7DSRPj8M4I4RWReX7JfYX4zI
 CZcYuu710DgviveaK7+9g1NGd2zVavdmoizw2VWiWMLvU2rlUTh3Rp7QIsVuu7ckpM3i
 5I+fEqnx4T9645z8/uXabn3C9TpcyaGi79BexlFkQtq+fW6Ok1qcnKd29hZYA3FUuroz
 5wqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ux7WwgBmVw/vJ3sl2dviENLYf0GhlklJxjYn9aMfJVY=;
 b=dHn0ib2x43PvsFxX/TXMlRnUIXp4Da5BOzveUJnBpiFuKJw+pyQNKsH2AkVXwn/Bnb
 mkrDJVquB3xPP9gTq09xh7SpuhDfLT64xYaABq+GfaQlckRwzvhdtM9pySfRLNhU2piF
 u8SonVqIdFwA1dT3E7qt23U+P5j/TddBedxAiZlkNEksnlIS3w5tsC6n8C3XjydeFIRy
 R2R3C7ivTJLhXgV31utqYb307cSWfMK6UDHxkAI8zYCcD2FQ12ULCN7oX3SDgI+LlwG7
 5P0V4wFmOxw0qVoh58wGAldLiHRZP3RLhhhFX75Cnt6cOg20hPNJCMRqEfA6NsIT7Z9Y
 3PCQ==
X-Gm-Message-State: ACrzQf2QG1K69P8tFvrbh0Cu/RwmmtFyONaxYyWROX4N1tFQhRJTKgsQ
 YwKb7X4CWBc4iFRgu/n8k6a1DQ==
X-Google-Smtp-Source: AMsMyM68R3g7fTiEyr5eEta1HF9+f8Ke827M6/KMnSWrWM37DQtDisplUp59MOGkoQGSvoR1TJSQpw==
X-Received: by 2002:a05:600c:4f11:b0:3b4:bf6c:4566 with SMTP id
 l17-20020a05600c4f1100b003b4bf6c4566mr23176322wmq.34.1665488059904; 
 Tue, 11 Oct 2022 04:34:19 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 t15-20020a5d49cf000000b0022dc6e76bbdsm11252680wrs.46.2022.10.11.04.34.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Oct 2022 04:34:18 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D89101FFBC;
 Tue, 11 Oct 2022 12:34:17 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v1 4/4] configure: expose the direct container command
Date: Tue, 11 Oct 2022 12:34:17 +0100
Message-Id: <20221011113417.794841-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221011113417.794841-1-alex.bennee@linaro.org>
References: <20221011113417.794841-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
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
index 45ee6f4eb3..5484ed2568 100755
--- a/configure
+++ b/configure
@@ -1778,6 +1778,7 @@ fi
 # functions to probe cross compilers
 
 container="no"
+runc=""
 if test $use_containers = "yes"; then
     case $($python "$source_path"/tests/docker/docker.py probe) in
         *docker) container=docker ;;
@@ -1786,6 +1787,7 @@ if test $use_containers = "yes"; then
     esac
     if test "$container" != "no"; then
         docker_py="$python $source_path/tests/docker/docker.py --engine $container"
+        runc=$($python "$source_path"/tests/docker/docker.py probe)
     fi
 fi
 
@@ -2380,6 +2382,7 @@ fi
 
 if test "$container" != no; then
     echo "ENGINE=$container" >> $config_host_mak
+    echo "RUNC=$runc" >> $config_host_mak
 fi
 echo "ROMS=$roms" >> $config_host_mak
 echo "MAKE=$make" >> $config_host_mak
-- 
2.34.1


