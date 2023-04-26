Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F886EF23A
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 12:40:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prcXR-0000eC-Uw; Wed, 26 Apr 2023 06:38:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1prcXL-0000Mc-GG
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 06:38:13 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1prcXJ-0002zn-Ab
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 06:38:10 -0400
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-63b733fd00bso5546022b3a.0
 for <qemu-devel@nongnu.org>; Wed, 26 Apr 2023 03:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1682505487; x=1685097487;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AUBKW0bOVpI3HeJe5UwSavvtooPoaFokXdNy31dH5Ac=;
 b=HoB18tD/xWW7xAzalUFg1eeRYzgp2ZpikX5n2t8+K5me5ET0G8Kd29qQQ/BH/2bryL
 bS1yTBYoVZXu/Eko+9Hiu3S4VlEgaFFfTBciXEGKpSaOdR/QLARfMz+jVOesx2b/Lie7
 bXW0YziMP/seIGPYs8JkQ9QbN2EGVmzzxrjzjN6q6JEZ+swIari+Ja3HgEztr6biHV4U
 f3caXTTaeup/bG7TvFChX0BriHJQaJPMXxPsZ1i4rHD1IX6WBmKkp0e1xuD1RmdswJA5
 mBASJ/Lhj9t4DZbpSJ3dmzpjcj1SzRLHtAotQkPk4IEdrzCWLmMhs6AaaxJY9znJrwRv
 jZnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682505487; x=1685097487;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AUBKW0bOVpI3HeJe5UwSavvtooPoaFokXdNy31dH5Ac=;
 b=Mp3t2yqcXLWRM882zSMo/PX6Z1BwmBbG1Bv+xjKGWXSC3xENOWCFftnMdU3Jsmd5lS
 BMy4MRXNaWj4UA8y5EMHAIcbhEVXNvM3GBTqIYIxVwwtpT+qZAJHHU4CxFZG6P/xN03Q
 3wgSHLAr//dNlZkkxzo4STA9AnRw28Uag6f3eNgPEc8b0vWE5k+fUmJAUn1TOhtPYeSx
 qHn3GuVFrfWaMXJHZsbsM+SoeSjt4/9O6+/cq4kRDWVEM6vlDMxt0zVaeQN8bufnWksY
 42JdQWnE5QBzfiZZtDeeQ5xceiXX5BEjRDrOIYQtcI0KYCg7Wz6+66Ti5IJnb3CcxfwB
 TPgA==
X-Gm-Message-State: AAQBX9fonosxQU3gfH0QjI/Z17qrhlTTB02u2tDIJIG6EUT5U+NtTCGW
 AB8+EYnH5b1/nPfRcE9XcSV7Nw==
X-Google-Smtp-Source: AKy350arZTQOsK9HVarWs6jmUVJy+OgyUiCe1nR813+0T2yLDf7hbMgSIv34ZHEGxH8h0WMDlCVVBA==
X-Received: by 2002:a05:6a00:851:b0:637:920c:25fd with SMTP id
 q17-20020a056a00085100b00637920c25fdmr28796045pfk.17.1682505487566; 
 Wed, 26 Apr 2023 03:38:07 -0700 (PDT)
Received: from alarm.u-tokyo.ac.jp ([157.82.194.15])
 by smtp.gmail.com with ESMTPSA id
 m11-20020a63580b000000b0051322a5aa64sm9317919pgb.3.2023.04.26.03.38.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Apr 2023 03:38:07 -0700 (PDT)
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
Subject: [PATCH v4 12/48] tests/avocado: Remove test_igb_nomsi_kvm
Date: Wed, 26 Apr 2023 19:36:40 +0900
Message-Id: <20230426103716.26279-13-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230426103716.26279-1-akihiko.odaki@daynix.com>
References: <20230426103716.26279-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::430;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x430.google.com
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


