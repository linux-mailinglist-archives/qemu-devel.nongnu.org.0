Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 074896EBCD4
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Apr 2023 06:20:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqRC9-0001tt-Cf; Sun, 23 Apr 2023 00:19:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pqRC4-0001s9-0v
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 00:19:20 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pqRC2-0000mB-GY
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 00:19:19 -0400
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-63d4595d60fso21521896b3a.0
 for <qemu-devel@nongnu.org>; Sat, 22 Apr 2023 21:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1682223557; x=1684815557;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hO7vy38C7n7U8m09DYFIOuqZKNDrQj3wd3r1DxexBJ4=;
 b=ZyoBiaTnsHagMrfTLx/G0VW7QYUGsj+txEsEV/35Ai8nc/daJ9Jygkc6x7zzgXmWck
 p5pBDAo24TnZvr8FjaFGfKDcEWkhylSDNzW9K3xQYpsnepBZDECKAm9iP+NP/G/ErcQR
 C81jpf1zMO7kLDp9xmeckaYDUbZve+ftnCB1NuTZJWOfcCU/C7JmC1sb2pVZIQvKoUEs
 hxErxAbU0alP7U0Mr7Ayf4p4sHeis3uqoYBuFlgN/+fi6xSXFqNNwKNBT3Z8BYyl1Xsf
 ZqY6biZ/N4CivLXcYga8OiDIexCO0DHZpBi153sYkRMjTnnMVZmlMj0OtqRbhxb4BJSs
 zm8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682223557; x=1684815557;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hO7vy38C7n7U8m09DYFIOuqZKNDrQj3wd3r1DxexBJ4=;
 b=Usc1lbf07BiOzIJhguB8nrcodxybi1oYisGXoHHy6lFGGWdAWKjz3knfzXxDgFt+Lu
 sIyY+dDP+H9jaOFOFO+RMBoynwS2E+UO0w69VNAwvk/p2gZuEd/J2g1BM6OR7eSonNne
 IWHLOL60h+ZRCzQPbQwBjFQVbNfEyNH+hHka3Hou1ed+qfU8xVX/gwkiaiBDQVbnttzo
 pvQ+IOlNfbr7AiEZ5aUcS4JIARWSrlmB2SDfGLcCZXOZRo29ReZSIGtg2uKqKabCRPnF
 PzUDHm3ATpW2fNiGE23eyQ3Y4E9w9RsWYqg9+EyOPGIblcqF5AXwR6M5GYq7sHD0IeI0
 rqKQ==
X-Gm-Message-State: AAQBX9eI14JZ9ihGZAh7xZbzWZXFtrvckD3bVTxa7FRvpur34OreMQEr
 AmlDIEcSF7rsL9k3wwHodR5FFQ==
X-Google-Smtp-Source: AKy350ZdseUshHH8fWYNLxzJLjAQQpdBmkN4rtUW8b+QpbRNKNS8LiSFDTI8u9MIvL9cB6NO8mUfIg==
X-Received: by 2002:a17:90b:188e:b0:237:ae98:a47f with SMTP id
 mn14-20020a17090b188e00b00237ae98a47fmr16320335pjb.1.1682223557157; 
 Sat, 22 Apr 2023 21:19:17 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 f1-20020a170902ff0100b001a5059861adsm4596996plj.224.2023.04.22.21.19.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Apr 2023 21:19:16 -0700 (PDT)
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
Subject: [PATCH v3 10/47] Fix references to igb Avocado test
Date: Sun, 23 Apr 2023 13:17:56 +0900
Message-Id: <20230423041833.5302-11-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230423041833.5302-1-akihiko.odaki@daynix.com>
References: <20230423041833.5302-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::434;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x434.google.com
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


