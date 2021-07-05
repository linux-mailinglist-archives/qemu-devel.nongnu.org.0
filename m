Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD8003BB978
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 10:41:45 +0200 (CEST)
Received: from localhost ([::1]:33336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0KAi-00088y-Ot
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 04:41:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m0K9O-00079S-0u
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 04:40:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23248)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m0K9I-00055m-UN
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 04:40:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625474415;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=739BGhT/S22dZHAbNyIAUJ6Qz+I6opGAjS8tM4gSWXw=;
 b=HB6/II5sV8ayLiSN+GrgEFOurX3pIdboxJiMo4ifi+2+Ml3tJ+DbvhioHRHEfJXVGYbjo0
 rtTNg5KB5Gxe51uk7XNpm+7E0Zd886MhPcRfygZTym2+o5QK7meN3uKwRljk7ZmZ56AwiN
 FwgHLmtSvr97TZY7N9hf4d5GSSgN7KY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-493-3X4-6F7UOny-TuCpB7uW_g-1; Mon, 05 Jul 2021 04:40:14 -0400
X-MC-Unique: 3X4-6F7UOny-TuCpB7uW_g-1
Received: by mail-wm1-f72.google.com with SMTP id
 m5-20020a05600c3b05b029020c34fd31cfso245827wms.4
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 01:40:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=739BGhT/S22dZHAbNyIAUJ6Qz+I6opGAjS8tM4gSWXw=;
 b=BojzLyLDva9oVjQsQmvyME2rXgXaHokJxRPjAaDfFXzAwfA7QEacCErFTwMxxwbBlK
 1oeLq5oLJ/sjnLB/LuPGt/9birSYhBGuMio/XRljJSiBhuPL9YlW/ELfxss1+LnrBic5
 pxU3FtNlHnGxlsn7hhLCtQjjPeGBBWxIKLFoTgQ238s/OBMduFdhd0Pge2/OglPN4+W3
 fC3ArzpVG4HCU0deQxs+arBE2/LRwUL0Co6Kg0/ZTPQ/45f/OKC9jJsrD09FexpZzhri
 eX0XlnRHHJ4xnkvUrNuSclLvul8+2FLBB/+2a78/aDILhyuiJDc6lvqy5TYI5edYZf6H
 E2xQ==
X-Gm-Message-State: AOAM532sbWNZR2FMM4TDgPdqN5gP9g95VdqgmGzMrU0w8V+uWaykLt/a
 r7olAK5jgxozoey9Q5p8AcA70lEXdXjyQyQakAZmDaSIJiVwCwcJ36LKN0NKgUbIaCACDYUYn9U
 EYGrHjnCply4XoLiL4tCkZZQ1rWJHsJfsUyM3cg8/h1RpeclpgLraRAzHXFsMzBtu
X-Received: by 2002:adf:fe12:: with SMTP id n18mr14059295wrr.219.1625474413268; 
 Mon, 05 Jul 2021 01:40:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyFClVr3gER1V0BeARoQi/uE/lHsbCJd2hQb+7ZrTn34QiHIX4dp+CJqyhb7kAye2x/Jx9WyQ==
X-Received: by 2002:adf:fe12:: with SMTP id n18mr14059245wrr.219.1625474412830; 
 Mon, 05 Jul 2021 01:40:12 -0700 (PDT)
