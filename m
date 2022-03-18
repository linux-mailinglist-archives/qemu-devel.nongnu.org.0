Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF30B4DDBA9
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 15:28:57 +0100 (CET)
Received: from localhost ([::1]:33830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVDb6-0003Ml-Mv
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 10:28:56 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.maximets@ovn.org>)
 id 1nVDDn-0003UY-92
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 10:04:51 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:38407)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.maximets@ovn.org>)
 id 1nVDDl-0000hj-FF
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 10:04:51 -0400
Received: (Authenticated sender: i.maximets@ovn.org)
 by mail.gandi.net (Postfix) with ESMTPSA id 253B660012;
 Fri, 18 Mar 2022 14:04:43 +0000 (UTC)
From: Ilya Maximets <i.maximets@ovn.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCH] vhost_net: Print feature masks in hex
Date: Fri, 18 Mar 2022 15:04:40 +0100
Message-Id: <20220318140440.596019-1-i.maximets@ovn.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=217.70.183.195; envelope-from=i.maximets@ovn.org;
 helo=relay3-d.mail.gandi.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 18 Mar 2022 10:21:24 -0400
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 Ilya Maximets <i.maximets@ovn.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"0x200000000" is much more readable than "8589934592".
The change saves one step (conversion) while debugging.

Signed-off-by: Ilya Maximets <i.maximets@ovn.org>
---
 hw/net/vhost_net.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
index 30379d2ca4..df0f050548 100644
--- a/hw/net/vhost_net.c
+++ b/hw/net/vhost_net.c
@@ -201,7 +201,7 @@ struct vhost_net *vhost_net_init(VhostNetOptions *options)
             net->dev.features &= ~(1ULL << VIRTIO_NET_F_MRG_RXBUF);
         }
         if (~net->dev.features & net->dev.backend_features) {
-            fprintf(stderr, "vhost lacks feature mask %" PRIu64
+            fprintf(stderr, "vhost lacks feature mask 0x%" PRIx64
                    " for backend\n",
                    (uint64_t)(~net->dev.features & net->dev.backend_features));
             goto fail;
@@ -213,7 +213,7 @@ struct vhost_net *vhost_net_init(VhostNetOptions *options)
     if (net->nc->info->type == NET_CLIENT_DRIVER_VHOST_USER) {
         features = vhost_user_get_acked_features(net->nc);
         if (~net->dev.features & features) {
-            fprintf(stderr, "vhost lacks feature mask %" PRIu64
+            fprintf(stderr, "vhost lacks feature mask 0x%" PRIx64
                     " for backend\n",
                     (uint64_t)(~net->dev.features & features));
             goto fail;
-- 
2.34.1


