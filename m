Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB74E6A5F8B
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 20:21:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX5Wp-0007OY-Dn; Tue, 28 Feb 2023 14:20:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pX5Wn-0007Nw-Db
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 14:20:45 -0500
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pX5Wk-00062H-VT
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 14:20:44 -0500
Received: by mail-lf1-x133.google.com with SMTP id m7so14607099lfj.8
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 11:20:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xt3eb+HaT4XEXo3IRutOvZXV+aViTUge+mDFXoTsYYE=;
 b=gWHn1qkCdict7Yi1ZCiJP3IL2ctfQg7WD8LgjS4GduS3XxFab5s67Qr/zse4q6a7Rl
 33mrW/cdm655PmGp/GJwDfCLUWiZidw1xTztgpWt9mjyXG5vL9ZhrZAAzidGEY+7oISR
 ixNXsIJwQZQdZEPRpdEg1M6ql5+384SyAPYxdkHgyglSQtHJ5ZM8QB+tDhR/M/h56Qcr
 K9HYXNSyItRt9bpfjY9EX90tOArMu0rEPjHB5Zp4HC6mY5HoM3ttix23FhCG3wzd3m8T
 8fdHjKfWF93SfuSdvlCxLFHxb+IUumsRu1x41/Rv8ucbHYJKeVcha3toJoH91fE7Ak/8
 koSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xt3eb+HaT4XEXo3IRutOvZXV+aViTUge+mDFXoTsYYE=;
 b=A5BeQOJPDkyQn5JagoogiBNTERY0F4qtlVW/HLOYNN50rNujl/91ZvAT3FSydYwLCu
 TMuAul8phCpd6x24a6XthV+LlnuB5RWVJE40+sAU0W8wmpRFP+mMbOiVLrfagnaZo7ZJ
 BCZ+4cRFZ+V513lN49hKAVthh9LhIKG2v9lHfuqm0bkNQtGSI5iZmnyjHRauNA3eDaLs
 ARr2QP7+8LIoRyiFV8/bivUMBEu+eXHA1gbz9isxRjj0HlYKDRiSY6EVbrcYL3srv6lZ
 4VREVpgel7XNIYRkEeci22VSxUbajy/vi0XIB/cRktQ0HpIVobMNRuu4aL0sDa56byM7
 wMlw==
X-Gm-Message-State: AO0yUKUlYikQfp7+w0ozajT6utfX5U1/trkhxhkw5ji86O2zd7uh5z0g
 T0e8TBRMfOWtGfzfuUkyZicOQVUVQqcdzmyP
X-Google-Smtp-Source: AK7set/oBx781GxbSKOPm2Y0QTd3XZGD2Ky5hXuJ/x22qkuo35jdPT7V5bvsAVbEXPIIauHReD2Isw==
X-Received: by 2002:a05:600c:358f:b0:3e9:9fc5:2c6d with SMTP id
 p15-20020a05600c358f00b003e99fc52c6dmr3149536wmq.14.1677611660616; 
 Tue, 28 Feb 2023 11:14:20 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 u4-20020adfed44000000b002c563b124basm10673883wro.103.2023.02.28.11.14.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 11:14:20 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 399FC1FFC6;
 Tue, 28 Feb 2023 19:06:55 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 Peter Maydell <peter.maydell@linaro.org>, Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Darren Kenny <darren.kenny@oracle.com>, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>,
 Ed Maste <emaste@freebsd.org>, qemu-arm@nongnu.org,
 Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 Yonggang Luo <luoyonggang@gmail.com>, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Bandan Das <bsd@redhat.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Laurent Vivier <lvivier@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PATCH v3 17/24] configure: expose the direct container command
Date: Tue, 28 Feb 2023 19:06:46 +0000
Message-Id: <20230228190653.1602033-18-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230228190653.1602033-1-alex.bennee@linaro.org>
References: <20230228190653.1602033-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::133;
 envelope-from=alex.bennee@linaro.org; helo=mail-lf1-x133.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
---
 configure | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/configure b/configure
index dccb5d4f96..1e36e05c37 100755
--- a/configure
+++ b/configure
@@ -1748,6 +1748,7 @@ fi
 # functions to probe cross compilers
 
 container="no"
+runc=""
 if test $use_containers = "yes" && (has "docker" || has "podman"); then
     case $($python "$source_path"/tests/docker/docker.py probe) in
         *docker) container=docker ;;
@@ -1756,6 +1757,7 @@ if test $use_containers = "yes" && (has "docker" || has "podman"); then
     esac
     if test "$container" != "no"; then
         docker_py="$python $source_path/tests/docker/docker.py --engine $container"
+        runc=$($python "$source_path"/tests/docker/docker.py probe)
     fi
 fi
 
@@ -2355,6 +2357,7 @@ fi
 
 if test "$container" != no; then
     echo "ENGINE=$container" >> $config_host_mak
+    echo "RUNC=$runc" >> $config_host_mak
 fi
 echo "ROMS=$roms" >> $config_host_mak
 echo "MAKE=$make" >> $config_host_mak
-- 
2.39.2


