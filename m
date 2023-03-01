Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DCC26A6F61
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 16:25:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXOJx-0000nc-4f; Wed, 01 Mar 2023 10:24:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pXOJi-0000bC-DQ
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 10:24:31 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pXOJd-000127-DG
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 10:24:29 -0500
Received: by mail-wm1-x335.google.com with SMTP id k37so8866160wms.0
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 07:24:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mkocC7TUPUcXj7ll+UawvcjBLr7Elh98/8Jity3e0Lo=;
 b=xACdqqHxQnILHAndgk8GRvdVp+IjQac3Hz8YUSo+1afLGVlYifP8tRysxJhGY6F36f
 eZHzwgJzLMYFOTMiVQgQYp/MLYMN22qYwUKHFjZlqNWHBl15daU+C3v1CjbLAkg0qKcm
 KKhJxZRxW7gnuns+P9hIeSgaZ1dz3RdEkGXvi4YpjagxPRWBNa1f0YnULbNbPWotY3kH
 tOqycUXimn+IXGPdB2DgWWX3peD0d2lJ65l8uBGOle7TZySrP9nkzWiuNKot39lb9PnA
 am+EV/ovmxkI4cUHH61bZuKAbmYfwSUdSengedWmH3EMy53A9L598q2BmhmK8a88dz9X
 pvqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mkocC7TUPUcXj7ll+UawvcjBLr7Elh98/8Jity3e0Lo=;
 b=KQJpK6syKN2GMAcNuiq3Aj4lVDmKU5XUHWBoxEJnNKzZRfoiI1539zzWvKn7Iybw8S
 B12oWLXDJkFp6WkghFeiEGTskLHlzrYSuzNys+PfvdoSYdPDne0kq+WCn/DVtAu7HmAV
 qD25yzIs3bjIjTLSVxuP+vzgw+dIv4QIXMYdhRd3JkXaWQ11E8ttx5pswND/KzCIu4s0
 SgHh+HU7BBm/usqbwPfIntE7KmlntTaRjc8Xg1OGNVg2zE9IzG+8Xz/1FdcsHwRliJGh
 AcTrdsP3m5K1crFh4hZdZMp5yEbappd764dTaDRx3XX/nShqZHGJ5n8Hw9LjrKWA2GKU
 oegA==
X-Gm-Message-State: AO0yUKUwsIDko5NRKOwRq9tCRhhHZlFj7pyEmc9anI7M9jGlVkISip01
 IaRXNuMr5ImV52cYMpOn7cj1tw==
X-Google-Smtp-Source: AK7set/5xWjApNj1k67zztDQBpdxc9N43woYu69SrnwIHoZdHxzAeEAfU2xSh4cmA1djbK0pPv3Hgg==
X-Received: by 2002:a05:600c:511c:b0:3e8:35a2:6abf with SMTP id
 o28-20020a05600c511c00b003e835a26abfmr4942024wms.23.1677684263949; 
 Wed, 01 Mar 2023 07:24:23 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 m34-20020a05600c3b2200b003df5be8987esm21926423wms.20.2023.03.01.07.24.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 07:24:23 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 74C601FFC7;
 Wed,  1 Mar 2023 15:16:06 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PULL v2 17/24] configure: expose the direct container command
Date: Wed,  1 Mar 2023 15:15:57 +0000
Message-Id: <20230301151604.1948813-18-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230301151604.1948813-1-alex.bennee@linaro.org>
References: <20230301151604.1948813-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

In the process of migrating away from using docker.py to build our
containers we need to expose the command to the build environment. The
script is still a useful way to probe which command works though.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20230228190653.1602033-18-alex.bennee@linaro.org>

diff --git a/configure b/configure
index 2a8a9be8a1..f5cfcd566e 100755
--- a/configure
+++ b/configure
@@ -1790,6 +1790,7 @@ fi
 # functions to probe cross compilers
 
 container="no"
+runc=""
 if test $use_containers = "yes" && (has "docker" || has "podman"); then
     case $($python "$source_path"/tests/docker/docker.py probe) in
         *docker) container=docker ;;
@@ -1798,6 +1799,7 @@ if test $use_containers = "yes" && (has "docker" || has "podman"); then
     esac
     if test "$container" != "no"; then
         docker_py="$python $source_path/tests/docker/docker.py --engine $container"
+        runc=$($python "$source_path"/tests/docker/docker.py probe)
     fi
 fi
 
@@ -2397,6 +2399,7 @@ fi
 
 if test "$container" != no; then
     echo "ENGINE=$container" >> $config_host_mak
+    echo "RUNC=$runc" >> $config_host_mak
 fi
 echo "ROMS=$roms" >> $config_host_mak
 echo "MAKE=$make" >> $config_host_mak
-- 
2.39.2


