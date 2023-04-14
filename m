Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 316116E22A0
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 13:50:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnHpx-0007GN-NR; Fri, 14 Apr 2023 07:43:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pnHnH-0005FE-9i
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 07:41:08 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pnHn8-00020d-1v
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 07:40:40 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 cm18-20020a17090afa1200b0024713adf69dso5816748pjb.3
 for <qemu-devel@nongnu.org>; Fri, 14 Apr 2023 04:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1681472430; x=1684064430;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ILeEC45O4cCOmKoGJEqXwqlDpUW0IKc6Vq1tRoBknx4=;
 b=nvRqNeKkuS0kVE2YObKph/t6yRfE1OJ6rUFgdTI7pWfrLxM1/sz596Me876+47zarq
 64yN6ZazTyNqbQlq0RkJKEYT/+fC+v8V1WhXyonpVsLLATrUoF7AJxevq+9JhC/GsZ9s
 0Nr7twydoPyFps2dAU4WIwE44C6zK9QmM5eEz3df25VZ6a9mn7zHh7fJ2I/8MYrv8YGq
 CB1A3P1MdSLvNnLeQq+CZucdE+PRlTjPRD7NRKHV8GbLA30kjOaypAk6kiLnwfljjthN
 Uzcfa5E3OZTO3MpMwgc5tpNs596tHR/N1l97/nFRB0WNb3OwRkPUO+8yW8P1BQtvOUjR
 dWqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681472430; x=1684064430;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ILeEC45O4cCOmKoGJEqXwqlDpUW0IKc6Vq1tRoBknx4=;
 b=B8ZAZvwj5yykpJTm384vkjCVcThzOEnifCjucIkVbZSOAzaVtZre+rVdlBX3K5WUEA
 id4Nf26RZRLmylZIryQg8BxrM3aJvRSUQdhbWPO4Q9YKEovv2B87I20i6RMmS7/ap4sZ
 lywah/L5xH8ILne3YvfLoLrWWbElSvCqNP1zacnWpBAIK0ZgcuL1/wnE3G6MFoMCUxha
 k72SB3OD/wc1UMuK4cf3rGiYV/uti1JkIsO51cM/3a1NexCPWlY+kPcKPLQCeqdYJXkk
 +hbzFSs5a+0QKP97+iBcUQrTKplKLRNBVxxkC5Hi7owpWdj9w8zxwr94VgDV1EOk7TKK
 HwAw==
X-Gm-Message-State: AAQBX9f/C+VPVpbRB9TuSZTNYuQ2luF9l0tQC8DdP9EEZhtn7TEQ9IPV
 NseBzrr4EJZ/LKcIs2sgwYXTaA==
X-Google-Smtp-Source: AKy350agM3DKZyrcznhnGuSncuQYq0Ff1cUSndVtPGyGGEJQ0eQ6uJPwJx+pjo69zbj3OORcPPEOYA==
X-Received: by 2002:a17:902:8c8f:b0:1a6:6f42:f5c0 with SMTP id
 t15-20020a1709028c8f00b001a66f42f5c0mr2300186plo.61.1681472430156; 
 Fri, 14 Apr 2023 04:40:30 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 u19-20020a170902a61300b001a20b31a23fsm2889249plq.293.2023.04.14.04.40.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Apr 2023 04:40:29 -0700 (PDT)
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
Subject: [PATCH 40/40] docs/system/devices/igb: Note igb is tested for DPDK
Date: Fri, 14 Apr 2023 20:37:37 +0900
Message-Id: <20230414113737.62803-41-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230414113737.62803-1-akihiko.odaki@daynix.com>
References: <20230414113737.62803-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1036;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1036.google.com
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


