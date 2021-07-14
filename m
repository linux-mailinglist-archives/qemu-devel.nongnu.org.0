Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5376B3C86A6
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 17:09:52 +0200 (CEST)
Received: from localhost ([::1]:45166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3gWF-00012m-CI
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 11:09:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3gNi-0007M4-1T
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 11:01:03 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:33602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3gNe-0007a3-0B
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 11:01:01 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 g8-20020a1c9d080000b02901f13dd1672aso3614804wme.0
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 08:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Gya0rhZdDHpqfN5h59vk9zddDbflAcf+45r7VgBsyyE=;
 b=TzheEzITjchtbCE5o49Ofy9YcG/tSiW8wyLlGvT8MiFC8C1IDwBYb1uuPZwVb0SVSb
 a7JBLqgIWk1Zr2W+S5QX5sCnSyVdWxGrSRQ4cd6V0wqumh4fdY5KVU7N2SnUG+9bz7FJ
 SNIPo4JjJJyw2/Ui8UZKxMDU4t91SPPpeEGP173/FT0Jaoeet2QDwV6TXbmaiZT6UGLG
 l2IT1L+PhbgXPk4pZNw7U8cc8ObT192zSl7kw+sjtopt7R+VCJefhttOS2jLthlvM+uG
 VDQLYJnnqnZpbNMkN1X/IBViEBawk2jiFl98m65zmqBxtyZzr363bhtIO+1ZDk6n+msw
 Wsxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Gya0rhZdDHpqfN5h59vk9zddDbflAcf+45r7VgBsyyE=;
 b=jq2+9GZmJMTbwErBCuMaHVECUyem8HKwl4zW17fZQ2Sp0Ca5eu/bWGMXK8d7ww/ddX
 u++Hqe6KEohfNo+x5DsdmdwHVYwOI3THmMl/ej91/oDQ+ecflGc0+rwfn+bMj4mPmZ1U
 adUz6wLfAr2uSOwIIM/Ak2BLLpitgS5fwpsRvmCe9IGWVg6Dxhcgj0SNDGws/znAPawa
 AjDL95fuZwgITMyA5+AJKjSwFai4w0b2F5kdwKN22aEQqqiQu0RoikkOxeSZR92GTIFU
 A9kxeccfC/7G8tIrcDVCTLSVegFPt2sApVQFqR6nOLPjBweLaGPc1nvng7pjHn9AhnS2
 ylOQ==
X-Gm-Message-State: AOAM532gvbAS6u43fVjbfsvyHym5ZCQE4RhDqUeSBpzar07THTEvNFen
 nVIILQnKI5IhGUV3SvFm1NCbAw==
X-Google-Smtp-Source: ABdhPJxJYjkjPUgYY9g64rwik4NkSgkBcRYBfRI7H6jaa+1q/otRuqSiBNNuyFyjDqpO+XQk4Q95wg==
X-Received: by 2002:a1c:a903:: with SMTP id s3mr4609535wme.58.1626274856203;
 Wed, 14 Jul 2021 08:00:56 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o3sm2904719wrw.56.2021.07.14.08.00.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 08:00:51 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BF9231FF99;
 Wed, 14 Jul 2021 16:00:37 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL v5 10/44] cirrus: delete FreeBSD and macOS jobs
Date: Wed, 14 Jul 2021 16:00:02 +0100
Message-Id: <20210714150036.21060-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210714150036.21060-1-alex.bennee@linaro.org>
References: <20210714150036.21060-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>,
 Ed Maste <emaste@freebsd.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

The builds for these two platforms can now be performed from GitLab CI
using cirrus-run.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-Id: <20210625172211.451010-4-berrange@redhat.com>
Message-Id: <20210709143005.1554-9-alex.bennee@linaro.org>

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


