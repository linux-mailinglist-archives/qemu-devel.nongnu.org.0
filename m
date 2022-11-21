Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02CDD632324
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 14:08:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ox6S6-00051Q-7G; Mon, 21 Nov 2022 08:03:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ox6Rl-0004tk-CB
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 08:02:51 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ox6Ri-0007Rh-7Q
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 08:02:48 -0500
Received: by mail-wr1-x42e.google.com with SMTP id bs21so19758966wrb.4
 for <qemu-devel@nongnu.org>; Mon, 21 Nov 2022 05:02:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=fwMWmQZd9sBU28g/akDXkXxjGE4RWYE++luBOirwphw=;
 b=kAR4MUmoRwrRSU8KC7umHfm4p3QC47OVr1XxAXqvwqUlFM2ZtUMOfqJt3fR21sOTIa
 gucZ1h6FMdIMUbK34uB8lTXwHuMyZyhXqfQ4zgXamtVbKksqWU2PqjkBaUCV5Dnfj5Cv
 ZaQdeEhx96OSi5C3WRWWM5dWEmDDF+crTJPJHGNU76rxzVIAS/QndCJgcGuXrSl1hxDA
 Hdz8PkxN0yFoCAJoDXkeuf6qOtJQHUsczc3YKmBUGMcn4tfZVjQekF5NBtlA8Oepd0rZ
 IEeGXgFriGiW2SvRWZM3BexfqEMVI91oFtSNOdO+VOHn7dZTR/CmuBqu9Vi0NMCA1hn5
 /4Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fwMWmQZd9sBU28g/akDXkXxjGE4RWYE++luBOirwphw=;
 b=Xf0r/B764GCT49sX9x7vJIPJTiDmaIt/4Re6JHpOED1/DtDebQJ1XkltmQaSFU6ZR0
 Rou2iLU4uUZWfBmGNDvukNNJEPRuwFoh6TJG9lFoljlsrqXAuM61F5gCsLJB+FRf/o3/
 ulZ4qRS/r2+jEUV51KUAF2kpHtGCsy4J8jvDe+X1K2YO6r2jZFzkl4n/fIoz+Cmz8d0G
 xTX0Dl04UMDHkyisyQ+Wso9mEK/tVm3Oz2pePlLJzTt5Zg7dCiU807ZGzBGE2BFP1x2i
 TWdz1vtbnlrehNDD/KJI7Y+7+L7IfMggsHtPMEwh+g+hC6Rs88xnRW8K3G6W6sateBLi
 LcKg==
X-Gm-Message-State: ANoB5pmElcyUsBs3Y/A5/isWiMOnm5ZOxdz6/zAWQIZHFJ1A1rxZcbD9
 yMOQCV5OdeNwZTI2MYOPTdF+tLagAHkY/A==
X-Google-Smtp-Source: AA0mqf7jSg4BROnamb+MO7AEA8J0mlQO/pWudGy7rk9ZpFkqgIj5p4WLM6PgZYuciNXYDs0frBCOcQ==
X-Received: by 2002:adf:d84c:0:b0:236:6f1a:955 with SMTP id
 k12-20020adfd84c000000b002366f1a0955mr10713977wrl.111.1669035764695; 
 Mon, 21 Nov 2022 05:02:44 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 t1-20020a1c7701000000b003cf4d99fd2asm13296725wmi.6.2022.11.21.05.02.43
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Nov 2022 05:02:44 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 4/5] tests/avocado/boot_linux.py: Bump aarch64 virt test
 timeout to 720s
Date: Mon, 21 Nov 2022 13:02:38 +0000
Message-Id: <20221121130239.1138631-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221121130239.1138631-1-peter.maydell@linaro.org>
References: <20221121130239.1138631-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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

The two tests
tests/avocado/boot_linux.py:BootLinuxAarch64.test_virt_tcg_gicv2
tests/avocado/boot_linux.py:BootLinuxAarch64.test_virt_tcg_gicv3

take quite a long time to run, and the current timeout of 240s
is not enough for the tests to complete on slow machines:
we've seen these tests time out in the gitlab CI in the
'avocado-system-alpine' CI job, for instance. The timeout
is also insufficient for running the test with a debug build
of QEMU: on my machine the tests take over 10 minutes to run
in that config.

Push the timeout up to 720s so that the test definitely has
enough time to complete.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/avocado/boot_linux.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/avocado/boot_linux.py b/tests/avocado/boot_linux.py
index 571d33882ae..32adae6ff6a 100644
--- a/tests/avocado/boot_linux.py
+++ b/tests/avocado/boot_linux.py
@@ -64,7 +64,7 @@ class BootLinuxAarch64(LinuxTest):
     :avocado: tags=machine:virt
     :avocado: tags=machine:gic-version=2
     """
-    timeout = 240
+    timeout = 720
 
     def add_common_args(self):
         self.vm.add_args('-bios',
-- 
2.25.1


