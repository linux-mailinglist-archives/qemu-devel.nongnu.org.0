Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCCA8699AD9
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 18:12:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pShnX-0000pS-WE; Thu, 16 Feb 2023 12:11:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pShnU-0000bL-Gj
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 12:11:52 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pShnS-0007zE-CN
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 12:11:52 -0500
Received: by mail-wr1-x431.google.com with SMTP id m14so2497118wrg.13
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 09:11:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=tgMbUsRHeiMP1zN6oNigLk88zA1/eZdSv72d9GFz8HA=;
 b=xzGzqmUfZcoiTUqYbvT+vyI6i5sw3LXjQPcgk+ov2E2shYpriY9A70MSENUFncuM3P
 VzsHYIyR8rG5bqskuI1PtlaWNod4Dd0Ux7a+xlJcpUvnBebBErnqvP0KzWy/NMqrS0ou
 QygRTj+GlT4HvA836Iva26YynWrRp1uif3nPdLQtSOlC1qxnaHf+H4AWMfKaCXYkBIMH
 1RZZF70BxzleSlbC86CEc5NVZqi8zJ8yBARomsHYjFVo5rjtR+OLFEHV2QV/PyW+mZOo
 iX0PGnj3pI3y9biqrmeCHW996Q7rLJH8UpQ7iQSoYkbJ2vlQ4YASkpwDgCH3kXxtxwex
 3yGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tgMbUsRHeiMP1zN6oNigLk88zA1/eZdSv72d9GFz8HA=;
 b=wHRiPVHAACg+agvqXPE65nw5WgFI/aXWVrEHMlL/cIpqL0MDpXceDXjoqWxr4o/r/e
 WM7tPjwPfkTGXsm71Un5WzUm3AKT6kNsmp/C88Tv55aP0CsK5Hy1Jr58j96lmSIjiNc/
 OHFBrDGQYmmnfcVdwqjv4CczclumPYZ0bjNijP0qbgUYcwt6KqGkosSsCf93coly+mk6
 BOoRkkgzJfyuIWRMb77cuty/FH/eE5DyVfvDnYr6GHMv22hA1OlEhsrQqEd0NyerCwp+
 gmVrrSHAB38ZDBmK5XKsOG2a/P3hVNvYZg3B4/pokXttajwtHT3P7nGlNEmxQ4xRtOvD
 0+dg==
X-Gm-Message-State: AO0yUKWeovI+/zIfJ2ZjlXExnckmdsV+vAhtvULpCo87wGIv1Ta/Ut78
 gASJ7D3Lc2NdaMVHcFrJbfAuQvvZfaKzv5Wu
X-Google-Smtp-Source: AK7set/zbAPGiatm02NppjEpqUmNRHProWlmoVsRS0Z/Se3qAuBwTBnRUEPbnoox0YTEH5sFIOrzcg==
X-Received: by 2002:adf:f087:0:b0:2c5:6036:2567 with SMTP id
 n7-20020adff087000000b002c560362567mr5368430wro.11.1676567508992; 
 Thu, 16 Feb 2023 09:11:48 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a5d4dcc000000b002c556a4f1casm2049107wru.42.2023.02.16.09.11.47
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 09:11:47 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 27/30] tests/avocado: Tag TCG tests with accel:tcg
Date: Thu, 16 Feb 2023 17:11:20 +0000
Message-Id: <20230216171123.2518285-28-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216171123.2518285-1-peter.maydell@linaro.org>
References: <20230216171123.2518285-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Fabiano Rosas <farosas@suse.de>

This allows the test to be skipped when TCG is not present in the QEMU
binary.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 tests/avocado/boot_linux_console.py | 1 +
 tests/avocado/reverse_debugging.py  | 8 ++++++++
 2 files changed, 9 insertions(+)

diff --git a/tests/avocado/boot_linux_console.py b/tests/avocado/boot_linux_console.py
index be60f8cda9a..574609bf43b 100644
--- a/tests/avocado/boot_linux_console.py
+++ b/tests/avocado/boot_linux_console.py
@@ -997,6 +997,7 @@ def test_arm_orangepi_uboot_netbsd9(self):
 
     def test_aarch64_raspi3_atf(self):
         """
+        :avocado: tags=accel:tcg
         :avocado: tags=arch:aarch64
         :avocado: tags=machine:raspi3b
         :avocado: tags=cpu:cortex-a53
diff --git a/tests/avocado/reverse_debugging.py b/tests/avocado/reverse_debugging.py
index d2921e70c3b..680c314cfcc 100644
--- a/tests/avocado/reverse_debugging.py
+++ b/tests/avocado/reverse_debugging.py
@@ -173,6 +173,10 @@ def reverse_debugging(self, shift=7, args=None):
         vm.shutdown()
 
 class ReverseDebugging_X86_64(ReverseDebugging):
+    """
+    :avocado: tags=accel:tcg
+    """
+
     REG_PC = 0x10
     REG_CS = 0x12
     def get_pc(self, g):
@@ -190,6 +194,10 @@ def test_x86_64_pc(self):
         self.reverse_debugging()
 
 class ReverseDebugging_AArch64(ReverseDebugging):
+    """
+    :avocado: tags=accel:tcg
+    """
+
     REG_PC = 32
 
     # unidentified gitlab timeout problem
-- 
2.34.1


