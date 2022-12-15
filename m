Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F78464DD01
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 15:41:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5pPj-0000lO-62; Thu, 15 Dec 2022 09:40:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p5pPg-0000hv-W0
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 09:40:45 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p5pPe-0006oz-M3
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 09:40:44 -0500
Received: by mail-wr1-x429.google.com with SMTP id u12so3239187wrr.11
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 06:40:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=q1v+mS1S0qPwApoERfxlG/tPBuzwvTJiOTQfstRqbP0=;
 b=RkfG85rXAM4T1B8kVdiwvg1X8c/53Dx0WUHTAp7f1wPlifSjLf0Yu/3NL2icuBkV6i
 bbm7k2ftBtqZKCKuN1vRaszrS/sV+ZBCMHZUhbyfJpfk+kUSqtRYeiZbTDobqKcb5ioY
 RI2LkdRrPQ0JkdKwz83PTZ8tz0YaMPb28PMaOBgAsS5qrbkqa4R6TtwYJVVjbPFHF2rc
 xzOheiBTg4g0x3dE+HuS8sS0q++SqMjJMtngfi3cKxhvQyhjdvBGsFia5EOSn8+jnD4U
 7YthYuW/9V+j+w+sOqyktQuO6i2W3KhmXVwvmAQiYqHv40jU/MmHxCWFZeGsQ8fc2SYa
 UQFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=q1v+mS1S0qPwApoERfxlG/tPBuzwvTJiOTQfstRqbP0=;
 b=eig4mvWZAkgPZOmtzDmWr8IsDiH6o0ETuNnD4aQpDtyepcP6ube1Tk5mSlqPPPSk9W
 VoTGrIF1f6+j0vPrrgKcdGYSjenkaoQtmOKkTSLNQG0uwvPmEzXCVTlh0IQvDBnO4016
 5xxfRKWwIYD8RpF2I+O1jgQE689P1JESRucFEWQX+gxAi1RyBXpSSqA318/jlpZ8YNW5
 /cGRyQ/P+8HmarKzL8nKMctVk7TRR+LKaezrZ9B+lg3wcf0StbqS89zh7+X1IkCXRo5r
 BJDW/ahjnG9V/jmCVsFAO5mUeOjH8n7INEft0Xtn5hNiu4erCO3UfTcmUIg1s5a4iO/9
 /Yag==
X-Gm-Message-State: ANoB5pn32/zzdnq42nfWKgJQX4SCdcDoRamTv4hWgL6EHSruyGQwrkSP
 3FlKK1cn8BPTEgigOlxgMVvykg==
X-Google-Smtp-Source: AA0mqf6it9nZ0nLpjlb/Pak/bi5/52zfuEer0sziNM43jODZLsyHNDBkf8gaqJ64knf5h7ujx2thIw==
X-Received: by 2002:a05:6000:408c:b0:242:7560:e927 with SMTP id
 da12-20020a056000408c00b002427560e927mr19387051wrb.48.1671115240644; 
 Thu, 15 Dec 2022 06:40:40 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 u7-20020adfed47000000b002365254ea42sm6118182wro.1.2022.12.15.06.40.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Dec 2022 06:40:40 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CBE1E1FFB7;
 Thu, 15 Dec 2022 14:40:39 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [RFC PATCH] gitlab: turn off verbose logging for make check on custom
 runners
Date: Thu, 15 Dec 2022 14:40:35 +0000
Message-Id: <20221215144035.2364830-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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
---
 .gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml   | 12 ++++++------
 .gitlab-ci.d/custom-runners/ubuntu-22.04-aarch32.yml |  2 +-
 .gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml | 12 ++++++------
 3 files changed, 13 insertions(+), 13 deletions(-)

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


