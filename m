Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D1E6E89E8
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 07:54:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppN9s-0007DZ-LW; Thu, 20 Apr 2023 01:48:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ppN9X-00074t-0e
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 01:48:19 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ppN9V-0001DR-31
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 01:48:18 -0400
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-63b4dfead1bso601999b3a.3
 for <qemu-devel@nongnu.org>; Wed, 19 Apr 2023 22:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1681969696; x=1684561696;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5Ra4vem1bEUNGQf/At/UarboHQTyTTT4h6LEAWK7BBQ=;
 b=WPKtu+YqVE4I5JwiR6TgGJrcbiZrxPSm4Upe1jx85q3sqVpz7zpS7skIDNzw1CRb1t
 801powGIKh8JiQleiJ5VZfGGh2xhkRMe1bVAdvIL2qn/X/NydimBKONu8fwQqu97wPkN
 sZ4KjMwrjlYaEF7mc1gNnRUrC+5DiEXw1lXiLY6JuF43mOb6fQIiKDMDDQ/Jfmz5qXf+
 hyEStEmOMM74X3ZGU0zY2e0GGFWDyOqsr18hal5IzoD2tJDVxfm+/5nBZpe+c4YBpj0k
 23pwffsLz39a4zBV3cfofiK7C34Izl9kCMYj637wohJaEt/mXFtvgvhjSvgs8PPRJ14D
 nUww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681969696; x=1684561696;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5Ra4vem1bEUNGQf/At/UarboHQTyTTT4h6LEAWK7BBQ=;
 b=E4+yYEq+czgC5oP7IHbYU6aZrMsj/WP1GpUY3VY1tIFkr9dIFEiaf5OpktYZYbEUnE
 iAdHiHf1kWhKHkb+VZuLhITAMiWs708HQHZxbCH7XULKcO0J3/1FbQ+RHxxmQxjGpV3B
 1Cqm0zbXJuZHGREDQyE59F9jQ+fsbfu7PrvgFApvgezPw5EDXyFLhCdPYzvSVz7jQDr5
 N6D216q7bkCJn+B7NidDrKHNAwgH8Wg8T8IqXrjWYMt0UPNHst4j0+l92pglIBaECvak
 7IMbh0KreckolXx9jzydZNjCzcbdsGLkso+sM2Z9Welr46Tmfmr3doacmFiyNaEtOf8H
 IabA==
X-Gm-Message-State: AAQBX9e+eps6YaRpFweENd+jRbixB5at1PZgv8RJQDzXQcPkibw3kIlC
 VNzIOEwM7zQ2jHkanDNWWAa0RA==
X-Google-Smtp-Source: AKy350Yxsu8qfRuY7ixH4zzh5Xd34DYMKjwsV3nCnh8FeR9yF5ZF8L0/l8qyeYAhnvm9528L7wjG5Q==
X-Received: by 2002:a17:903:294c:b0:1a1:e01e:7279 with SMTP id
 li12-20020a170903294c00b001a1e01e7279mr388890plb.4.1681969695889; 
 Wed, 19 Apr 2023 22:48:15 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 x15-20020a17090a46cf00b00247164c1947sm2769255pjg.0.2023.04.19.22.48.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 22:48:15 -0700 (PDT)
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
Subject: [PATCH v2 11/41] tests/avocado: Remove test_igb_nomsi_kvm
Date: Thu, 20 Apr 2023 14:46:27 +0900
Message-Id: <20230420054657.50367-12-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230420054657.50367-1-akihiko.odaki@daynix.com>
References: <20230420054657.50367-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::436;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x436.google.com
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