Received: from x1w.redhat.com (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id j1sm810146wms.7.2021.07.05.01.40.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jul 2021 01:40:12 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/net: Discard overly fragmented packets
Date: Mon,  5 Jul 2021 10:40:11 +0200
Message-Id: <20210705084011.814175-1-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.441,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Mauro Matteo Cascella <mcascell@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, Jason Wang <jasowang@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, Andrew Melnychenko <andrew@daynix.com>,
 Prasad J Pandit <ppandit@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Thomas Huth <thuth@redhat.com>, qemu-stable@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Our infrastructure can handle fragmented packets up to
NET_MAX_FRAG_SG_LIST (64) pieces. This hard limit has
been proven enough in production for years. If it is
reached, it is likely an evil crafted packet. Discard it.

Include the qtest reproducer provided by Alexander Bulekov:

  $ make check-qtest-i386
  ...
  Running test qtest-i386/fuzz-vmxnet3-test
  qemu-system-i386: net/eth.c:334: void eth_setup_ip4_fragmentation(const void *, size_t, void *, size_t, size_t, size_t, _Bool):
  Assertion `frag_offset % IP_FRAG_UNIT_SIZE == 0' failed.

Cc: qemu-stable@nongnu.org
Reported-by: OSS-Fuzz (Issue 35799)
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/460
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/net/net_tx_pkt.c             |   8 ++
 tests/qtest/fuzz-vmxnet3-test.c | 195 ++++++++++++++++++++++++++++++++
 MAINTAINERS                     |   1 +
 tests/qtest/meson.build         |   1 +
 4 files changed, 205 insertions(+)
 create mode 100644 tests/qtest/fuzz-vmxnet3-test.c

diff --git a/hw/net/net_tx_pkt.c b/hw/net/net_tx_pkt.c
index 1f9aa59eca2..77e9729a7ba 100644
--- a/hw/net/net_tx_pkt.c
+++ b/hw/net/net_tx_pkt.c
@@ -590,6 +590,14 @@ static bool net_tx_pkt_do_sw_fragmentation(struct NetTxPkt *pkt,
         fragment_len = net_tx_pkt_fetch_fragment(pkt, &src_idx, &src_offset,
             fragment, &dst_idx);
 
+        if (dst_idx == NET_MAX_FRAG_SG_LIST && fragment_len > 0) {
+            /*
+             * The packet is too fragmented for our infrastructure
+             * (not enough iovec), don't even try to send.
+             */
+            return false;
+        }
+
         more_frags = (fragment_offset + fragment_len < pkt->payload_len);
 
         eth_setup_ip4_fragmentation(l2_iov_base, l2_iov_len, l3_iov_base,
diff --git a/tests/qtest/fuzz-vmxnet3-test.c b/tests/qtest/fuzz-vmxnet3-test.c
new file mode 100644
index 00000000000..d69009bf5ce
--- /dev/null
+++ b/tests/qtest/fuzz-vmxnet3-test.c
@@ -0,0 +1,195 @@
+/*
+ * QTest testcase for vmxnet3 device generated by fuzzer
+ *
+ * Copyright Red Hat
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+
+#include "libqos/libqtest.h"
+
+/*
+ * https://gitlab.com/qemu-project/qemu/-/issues/460
+ */
+static void test_oss_35799_eth_setup_ip4_fragmentation(void)
+{
+    QTestState *s;
+
+    s = qtest_init("-machine q35 -m 32M -display none -nodefaults "
+                   "-device vmxnet3,netdev=net0 -netdev user,id=net0");
+    qtest_outl(s, 0xcf8, 0x80000814);
+    qtest_outl(s, 0xcfc, 0xe0000000);
+    qtest_outl(s, 0xcf8, 0x80000804);
+    qtest_outw(s, 0xcfc, 0x06);
+    qtest_outl(s, 0xcf8, 0x80000812);
+    qtest_outl(s, 0xcfc, 0x2000);
+    qtest_outl(s, 0xcf8, 0x80000815);
+    qtest_outb(s, 0xcfc, 0x40);
+    qtest_bufwrite(s, 0x0, "\xe1", 0x1);
+    qtest_bufwrite(s, 0x1, "\xfe", 0x1);
+    qtest_bufwrite(s, 0x2, "\xbe", 0x1);
+    qtest_bufwrite(s, 0x3, "\xba", 0x1);
+    qtest_bufwrite(s, 0x28, "\xff", 0x1);
+    qtest_bufwrite(s, 0x29, "\xff", 0x1);
+    qtest_bufwrite(s, 0x2a, "\xff", 0x1);
+    qtest_bufwrite(s, 0x2b, "\xff", 0x1);
+    qtest_bufwrite(s, 0x2c, "\xff", 0x1);
+    qtest_bufwrite(s, 0x2d, "\xff", 0x1);
+    qtest_bufwrite(s, 0x2e, "\xff", 0x1);
+    qtest_bufwrite(s, 0x2f, "\xff", 0x1);
+    qtest_bufwrite(s, 0x37, "\x40", 0x1);
+    qtest_bufwrite(s, 0x3e, "\x01", 0x1);
+    qtest_bufwrite(s, 0xe0004020, "\x00\x00\xfe\xca", 0x4);
+    qtest_bufwrite(s, 0x9, "\x40", 0x1);
+    qtest_bufwrite(s, 0xd, "\x10", 0x1);
+    qtest_bufwrite(s, 0x12, "\x10", 0x1);
+    qtest_bufwrite(s, 0x19, "\x40", 0x1);
+    qtest_bufwrite(s, 0x1b, "\x21", 0x1);
+    qtest_bufwrite(s, 0x1d, "\x0c", 0x1);
+    qtest_bufwrite(s, 0x2d, "\x00", 0x1);
+    qtest_bufwrite(s, 0x10000c, "\x08", 0x1);
+    qtest_bufwrite(s, 0x10000e, "\x45", 0x1);
+    qtest_bufwrite(s, 0x100017, "\x11", 0x1);
+    qtest_bufwrite(s, 0x20000600, "\x00", 0x1);
+    qtest_bufwrite(s, 0x38, "\x01", 0x1);
+    qtest_bufwrite(s, 0x39, "\x40", 0x1);
+    qtest_bufwrite(s, 0x48, "\x01", 0x1);
+    qtest_bufwrite(s, 0x49, "\x40", 0x1);
+    qtest_bufwrite(s, 0x58, "\x01", 0x1);
+    qtest_bufwrite(s, 0x59, "\x40", 0x1);
+    qtest_bufwrite(s, 0x68, "\x01", 0x1);
+    qtest_bufwrite(s, 0x69, "\x40", 0x1);
+    qtest_bufwrite(s, 0x78, "\x01", 0x1);
+    qtest_bufwrite(s, 0x79, "\x40", 0x1);
+    qtest_bufwrite(s, 0x88, "\x01", 0x1);
+    qtest_bufwrite(s, 0x89, "\x40", 0x1);
+    qtest_bufwrite(s, 0x98, "\x01", 0x1);
+    qtest_bufwrite(s, 0x99, "\x40", 0x1);
+    qtest_bufwrite(s, 0xa8, "\x01", 0x1);
+    qtest_bufwrite(s, 0xa9, "\x40", 0x1);
+    qtest_bufwrite(s, 0xb8, "\x01", 0x1);
+    qtest_bufwrite(s, 0xb9, "\x40", 0x1);
+    qtest_bufwrite(s, 0xc8, "\x01", 0x1);
+    qtest_bufwrite(s, 0xc9, "\x40", 0x1);
+    qtest_bufwrite(s, 0xd8, "\x01", 0x1);
+    qtest_bufwrite(s, 0xd9, "\x40", 0x1);
+    qtest_bufwrite(s, 0xe8, "\x01", 0x1);
+    qtest_bufwrite(s, 0xe9, "\x40", 0x1);
+    qtest_bufwrite(s, 0xf8, "\x01", 0x1);
+    qtest_bufwrite(s, 0xf9, "\x40", 0x1);
+    qtest_bufwrite(s, 0x108, "\x01", 0x1);
+    qtest_bufwrite(s, 0x109, "\x40", 0x1);
+    qtest_bufwrite(s, 0x118, "\x01", 0x1);
+    qtest_bufwrite(s, 0x119, "\x40", 0x1);
+    qtest_bufwrite(s, 0x128, "\x01", 0x1);
+    qtest_bufwrite(s, 0x129, "\x40", 0x1);
+    qtest_bufwrite(s, 0x138, "\x01", 0x1);
+    qtest_bufwrite(s, 0x139, "\x40", 0x1);
+    qtest_bufwrite(s, 0x148, "\x01", 0x1);
+    qtest_bufwrite(s, 0x149, "\x40", 0x1);
+    qtest_bufwrite(s, 0x158, "\x01", 0x1);
+    qtest_bufwrite(s, 0x159, "\x40", 0x1);
+    qtest_bufwrite(s, 0x168, "\x01", 0x1);
+    qtest_bufwrite(s, 0x169, "\x40", 0x1);
+    qtest_bufwrite(s, 0x178, "\x01", 0x1);
+    qtest_bufwrite(s, 0x179, "\x40", 0x1);
+    qtest_bufwrite(s, 0x188, "\x01", 0x1);
+    qtest_bufwrite(s, 0x189, "\x40", 0x1);
+    qtest_bufwrite(s, 0x198, "\x01", 0x1);
+    qtest_bufwrite(s, 0x199, "\x40", 0x1);
+    qtest_bufwrite(s, 0x1a8, "\x01", 0x1);
+    qtest_bufwrite(s, 0x1a9, "\x40", 0x1);
+    qtest_bufwrite(s, 0x1b8, "\x01", 0x1);
+    qtest_bufwrite(s, 0x1b9, "\x40", 0x1);
+    qtest_bufwrite(s, 0x1c8, "\x01", 0x1);
+    qtest_bufwrite(s, 0x1c9, "\x40", 0x1);
+    qtest_bufwrite(s, 0x1d8, "\x01", 0x1);
+    qtest_bufwrite(s, 0x1d9, "\x40", 0x1);
+    qtest_bufwrite(s, 0x1e8, "\x01", 0x1);
+    qtest_bufwrite(s, 0x1e9, "\x40", 0x1);
+    qtest_bufwrite(s, 0x1f8, "\x01", 0x1);
+    qtest_bufwrite(s, 0x1f9, "\x40", 0x1);
+    qtest_bufwrite(s, 0x208, "\x01", 0x1);
+    qtest_bufwrite(s, 0x209, "\x40", 0x1);
+    qtest_bufwrite(s, 0x218, "\x01", 0x1);
+    qtest_bufwrite(s, 0x219, "\x40", 0x1);
+    qtest_bufwrite(s, 0x228, "\x01", 0x1);
+    qtest_bufwrite(s, 0x229, "\x40", 0x1);
+    qtest_bufwrite(s, 0x238, "\x01", 0x1);
+    qtest_bufwrite(s, 0x239, "\x40", 0x1);
+    qtest_bufwrite(s, 0x248, "\x01", 0x1);
+    qtest_bufwrite(s, 0x249, "\x40", 0x1);
+    qtest_bufwrite(s, 0x258, "\x01", 0x1);
+    qtest_bufwrite(s, 0x259, "\x40", 0x1);
+    qtest_bufwrite(s, 0x268, "\x01", 0x1);
+    qtest_bufwrite(s, 0x269, "\x40", 0x1);
+    qtest_bufwrite(s, 0x278, "\x01", 0x1);
+    qtest_bufwrite(s, 0x279, "\x40", 0x1);
+    qtest_bufwrite(s, 0x288, "\x01", 0x1);
+    qtest_bufwrite(s, 0x289, "\x40", 0x1);
+    qtest_bufwrite(s, 0x298, "\x01", 0x1);
+    qtest_bufwrite(s, 0x299, "\x40", 0x1);
+    qtest_bufwrite(s, 0x2a8, "\x01", 0x1);
+    qtest_bufwrite(s, 0x2a9, "\x40", 0x1);
+    qtest_bufwrite(s, 0x2b8, "\x01", 0x1);
+    qtest_bufwrite(s, 0x2b9, "\x40", 0x1);
+    qtest_bufwrite(s, 0x2c8, "\x01", 0x1);
+    qtest_bufwrite(s, 0x2c9, "\x40", 0x1);
+    qtest_bufwrite(s, 0x2d8, "\x01", 0x1);
+    qtest_bufwrite(s, 0x2d9, "\x40", 0x1);
+    qtest_bufwrite(s, 0x2e8, "\x01", 0x1);
+    qtest_bufwrite(s, 0x2e9, "\x40", 0x1);
+    qtest_bufwrite(s, 0x2f8, "\x01", 0x1);
+    qtest_bufwrite(s, 0x2f9, "\x40", 0x1);
+    qtest_bufwrite(s, 0x308, "\x01", 0x1);
+    qtest_bufwrite(s, 0x309, "\x40", 0x1);
+    qtest_bufwrite(s, 0x318, "\x01", 0x1);
+    qtest_bufwrite(s, 0x319, "\x40", 0x1);
+    qtest_bufwrite(s, 0x328, "\x01", 0x1);
+    qtest_bufwrite(s, 0x329, "\x40", 0x1);
+    qtest_bufwrite(s, 0x338, "\x01", 0x1);
+    qtest_bufwrite(s, 0x339, "\x40", 0x1);
+    qtest_bufwrite(s, 0x348, "\x01", 0x1);
+    qtest_bufwrite(s, 0x349, "\x40", 0x1);
+    qtest_bufwrite(s, 0x358, "\x01", 0x1);
+    qtest_bufwrite(s, 0x359, "\x40", 0x1);
+    qtest_bufwrite(s, 0x368, "\x01", 0x1);
+    qtest_bufwrite(s, 0x369, "\x40", 0x1);
+    qtest_bufwrite(s, 0x378, "\x01", 0x1);
+    qtest_bufwrite(s, 0x379, "\x40", 0x1);
+    qtest_bufwrite(s, 0x388, "\x01", 0x1);
+    qtest_bufwrite(s, 0x389, "\x40", 0x1);
+    qtest_bufwrite(s, 0x398, "\x01", 0x1);
+    qtest_bufwrite(s, 0x399, "\x40", 0x1);
+    qtest_bufwrite(s, 0x3a8, "\x01", 0x1);
+    qtest_bufwrite(s, 0x3a9, "\x40", 0x1);
+    qtest_bufwrite(s, 0x3b8, "\x01", 0x1);
+    qtest_bufwrite(s, 0x3b9, "\x40", 0x1);
+    qtest_bufwrite(s, 0x3c8, "\x01", 0x1);
+    qtest_bufwrite(s, 0x3c9, "\x40", 0x1);
+    qtest_bufwrite(s, 0x3d8, "\x01", 0x1);
+    qtest_bufwrite(s, 0x3d9, "\x40", 0x1);
+    qtest_bufwrite(s, 0x3e8, "\x01", 0x1);
+    qtest_bufwrite(s, 0x3e9, "\x40", 0x1);
+    qtest_bufwrite(s, 0x3f8, "\x01", 0x1);
+    qtest_bufwrite(s, 0x3f9, "\x40", 0x1);
+    qtest_bufwrite(s, 0xd, "\x10", 0x1);
+    qtest_bufwrite(s, 0x20000600, "\x00", 0x1);
+    qtest_quit(s);
+}
+
+int main(int argc, char **argv)
+{
+    const char *arch = qtest_get_arch();
+
+    g_test_init(&argc, &argv, NULL);
+
+    if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
+        qtest_add_func("fuzz/test_oss_35799_eth_setup_ip4_fragmentation",
+                       test_oss_35799_eth_setup_ip4_fragmentation);
+    }
+
+    return g_test_run();
+}
diff --git a/MAINTAINERS b/MAINTAINERS
index cb8f3ea2c2e..43e5050ad96 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2001,6 +2001,7 @@ S: Maintained
 F: hw/net/vmxnet*
 F: hw/scsi/vmw_pvscsi*
 F: tests/qtest/vmxnet3-test.c
+F: tests/qtest/fuzz-vmxnet3-test.c
 
 Rocker
 M: Jiri Pirko <jiri@resnulli.us>
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index b03e8541700..42add92e9d4 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -66,6 +66,7 @@
   (config_all_devices.has_key('CONFIG_TPM_TIS_ISA') ? ['tpm-tis-swtpm-test'] : []) +        \
   (config_all_devices.has_key('CONFIG_RTL8139_PCI') ? ['rtl8139-test'] : []) +              \
   (config_all_devices.has_key('CONFIG_E1000E_PCI_EXPRESS') ? ['fuzz-e1000e-test'] : []) +   \
+  (config_all_devices.has_key('CONFIG_VMXNET3_PCI') ? ['fuzz-vmxnet3-test'] : []) +   \
   (config_all_devices.has_key('CONFIG_ESP_PCI') ? ['am53c974-test'] : []) +                 \
   qtests_pci +                                                                              \
   ['fdc-test',
-- 
2.31.1


