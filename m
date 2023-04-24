Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA906EC8CE
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 11:25:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqsQ3-0007QX-4H; Mon, 24 Apr 2023 05:23:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pqsPa-0007EK-4P
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 05:23:06 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pqsPP-0004m6-AZ
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 05:23:05 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3f19323259dso30657995e9.3
 for <qemu-devel@nongnu.org>; Mon, 24 Apr 2023 02:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682328173; x=1684920173;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o5kSB6Tp7rwswMBs6F95VrSi+MAlNKbqKile7T4KtUU=;
 b=qvVYWTEbTzMEbCUcUjyONZj5qjdX0zEBYSBlq85WgcFEp0yzzwxl+6MkLmDrUkOEnG
 4Kej8f+Ktq24ncfu4XXVQgFLxDZuKidvxXB4ge+WjpLrd2x/Pb4hsHcUm3u78crtV/9A
 FWki+lMM3g7WZkLaeTnjpQ1gIWJ32OvrROD4tSJoL5imremLKx+4HkRx4cEd1rs3pJ6l
 rmZ9kluhnIx/oXn0/OfvSV/0PQTeL5veuORn4kxOu4lIsML4SOmotQqwIfMENO3FPKj2
 JkKAZw6oR00rjGggHbAYg0ppJcIdS91dZJbi11+OFqyj23XXKYx/gIvyIFF+JrmJ9BCt
 TAXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682328173; x=1684920173;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o5kSB6Tp7rwswMBs6F95VrSi+MAlNKbqKile7T4KtUU=;
 b=FFMMuZK2dM22iiaSZOjHBIQwcZNXk+aCUF9Z5ptu/X6+lejYnHOcftyFP4YQZC994Q
 zaiVxhl4iGNjzrP1GG0gf0//FNj31gPA0aI/RQAMtGVGHhCH2iIVfYhPacjqJHsfPGwj
 ttlxsk0CZ/sDUkr/EyDb0O9q0DSvzd8QMrrPG+YSZMth9LqQWT4PwciHPWcPHNhjpyzT
 JoFTwzaebAdppAPa3IC7Nw8aWhpjiWKnA8k+9F4x1FhCPidWgtxaSvKfcuH1cgs9Ey2J
 EzqY3EPpcxfPqnA4qxu07ol+ki1AWy/+jfXlBCFjkkWeRz4NC4Ir5/gmo6Uf6o5fJLHj
 IRiQ==
X-Gm-Message-State: AAQBX9fYXcy5Lfwxrdvp/Ih1oZnYl/IqkhnyBm70JcQtvAo5OKm8i9BF
 JEQTNcDVvZRcGCyJasw5RxUz2Q==
X-Google-Smtp-Source: AKy350YVausBhTOIL7CjFInMtQTPh2fj7bI2mo9SaAOPZHUN6wTrBjwHy/Sp2ut50E8gKmLTWgZX5A==
X-Received: by 2002:a05:600c:2214:b0:3f1:98bd:acec with SMTP id
 z20-20020a05600c221400b003f198bdacecmr4564123wml.11.1682328173551; 
 Mon, 24 Apr 2023 02:22:53 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 p10-20020a5d48ca000000b003047dc162f7sm1094226wrs.67.2023.04.24.02.22.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Apr 2023 02:22:52 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0CBC91FFBD;
 Mon, 24 Apr 2023 10:22:50 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Leif Lindholm <quic_llindhol@quicinc.com>,
 Markus Armbruster <armbru@redhat.com>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 John Snow <jsnow@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 David Hildenbrand <david@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-s390x@nongnu.org,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-arm@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Eldon Stegall <eldon-qemu@eldondev.com>
Subject: [PATCH 05/18] scripts/device-crash-test: Add a parameter to run with
 TCG only
Date: Mon, 24 Apr 2023 10:22:36 +0100
Message-Id: <20230424092249.58552-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230424092249.58552-1-alex.bennee@linaro.org>
References: <20230424092249.58552-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230417134321.3627231-6-alex.bennee@linaro.org>
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


