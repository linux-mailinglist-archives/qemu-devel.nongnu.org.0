Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9169562E247
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 17:53:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovi7Y-0000vG-JL; Thu, 17 Nov 2022 11:52:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1ovi7T-0000qI-PK
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 11:52:07 -0500
Received: from prt-mail.chinatelecom.cn ([42.123.76.219] helo=chinatelecom.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1ovi7Q-0006u9-UF
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 11:52:07 -0500
HMM_SOURCE_IP: 172.18.0.48:51864.42162454
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-125.69.40.159 (unknown [172.18.0.48])
 by chinatelecom.cn (HERMES) with SMTP id A5DBE2800B5;
 Fri, 18 Nov 2022 00:51:51 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([125.69.40.159])
 by app0024 with ESMTP id adf9867cceb94adab56c32d29fbbd15d for
 qemu-devel@nongnu.org; Fri, 18 Nov 2022 00:51:56 CST
X-Transaction-ID: adf9867cceb94adab56c32d29fbbd15d
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 125.69.40.159
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: qemu-devel <qemu-devel@nongnu.org>
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 =?UTF-8?q?Hyman=20Huang=28=E9=BB=84=E5=8B=87=29?= <huangy81@chinatelecom.cn>
Subject: [PATCH v4 0/3] Fix the virtio features negotiation flaw 
Date: Fri, 18 Nov 2022 00:51:42 +0800
Message-Id: <cover.1668702822.git.huangy81@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.219;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>

v4:
-rebase on master
-add stub function to fix build errors
-code clean on [PATCH v2 1/2]: drop 'cleanup' parameter in
 vhost_user_save_acked_features.
-code clean on [PATCH v2 2/2]: make refactor of chr_closed_bh
 a standalone patch.

Above changes are suggested by Michael and thanks very much.

Please review,

Yong

v3:
-rebase on master
-code clean on [PATCH v2 1/2]: keep the commit self-consistent and
 do not modify the logic of saving acked_features. Just abstract the
 util function.
-modify the [PATCH v2 2/2] logic: change the behavior of saving
 acked_features in chr_closed_bh: saving acked_features only if
 features aren't 0. For the case of 0, we implement it in
 virtio_net_set_features function, which will save the acked_features
 in advance, including assign 0 to acked_features.

v2:
Fix the typo in subject of [PATCH v2 2/2] 

v1:
This is the version 1 of the series and it is exactly the same as
RFC version, but fixing a typo in subject, which is reported by Michael. 

As for test for the behavior suggested by Michael, IMHO, it could be
post in another series, since i found that testing the negotiation
behavior using QGraph Test Framework requires more work than i thought.

The test patch may implement the following logic...
1. Introduce a fresh new qmp command to query netdev info, which show
   the NetClient status including guest features and acked_features.
2. Using vhost-user QGraph Test to check the behavior of the vhost user
   protocol cmd VHOST_USER_SET_FEATURES. 
3. Adding acked_features into TestServer, which receive the features
   set by QEMU.
4. Compare the acked_feature in TestServer with the acked_features 
   in the output of qmp query command.

Patch for RFC can be found in the following:
https://patchew.org/QEMU/20220926063641.25038-1-huangy81@chinatelecom.cn/

This patchset aim to fix the unexpected negotiation features for
vhost-user netdev interface. 

Steps to reproduce the issue:
Prepare a vm (CentOS 8 in my work scenario) with vhost-user
backend interface and configure qemu as server mode. So dpdk
would connect qemu's unix socket periodically.

1. start vm in background and restart openvswitch service 
   concurrently and repeatedly in the process of vm start. 

2. check if negotiated virtio features of port is "0x40000000" at
   dpdk side by executing:
   ovs-vsctl list interface | grep features | grep {port_socket_path}
       
3. if features equals "0x40000000", go to the vm and check if sending 
   arp package works, executing:
   arping {IP_ADDR}
   if vm interface is configured to boot with dhcp protocol, it
   would get no ip. 

After doing above steps, we'll find the arping not work, the ovs on
host side has forwarded unexpected arp packages, which be added 0x0000
in the head of ethenet frame.  Though qemu report some error when
read/write cmd of vhost protocol during the process of vm start,
like the following:

"Failed to set msg fds"
"vhost VQ 0 ring restore failed: -22: Invalid argument (22)"

The vm does not stop or report more suggestive error message, it
seems that everthing is ok. 

The root cause is that dpdk port negotiated nothing but only one
VHOST_USER_F_PROTOCOL_FEATURES feature with vhost-user interface at
qemu side, which is an unexpected behavior. qemu only load the
VHOST_USER_F_PROTOCOL_FEATURES when VHOST_USER_SET_FEATURES and loss
the guest features configured by front-end virtio driver using the
VIRTIO_PCI_COMMON_GF addr, which is stored in acked_features field
of struct vhost_dev.

To explain how the acked_features disappear, we may need to know the
lifecyle of acked_features in vhost_dev during feature negotiation. 

1. qemu init acked_features field of struct vhost_dev in vhost_net_init()
   by calling vhost_net_ack_features(), the init value fetched from
   acked_features field of struct NetVhostUserState, which is the backup
   role after vhost stopping or unix socket closed.
   In the first time, the acked_features of struct NetVhostUserState is 0
   so the init value of vhost_dev's acked_features also 0. 

2. when guest virtio driver set features, qemu accept the features and
   call virtio_set_features to store the features as acked_features in
   vhost_dev.

3. when unix socket closed or vhost_dev device doesn't work and be
   stopped unexpectedly, qemu will call chr_closed_bh or vhost_user_stop,
   which will copy acked_features from vhost_dev to NetVhostUserState and
   cleanup the vhost_dev. Since virtio driver not allowed to set features
   once status of virtio device changes to VIRTIO_CONFIG_S_FEATURE_OK,
   qemu need to backup it in case of loss. 
    
4. once unix socket return to normal and get connected, qemu will
   call vhost_user_start to restore the vhost_dev and fetch the
   acked_features stored in NetVhostUserState previously. 

The above flow works fine in the normal scenarios, but it doesn't cover
the scenario that openvswitch service restart in the same time of
virtio features negotiation.

Let's analyze such scenario: 
       qemu                                 dpdk

   vhost_net_init()                          
         |                      systemctl stop openvswitch.service
   virtio_set_features()                     | 
         |                      systemctl start openvswitch.service
   virtio_set_status()                      

Ovs stop service before guset setting virtio features, chr_closed_bh()
be called and fetch acked_features in vhost_dev, if may store the
incomplete features to NetVhostUserState since it doesn't include
guest features, eg "0x40000000". 

Guest set virtio features with another features, eg "0x7060a782",
this value will store in acked_features of vhost_dev, which is the
right and up-to-date features.

After ovs service show up, qemu unix socket get connected and call
vhost_user_start(), which will restore acked_features of vhost_dev
using NetVhostUserState and "0x40000000" be loaded, which is obsolete.

Guest set virtio device status and therefore qemu call 
virtio_net_vhost_status finally, checking if vhost-net device has
started, start it if not, consequently the obsolete acked_features
"0x40000000" be negotiated after calling vhost_dev_set_features(). 

So the key point of solving this issue making the acked_features 
in NetVhostUserState up-to-date, these patchset provide this
solution.  

[PATCH 1/2]: Abstract the existing code of saving acked_features
             into vhost_user_save_acked_features so the next
             patch seems clean. 

[PATCH 2/2]: Save the acked_features to NetVhostUserState once
             Guest virtio driver configured. This step makes
             acked_features in NetVhostUserState up-to-date. 

Please review, any comments and suggestions are welcome. 

Best regard.

Yong

*** BLURB HERE ***

Hyman Huang (3):
  vhost-user: Refactor vhost acked features saving
  vhost-user: Refactor the chr_closed_bh
  vhost-user: Fix the virtio features negotiation flaw

 hw/net/vhost_net-stub.c  |  5 +++++
 hw/net/vhost_net.c       |  6 ++++++
 hw/net/virtio-net.c      |  6 ++++++
 include/net/vhost-user.h |  1 +
 include/net/vhost_net.h  |  2 ++
 net/vhost-user.c         | 27 ++++++++++++++++-----------
 6 files changed, 36 insertions(+), 11 deletions(-)

-- 
1.8.3.1


