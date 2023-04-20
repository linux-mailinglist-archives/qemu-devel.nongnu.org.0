Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BFE16E89AF
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 07:49:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppN9S-0006u7-EF; Thu, 20 Apr 2023 01:48:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ppN9P-0006tf-Dj
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 01:48:11 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ppN9N-00012m-Oo
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 01:48:11 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-244a5ccf13eso388873a91.2
 for <qemu-devel@nongnu.org>; Wed, 19 Apr 2023 22:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1681969689; x=1684561689;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hO7vy38C7n7U8m09DYFIOuqZKNDrQj3wd3r1DxexBJ4=;
 b=HAE39E0UFwRARmKj8m7ywt1z5MPs6pV/wh6/mXTGVY3D5R0yCNDzifA/UWlm2gb4eA
 ODVeXyB4rLP0cR3+Zw1qVLAxgW1fw6oqNzqb2WwqdRoMGPLhmzN8O48qkMiaUb0x0gQQ
 uvMwgJFzwmc9r6pATa0eHafaw0iTf8p3sd3F+aWqaxetZD7rXX9HittIspGVHlUgicX6
 ATxsBdUuakz29njUO9W+54Gii8d5uPz/eKV8imrNOpouNu/JNoS/zznUZEkP9qwbGSu/
 hS/cYzT0AXak6Afne5mr9J+Nfp+iTiNcDzMKZr/Ek5Kod4ztI/1qk2F780VLI2vftIFB
 ZZMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681969689; x=1684561689;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hO7vy38C7n7U8m09DYFIOuqZKNDrQj3wd3r1DxexBJ4=;
 b=YwzsD6H7ueH2JW731iSWpsqcPZtgRcC9puD5BtdCsi2NjXf9DCRVD+lMWFO6rrfFDY
 4yZ/t/4Gxfr8J/Or9sj3VnFi5OnTUp17VhqeADjJ7I6VKtd8RBVLxyhNMXzhklL45Qh+
 d0FaWYy3LyDIhp5hT0/sjicylL9B+l0qioeJzhkyZERqZRYRBm27ZTvafBnP7vOnISgx
 uHYtM7VB4h9qIGCmWwpJx+PIjNXqrzA355H+iLhCXzDaAeIcFJvF+h0qNJ35mH5D0LK1
 kdTw/J5U7LFd9VKL6NSNNF84dGzOhcSyzJGiuEbbUOim9Dy22s2YLCM10v7s9Od8qRV1
 fDmQ==
X-Gm-Message-State: AAQBX9eRt2HUoFgWgOp7WjIU6uKTq6LRzGQnuTR64K+67PCcsjDDDoQy
 Gzik84pBHPDj/BN++QjeqZ0vCQ==
X-Google-Smtp-Source: AKy350aRLxrvgBPQVYsx1GsNc9M3cWSYtA6egKdsmYvmgYrsuzbygNpJ7+VYJT+LIT1TTSGZUmTeEg==
X-Received: by 2002:a17:90a:ca07:b0:249:89a2:5800 with SMTP id
 x7-20020a17090aca0700b0024989a25800mr653062pjt.9.1681969689052; 
 Wed, 19 Apr 2023 22:48:09 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 x15-20020a17090a46cf00b00247164c1947sm2769255pjg.0.2023.04.19.22.48.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 22:48:08 -0700 (PDT)
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
Subject: [PATCH v2 09/41] Fix references to igb Avocado test
Date: Thu, 20 Apr 2023 14:46:25 +0900
Message-Id: <20230420054657.50367-10-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230420054657.50367-1-akihiko.odaki@daynix.com>
References: <20230420054657.50367-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::102e;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x102e.google.com
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


