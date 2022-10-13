Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFFAD5FDDBE
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 17:56:38 +0200 (CEST)
Received: from localhost ([::1]:50980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oj0ZZ-00083W-Q4
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 11:56:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oj0QT-00064c-4h
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 11:47:13 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:52158)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oj0QR-0006o5-Ge
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 11:47:12 -0400
Received: by mail-wm1-x336.google.com with SMTP id n9so1473917wms.1
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 08:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P6ZlX/GdPaZ36NnknHeGOl5vJSXm8qxKKINm9d0mPmI=;
 b=Z6WULl9AFe4ASz3r5PaQdZFW8HReFlJWJ8xQwDSA16kmE24SDSZmL3bea+VJBFacU7
 vpAfTHedUwjOpQGwSUdLCvy805iX8SItOy/FWMb8LlGT3n36xED/CY1rCxIC7qGXJWob
 u2LyKK8jvIw0yTIeRIsdbI/Q/ekt8iZuqw6/RDDZCps9u7HpxVWr7RClTq6RU4n4P0KR
 lHeH6ZhDzYlLkEq9FOMZbnpK6B9bY7ztvx+dvUCzT70GSMYyDwDtrQKSD3Q7tZ+Z3OUB
 X+tf+cBMLb1OF/AvVPVDEC+HFHWdYCiZariJjTcCqGkk6QcU7adv6SQFZjVsj6T+zzhi
 CUIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P6ZlX/GdPaZ36NnknHeGOl5vJSXm8qxKKINm9d0mPmI=;
 b=1Mp6kQF2uGgVLkzdSt6vzM5sEEv1hQH6XdTMQ3tkc44RyEnaFFIEpY6vrElFnJf+5x
 CK1IJKjsr3r8NTzrW+IZYL/Ekx16rGdt1+azjAdLpA5mpJd4N1BTwylew1vl6kbiS3La
 cWQnazhMkDpyJgjeu5xJ5FNpoZjKkMJJstO/r2RB4FP1Fbnx24iixT1DwxuUANfoHB7V
 StQLxlfvL7YQ7TemGHfwbGpCxPF5HcTSCVWLzbguYbq8xKE8Bsv8sGRx1STSuC7wooWS
 wIqC6sYHZHOQfTdRi+Ka2wo8fzIHyzHaJ+mi/3dApW24K+FxPMltxn7kdDfbkwBswX4k
 f41Q==
X-Gm-Message-State: ACrzQf0xPghfCb5nFnTcQ1xp2TTCLTdSGYbJQc1GhN3X0NqW5Ko0lkKC
 Qd8dLNuT6s8LVHRfxZ5KrR6qgg==
X-Google-Smtp-Source: AMsMyM5Jju30YXt5bZYA8mCsgEYIdPFL9AHucrVL1NoBMKKRmF0oTgmVdLr4huKWbUAKxziXuYZ+0w==
X-Received: by 2002:a05:600c:15cc:b0:3c6:6ff5:21b8 with SMTP id
 v12-20020a05600c15cc00b003c66ff521b8mr309407wmf.55.1665676030139; 
 Thu, 13 Oct 2022 08:47:10 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 g17-20020a05600c4ed100b003b4ac05a8a4sm6513678wmq.27.2022.10.13.08.47.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 08:47:07 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 20E191FFBB;
 Thu, 13 Oct 2022 16:47:06 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH  v2 3/7] tests/docker: Add flex/bison to `debian-all-test`
Date: Thu, 13 Oct 2022 16:47:01 +0100
Message-Id: <20221013154705.1846261-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221013154705.1846261-1-alex.bennee@linaro.org>
References: <20221013154705.1846261-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
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

From: Anton Johansson <anjo@rev.ng>

Adds flex/bison to the debian-all-test-cross container which was missed
in the previous CI patch. These dependencies are required by the
idef-parser patchset for target/hexagon.

Signed-off-by: Anton Johansson <anjo@rev.ng>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20221011173229.57909-1-anjo@rev.ng>
---
 tests/docker/dockerfiles/debian-all-test-cross.docker | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/docker/dockerfiles/debian-all-test-cross.docker b/tests/docker/dockerfiles/debian-all-test-cross.docker
index 2beb077fb4..8dc5e1b5de 100644
--- a/tests/docker/dockerfiles/debian-all-test-cross.docker
+++ b/tests/docker/dockerfiles/debian-all-test-cross.docker
@@ -20,8 +20,10 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
 # Add extra build tools and as many cross compilers as we can for testing
 RUN DEBIAN_FRONTEND=noninteractive eatmydata \
         apt install -y --no-install-recommends \
+        bison \
         ccache \
         clang  \
+        flex \
         git \
         ninja-build \
         gcc-aarch64-linux-gnu \
-- 
2.34.1


