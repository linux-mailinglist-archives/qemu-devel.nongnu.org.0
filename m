Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6EB459F8EB
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 13:59:09 +0200 (CEST)
Received: from localhost ([::1]:44244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQp2L-0003G8-0F
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 07:59:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1oQoGs-0003fD-7j
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 07:10:06 -0400
Received: from proxmox-new.maurer-it.com ([94.136.29.106]:5923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1oQoGj-0006wW-GL
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 07:10:05 -0400
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 616E343329;
 Wed, 24 Aug 2022 13:09:43 +0200 (CEST)
From: Fiona Ebner <f.ebner@proxmox.com>
To: qemu-devel@nongnu.org
Cc: dmitry.fleytman@gmail.com,
	jasowang@redhat.com,
	pjp@fedoraproject.org
Subject: [RFC] hw/net/vmxnet3: allow VMXNET3_MAX_MTU itself as a value
Date: Wed, 24 Aug 2022 13:08:45 +0200
Message-Id: <20220824110845.353435-1-f.ebner@proxmox.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=94.136.29.106; envelope-from=f.ebner@proxmox.com;
 helo=proxmox-new.maurer-it.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Fixes: d05dcd94ae ("net: vmxnet3: validate configuration values during activate (CVE-2021-20203)")
Signed-off-by: Fiona Ebner <f.ebner@proxmox.com>
---

I'm not familiar with this code, so really I'm asking: is the change
justified?

I tested the change and it seems to work, but I only have some rough
rationale for it, which is also why there's no commit message yet.

In the Linux kernel's net/core/dev.c, in dev_validate_mtu(), the upper
limit itself is a valid value:
    if (dev->max_mtu > 0 && new_mtu > dev->max_mtu) {
        NL_SET_ERR_MSG(extack, "mtu greater than device maximum");
        return -EINVAL;
    }
and AFAICT in the case of the vmxnet3 driver, max_mtu is set to
VMXNET3_MAX_MTU (as defined in the kernel, which is 9000, same as in
QEMU).

Reported by one of our users running into the failing assert():
https://forum.proxmox.com/threads/114011/#post-492916

 hw/net/vmxnet3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/vmxnet3.c b/hw/net/vmxnet3.c
index 0b7acf7f89..a2037583bf 100644
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



