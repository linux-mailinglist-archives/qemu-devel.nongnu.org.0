Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA5D16E22A7
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 13:52:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnHla-0000Ty-8G; Fri, 14 Apr 2023 07:38:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pnHlR-0000Ar-GP
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 07:38:50 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pnHlO-0001MS-SH
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 07:38:49 -0400
Received: by mail-pj1-x102b.google.com with SMTP id v9so23392417pjk.0
 for <qemu-devel@nongnu.org>; Fri, 14 Apr 2023 04:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1681472325; x=1684064325;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OFxd8pcj4wHW0mO+/pQHN3vlTEm9pQVwouFzSiwk1aY=;
 b=3s8o664t7O/JDQZdFToSstDZocybEXqTlhZT1ciU02ql+aqAze3N9ucS1JjpLBkRpD
 WTKTtnfkPwgnBVmS8dPY0YmgRaTD3vBzPUCb4+4LrcW95//1122qy7xV9mhfose/HkT4
 eXAXDCv/O1IzIJiDjxzLjUt0eo7Ol4gBeZ0niMxxrwuthXTEiW/A7GgbslAU+1MADP4W
 lfdRDXRplMOJ/CJWdaLtC9rBZK3OqUnLbMQzV7YUEYlox1k6RBfIlvG9e1u/hfgz9ib2
 F2qZLqQamLLQI+zams9i/icohZ158TxIbLtL8nfqr/q8de3h+ttecFcVwmzqPNgqpg5R
 W95g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681472325; x=1684064325;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OFxd8pcj4wHW0mO+/pQHN3vlTEm9pQVwouFzSiwk1aY=;
 b=ZwwwTiwPN4z9YuYi58ND5qakIw/C7sACkY4LNn8eYfHd+/KtWoAINqKMO2O3Jul9if
 XrriRplIQ1fYt+TzICETLGW18Gi3xmOgSr6CLX2SGDaFCfTinAUmE84e0Kz70tNDXlbk
 9VJwMLgJxNnVW0pG4jTXg641jkfb2KE2z04Ku4X9NRW+3IuHJLy9Pv2ky3PLIj92xu53
 GYOlbgKAp7Q+gZJUf2Pza1Fp0g40hQOM3gt5ckGVcjIgr6JFa4RA1StumpvIL5R5X6eT
 OTCJRc5V2x3nORSo9qbPGL/ZJbOZUniiMpYW0vUbeRDkqhlRGbBNh/JLlqr2kMqtWVAH
 3BGA==
X-Gm-Message-State: AAQBX9eCckJGCdTXecCfmA+ze4YB/ak8v/ueadZwlQhCkyx76y8HXDny
 VdVQCur1RrZgb1S/Jkhca6RoNw==
X-Google-Smtp-Source: AKy350bSMg6TugLG0xguLOEwZ4EKrxYQXXTpMkn+Y7Ejn36m+A6AZorcGcBddGq0JqCrg8dQxaXmyw==
X-Received: by 2002:a17:90a:f190:b0:246:b2de:f13f with SMTP id
 bv16-20020a17090af19000b00246b2def13fmr5332735pjb.24.1681472325458; 
 Fri, 14 Apr 2023 04:38:45 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 u19-20020a170902a61300b001a20b31a23fsm2889249plq.293.2023.04.14.04.38.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Apr 2023 04:38:45 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH 09/40] Fix references to igb Avocado test
Date: Fri, 14 Apr 2023 20:37:06 +0900
Message-Id: <20230414113737.62803-10-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230414113737.62803-1-akihiko.odaki@daynix.com>
References: <20230414113737.62803-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::102b;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Fixes: 9f95111474 ("tests/avocado: re-factor igb test to avoid timeouts")
Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 MAINTAINERS                                        | 2 +-
 docs/system/devices/igb.rst                        | 2 +-
 scripts/ci/org.centos/stream/8/x86_64/test-avocado | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index ef45b5e71e..c31d2279ab 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2256,7 +2256,7 @@ R: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
 S: Maintained
 F: docs/system/devices/igb.rst
 F: hw/net/igb*
-F: tests/avocado/igb.py
+F: tests/avocado/netdev-ethtool.py
 F: tests/qtest/igb-test.c
 F: tests/qtest/libqos/igb.c
 
diff --git a/docs/system/devices/igb.rst b/docs/system/devices/igb.rst
index 70edadd574..afe036dad2 100644
--- a/docs/system/devices/igb.rst
+++ b/docs/system/devices/igb.rst
@@ -60,7 +60,7 @@ Avocado test and can be ran with the following command:
 
 .. code:: shell
 
-  make check-avocado AVOCADO_TESTS=tests/avocado/igb.py
+  make check-avocado AVOCADO_TESTS=tests/avocado/netdev-ethtool.py
 
 References
 ==========
diff --git a/scripts/ci/org.centos/stream/8/x86_64/test-avocado b/scripts/ci/org.centos/stream/8/x86_64/test-avocado
index d2c0e5fb4c..a1aa601ee3 100755
--- a/scripts/ci/org.centos/stream/8/x86_64/test-avocado
+++ b/scripts/ci/org.centos/stream/8/x86_64/test-avocado
@@ -30,7 +30,7 @@ make get-vm-images
     tests/avocado/cpu_queries.py:QueryCPUModelExpansion.test \
     tests/avocado/empty_cpu_model.py:EmptyCPUModel.test \
     tests/avocado/hotplug_cpu.py:HotPlugCPU.test \
-    tests/avocado/igb.py:IGB.test \
+    tests/avocado/netdev-ethtool.py:NetDevEthtool.test_igb_nomsi \
     tests/avocado/info_usernet.py:InfoUsernet.test_hostfwd \
     tests/avocado/intel_iommu.py:IntelIOMMU.test_intel_iommu \
     tests/avocado/intel_iommu.py:IntelIOMMU.test_intel_iommu_pt \
-- 
2.40.0


