Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 242126E4A45
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Apr 2023 15:45:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poP91-0000zd-Py; Mon, 17 Apr 2023 09:43:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1poP8q-0000wd-2F
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 09:43:36 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1poP8o-0006Sd-FS
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 09:43:35 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 eo6-20020a05600c82c600b003ee5157346cso15535874wmb.1
 for <qemu-devel@nongnu.org>; Mon, 17 Apr 2023 06:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681739013; x=1684331013;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dLH2QEWQqVAIoLqiAtlECXbd5H/woEL07ZUKBkfOWGo=;
 b=cPEl514BRWuzxDA3zA/4qTrTpx+6O6YrMEBxuJas7TipS1z0koqMXgnN4IvjTFkFe9
 7CPptISlAq4xZ7P15AI5dfA72hYejyVZ7mmn8qiKBc6xd6X8pYHDT+J2iGRxzb5COJx4
 2Agu7xDoNPnNQEDPqAmO6VPTkqF2AHz2omInEKu7kM+8amzb8m9O72xB5O+B4NWv6hw4
 BYA5nPOZVbf8B8PlwrpdLqdZD4sV0olb9SloJhD5ba8GOOgLMQRYtaLg7LEB4zaJlFmx
 tvyPmQz+vN6Inw74T0n3Pl7MZ5OssvohtnD7qibjqv/vMRdmkhbJXj78D2L9LR2oEXwj
 EBzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681739013; x=1684331013;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dLH2QEWQqVAIoLqiAtlECXbd5H/woEL07ZUKBkfOWGo=;
 b=FRbo6JMV+lnfUsjVYtYyJLPauuynHqO853hxtkjvYrSjTlrOcY+jOkJsiKi/UkFqqk
 s8prS28leW3L91NG+nFj+w2Jcz6sBiEPQz5lsNNgcCvagcQavyUq5GF4An6GXRX5zUeU
 KkNFaQ7+qraDm82WY2htwsXcE6IXDWDRB+RtA1fn87rSm2JO9QajDI+KHcQZ+JWtpy/P
 jWGHculve2fsz5TGaR4PQMkZ8JU5aMGQfZeT6XrBambYqaY6y/t1tOWKKQumzAFIc2Vm
 Sy7PoVmfv7zQCupGZ/tZ7eYRUj5sdf+Tmahm5sYsSwuH6hmQ6CuopGjICSqtWd0cS7Yu
 bTuQ==
X-Gm-Message-State: AAQBX9eVwuU9HgaE5ypg+ZHjbpAjdCvgW6haX/nWpd3T0dRjAlF0LjVh
 8gu5foLV8Z4IShiYXpI8Bc9hjw==
X-Google-Smtp-Source: AKy350YmwT3uAKUoxDBGuSoQJJRNDvtCU6rnFZeHIHlpJIffc/5s/lRqWNBnknhEFsfIrBddozMcuA==
X-Received: by 2002:a7b:c4cd:0:b0:3f0:9a9d:4a0d with SMTP id
 g13-20020a7bc4cd000000b003f09a9d4a0dmr11504908wmk.21.1681739013135; 
 Mon, 17 Apr 2023 06:43:33 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 iv8-20020a05600c548800b003f09e294d5esm15588497wmb.6.2023.04.17.06.43.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Apr 2023 06:43:28 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5B3BD1FFBD;
 Mon, 17 Apr 2023 14:43:22 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Markus Armbruster <armbru@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Radoslaw Biernacki <rad@semihalf.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>, John Snow <jsnow@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org,
 Eldon Stegall <eldon-qemu@eldondev.com>
Subject: [PATCH v4 5/6] scripts/device-crash-test: Add a parameter to run with
 TCG only
Date: Mon, 17 Apr 2023 14:43:20 +0100
Message-Id: <20230417134321.3627231-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230417134321.3627231-1-alex.bennee@linaro.org>
References: <20230417134321.3627231-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Thomas Huth <thuth@redhat.com>

We're currently facing the problem that the device-crash-test script
runs twice as long in the CI when a runner supports KVM - which sometimes
results in a timeout of the CI job. To get a more deterministic runtime
here, add an option to the script that allows to run it with TCG only.

Reported-by: Eldon Stegall <eldon-qemu@eldondev.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20230414145845.456145-3-thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitlab-ci.d/buildtest.yml | 2 +-
 scripts/device-crash-test  | 4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index 333eea9dd3..bb3650a51c 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -103,7 +103,7 @@ crash-test-debian:
   script:
     - cd build
     - make NINJA=":" check-venv
-    - tests/venv/bin/python3 scripts/device-crash-test -q ./qemu-system-i386
+    - tests/venv/bin/python3 scripts/device-crash-test -q --tcg-only ./qemu-system-i386
 
 build-system-fedora:
   extends:
diff --git a/scripts/device-crash-test b/scripts/device-crash-test
index 73bcb98693..b74d887331 100755
--- a/scripts/device-crash-test
+++ b/scripts/device-crash-test
@@ -397,7 +397,7 @@ def binariesToTest(args, testcase):
 
 
 def accelsToTest(args, testcase):
-    if getBinaryInfo(args, testcase['binary']).kvm_available:
+    if getBinaryInfo(args, testcase['binary']).kvm_available and not args.tcg_only:
         yield 'kvm'
     yield 'tcg'
 
@@ -510,6 +510,8 @@ def main():
                         help="Full mode: test cases that are expected to fail")
     parser.add_argument('--strict', action='store_true', dest='strict',
                         help="Treat all warnings as fatal")
+    parser.add_argument('--tcg-only', action='store_true', dest='tcg_only',
+                        help="Only test with TCG accelerator")
     parser.add_argument('qemu', nargs='*', metavar='QEMU',
                         help='QEMU binary to run')
     args = parser.parse_args()
-- 
2.39.2


