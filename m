Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 640236A2131
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 19:10:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVcVF-00055C-Kx; Fri, 24 Feb 2023 13:09:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pVcVD-00053u-Lt
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 13:09:03 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pVcVA-0004ns-Nf
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 13:09:03 -0500
Received: by mail-wr1-x42d.google.com with SMTP id 6so4675wrb.11
 for <qemu-devel@nongnu.org>; Fri, 24 Feb 2023 10:09:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sWlMo82fjyi0DYAw1U4gGmbZ7Vz62HpgPG/tbr6QTr0=;
 b=nozBLWQXs6DSnx1BjgtmCkYxH5eCBy644EmdEqZ/sh9vdqK0Ft2g8dzFtVSB9zt7Gz
 8dhp9u9ZnskKeQ3PpSl3UXTZO77QF3lQdPPI0IiuO1+7+LYhPOsnXcj8SdmW2w+do/KH
 bOqgJs0+BoSmMAgXu4uk8lwRDLPRbG5yiTJjs5MMXuM8Snp1lyH02f67H0wmCgZ1awFR
 +l6wnC3qsBDvrVBtOiAFig9rTGcrMg4dU38O+9IuDK+j7CZKqyeEYGwbdlW1Yhglh0II
 GPdKf9GX51XmW4OFdCqyWBhJx2cf9533fPn6lCEL2nGsmnkzRAJap5uDDFIkXuMi/gAD
 J3Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sWlMo82fjyi0DYAw1U4gGmbZ7Vz62HpgPG/tbr6QTr0=;
 b=sj4PeCD3UjE0AZn5kLgeTIVM+4zaPiuUSSw1wEweczWh77F6VRRxHfkrgsciqr2yJo
 jKj6m2jYYNKp+oqf4L0lGjDrCughLya0C4D1OtjpVzgtSt1KlPeB3UwVKmo9gXRLZELY
 ucFZf6AU1WKamQuKpg4jslUKF/1ez64SIFdxoMobJ4ufb/OI/oGizeqpU/ky8gATXnrG
 sqVV8+0eWkgMmTQHYMiFtkplTP9JSny8S2j4PenSnjBw4qzefqwXDmIU2XFQ2zpzA48o
 s2nwzeNPiUBymtO0gX2k0vSDUq/h3QmTjKxTohFcpujE5NL4uQw4E+c+B65bgFcsUBqm
 5pCA==
X-Gm-Message-State: AO0yUKWs104r5mSCspni0WL1Au5J7fBfP0KXQ9iCAHRZ2bT0p73aV2da
 t8KxftesxTHivCD7wZAmF/ew8A==
X-Google-Smtp-Source: AK7set+Ip5eqF7XgLLdBFt+w4OBPLbazdnUO/8KkLjb7OsWqa5aMFPOmNp5JnLivc+Vf1+VG4Cn37Q==
X-Received: by 2002:a05:6000:1151:b0:2c7:d7e:4c6c with SMTP id
 d17-20020a056000115100b002c70d7e4c6cmr7647408wrx.44.1677262139311; 
 Fri, 24 Feb 2023 10:08:59 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 i16-20020adfefd0000000b002c552c6c8c2sm11391333wrp.87.2023.02.24.10.08.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 10:08:58 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B05E51FFB8;
 Fri, 24 Feb 2023 18:08:57 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Li-Wen Hsu <lwhsu@freebsd.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Beraldo Leal <bleal@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>,
 Ed Maste <emaste@freebsd.org>, Peter Maydell <peter.maydell@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-block@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Hanna Reitz <hreitz@redhat.com>,
 Bandan Das <bsd@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
Subject: [PATCH 1/7] configure: expose the direct container command
Date: Fri, 24 Feb 2023 18:08:51 +0000
Message-Id: <20230224180857.1050220-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230224180857.1050220-1-alex.bennee@linaro.org>
References: <20230224180857.1050220-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 configure | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/configure b/configure
index cf6db3d551..b6a1cebad9 100755
--- a/configure
+++ b/configure
@@ -1744,6 +1744,7 @@ fi
 # functions to probe cross compilers
 
 container="no"
+runc=""
 if test $use_containers = "yes" && (has "docker" || has "podman"); then
     case $($python "$source_path"/tests/docker/docker.py probe) in
         *docker) container=docker ;;
@@ -1752,6 +1753,7 @@ if test $use_containers = "yes" && (has "docker" || has "podman"); then
     esac
     if test "$container" != "no"; then
         docker_py="$python $source_path/tests/docker/docker.py --engine $container"
+        runc=$($python "$source_path"/tests/docker/docker.py probe)
     fi
 fi
 
@@ -2351,6 +2353,7 @@ fi
 
 if test "$container" != no; then
     echo "ENGINE=$container" >> $config_host_mak
+    echo "RUNC=$runc" >> $config_host_mak
 fi
 echo "ROMS=$roms" >> $config_host_mak
 echo "MAKE=$make" >> $config_host_mak
-- 
2.39.1


