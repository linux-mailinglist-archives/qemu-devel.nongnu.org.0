Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 820346EBCD3
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Apr 2023 06:20:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqRCD-0001vL-RS; Sun, 23 Apr 2023 00:19:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pqRCA-0001uQ-PF
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 00:19:26 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pqRC9-0000oC-8F
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 00:19:26 -0400
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-63b7588005fso2965947b3a.0
 for <qemu-devel@nongnu.org>; Sat, 22 Apr 2023 21:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1682223564; x=1684815564;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AUBKW0bOVpI3HeJe5UwSavvtooPoaFokXdNy31dH5Ac=;
 b=UQaHgNNpIaLsGGAXstX6xJBr9jfs1khTPLBBeOwlVpCzfwa0YCINdyfh3KHdB8uQAa
 GDRRAT/xv7JDbVhF7o3Ly6QYSR7tVWqXBiHwRmcLUmi/7DaNhwh7TQ99sIXeyBnqjYjc
 6rt7m7WL0jUtKn+cq2Swo1VMDkjzOiUx8BtYo2QRj3McNKYbswhPqtIIOhNFK+o3RJb7
 2MPmUv0rFV09oWCtHy/dHF0+0IjBFOvKZ8uvsoM0fx24ZvJldP8aihce+7NjExM4MEGF
 iIYkYFTYR6Snt0JdUxtoBJGJ/9RYhPJDZ2NK4cUtxF82Kp+/WREcVAFQZ7CXmZcealXL
 GQVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682223564; x=1684815564;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AUBKW0bOVpI3HeJe5UwSavvtooPoaFokXdNy31dH5Ac=;
 b=QhIqMAdhpM54q/odEycoGWPMrE/uIL9RVw/pYwddDo5A647KG5Zimpi2LYfxGe6qLT
 iJ1hEmc6/RGBpQ42al2qhe12dDmJzPWASaz0YUezluMPmz63I4SyYn1C3WG5NJI1S2Te
 j12+JktdcM77a26RSutB5qd08X48OOKWaK4LMWODFWBITDakPuhHiUPwbIVttNm+hR0g
 L0QQKDwH2UnU87xIUTPs538cE3e6Okqp9rknsiO/xiYDfyyEaQ8QSniEugsfEPu040Lc
 iER45jXFS9c1ezAjpJnKPcIEsbAaGAIOzelbMAQAUuY9PR/YbyhRSAZNKnSPo4uwqISV
 qjlw==
X-Gm-Message-State: AAQBX9ebrkr6Y/EkofOj3ROdvQuO5n4dcAA2IkChLyb2BEUyGq1fiM0b
 bgnBb7wqKb534A9CEaKRpgD4Sai1EZO1BxNweL0=
X-Google-Smtp-Source: AKy350YcI6T3PYPmsfbna45RpR/6gn1gAO7wWeWilvk/kjD4KX1w/9NYeAOKt7i7W6zoTuU7tkzTLg==
X-Received: by 2002:a17:902:da84:b0:1a6:b5b2:6a25 with SMTP id
 j4-20020a170902da8400b001a6b5b26a25mr12202144plx.2.1682223563899; 
 Sat, 22 Apr 2023 21:19:23 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 f1-20020a170902ff0100b001a5059861adsm4596996plj.224.2023.04.22.21.19.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Apr 2023 21:19:23 -0700 (PDT)
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
Subject: [PATCH v3 12/47] tests/avocado: Remove test_igb_nomsi_kvm
Date: Sun, 23 Apr 2023 13:17:58 +0900
Message-Id: <20230423041833.5302-13-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230423041833.5302-1-akihiko.odaki@daynix.com>
References: <20230423041833.5302-1-akihiko.odaki@daynix.com>
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

It is unlikely to find more bugs with KVM so remove test_igb_nomsi_kvm
to save time to run it.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Acked-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/avocado/netdev-ethtool.py | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/tests/avocado/netdev-ethtool.py b/tests/avocado/netdev-ethtool.py
index 8de118e313..6da800f62b 100644
--- a/tests/avocado/netdev-ethtool.py
+++ b/tests/avocado/netdev-ethtool.py
@@ -29,7 +29,7 @@ def get_asset(self, name, sha1):
         # URL into a unique one
         return self.fetch_asset(name=name, locations=(url), asset_hash=sha1)
 
-    def common_test_code(self, netdev, extra_args=None, kvm=False):
+    def common_test_code(self, netdev, extra_args=None):
 
         # This custom kernel has drivers for all the supported network
         # devices we can emulate in QEMU
@@ -57,9 +57,6 @@ def common_test_code(self, netdev, extra_args=None, kvm=False):
                          '-drive', drive,
                          '-device', netdev)
 
-        if kvm:
-            self.vm.add_args('-accel', 'kvm')
-
         self.vm.set_console(console_index=0)
         self.vm.launch()
 
@@ -86,13 +83,6 @@ def test_igb_nomsi(self):
         """
         self.common_test_code("igb", "pci=nomsi")
 
-    def test_igb_nomsi_kvm(self):
-        """
-        :avocado: tags=device:igb
-        """
-        self.require_accelerator('kvm')
-        self.common_test_code("igb", "pci=nomsi", True)
-
     # It seems the other popular cards we model in QEMU currently fail
     # the pattern test with:
     #
-- 
2.40.0


