Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFEA659F7B7
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 12:30:39 +0200 (CEST)
Received: from localhost ([::1]:46324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQneg-00018A-Tc
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 06:30:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oQmtx-000368-75
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 05:42:21 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:46997)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oQmtv-0001Wm-IV
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 05:42:20 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 o14-20020a17090a0a0e00b001fabfd3369cso945030pjo.5
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 02:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=vUeT/wlv8A0+FPAxIWhpLkds8vbnKER1tCflKpvf5G8=;
 b=PzRlwJvazkZj7n12AdnMyBlG7ks/Us4ip1yPTEujxhiiE5Aow3Nm1peAUmyG4GqjGp
 N4SfZ6v+haLM8Tk19j6rYZXOs892pk/yL7eGyXBRUs9X1XiTlo+JlJB8ODtOhY8tsejz
 jekGTi0w82h9M4iMcLRBkIbHEemCOp9lhuL1ZcknFZAkNk9o/MaRncpC/lNqQuRI4ZoA
 pT6I1cN0peG2GcxHHZjH8Shrjap+KWQxTFA2agA1WFSUsG44WMVnMt8WftzlkMaGXYbW
 m0WQ9k5FW0vyrcf6//QeagDypiRznPvbeaaqlBy/kGTCKSy7d0URYWPhFgr/GBoiXw/5
 kEWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=vUeT/wlv8A0+FPAxIWhpLkds8vbnKER1tCflKpvf5G8=;
 b=12woY32CJ15ibXlyY19WHEJ2bUAALWXdz5WAimIzIOLcDgWx3TDBGSocsTddn3j7J6
 aFD7K96JAe2BwE0+W+hpuVUTK+6beZOrQU5dB1x3IjJY3qFVGWQ3dHYHEMZFnGKvo2Dr
 ccQ78SrZ63lxmLrUUApRqo8O711MCtFOrIYl1yQFGgyHMQzuuicPZWUH+jT68OzMzsBp
 HbjSAsICtAfZlmmaTM5gAKrgx5Ce1j2Kh+uOjJlLsn6gjjQMHgWigom03BoNkm6K8Nkx
 3OF5ctxA+COHhgcOGJ6WESpjv34x5BLeqG3o7Vxfnh06gfQWfwQf/gsDONmNBW1yNofs
 AVrQ==
X-Gm-Message-State: ACgBeo06y8CHVB1Cm4XX/02AckdQvkBButC83Kc+ipU9hsY/yuUc7gUB
 rAKcZARKo5s84SarwCj+qtoJay2Cmak=
X-Google-Smtp-Source: AA6agR6WXSxdG5oVI2obxQdYSftfWrLhPr2fpJtSaHZf6l3g0vJutOD/Iq2EgIbEEZkNc27ddnNaTg==
X-Received: by 2002:a17:902:f542:b0:173:a8a:d7bf with SMTP id
 h2-20020a170902f54200b001730a8ad7bfmr4806063plf.134.1661334138698; 
 Wed, 24 Aug 2022 02:42:18 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a170903228e00b001728eb339e2sm12165972plh.286.2022.08.24.02.42.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 02:42:18 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Jason Wang <jasowang@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH 17/51] tests/qtest: Build virtio-net-test for posix only
Date: Wed, 24 Aug 2022 17:39:55 +0800
Message-Id: <20220824094029.1634519-18-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220824094029.1634519-1-bmeng.cn@gmail.com>
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

All of the virtio-net-test test cases require socketpair() to do the
test setup.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 tests/qtest/virtio-net-test.c | 6 ------
 tests/qtest/meson.build       | 3 +--
 2 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/tests/qtest/virtio-net-test.c b/tests/qtest/virtio-net-test.c
index 6ded252901..d44c3d9666 100644
--- a/tests/qtest/virtio-net-test.c
+++ b/tests/qtest/virtio-net-test.c
@@ -26,8 +26,6 @@
 #define QVIRTIO_NET_TIMEOUT_US (30 * 1000 * 1000)
 #define VNET_HDR_SIZE sizeof(struct virtio_net_hdr_mrg_rxbuf)
 
-#ifndef _WIN32
-
 static void rx_test(QVirtioDevice *dev,
                     QGuestAllocator *alloc, QVirtQueue *vq,
                     int socket)
@@ -165,8 +163,6 @@ static void stop_cont_test(void *obj, void *data, QGuestAllocator *t_alloc)
     rx_stop_cont_test(dev, t_alloc, rx, sv[0]);
 }
 
-#endif
-
 static void hotplug(void *obj, void *data, QGuestAllocator *t_alloc)
 {
     QVirtioPCIDevice *dev = obj;
@@ -324,10 +320,8 @@ static void register_virtio_net_test(void)
     };
 
     qos_add_test("hotplug", "virtio-net-pci", hotplug, &opts);
-#ifndef _WIN32
     qos_add_test("basic", "virtio-net", send_recv_test, &opts);
     qos_add_test("rx_stop_cont", "virtio-net", stop_cont_test, &opts);
-#endif
     qos_add_test("announce-self", "virtio-net", announce_self, &opts);
 
     /* These tests do not need a loopback backend.  */
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 9d0f82bf1c..72bb9e21f3 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -259,7 +259,6 @@ qos_test_ss.add(
   'usb-hcd-ohci-test.c',
   'virtio-test.c',
   'virtio-blk-test.c',
-  'virtio-net-test.c',
   'virtio-rng-test.c',
   'virtio-scsi-test.c',
   'virtio-serial-test.c',
@@ -267,7 +266,7 @@ qos_test_ss.add(
   'vmxnet3-test.c',
 )
 if config_host.has_key('CONFIG_POSIX')
-  qos_test_ss.add(files('e1000e-test.c'))
+  qos_test_ss.add(files('e1000e-test.c', 'virtio-net-test.c'))
 endif
 if have_virtfs
   qos_test_ss.add(files('virtio-9p-test.c'))
-- 
2.34.1


