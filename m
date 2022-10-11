Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4F15FB2AE
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 14:54:09 +0200 (CEST)
Received: from localhost ([::1]:48098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiEls-0005kU-DS
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 08:54:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oiDWg-0004da-N1
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 07:34:24 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:37574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oiDWf-0004Km-2T
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 07:34:22 -0400
Received: by mail-wr1-x42e.google.com with SMTP id bv10so17590215wrb.4
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 04:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kl2iN6rt6pDhvN8sLa5DXi2F/l3cWenxvR+M48fWHds=;
 b=L2QiUw/349Ofbj6mVq8J5nSj9R/mgvk4GCnBJGSV/4M6JfErbq/K8sMD7+3vSdFSxm
 urFrXfkrKQsbsaiV7+Gac5Uyc9Ycnjq661Cw5CEuLTd+i52THO7ZScJS6+r8cYJ2Rps3
 rdK3RQmc9eURIpscyO6Ai72P0hYGUM+W0J3LaXn+9r0Qa34DfV70lOkRI1MnGz5WT96c
 jsna22wgUZdR86OLD6oMGpujB/kiISTDUPv5gT9sUnjjFRQcbkpctRrCy3m01MDHuUkM
 RkN6lVdq9qH9Z1aZWiWsspEaib83rLYQdYPtRpd+TLbsZ17IGL1UEwn25WdozzB99RDL
 jzRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kl2iN6rt6pDhvN8sLa5DXi2F/l3cWenxvR+M48fWHds=;
 b=xAvEKZBv1budd7sI1lINbHcik8t/iTX5uTzzrMrj9CCmr+1emCq5+2YEDquCwgXNMY
 RqTNtJJdPXcxwUP92TzGUdzeloqQhE/gLrKGTF97fNZeffULyFKIwy4Xvxhs1gm5LXYk
 apUrtVj1umJppAhn/swwm5PXtz5+f1u0cddxggRit82sFoXDVNAw0nGTg3Ym98IybKPC
 tVoF9XBNn1EPMeo3XwJYVakNZAmmTPM+QyFyJxSkDJ21ka3fc7cOhbab49P8z0mwQlmx
 +ZZeQGqw58QP1Wh+zAAjj9GQpmic3I4/1NoRRZP38HqhDf4om+lyWHZCl6JoISOatFLL
 CYZQ==
X-Gm-Message-State: ACrzQf0lzrIrVFSO5W5y4FdhUTrtgJjZ8Tas87TXzFRnOG5yKt6ptUra
 uk8FwQ8BaVqjgUa8V5idi2C6nIn2rWAokA==
X-Google-Smtp-Source: AMsMyM4sBkGpj47e6WT9e/xWOR5cdA6oHSDHGYnxN6ZLOzV75nqOkIyPNQDqWmwAyEE/8ZJc7VVXrA==
X-Received: by 2002:a5d:47c5:0:b0:22e:6573:5621 with SMTP id
 o5-20020a5d47c5000000b0022e65735621mr14696570wrc.478.1665488059496; 
 Tue, 11 Oct 2022 04:34:19 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 m4-20020a05600c3b0400b003c6bd12ac27sm4336335wms.37.2022.10.11.04.34.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Oct 2022 04:34:18 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AD7581FFBA;
 Tue, 11 Oct 2022 12:34:17 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH  v1 2/4] tests/docker: update test-mingw to run single build
Date: Tue, 11 Oct 2022 12:34:15 +0100
Message-Id: <20221011113417.794841-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221011113417.794841-1-alex.bennee@linaro.org>
References: <20221011113417.794841-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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


