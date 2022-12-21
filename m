Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6623653286
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 15:41:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p80Gq-0006vu-BU; Wed, 21 Dec 2022 09:40:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p80Gg-0006uw-2S
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 09:40:26 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p80Gd-0004tY-Dt
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 09:40:25 -0500
Received: by mail-wr1-x432.google.com with SMTP id h16so15109446wrz.12
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 06:40:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yvIEiOM5aA2Gy38HlTTKUCrD1y1F3I2eMO7xxM9fi9w=;
 b=V6P4LQMCGdMRc0UgENx46XBdjJPSa+2dvDDGUiRKS6+skBM1ghNyAt15oTHpIa2lXk
 Ytbcbddx85cu6b4iiaWvMAb9mAk8zygXR2CzmV/h/GNe05u3D9H35M19VV88C0eBwVf0
 9G/4XgQQz4h/VThyqITnC2yM9u6HgifXXdiuGJObN+WJ/SSAeKnJALiJVQDt6CGde6rn
 fyWBJ0b5iRI2jMaDkLLAOovlvKn3aqDRUbJ2SbveTQqIsJpFfqkedEg2j5PDTgCXhxgD
 PnJY01xdIXpF1iUloZ1b2gbvK3wdWCWuZzL/T+aBz+Tz89WmTOSW3nMsgI+Q43x+EGul
 YG1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yvIEiOM5aA2Gy38HlTTKUCrD1y1F3I2eMO7xxM9fi9w=;
 b=AOwX9XdkTFQHct0p3F6cSGeuMPZLgexMzOowRD0qQepLyJH2PtVsHuLopWVzfLwzU+
 nI6500VVhm/G2xCB6gxNFrmIKVFyYYI8ofj9tB//jGQvAGatzTUgwaumyx7gP3fir55H
 qZXdyHo5Sk72yszrSbwzGe0bEyqImTD58XhxAAPjfFuG1fXclmipEjuVk/VPsXCBJMWb
 9gHP934LDCudZ7HrBzR23UFA7kZaTE2yIYhl9cFNoMDyZidIh70o8DkeCc6Al2sLu3x1
 /UqOpw60FKAleqG4g6rCnasYu3AjCFv2IyyJHbdCyEl7z4WnbokoU90LAjs3HNPpoIfG
 2tVg==
X-Gm-Message-State: AFqh2krz67HhunnoboRGu11Hpqx7SoQza1m79vxwkWGwTqO4myTefAh8
 Qyq+FEaHfcaCB1KJqKa/tvNaZw==
X-Google-Smtp-Source: AMrXdXsncZnRH2r91Q0hePzmt4S5+C4FdnsnsPNcVDnJcl2BawpAhCyRNL86zWSaKD2uycVQuW1g1Q==
X-Received: by 2002:a5d:560b:0:b0:242:1ce8:c51c with SMTP id
 l11-20020a5d560b000000b002421ce8c51cmr1461740wrv.45.1671633621844; 
 Wed, 21 Dec 2022 06:40:21 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 u1-20020a5d6ac1000000b00241cfe6e286sm15436668wrw.98.2022.12.21.06.40.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 06:40:21 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id F416F1FFBA;
 Wed, 21 Dec 2022 14:40:19 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL 2/6] gitlab: turn off verbose logging for make check on custom
 runners
Date: Wed, 21 Dec 2022 14:40:15 +0000
Message-Id: <20221221144019.2149905-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221221144019.2149905-1-alex.bennee@linaro.org>
References: <20221221144019.2149905-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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

The verbosity adds a lot of unnecessary output to the CI logs which
end up getting truncated anyway. We can always extract information
from the meson test logs on a failure and for the custom runners its
generally easier to re-create failures anyway.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20221221090411.1995037-3-alex.bennee@linaro.org>

diff --git a/.gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml b/.gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml
index 0c835939db..fcaef9e5ef 100644
--- a/.gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml
+++ b/.gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml
@@ -19,9 +19,9 @@ ubuntu-20.04-s390x-all-linux-static:
  - ../configure --enable-debug --static --disable-system --disable-glusterfs --disable-libssh
    || { cat config.log meson-logs/meson-log.txt; exit 1; }
  - make --output-sync -j`nproc`
- - make --output-sync -j`nproc` check V=1
+ - make --output-sync -j`nproc` check
    || { cat meson-logs/testlog.txt; exit 1; } ;
- - make --output-sync -j`nproc` check-tcg V=1
+ - make --output-sync -j`nproc` check-tcg
    || { cat meson-logs/testlog.txt; exit 1; } ;
 
 ubuntu-20.04-s390x-all:
@@ -40,7 +40,7 @@ ubuntu-20.04-s390x-all:
  - ../configure --disable-libssh
    || { cat config.log meson-logs/meson-log.txt; exit 1; }
  - make --output-sync -j`nproc`
- - make --output-sync -j`nproc` check V=1
+ - make --output-sync -j`nproc` check
    || { cat meson-logs/testlog.txt; exit 1; } ;
 
 ubuntu-20.04-s390x-alldbg:
