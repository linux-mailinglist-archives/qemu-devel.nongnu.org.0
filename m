Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ABAC508F9F
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 20:41:44 +0200 (CEST)
Received: from localhost ([::1]:36434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhFGp-0007xz-Nn
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 14:41:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nhEqp-0008Gx-H1
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:14:53 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:40476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nhEqm-0002KY-Os
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:14:50 -0400
Received: by mail-wr1-x436.google.com with SMTP id q3so3380206wrj.7
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 11:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cgvFuRemyWeCyVz1dHvlNb6OyUDUe3PZXp55yAf80Y0=;
 b=vdU/N3nhWF/VAlil/sLIozhqyhPaQCU1mvk67YwM3jfr+EXUecx5qUH2F40KGd2T6k
 Uf2/CC8kMRh9gExuJHOGRDEYF840PAlRiTKnNxT8ROF4fbiGxEJJPgmXBOVHoeCPgmRB
 aQkYv9MD7Zt/TpaT1oK+owqhz9RaDlxN5QulcPXjvo+YFhoqFgx9v7fgyCwDhhdU9oWo
 l6YNjYATA5sohyevPdYftE8m9uFQs00M7A5SHq3nKloqrhnj+fS1ROginqMEyTW6su26
 KEonSGX1uIkVijCUTl5GR+1/+o21Bat78nZFuTbuTY42ok6OvOJQEl3SfRU/XALhUyzT
 4/Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cgvFuRemyWeCyVz1dHvlNb6OyUDUe3PZXp55yAf80Y0=;
 b=oBKFGR4VGSD+EqUvdG3kIKIxUG44ztzyIznxj9AkUPV/gIsdNWv2WBDGtW1L31nbSQ
 mACies9ACl9ScyG3gjLRtVd4oXiXcOTGpuO1m1zF/BaBQK4tmsxRpEIdEVMQ6PcaFjsd
 0ivmRhE1Fk1b+9uW+/rqKwV3bS0NxBR5BZoN2lg56UFeQ6Pd5WTNS0RQpTxAW7AyrX1D
 YVIn0esPJvKiTUWezlJUV2F9LYmyDpyBtflbUVB+gdkIZj/JoXxyogSRkpVdErUpSI2r
 5TAAlXBppOI2xMvLanHlZl8TGYlxZGs9o4qPezQCSFzJ/6KKQUihr2jBr9JRa2MmDk/w
 3HLg==
X-Gm-Message-State: AOAM533iXOlS9GjCbPmoieK0rsco2HSajkPhGLk0h40LChG+FZFNwnrJ
 3KRiH7fKzxmHRWiq1pqkQfk8IQ==
X-Google-Smtp-Source: ABdhPJyEbJ4CUPQLmwX57o6xIkQjJ5qnFeACx3xiV54N8fLwMSic57SarXsD7v+zoNs6HITxbopL4w==
X-Received: by 2002:a5d:64c8:0:b0:20a:b841:1b05 with SMTP id
 f8-20020a5d64c8000000b0020ab8411b05mr262060wri.619.1650478487398; 
 Wed, 20 Apr 2022 11:14:47 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 c10-20020a056000184a00b0020a85e7f22asm580769wri.26.2022.04.20.11.14.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 11:14:43 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A9C591FFD0;
 Wed, 20 Apr 2022 19:08:34 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Subject: [PULL 25/25] tests/guest-debug: better handle gdb crashes
Date: Wed, 20 Apr 2022 19:08:32 +0100
Message-Id: <20220420180832.3812543-26-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220420180832.3812543-1-alex.bennee@linaro.org>
References: <20220420180832.3812543-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, Gautam Agrawal <gautamnagrawal@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There are a number of GDB's on various distros which fail fairly hard
when attempting to talk to a cross-arch guest. The previous attempt to
catch this was incorrect as the shell will deliver signals as 128+n.
Fix the detection and while we are it improve the logging we dump into
the test output.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reported-by: Gautam Agrawal <gautamnagrawal@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220419091020.3008144-26-alex.bennee@linaro.org>

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


