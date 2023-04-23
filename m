Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 722F46EBCE7
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Apr 2023 06:23:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqREc-0008Bq-16; Sun, 23 Apr 2023 00:21:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pqRE6-0007Qw-Kw
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 00:21:39 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pqRE4-0001JZ-IX
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 00:21:26 -0400
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-63d4595d60fso21525706b3a.0
 for <qemu-devel@nongnu.org>; Sat, 22 Apr 2023 21:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1682223682; x=1684815682;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ILeEC45O4cCOmKoGJEqXwqlDpUW0IKc6Vq1tRoBknx4=;
 b=KqaCTcy6SwLEtNbenDV4k1UgzUvv2KkIHeqVbWxovIhYObQZbrYijuJUoj9uwCiUv1
 UDnbmkjQDDDDkYl42VWRMd7gzZsjmG4HVYVhTMoJVzIQ+bTAw+lTnfG9G3Wphr2l0EYo
 hDEwc2WJSK0V6o8ssie7U5ZGOsvWLgLRUBAChFh9evT56DvScje+lwXNuomZLC9/AloO
 iykNpf4d3eaoHuIZTsImL6DD/J8yIs2YlTBFc5xXtBxsdmq+m5aqSjAPOQ60C+10qMyb
 ReYeGTQwiMgpCAAwE6rmXOwxFPWuy8YLsZIXDv9cNPMYLf5Kr2pFNs33P2ctHz3JBOlY
 zeow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682223682; x=1684815682;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ILeEC45O4cCOmKoGJEqXwqlDpUW0IKc6Vq1tRoBknx4=;
 b=DIXlltVgXi3+/VSApQ9S5lsps5AfxevHf+YBN8h465zsPR0Wqd15nB1pELyqD0AMPR
 DILzFaAmh9+3GDget9kIMJdm7WJN8aEziVk7IFLVemh7VvbzX6y7nTerExm4PjlDWs2h
 SABbAzA2xTLbp4nSrOiosEbyrC0dh/NGm1uKbbC0gcVUg5ipqXLSHtko65LxMgyqxEmQ
 SHEVpEDwIU3Na3hG8eLln4MnLy3+hi3qeh0ZD2wklIBZxag/fnFfjL7Jp5Z2+h32B18E
 PDyfJITYzGeq9OJetDYyWm4uF9Jw6PsDk8O0JLXCwhQRlRXfaUZvHcTN6KtzEDrsHK5K
 DKCg==
X-Gm-Message-State: AAQBX9ccXidzeKsWTf7Zz4ByjAcwJatjg2DO1H6UMyfPn7VDuwVk4Dkw
 3YyE7wly4G42R1EhR2O2tCgwyA==
X-Google-Smtp-Source: AKy350YyGLeXGFlXJo3J6zIPmiXHWqn+QFq6UOGgGmZf2HL4K+L+hxgoOKoyq6ZXbwAw2oDz+hQu6g==
X-Received: by 2002:a17:902:d486:b0:1a6:98a4:e941 with SMTP id
 c6-20020a170902d48600b001a698a4e941mr12954519plg.2.1682223682579; 
 Sat, 22 Apr 2023 21:21:22 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 f1-20020a170902ff0100b001a5059861adsm4596996plj.224.2023.04.22.21.21.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Apr 2023 21:21:22 -0700 (PDT)
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
Subject: [PATCH v3 47/47] docs/system/devices/igb: Note igb is tested for DPDK
Date: Sun, 23 Apr 2023 13:18:33 +0900
Message-Id: <20230423041833.5302-48-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230423041833.5302-1-akihiko.odaki@daynix.com>
References: <20230423041833.5302-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::42d;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x42d.google.com
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


