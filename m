Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 476905FDD91
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 17:52:57 +0200 (CEST)
Received: from localhost ([::1]:45926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oj0Vz-0003BW-Qk
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 11:52:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oj0QS-00063o-HL
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 11:47:12 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:37717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oj0QQ-0006nl-LX
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 11:47:12 -0400
Received: by mail-wr1-x42b.google.com with SMTP id bv10so3486007wrb.4
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 08:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kl2iN6rt6pDhvN8sLa5DXi2F/l3cWenxvR+M48fWHds=;
 b=d/bIwp2NH0e7L25cYYMPk1M+6Zon07aZYTNi88pksnFD4306LIpL5KhGWyF9oGTjIq
 XovmDHpSK+xc76Z3QMv+WSFzyQhVpJJ3qDxTTL45t1tKpgh92/WFfFD6KKqg3KatdyBz
 xWKKJ7KlneAf4Jz4Rj0D3mvGqH8ZXMFzihxqPr9PW+FffHQQfKGTYu17ir6p1YmyNwOW
 5XEiC2JUvhjmrOc5c432mjuYPnmd2MYMRlKi+bnKgF1BTOIopiS4RCy+BOB9hzMbPuNW
 Op1n2qADQRyrctCkYJDzFzk4ZJiTL9l6/Tk6bAUQHpylhRHN+vS562LQSfS0bKc2kgNc
 feBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kl2iN6rt6pDhvN8sLa5DXi2F/l3cWenxvR+M48fWHds=;
 b=KMxQ5Ibyz+Bx8esjZaBdVec/wDDTJ6+h5jhYOMmlBYEWGkDAY6KeiF6BeGivDTSqjL
 ChTVSQwm5WHFCYiK2/stcKe3c4uLgJvFZ+PR2uKzbmj7xWUExBXQHnE4lWQlSjrmcWxO
 UNGYwnpH6lwCy0Thx04O/h6ZL4TJy0S5vW4uNtUyWkGHE8I9YjarYBBNi54k9b58uD8B
 t3/JCS0dNSAsN6ZkJujb4MYbvcExe4xJELRuOo5u5B+lJqjb9KgpvBt3E1FUH3XoHyHb
 ov/bWf2rtrz41fio6VCYJ78Q+x3W3AGDGKgFenzQQ48BR+eyHm2k+FH7iV+8Mu/lnFHQ
 D5Fw==
X-Gm-Message-State: ACrzQf28+fpfHgCupvd1r18IrV4BUMsD9UGvi7/lhX3gU9v3OdSHqKLD
 UoJU5F1L+YTvLa+0NNmxpbHIO7sUyRzTJg==
X-Google-Smtp-Source: AMsMyM6veteo8pzKG3UR327Ks+H5yt/TMoW9ptyrL1yrPn4gKV8EVEJAojRuvzT8/Egik3j/hXzuIw==
X-Received: by 2002:a5d:5942:0:b0:225:7425:4e39 with SMTP id
 e2-20020a5d5942000000b0022574254e39mr412839wri.566.1665676029156; 
 Thu, 13 Oct 2022 08:47:09 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 n13-20020a5d51cd000000b0022e47b57735sm2163521wrv.97.2022.10.13.08.47.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 08:47:07 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0A8991FFBA;
 Thu, 13 Oct 2022 16:47:06 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH  v2 2/7] tests/docker: update test-mingw to run single build
Date: Thu, 13 Oct 2022 16:47:00 +0100
Message-Id: <20221013154705.1846261-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221013154705.1846261-1-alex.bennee@linaro.org>
References: <20221013154705.1846261-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
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

While the test-build test happily run for mingw the test-mingw case
runs more of the packaging inline with what our CI does. It however
fails if we don't find both compilers and expects to be run on a
docker image with both.

Remove that distinction and make it work more like the other build
test scripts.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/test-mingw | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/tests/docker/test-mingw b/tests/docker/test-mingw
index 0bc6d78872..18366972eb 100755
--- a/tests/docker/test-mingw
+++ b/tests/docker/test-mingw
@@ -13,14 +13,12 @@
 
 . common.rc
 
-requires_binary x86_64-w64-mingw32-gcc
-requires_binary i686-w64-mingw32-gcc
+requires_binary x86_64-w64-mingw32-gcc i686-w64-mingw32-gcc
 
 cd "$BUILD_DIR"
 
-for prefix in x86_64-w64-mingw32- i686-w64-mingw32-; do
-    TARGET_LIST=${TARGET_LIST:-$DEF_TARGET_LIST} \
-        build_qemu --cross-prefix=$prefix \
+TARGET_LIST=${TARGET_LIST:-$DEF_TARGET_LIST} \
+build_qemu \
         --enable-trace-backends=simple \
         --enable-gnutls \
         --enable-nettle \
@@ -29,8 +27,6 @@ for prefix in x86_64-w64-mingw32- i686-w64-mingw32-; do
         --enable-bzip2 \
         --enable-guest-agent \
         --enable-docs
-    install_qemu
-    make installer
-    make clean
-
-done
+install_qemu
+make installer
+make clean
-- 
2.34.1


