Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2606E136A
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Apr 2023 19:23:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pn0dZ-0003CR-LH; Thu, 13 Apr 2023 13:21:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pn0dX-0003CI-SL
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 13:21:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pn0d9-0001dZ-R7
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 13:21:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681406466;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=WoTR/eqzUD2JElMdId6U3MF9cQSmNXlCOb4CgYSr3Rk=;
 b=VOvWQiOWW0ARNAKZCYoJeJcTB2CQAFfGoWC6xESzRBAzyqyD2wJlRku8wkWRSCl7cB6LKB
 tXXB4DNEtE+WoEcNtkxwFYdnXBMYStG4w2/Hoi2soxiNV4Klous3LA5GDLSqVVB+92GQHi
 VSNOTzNYthWJxXsVUOCkC41wU2vUbHU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-41-z4O1COBbPyWXwZq4mwwyBA-1; Thu, 13 Apr 2023 13:21:03 -0400
X-MC-Unique: z4O1COBbPyWXwZq4mwwyBA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 46E2585542A;
 Thu, 13 Apr 2023 17:21:01 +0000 (UTC)
Received: from localhost (unknown [10.39.192.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CF96540C6E70;
 Thu, 13 Apr 2023 17:21:00 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH] rtl8139: fix large_send_mss divide-by-zero
Date: Thu, 13 Apr 2023 13:19:46 -0400
Message-Id: <20230413171946.2865726-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

If the driver sets large_send_mss to 0 then a divide-by-zero occurs.
Even if the division wasn't a problem, the for loop that emits MSS-sized
packets would never terminate.

Solve these issues by skipping offloading when large_send_mss=0.

This issue was found by OSS-Fuzz as part of Alexander Bulekov's device
fuzzing work. The reproducer is:

  $ cat << EOF | ./qemu-system-i386 -display none -machine accel=qtest, -m \
  512M,slots=1,maxmem=0xffff000000000000 -machine q35 -nodefaults -device \
  rtl8139,netdev=net0 -netdev user,id=net0 -device \
  pc-dimm,id=nv1,memdev=mem1,addr=0xb800a64602800000 -object \
  memory-backend-ram,id=mem1,size=2M  -qtest stdio
  outl 0xcf8 0x80000814
  outl 0xcfc 0xe0000000
  outl 0xcf8 0x80000804
  outw 0xcfc 0x06
  write 0xe0000037 0x1 0x04
  write 0xe00000e0 0x2 0x01
  write 0x1 0x1 0x04
  write 0x3 0x1 0x98
  write 0xa 0x1 0x8c
  write 0xb 0x1 0x02
  write 0xc 0x1 0x46
  write 0xd 0x1 0xa6
  write 0xf 0x1 0xb8
  write 0xb800a646028c000c 0x1 0x08
  write 0xb800a646028c000e 0x1 0x47
  write 0xb800a646028c0010 0x1 0x02
  write 0xb800a646028c0017 0x1 0x06
  write 0xb800a646028c0036 0x1 0x80
  write 0xe00000d9 0x1 0x40
  EOF

Buglink: https://gitlab.com/qemu-project/qemu/-/issues/1582
Fixes: 6d71357a3b65 ("rtl8139: honor large send MSS value")
Reported-by: Alexander Bulekov <alxndr@bu.edu>
Cc: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/net/rtl8139.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/net/rtl8139.c b/hw/net/rtl8139.c
index 5a5aaf868d..5f1a4d359b 100644
--- a/hw/net/rtl8139.c
+++ b/hw/net/rtl8139.c
@@ -2154,6 +2154,9 @@ static int rtl8139_cplus_transmit_one(RTL8139State *s)
 
                 int large_send_mss = (txdw0 >> CP_TC_LGSEN_MSS_SHIFT) &
                                      CP_TC_LGSEN_MSS_MASK;
+                if (large_send_mss == 0) {
+                    goto skip_offload;
+                }
 
                 DPRINTF("+++ C+ mode offloaded task TSO IP data %d "
                     "frame data %d specified MSS=%d\n",
-- 
2.39.2


