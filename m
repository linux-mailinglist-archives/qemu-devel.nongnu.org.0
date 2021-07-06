Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 664F73BD987
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 17:08:49 +0200 (CEST)
Received: from localhost ([::1]:50740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0mgq-0008P5-6L
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 11:08:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0mX7-0004lD-Rd
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 10:58:45 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:52829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0mWt-00023q-Pu
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 10:58:45 -0400
Received: by mail-wm1-x32b.google.com with SMTP id g10so7937816wmh.2
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 07:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bTttEc+oJXhPYrt7q5iIhClUXDghFeYtwNO1q7NtVDA=;
 b=JCIQL7Snl+Ug+GZDN2TtwyuTPwWQ/as0P8NZlcpOeXaW5OXyd9HK0TqQl9GbNS+g5e
 isJA7ObpljUic7Vg5WgrzQLsE3BmJSs19Y5b3n2w1tV6JeB7JoVnpa9VGZVlmAXXFhS9
 IKrlT+aTCTHOJ47DcyIuIt6EDfbnjnopyOdjlQFUWL+lrKBdS8FdsMSxcLgTY9HtzCD4
 +q73qTi4IYUN1YGGp53AtoDd58OXyTbEMhC4WGl0EfiLN19FU/yAGQhewItT0Xcv+Zgp
 lzOB3uYB+2P8QhZonwgZLCJ3kqfNiyBl+Goa1jeEgUOwQq4+Pd7xBzk6P1lcbXpSc6P1
 TGkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bTttEc+oJXhPYrt7q5iIhClUXDghFeYtwNO1q7NtVDA=;
 b=feygw1cYUCoCIV3QZc6oMxbw0H+23tidIpr6kTjuw87vVT9B4mkuxcarQjobqJbIGP
 zQuMNkJj4WF9b56UVpucZ+2LGWphx5zdr2u9zR3D6dIB5OabaT7CZeO0sOvfSfs8PLdl
 u+BL6D/iHqj+0DpyiJv9Mc00Tnd7n/L4qQSxgRbAbiTM5JkgwgBdD2SA2df3fyuLT2TL
 G5VGjEQiFuOJkO+FhCKSj9+GWSrKq7XIPGc7uqGU9PVUO4b7iwklbGyCMCp7e4d40aNx
 xTF93tC4Nh6MprChUdTEW8CQ9Q1OAa7+LLppl3tMJ8/3zPyY1ilQ2xPYiOomnGj3gJ3O
 /8ug==
X-Gm-Message-State: AOAM533DUCxgA2PUL6e9yKIXyG8AvxWwhxUKHh5Ztvf7vwaRo7bVTwYz
 SDchwvCxHX9VgLSgSSExmSnaUw==
X-Google-Smtp-Source: ABdhPJyGQJKIYHStDEpAje1PLGzA5p+0ZjrjjfwM+8hbn8o0LU5QdQDel4BX7sJYuYymkoe1C6HLKw==
X-Received: by 2002:a05:600c:4f41:: with SMTP id
 m1mr20941645wmq.134.1625583507016; 
 Tue, 06 Jul 2021 07:58:27 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n41sm2959445wms.26.2021.07.06.07.58.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 07:58:21 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A3E231FF96;
 Tue,  6 Jul 2021 15:58:18 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 08/39] cirrus: delete FreeBSD and macOS jobs
Date: Tue,  6 Jul 2021 15:57:46 +0100
Message-Id: <20210706145817.24109-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210706145817.24109-1-alex.bennee@linaro.org>
References: <20210706145817.24109-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 f4bug@amsat.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Ed Maste <emaste@freebsd.org>,
 Yonggang Luo <luoyonggang@gmail.com>, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

The builds for these two platforms can now be performed from GitLab CI
using cirrus-run.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-Id: <20210625172211.451010-4-berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .cirrus.yml | 55 -----------------------------------------------------
 1 file changed, 55 deletions(-)

diff --git a/.cirrus.yml b/.cirrus.yml
index f4bf49b704..02c43a074a 100644
--- a/.cirrus.yml
+++ b/.cirrus.yml
@@ -1,61 +1,6 @@
 env:
   CIRRUS_CLONE_DEPTH: 1
 
-freebsd_12_task:
-  freebsd_instance:
-    image_family: freebsd-12-2
-    cpu: 8
-    memory: 8G
-  install_script:
-    - ASSUME_ALWAYS_YES=yes pkg bootstrap -f ;
-    - pkg install -y bash curl cyrus-sasl git glib gmake gnutls gsed
-          nettle perl5 pixman pkgconf png usbredir ninja
-  script:
-    - mkdir build
-    - cd build
-    # TODO: Enable gnutls again once FreeBSD's libtasn1 got fixed
-    # See: https://gitlab.com/gnutls/libtasn1/-/merge_requests/71
-    - ../configure --enable-werror --disable-gnutls
-      || { cat config.log meson-logs/meson-log.txt; exit 1; }
-    - gmake -j$(sysctl -n hw.ncpu)
-    - gmake -j$(sysctl -n hw.ncpu) check V=1
-
-macos_task:
-  osx_instance:
-    image: catalina-base
-  install_script:
-    - brew install pkg-config python gnu-sed glib pixman make sdl2 bash ninja
-  script:
-    - mkdir build
-    - cd build
-    - ../configure --python=/usr/local/bin/python3 --enable-werror
-                   --extra-cflags='-Wno-error=deprecated-declarations'
-                   || { cat config.log meson-logs/meson-log.txt; exit 1; }
-    - gmake -j$(sysctl -n hw.ncpu)
-    - gmake check-unit V=1
-    - gmake check-block V=1
-    - gmake check-qapi-schema V=1
-    - gmake check-softfloat V=1
-    - gmake check-qtest-x86_64 V=1
-
-macos_xcode_task:
-  osx_instance:
-    # this is an alias for the latest Xcode
-    image: catalina-xcode
-  install_script:
-    - brew install pkg-config gnu-sed glib pixman make sdl2 bash ninja
-  script:
-    - mkdir build
-    - cd build
-    - ../configure --extra-cflags='-Wno-error=deprecated-declarations' --enable-modules
-                   --enable-werror --cc=clang || { cat config.log meson-logs/meson-log.txt; exit 1; }
-    - gmake -j$(sysctl -n hw.ncpu)
-    - gmake check-unit V=1
-    - gmake check-block V=1
-    - gmake check-qapi-schema V=1
-    - gmake check-softfloat V=1
-    - gmake check-qtest-x86_64 V=1
-
 windows_msys2_task:
   timeout_in: 90m
   windows_container:
-- 
2.20.1


