Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A214A6E89DD
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 07:53:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppNBg-0004B3-7y; Thu, 20 Apr 2023 01:50:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ppNBV-00048g-84
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 01:50:21 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ppNBA-0001a6-MX
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 01:50:02 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 98e67ed59e1d1-24735727c83so406014a91.3
 for <qemu-devel@nongnu.org>; Wed, 19 Apr 2023 22:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1681969799; x=1684561799;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ILeEC45O4cCOmKoGJEqXwqlDpUW0IKc6Vq1tRoBknx4=;
 b=W5bkx2MBSKlQdXRX90wmSA0q2XEoW6QAX0xxvbUMp6TaCKqNgIMqgSYN6TrQQpUAxk
 KNQbvDnctj9Ge5s2G4Pmyp1rLBY+hZD1YBwzg8R+oywOoa06xqI7e0Zr6bVEUFBnlg2L
 z1s6ZJUw38lBu4E9K/LhXQ0K6DFQbQc/CDPDQTVRzJ0UvRHYAkYjsK7JJQ18PB/akUvv
 ZIDUHoHKE6EOJSc0auCQKA/drP67FxMFcJF/Yzv9wmnIDSCwBbwegLFyxnBwfRJJQLlA
 KqcKs5iLDduVxQ1NiPyLSaJgWCLJAwtrDtuyKM2cHEDDyP4EixywPgUpMalpWn9xVJO/
 yh2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681969799; x=1684561799;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ILeEC45O4cCOmKoGJEqXwqlDpUW0IKc6Vq1tRoBknx4=;
 b=FL3+Gdx4dXoHlezkr0EDGRarRqX2TuzPWjgl3mm+a3PzbZUalJ+URtz2efTNlOJh4x
 5J03CcsXPZ7M6alE2F0epZZidfyffhKLRNM1FOp4AtVIMLZ9B+Gh1/Vdg7LKAEFrDFdS
 FZ6szw2w5jwxRSrPLKmV4DpeofDT9pWAihsWE3iK9CXTVvpHDgRym3d4+GQpny/tfscW
 KvCK8A/WcEpQai3wTOKIHW8UAg8tIekp5Y+6JVTCSyH/mApYYs8oy+ASo6YZUpw8wVRg
 DLnhnqfMa7N6qD5VWr9zWOy42gGNrhCgkSvJQ2KE5P1dt/SHJ4bMe20LUWMzLxDpHWjB
 hXwg==
X-Gm-Message-State: AAQBX9cMGYR1mGa95NmKOglUA/oZ48Y6hjyNc7c6iS2/f1x3C/lA9iwN
 y/Ra1TcyXVFNVIzLbH/e4b7NjA==
X-Google-Smtp-Source: AKy350btpyPON7proZ/xy50heh5+9WdMLL483B+qfhGvFWJeZwH966K7PWoNYsWqQSffEQg3JATpMg==
X-Received: by 2002:a17:90a:b001:b0:23f:6958:e931 with SMTP id
 x1-20020a17090ab00100b0023f6958e931mr518724pjq.46.1681969799372; 
 Wed, 19 Apr 2023 22:49:59 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 x15-20020a17090a46cf00b00247164c1947sm2769255pjg.0.2023.04.19.22.49.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 22:49:59 -0700 (PDT)
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
Subject: [PATCH v2 41/41] docs/system/devices/igb: Note igb is tested for DPDK
Date: Thu, 20 Apr 2023 14:46:57 +0900
Message-Id: <20230420054657.50367-42-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230420054657.50367-1-akihiko.odaki@daynix.com>
References: <20230420054657.50367-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1029;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1029.google.com
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

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 docs/system/devices/igb.rst | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/docs/system/devices/igb.rst b/docs/system/devices/igb.rst
index afe036dad2..60c10bf7c7 100644
--- a/docs/system/devices/igb.rst
+++ b/docs/system/devices/igb.rst
@@ -14,7 +14,8 @@ Limitations
 ===========
 
 This igb implementation was tested with Linux Test Project [2]_ and Windows HLK
-[3]_ during the initial development. The command used when testing with LTP is:
+[3]_ during the initial development. Later it was also tested with DPDK Test
+Suite [4]_. The command used when testing with LTP is:
 
 .. code-block:: shell
 
@@ -22,8 +23,8 @@ This igb implementation was tested with Linux Test Project [2]_ and Windows HLK
 
 Be aware that this implementation lacks many functionalities available with the
 actual hardware, and you may experience various failures if you try to use it
-with a different operating system other than Linux and Windows or if you try
-functionalities not covered by the tests.
+with a different operating system other than DPDK, Linux, and Windows or if you
+try functionalities not covered by the tests.
 
 Using igb
 =========
@@ -32,7 +33,7 @@ Using igb should be nothing different from using another network device. See
 :ref:`pcsys_005fnetwork` in general.
 
 However, you may also need to perform additional steps to activate SR-IOV
-feature on your guest. For Linux, refer to [4]_.
+feature on your guest. For Linux, refer to [5]_.
 
 Developing igb
 ==============
@@ -68,4 +69,5 @@ References
 .. [1] https://www.intel.com/content/dam/www/public/us/en/documents/datasheets/82576eb-gigabit-ethernet-controller-datasheet.pdf
 .. [2] https://github.com/linux-test-project/ltp
 .. [3] https://learn.microsoft.com/en-us/windows-hardware/test/hlk/
-.. [4] https://docs.kernel.org/PCI/pci-iov-howto.html
+.. [4] https://doc.dpdk.org/dts/gsg/
+.. [5] https://docs.kernel.org/PCI/pci-iov-howto.html
-- 
2.40.0