@@ -63,7 +63,7 @@ ubuntu-20.04-s390x-alldbg:
    || { cat config.log meson-logs/meson-log.txt; exit 1; }
  - make clean
  - make --output-sync -j`nproc`
- - make --output-sync -j`nproc` check V=1
+ - make --output-sync -j`nproc` check
    || { cat meson-logs/testlog.txt; exit 1; } ;
 
 ubuntu-20.04-s390x-clang:
@@ -85,7 +85,7 @@ ubuntu-20.04-s390x-clang:
  - ../configure --disable-libssh --cc=clang --cxx=clang++ --enable-sanitizers
    || { cat config.log meson-logs/meson-log.txt; exit 1; }
  - make --output-sync -j`nproc`
- - make --output-sync -j`nproc` check V=1
+ - make --output-sync -j`nproc` check
    || { cat meson-logs/testlog.txt; exit 1; } ;
 
 ubuntu-20.04-s390x-tci:
@@ -127,5 +127,5 @@ ubuntu-20.04-s390x-notcg:
  - ../configure --disable-libssh --disable-tcg
    || { cat config.log meson-logs/meson-log.txt; exit 1; }
  - make --output-sync -j`nproc`
- - make --output-sync -j`nproc` check V=1
+ - make --output-sync -j`nproc` check
    || { cat meson-logs/testlog.txt; exit 1; } ;
diff --git a/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch32.yml b/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch32.yml
index 1a2f9b8dbe..2c386fa3e9 100644
--- a/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch32.yml
+++ b/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch32.yml
@@ -21,5 +21,5 @@ ubuntu-22.04-aarch32-all:
  - ../configure --cross-prefix=arm-linux-gnueabihf-
    || { cat config.log meson-logs/meson-log.txt; exit 1; }
  - make --output-sync -j`nproc --ignore=40`
- - make --output-sync -j`nproc --ignore=40` check V=1
+ - make --output-sync -j`nproc --ignore=40` check
    || { cat meson-logs/testlog.txt; exit 1; } ;
diff --git a/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml b/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml
index ce0b18af6f..abeb33eaff 100644
--- a/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml
+++ b/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml
@@ -19,9 +19,9 @@ ubuntu-22.04-aarch64-all-linux-static:
  - ../configure --enable-debug --static --disable-system --disable-pie
    || { cat config.log meson-logs/meson-log.txt; exit 1; }
  - make --output-sync -j`nproc --ignore=40`
- - make --output-sync -j`nproc --ignore=40` check V=1
+ - make --output-sync -j`nproc --ignore=40` check
    || { cat meson-logs/testlog.txt; exit 1; } ;
- - make --output-sync -j`nproc --ignore=40` check-tcg V=1
+ - make --output-sync -j`nproc --ignore=40` check-tcg
    || { cat meson-logs/testlog.txt; exit 1; } ;
 
 ubuntu-22.04-aarch64-all:
@@ -43,7 +43,7 @@ ubuntu-22.04-aarch64-all:
  - ../configure
    || { cat config.log meson-logs/meson-log.txt; exit 1; }
  - make --output-sync -j`nproc --ignore=40`
- - make --output-sync -j`nproc --ignore=40` check V=1
+ - make --output-sync -j`nproc --ignore=40` check
    || { cat meson-logs/testlog.txt; exit 1; } ;
 
 ubuntu-22.04-aarch64-alldbg:
@@ -62,7 +62,7 @@ ubuntu-22.04-aarch64-alldbg:
    || { cat config.log meson-logs/meson-log.txt; exit 1; }
  - make clean
  - make --output-sync -j`nproc --ignore=40`
- - make --output-sync -j`nproc --ignore=40` check V=1
+ - make --output-sync -j`nproc --ignore=40` check
    || { cat meson-logs/testlog.txt; exit 1; } ;
 
 ubuntu-22.04-aarch64-clang:
@@ -84,7 +84,7 @@ ubuntu-22.04-aarch64-clang:
  - ../configure --disable-libssh --cc=clang-10 --cxx=clang++-10 --enable-sanitizers
    || { cat config.log meson-logs/meson-log.txt; exit 1; }
  - make --output-sync -j`nproc --ignore=40`
- - make --output-sync -j`nproc --ignore=40` check V=1
+ - make --output-sync -j`nproc --ignore=40` check
    || { cat meson-logs/testlog.txt; exit 1; } ;
 
 ubuntu-22.04-aarch64-tci:
@@ -126,5 +126,5 @@ ubuntu-22.04-aarch64-notcg:
  - ../configure --disable-tcg
    || { cat config.log meson-logs/meson-log.txt; exit 1; }
  - make --output-sync -j`nproc --ignore=40`
- - make --output-sync -j`nproc --ignore=40` check V=1
+ - make --output-sync -j`nproc --ignore=40` check
    || { cat meson-logs/testlog.txt; exit 1; } ;
-- 
2.34.1


