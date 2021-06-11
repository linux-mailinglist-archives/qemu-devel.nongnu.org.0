Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E598D3A4B5B
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Jun 2021 01:44:22 +0200 (CEST)
Received: from localhost ([::1]:53072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrqp2-0005ot-Kf
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 19:44:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrqmb-0002CJ-3b
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 19:41:49 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:40457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrqmZ-0002Ww-7d
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 19:41:48 -0400
Received: by mail-pl1-x635.google.com with SMTP id e7so3597130plj.7
 for <qemu-devel@nongnu.org>; Fri, 11 Jun 2021 16:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5uMDnDezH8ov3NNnW0R3HVYll0BfUqU9E5lc10lEDLE=;
 b=b6WPe+KTdqsJPklkzvOPNM3pYY0KxQJgFZiXbbtRZYiY6tpIahZlG7PP97FDeQPZfh
 P9ifPm0cacZyRlvzddG4rO3PK4wRniIg2tkGyXblGneLzEU1k223fpBmEOdQz7CsNqzR
 tojyhupRXNcBPpKGQfD+Gh/RCcKbGFxuENl7N7Zl4/poVopW2gOqjt/YfTL89lCz3aeB
 a/cuhUNezVDpcK2/RBduNqceu2zKT4LWP7VHtXfUB8ZPFA9ivhwYRoea8u3XS5r3WYtq
 zWshI3W5lSPjIqhGpQNNqvlnZe/BQqWyrJN8DHWd/hqy5RksxPnxPsz7a79LP+oZRkG0
 1LLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5uMDnDezH8ov3NNnW0R3HVYll0BfUqU9E5lc10lEDLE=;
 b=e2ZZiLVhjKNUd1uPxl5aTKfqlli9X3RiAFYxGqpNr1RXZggjRwwku9a5gRqQCYeltr
 ejBvD7hFUHK1CAP/CpS9a7Rvw4AcUx4VE8BiU57EaOpeF1z/awjaY8wkQvtTKkiyPcPn
 y2F2SX8FtbOtcaZs/zt5VhEVC1FVfGMs+W3LdD4XUJmv7gzeCZKEaQfd0RBax9S7W5qq
 iOxLXO1C2ZD4zDTE+8oR3iHDwUbXIsSV+pF9Lr8APw9OvYolRJHfOq8bCMSzz12uJctr
 Wz0KE42LYp+8PBFJMAWpPc4CQbzBcV2aAvFWkd6bH4/O8qRs2fWQH3d0ex8u4vsmR2Zr
 qojg==
X-Gm-Message-State: AOAM531Y7AbztgiaIbO24L7LSAw/v2m2qwRokygCsR9DRxEEjG7PRd6N
 Ody9G61gzdaVzPYi+A1bSyilvQxeuZPjpQ==
X-Google-Smtp-Source: ABdhPJwv5w+qju1lbPjYaG1T5O86JQlO1HonObrBbI21o0UkBqb9amBxwSvM1Euv/Mi2x8CzuGpX9w==
X-Received: by 2002:a17:90a:d590:: with SMTP id
 v16mr6737382pju.205.1623454905921; 
 Fri, 11 Jun 2021 16:41:45 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id q23sm6139829pgm.31.2021.06.11.16.41.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 16:41:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 01/34] meson: Split out tcg/meson.build
Date: Fri, 11 Jun 2021 16:41:11 -0700
Message-Id: <20210611234144.653682-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210611234144.653682-1-richard.henderson@linaro.org>
References: <20210611234144.653682-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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
Cc: Luis Pires <luis.pires@eldorado.org.br>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 meson.build     |  8 +-------
 tcg/meson.build | 13 +++++++++++++
 2 files changed, 14 insertions(+), 7 deletions(-)
 create mode 100644 tcg/meson.build

diff --git a/meson.build b/meson.build
index d2a9ce91f5..b5b2cf9e04 100644
--- a/meson.build
+++ b/meson.build
@@ -1970,14 +1970,7 @@ common_ss.add(capstone)
 specific_ss.add(files('cpu.c', 'disas.c', 'gdbstub.c'), capstone)
 specific_ss.add(when: 'CONFIG_TCG', if_true: files(
   'fpu/softfloat.c',
-  'tcg/optimize.c',
-  'tcg/tcg-common.c',
-  'tcg/tcg-op-gvec.c',
-  'tcg/tcg-op-vec.c',
-  'tcg/tcg-op.c',
-  'tcg/tcg.c',
 ))
-specific_ss.add(when: 'CONFIG_TCG_INTERPRETER', if_true: files('tcg/tci.c'))
 
 # Work around a gcc bug/misfeature wherein constant propagation looks
 # through an alias:
@@ -2007,6 +2000,7 @@ subdir('net')
 subdir('replay')
 subdir('semihosting')
 subdir('hw')
+subdir('tcg')
 subdir('accel')
 subdir('plugins')
 subdir('bsd-user')
diff --git a/tcg/meson.build b/tcg/meson.build
new file mode 100644
index 0000000000..84064a341e
--- /dev/null
+++ b/tcg/meson.build
@@ -0,0 +1,13 @@
+tcg_ss = ss.source_set()
+
+tcg_ss.add(files(
+  'optimize.c',
+  'tcg.c',
+  'tcg-common.c',
+  'tcg-op.c',
+  'tcg-op-gvec.c',
+  'tcg-op-vec.c',
+))
+tcg_ss.add(when: 'CONFIG_TCG_INTERPRETER', if_true: files('tci.c'))
+
+specific_ss.add_all(when: 'CONFIG_TCG', if_true: tcg_ss)
-- 
2.25.1


