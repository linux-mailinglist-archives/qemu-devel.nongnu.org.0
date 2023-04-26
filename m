Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5F26EF24E
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 12:41:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prcXP-0000Be-61; Wed, 26 Apr 2023 06:38:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1prcXD-0008OK-7K
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 06:38:04 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1prcXB-0002kV-8Q
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 06:38:02 -0400
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-63b7b54642cso5036765b3a.0
 for <qemu-devel@nongnu.org>; Wed, 26 Apr 2023 03:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1682505480; x=1685097480;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hO7vy38C7n7U8m09DYFIOuqZKNDrQj3wd3r1DxexBJ4=;
 b=bO5upV/6iP6Wuok1QTskvGZ7JwUp9AvXi9NaOrJSWo5K2iPCzwMDYZxSshGkizcE4Z
 Z5QXCxcVjpsmBiZLjBHOrU6RHR6mLPZNHnPhcgXCkiwKzZqhPZp06jT/8/YBLf9bD7VG
 i9YWiFcftNy6KDd4CtrLBO2RZQqfxCLF3udbgexT6APnp/OTNmY4m7P0YI8lBuHvP4KV
 GM1Vv4uJvCGGQ2OsCL0oh5/XNK6paRDdPPuaXsc9GBpMTbl8cUrjV/+M6RES5M9bC6bQ
 MOGHUeOqvFDzL+clhtaeUxMQMMJJEH6lKilqN3S90ekw7t/9eIV6H3ivHKlSZIMTD0k4
 Qb5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682505480; x=1685097480;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hO7vy38C7n7U8m09DYFIOuqZKNDrQj3wd3r1DxexBJ4=;
 b=hIHb+2CwCibFhRRI8gNoisZEpQVA2BU8fO5SgP3uyK9KiVLaY2ZuAYcvTeMU4Qarrm
 8HO2T6eg3Tz/ShDbnfWcYZSJYRZskxbOAx2a2TqEti4beg27cRE6c7vNyNxqhY74Tey+
 mJEAuaSBOFBrnN/jUo6W3Uc0AkRAI3PHeGlcm2Zn5Hj+EZ415jwekRA69jJSY78cq4Tp
 +PFBAPwl3+gJ7EgjC7hoWWcjGd+0qrw75g/2209vRPVzOZ7w2X5zoWJ5G6Oj/3uwqyXR
 OXXDKvKQgQFS22dWy+ovn/m54mDh8tKTdyAN52sSYybVdggqknk2hXEcjCoRtV0Qx1zE
 84Ow==
X-Gm-Message-State: AAQBX9f0FDDzwSxXJaUgLDpWD3/4UoL5IWpFsbZk9k+lkWOG5SlWH41u
 uQHA7uedfIKJloLH/nXB8llHBg==
X-Google-Smtp-Source: AKy350bDAjvXpZn0k8RPFOag6oBE4nWzhR7VSX2Gq62nQEBO6RMiDfxwOA7H0+1uPKHc+z7TNH5f2Q==
X-Received: by 2002:a05:6a00:23c5:b0:63a:8f4c:8be1 with SMTP id
 g5-20020a056a0023c500b0063a8f4c8be1mr28201130pfc.10.1682505480529; 
 Wed, 26 Apr 2023 03:38:00 -0700 (PDT)
Received: from alarm.u-tokyo.ac.jp ([157.82.194.15])
 by smtp.gmail.com with ESMTPSA id
 m11-20020a63580b000000b0051322a5aa64sm9317919pgb.3.2023.04.26.03.37.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Apr 2023 03:38:00 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, Tomasz Dzieciol <t.dzieciol@partner.samsung.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v4 10/48] Fix references to igb Avocado test
Date: Wed, 26 Apr 2023 19:36:38 +0900
Message-Id: <20230426103716.26279-11-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230426103716.26279-1-akihiko.odaki@daynix.com>
References: <20230426103716.26279-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::42c;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x42c.google.com
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
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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


