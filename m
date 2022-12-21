Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B259652D64
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 08:44:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7tkt-00073M-HR; Wed, 21 Dec 2022 02:43:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p7tkf-0006zn-TE
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 02:42:58 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p7tkd-00048e-I9
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 02:42:57 -0500
Received: by mail-wm1-x32d.google.com with SMTP id m19so10529865wms.5
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 23:42:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uqWW7IL4wGNN919LQfSA7oklF6f1eaV5kpUPVgpB+s4=;
 b=HuJZh5dK8j0essCsioNrJeYfWyisMiuTp3lq7AOoQfSEOCSnhJLqlPsENknk9cP9BV
 Q4Rm+umhjOa+Z7CyUJ20MWdBWCNdd6SVr3jEb64KSdLV1ImJZnmY86qwNnJVCZfkmOci
 bkYi6SDNKe4wPwT7gGvHveRnCJ/ZahP0dSBPqnrVLF75W1WMYGDfcag7e8ZDMYeghT6y
 QmFNtwqg2MMxHWdtrn0fvd4WG+aoVNnlW3Gnz39iVQLhIb8PQ2SfVlAc8f+lDT1xM3Xd
 0ulWFkrPWvaDGNM7mNdqzl2S2d4+243M+Tt5tPSdc2Y2VhBPaRdA1H98glq9rphbKA4r
 gFTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uqWW7IL4wGNN919LQfSA7oklF6f1eaV5kpUPVgpB+s4=;
 b=LtoXxJe1wNgj9SV+Rwlv7gt5MQR4W7tMYExQpg/JdUaQK0YbTpTcqXwgebY8K/AGOd
 eMx7mODC5sjNxhZZr5Z3Kfp2vDyirBm6sl239hoHgBaffdeQDcMcCbNUJlXKOkEEZp/v
 2Vhlz3xv6esJ4UEdCzTsTX8kSF78L62atQHrr93sLYHQ71ZAnGPUF1X0d/Wp0RK0JHqq
 7QSDvuspp/g/Gz2nKFLs+6UW9ICoJHSnzHNBEtIJs2yCtUIJZFSGTgOHP1GJfCrwR4zl
 zoibXbSYToTorvSHsNoFpd/lZGPKQVqpG/R1rfM4mfXQpAUTV9NJ8EvSh9s5HKjLHt8X
 gKgg==
X-Gm-Message-State: AFqh2kqG4Sio22njXNfPR+bz6XalQPxiE+7B7MPGFpvJKS667GmN3s8p
 pCD1pStKu0zk958x3gxydHbOFw==
X-Google-Smtp-Source: AMrXdXuqKYGnEcEAzNCJZkFqlowbmY3ca79U9DagjoUVv8ssr9b24YWeqRbBTzEGD2QDB3ndMpnkGg==
X-Received: by 2002:a05:600c:4998:b0:3cf:68d3:3047 with SMTP id
 h24-20020a05600c499800b003cf68d33047mr783296wmp.41.1671608574250; 
 Tue, 20 Dec 2022 23:42:54 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 a7-20020a05600c348700b003cf6e1df4a8sm1327440wmq.15.2022.12.20.23.42.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Dec 2022 23:42:53 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 91F191FFBA;
 Wed, 21 Dec 2022 07:42:52 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Beraldo Leal <bleal@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, stefanha@redhat.com,
 crosa@redhat.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [[PATCH]--edit 2/6] gitlab: turn off verbose logging for make check
 on custom runners
Date: Wed, 21 Dec 2022 07:42:48 +0000
Message-Id: <20221221074252.1962896-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221221074252.1962896-1-alex.bennee@linaro.org>
References: <20221221074252.1962896-1-alex.bennee@linaro.org>
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The verbosity adds a lot of unnecessary output to the CI logs which
end up getting truncated anyway. We can always extract information
from the meson test logs on a failure and for the custom runners its
generally easier to re-create failures anyway.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20221215144035.2364830-1-alex.bennee@linaro.org>
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


