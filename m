Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E306E15EB
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Apr 2023 22:35:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pn3c0-0003io-EZ; Thu, 13 Apr 2023 16:32:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pn3bu-0003fo-2v; Thu, 13 Apr 2023 16:32:03 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pn3bo-0003iA-7g; Thu, 13 Apr 2023 16:32:01 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 7B1F540126;
 Thu, 13 Apr 2023 23:31:52 +0300 (MSK)
Received: from tls.msk.ru (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with SMTP id 109A295;
 Thu, 13 Apr 2023 23:31:51 +0300 (MSK)
Received: (nullmailer pid 2344331 invoked by uid 1000);
 Thu, 13 Apr 2023 20:31:51 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, Fiona Ebner <f.ebner@proxmox.com>,
 Jason Wang <jasowang@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>
Subject: [PATCH 03/21] hw/net/vmxnet3: allow VMXNET3_MAX_MTU itself as a value
Date: Thu, 13 Apr 2023 23:31:15 +0300
Message-Id: <20230413203143.2344250-3-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230413203051.2344192-1-mjt@tls.msk.ru>
References: <20230413203051.2344192-1-mjt@tls.msk.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
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

From: Fiona Ebner <f.ebner@proxmox.com>

Currently, VMXNET3_MAX_MTU itself (being 9000) is not considered a
valid value for the MTU, but a guest running ESXi 7.0 might try to
set it and fail the assert [0].

In the Linux kernel, dev->max_mtu itself is a valid value for the MTU
and for the vmxnet3 driver it's 9000, so a guest running Linux will
also fail the assert when trying to set an MTU of 9000.

VMXNET3_MAX_MTU and s->mtu don't seem to be used in relation to buffer
allocations/accesses, so allowing the upper limit itself as a value
should be fine.

[0]: https://forum.proxmox.com/threads/114011/

Fixes: d05dcd94ae ("net: vmxnet3: validate configuration values during activate (CVE-2021-20203)")
Signed-off-by: Fiona Ebner <f.ebner@proxmox.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
(cherry picked from commit 099a63828130843741d317cb28e936f468b2b53b)
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/net/vmxnet3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/vmxnet3.c b/hw/net/vmxnet3.c
index d2ab527ef4..56559cda24 100644
--- a/hw/net/vmxnet3.c
+++ b/hw/net/vmxnet3.c
@@ -1441,7 +1441,7 @@ static void vmxnet3_activate_device(VMXNET3State *s)
     vmxnet3_setup_rx_filtering(s);
     /* Cache fields from shared memory */
     s->mtu = VMXNET3_READ_DRV_SHARED32(d, s->drv_shmem, devRead.misc.mtu);
-    assert(VMXNET3_MIN_MTU <= s->mtu && s->mtu < VMXNET3_MAX_MTU);
+    assert(VMXNET3_MIN_MTU <= s->mtu && s->mtu <= VMXNET3_MAX_MTU);
     VMW_CFPRN("MTU is %u", s->mtu);
 
     s->max_rx_frags =
-- 
2.30.2


