Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FFEC6E2295
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 13:49:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnHlc-0000a6-L4; Fri, 14 Apr 2023 07:39:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pnHlX-0000My-AW
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 07:38:55 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pnHlV-0001Or-7c
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 07:38:54 -0400
Received: by mail-pj1-x102d.google.com with SMTP id hg12so3564468pjb.2
 for <qemu-devel@nongnu.org>; Fri, 14 Apr 2023 04:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1681472332; x=1684064332;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5Ra4vem1bEUNGQf/At/UarboHQTyTTT4h6LEAWK7BBQ=;
 b=wbIpb9rpF4tT8sWbjdv9wcf636m6F5uN8mpHl1HfRSVN8OwJkb6vqfKKxXNb9h3+Hz
 pJujDJoLHlgVIdvVbTxGUH6E8pK8OwbZFKzZXpeDkh9kmb5qzDz2ZOANVf6K+SN7TkcF
 S3Sg5I4h4k7ZtvmdektU7QN9OhLeTjY2q0qtqsSd8/t8P+AadNI+hWzkxOocqeWe2Lup
 0Mn6guz8oUeyRkchdUzzsXL1eHZV/P33T3nz0fauBR4Jh+1Oh71jvsLsiO+9GNQAePnq
 Zghl56wABkwzySBZ3ZT45VYewW/tL6/8ROrsJEF/bkG/02igaJW1/fHzrnnr6tityV18
 osLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681472332; x=1684064332;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5Ra4vem1bEUNGQf/At/UarboHQTyTTT4h6LEAWK7BBQ=;
 b=S3ZkRNL2t8T8tCS/P8ftJ8+dGr8PBhDdTAt+Q5yO32OG3q5zzCNJXLDj1QTV/Xyg2z
 1HhgmPuXQUqtoWrg6m8IhbRoD1AUbtTkhY+ZUEmxHlITGtm0vuC9KErIs+x09Wq9a2++
 goTurWkJIPi6/yhnIN1kbbTCUXsMY8hOkyDw4LPfmjKb9OF0VQwblYJHBX9Wmyv/2ATn
 8HijEbGQeatKBumK0vcLELlzANGKqN3FwlctXt/i82FxsUGl8LMP7JISxDFUnCnWclC6
 ugAVWhh3E2T5P5QYAKGR5HlVidW6vRqhSZt010p3u17kuA3nPuWd+mY5M+1uYJ4zjFCb
 uEQA==
X-Gm-Message-State: AAQBX9cLemp57CeID+Kwu/DwwRC4Dl+/H+EGCQrSJr/N+BlLIbhfLV/9
 Cadtm6AJNyg/FBeauYjEK1UcWg==
X-Google-Smtp-Source: AKy350aHlOCim2+zdYiCZL3KwMFpqwOq3AA1YSjDs1Y3R6QkBvCzGEQiutw/hdRceGGVv6E+CbXj2A==
X-Received: by 2002:a17:90a:e28f:b0:247:4200:7432 with SMTP id
 d15-20020a17090ae28f00b0024742007432mr1404389pjz.40.1681472332027; 
 Fri, 14 Apr 2023 04:38:52 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 u19-20020a170902a61300b001a20b31a23fsm2889249plq.293.2023.04.14.04.38.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Apr 2023 04:38:51 -0700 (PDT)
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
Subject: [PATCH 11/40] tests/avocado: Remove test_igb_nomsi_kvm
Date: Fri, 14 Apr 2023 20:37:08 +0900
Message-Id: <20230414113737.62803-12-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230414113737.62803-1-akihiko.odaki@daynix.com>
References: <20230414113737.62803-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::102d;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x102d.google.com
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


