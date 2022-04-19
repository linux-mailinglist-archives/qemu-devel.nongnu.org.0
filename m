Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D9C50685C
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 12:08:40 +0200 (CEST)
Received: from localhost ([::1]:49928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngkmh-0003mQ-Mw
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 06:08:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ngk1b-0007Tg-TU
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 05:19:56 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:46036)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ngk1a-0001QR-AX
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 05:19:55 -0400
Received: by mail-ed1-x531.google.com with SMTP id v15so20381678edb.12
 for <qemu-devel@nongnu.org>; Tue, 19 Apr 2022 02:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sBtq6aJsF5JQPiNLvSzhAK+KB6fcDDkK9xa86DslMw4=;
 b=PmYxSlf5fcVkiRf+IzLBpy6ZA1yFg5HyKXOmetIUpei6K0Hpv3J/FbkRGAhx/qYN2r
 8hWTwwgsNPyDGGxN2LoQxO4u//j6J0OGy56jzsUKumDRMHoFIrIto1pbdxNkXSG0TAj8
 JyWx23+hlfJt8sxCBEKCdD8SjLOq06K4XKsh5Xt+9iJ5zuyRLW5j06PeX5Z811+H7KYj
 a1uGtR8BKMlsxFX3lj0g3leO4DxQWCxiXyVsABnILP4eptMxYJSXIkGldqznVoAKHfmc
 b62SrTtfplKswg4dijFUll8gL9HWKAvLQAfKx7z1LIAcyLkdh/oGQx51PTDLKTud52V5
 +OFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sBtq6aJsF5JQPiNLvSzhAK+KB6fcDDkK9xa86DslMw4=;
 b=6Lpm5G+aJAexeufl9O3gtgt6SIfBTj6vixgbzxZHhNc+XagJqvk/09+477d8g3r7n9
 c7QocTtMpgEkqUxGm3er6S1zh3BQjyivLGaQaVDj9rGufD1IjV72kAEdENF2yE4MNH6J
 Czg2GXLK24DJsiDijuw9xLocoQ+kdUGWxMQxok11sBKK9nFIc6/0+jh5L7FnrgakXlMT
 mnxwTaJdvmBIqpTyblY6pIZ4wTjRIYAI0Aglj9eIXZwvZobosG1ayFBkyEtu1eWrl0/u
 l9eGyh6PJTPsRZtCG71GtjXIxrMhPkOyigORpc773TD036PF5ilOxI8Vq6+5maj+ljoO
 s5Rw==
X-Gm-Message-State: AOAM533P7aY4nqF6atFxwNJ9ESYX/sXqxvcMq1RGII5tNff9T24ULT2F
 F62KmSgKHWvzaH+qcjb8uNnaeA==
X-Google-Smtp-Source: ABdhPJyh1bg8u32vXjagA35qA50KxymaFHeaRp8zJ6+6fehBQv0JrlLshIW47/gpmZSd8XpZeXATfg==
X-Received: by 2002:a05:6402:1941:b0:413:2b80:b245 with SMTP id
 f1-20020a056402194100b004132b80b245mr16675278edz.252.1650359992985; 
 Tue, 19 Apr 2022 02:19:52 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 o22-20020a170906289600b006e44a0c1105sm5432858ejd.46.2022.04.19.02.19.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 02:19:49 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C99651FFD0;
 Tue, 19 Apr 2022 10:10:22 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 25/25] tests/guest-debug: better handle gdb crashes
Date: Tue, 19 Apr 2022 10:10:20 +0100
Message-Id: <20220419091020.3008144-26-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220419091020.3008144-1-alex.bennee@linaro.org>
References: <20220419091020.3008144-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x531.google.com
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
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 Gautam Agrawal <gautamnagrawal@gmail.com>, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There are a number of GDB's on various distros which fail fairly hard
when attempting to talk to a cross-arch guest. The previous attempt to
catch this was incorrect as the shell will deliver signals as 128+n.
Fix the detection and while we are it improve the logging we dump into
the test output.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reported-by: Gautam Agrawal <gautamnagrawal@gmail.com>
---
 tests/guest-debug/run-test.py | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/tests/guest-debug/run-test.py b/tests/guest-debug/run-test.py
index 2e58795a10..d865e46ecd 100755
--- a/tests/guest-debug/run-test.py
+++ b/tests/guest-debug/run-test.py
@@ -92,17 +92,18 @@ def log(output, msg):
 
     result = subprocess.call(gdb_cmd, shell=True, stdout=output)
 
-    # A negative result is the result of an internal gdb failure like
-    # a crash. We force a return of 0 so we don't fail the test on
+    # A result of greater than 128 indicates a fatal signal (likely a
+    # crash due to gdb internal failure). That's a problem for GDB and
+    # not the test so we force a return of 0 so we don't fail the test on
     # account of broken external tools.
-    if result < 0:
-        print("GDB crashed? SKIPPING")
+    if result > 128:
+        log(output, "GDB crashed? (%d, %d) SKIPPING" % (result, result - 128))
         exit(0)
 
     try:
         inferior.wait(2)
     except subprocess.TimeoutExpired:
-        print("GDB never connected? Killed guest")
+        log(output, "GDB never connected? Killed guest")
         inferior.kill()
 
     exit(result)
-- 
2.30.2


