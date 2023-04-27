Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 568F76F0898
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 17:46:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps3ob-0001wC-62; Thu, 27 Apr 2023 11:45:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ps3o7-0001ps-Bf
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 11:45:19 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ps3o4-0004lG-Sx
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 11:45:19 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3047ff3269aso3163123f8f.0
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 08:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682610315; x=1685202315;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4eCwi/pVbpdAUWwYQpZXmTPlZe0TlOgYAIJaukeqpyY=;
 b=ZlF4TOgx83J9HtkORK/uelak1qPhRe4gQGmQqatv24sS0cXegokAQYh5xWTFJYKpmt
 SBaJ20OEDG8npsWOXlhC5OTwiQcWYM/f8TKZXsPnAFY4hz2/ncEuLZ5HBy9vF2qTaBlW
 Shcs6Is0+RQK1vhGz8PDlvqo7/THvLPOQC5Stg/+2w5deLL7vQBQVEzoi5C++8Wih4MI
 lFJC5QcWio1+Z7HIVloLO+tpDWhIi3bSY1zL0YZ2wtOxv3VRXYK7vZeQV4c1XOJ49Pw/
 ecC2dUVYxkEMVZdHNBCtm0sqVMxS3fTYxNziQyVlxD1akxgI6g8faSg3+D+rri2AgxRJ
 no7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682610315; x=1685202315;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4eCwi/pVbpdAUWwYQpZXmTPlZe0TlOgYAIJaukeqpyY=;
 b=W4xVbMkv+wFo8BlwXUTnB+/SkEw6JjTVzEDchVzXz/ZGQj29WHCpMXzPZyo8xiE3aE
 Zl9V/qBhIvXKDJ3OuOF7ZiDnDqNWGDEdQSJ+HjPhecTiNy8Stz1VdlK/I2Pz1KSysrLE
 bcGybT80TTZx1WeTT9W5Er8ROKaWs6Tm3PHm4UWXkzxDl8YLg9S2UOKx1gYZcOp6wJRn
 3ps/tU7T2qzBjPPOjQFXdfhXRlEH+toXnnupka2Piy6uHtEh+05ylveSyMwVQTkdZHZ0
 tg9HdXJbC83hx41oJvjtUIJfmuRfl07voBmHSIuu63XUI+RG9XYKV4Jpn1ef8kPvpAkP
 N2+g==
X-Gm-Message-State: AC+VfDzqhfEsGBzS5V/E71HWgI7LUQC18FLlsCpreTcdvjq0eTHG6qDB
 aqQiFzoyy7raSaBzyZNCwAR5bwAW4c6IBj6aT+I=
X-Google-Smtp-Source: ACHHUZ559p2Kpka0YRynLIBRv54qA7IOlaP6n4U5C6j5LZvUUGrOwSPwa0JTDnUER088oEx/chOg7Q==
X-Received: by 2002:a5d:4008:0:b0:301:3179:f94 with SMTP id
 n8-20020a5d4008000000b0030131790f94mr1616240wrp.5.1682610315312; 
 Thu, 27 Apr 2023 08:45:15 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 z16-20020a5d4410000000b002fb0c5a0458sm18841221wrq.91.2023.04.27.08.45.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Apr 2023 08:45:12 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3A7C81FFBD;
 Thu, 27 Apr 2023 16:45:11 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, Thomas Huth <thuth@redhat.com>,
 Eldon Stegall <eldon-qemu@eldondev.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL 05/18] scripts/device-crash-test: Add a parameter to run with
 TCG only
Date: Thu, 27 Apr 2023 16:44:57 +0100
Message-Id: <20230427154510.1791273-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230427154510.1791273-1-alex.bennee@linaro.org>
References: <20230427154510.1791273-1-alex.bennee@linaro.org>
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
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230414145845.456145-3-thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20230424092249.58552-6-alex.bennee@linaro.org>

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


