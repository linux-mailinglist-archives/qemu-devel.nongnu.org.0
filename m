Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D02F96E8EE1
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 12:05:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppRAF-0000cJ-4P; Thu, 20 Apr 2023 06:05:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ppRA5-0000Y7-0I
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 06:05:10 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ppRA0-0003fp-Qn
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 06:05:08 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3f180510299so3402295e9.2
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 03:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681985102; x=1684577102;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=9TPO1u+pAHb6aTiQd8rmqJXZ6ptbfMeE8o/R5XyQnOE=;
 b=iyt3a18RAN7UwhPzMDKkF8pEvaCWAQhGITT8Ra1H1Wmr7W8wlsmNUfTP+q+mBO6Ng/
 L5J4YlDtKNU0vAy8PB8U3xQaUsHDL+854vsuZL1OglUd1vkMuqbC7TtnDGi9rWIOfIiE
 n4mv4WPD/WJuhrVhSWqGGxc1IdHRA0tZd35x7FuaxvKAjSwLcpUxuhLu4Me5hb9FGtkE
 oAKpv3nmXt3WhEKZntQs9AEOQoUVUBerAhgX2sDZFiyrK4pQ3X6Zusu/rNmvQvL4tLBc
 vHDvMQX8axAWD/t81JiOHay49lN6B7ax/4uS4jwmVWL9G5vmGn+o5O32chxMn7hxq0ow
 2tqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681985102; x=1684577102;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9TPO1u+pAHb6aTiQd8rmqJXZ6ptbfMeE8o/R5XyQnOE=;
 b=GLmGobf8DDT9i+dUqDOQLhVQvSPtspDNDLIOGwelstqjhNl8w5DBY65y+Da69dOY/l
 UZj9DgJDe7Ic9OaCSCwxUoE5GQnJnXYrvKewiPXu3bQK1Iph5UbHA05cvg5wDSkqGK2/
 CV4Ix3RxtHArBCDhTea5pZzw2Okhi+zvqeSvQxx5WknutIiw50cT8QVw+6BFP7hw+8hn
 1atbiKa0JXz/S8eT53PCh+pDrCNLHhJ71qiap9ag2NvQ3Gq1FY/PMfMvwPISUKdZdyIa
 lYZ+DwZKkBEoPwkGPwqtKR0LYUk8mrnpWx1Q++0pKfvA/8EEikqgswd6PK73y1/PUv8g
 CnhA==
X-Gm-Message-State: AAQBX9ciJTXK0xsXkm1UoqbBnzFlyrxsEibGHLRCyokm+BJ8PEe8Pl59
 TVGJ39RnqTd4fIilX4oI42Cxi+Z6PqghJQHbW7E=
X-Google-Smtp-Source: AKy350aLi/NpmnlG7lkUWGGFkK3w51krpl2W9ASkCzK1y0SEDoisqqa+1LogD35iC2tz5ASoZpaGkQ==
X-Received: by 2002:adf:f203:0:b0:2f0:69c4:3900 with SMTP id
 p3-20020adff203000000b002f069c43900mr911024wro.54.1681985102593; 
 Thu, 20 Apr 2023 03:05:02 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 o2-20020a5d58c2000000b002fe522117fdsm1556388wrf.36.2023.04.20.03.05.02
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 03:05:02 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 06/21] tests/avocado: Add reboot tests to Cubieboard
Date: Thu, 20 Apr 2023 11:04:41 +0100
Message-Id: <20230420100456.944969-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230420100456.944969-1-peter.maydell@linaro.org>
References: <20230420100456.944969-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
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

From: Strahinja Jankovic <strahinjapjankovic@gmail.com>

Cubieboard tests end with comment "reboot not functioning; omit test".
Fix this so reboot is done at the end of each test.

Signed-off-by: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
Reviewed-by: Niek Linnenbank <nieklinnenbank@gmail.com>
Tested-by: Niek Linnenbank <nieklinnenbank@gmail.com>
Message-id: 20230326202256.22980-5-strahinja.p.jankovic@gmail.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 tests/avocado/boot_linux_console.py | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/tests/avocado/boot_linux_console.py b/tests/avocado/boot_linux_console.py
index 574609bf43b..c0675809e64 100644
--- a/tests/avocado/boot_linux_console.py
+++ b/tests/avocado/boot_linux_console.py
@@ -581,7 +581,10 @@ def test_arm_cubieboard_initrd(self):
                                                 'Allwinner sun4i/sun5i')
         exec_command_and_wait_for_pattern(self, 'cat /proc/iomem',
                                                 'system-control@1c00000')
-        # cubieboard's reboot is not functioning; omit reboot test.
+        exec_command_and_wait_for_pattern(self, 'reboot',
+                                                'reboot: Restarting system')
+        # Wait for VM to shut down gracefully
+        self.vm.wait()
 
     def test_arm_cubieboard_sata(self):
         """
@@ -625,7 +628,10 @@ def test_arm_cubieboard_sata(self):
                                                 'Allwinner sun4i/sun5i')
         exec_command_and_wait_for_pattern(self, 'cat /proc/partitions',
                                                 'sda')
-        # cubieboard's reboot is not functioning; omit reboot test.
+        exec_command_and_wait_for_pattern(self, 'reboot',
+                                                'reboot: Restarting system')
+        # Wait for VM to shut down gracefully
+        self.vm.wait()
 
     @skipUnless(os.getenv('AVOCADO_ALLOW_LARGE_STORAGE'), 'storage limited')
     def test_arm_cubieboard_openwrt_22_03_2(self):
@@ -672,7 +678,10 @@ def test_arm_cubieboard_openwrt_22_03_2(self):
 
         exec_command_and_wait_for_pattern(self, 'cat /proc/cpuinfo',
                                                 'Allwinner sun4i/sun5i')
-        # cubieboard's reboot is not functioning; omit reboot test.
+        exec_command_and_wait_for_pattern(self, 'reboot',
+                                                'reboot: Restarting system')
+        # Wait for VM to shut down gracefully
+        self.vm.wait()
 
     @skipUnless(os.getenv('AVOCADO_TIMEOUT_EXPECTED'), 'Test might timeout')
     def test_arm_quanta_gsj(self):
-- 
2.34.1


