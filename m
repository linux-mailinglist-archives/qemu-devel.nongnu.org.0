Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F36CF64C4DC
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 09:17:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5MwF-0000M1-2D; Wed, 14 Dec 2022 03:16:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liuxiangdong5@huawei.com>)
 id 1p5Mw6-0000GD-8V
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 03:16:19 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liuxiangdong5@huawei.com>)
 id 1p5Mw3-0000n2-11
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 03:16:17 -0500
Received: from kwepemi100025.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4NX7Sw3S9CzlW70;
 Wed, 14 Dec 2022 16:14:56 +0800 (CST)
Received: from [10.174.187.161] (10.174.187.161) by
 kwepemi100025.china.huawei.com (7.221.188.158) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Wed, 14 Dec 2022 16:15:54 +0800
To: <huangy81@chinatelecom.cn>
References: <3e937591a7c96bfb7bc9ac8da7b1e41ff06d7305.1668702822.git.huangy81@chinatelecom.cn>
Subject: Re: [PATCH v4 3/3] vhost-user: Fix the virtio features negotiation
 flaw
CC: <armbru@redhat.com>, <dgilbert@redhat.com>, <eblake@redhat.com>,
 <jasowang@redhat.com>, <lvivier@redhat.com>, <mst@redhat.com>,
 <pbonzini@redhat.com>, <qemu-devel@nongnu.org>,
 <raphael.norwitz@nutanix.com>, <sgarzare@redhat.com>, <thuth@redhat.com>,
 <tugy@chinatelecom.cn>, "Fangyi (Eric)" <eric.fangyi@huawei.com>,
 <yezengruan@huawei.com>, <liuxiangdong5@huawei.com>
Message-ID: <63998620.1030707@huawei.com>
Date: Wed, 14 Dec 2022 16:15:28 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:38.0) Gecko/20100101
 Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <3e937591a7c96bfb7bc9ac8da7b1e41ff06d7305.1668702822.git.huangy81@chinatelecom.cn>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.187.161]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi100025.china.huawei.com (7.221.188.158)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=liuxiangdong5@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Reply-to:  Liuxiangdong <liuxiangdong5@huawei.com>
From:  Liuxiangdong via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

QEMU will coredump when vm starts.

Using command line:

./build/qemu-system-x86_64 \
     -nodefaults \
     -m 4G \
     -machine pc-i440fx-4.1 \
     -accel kvm \
     -cpu host \
     -smp 4 \
     -device qemu-xhci -device usb-kbd -device usb-tablet \
     -drive if=none,id=linux,file=test.img,format=raw \
     -device virtio-blk-pci,drive=linux,disable-legacy=on \
     -vnc :0 \
     -d all \
     -D %dlog \
     -netdev tap,id=hostnet0,ifname=tap0,vhost=on,script=no,downscript=no \
     -device virtio-net-pci,netdev=hostnet0,id=net0,mac=52:54:00:6b:0d:a1 \
     -device cirrus-vga \
     -msg timestamp=on


And then:
qemu-system-x86_64: ../hw/net/vhost_net.c:149: 
vhost_net_save_acked_features: Assertion `nc->info->type == 
NET_CLIENT_DRIVER_VHOST_USER' failed.
Aborted (core dumped)

Because it may be a tap or vdpa besides vhost user when function 
"get_vhost_net(nc->peer)" returns ture.





From: liuxiangdong <liuxiangdong5@huawei.com>
Date: Mon, 5 Dec 2022 07:11:28 +0800
Subject: [PATCH] vhost_net: keep acked_feature only for
  NET_CLIENT_DRIVER_VHOST_USER

Keep acked_features in NetVhostUserState up-to-date by function 
vhost_net_save_acked_features
in function virtio_net_set_features. But nc->peer->info->type maybe 
NET_CLIENT_DRIVER_TAP or
NET_CLIENT_DRIVER_VHOST_VDPA besides NET_CLIENT_DRIVER_VHOST_USER.

Don't keep acked_features in other type now except 
NET_CLIENT_DRIVER_VHOST_USER

Fix:  vhost-user: Fix the virtio features negotiation flaw

Signed-off-by: liuxiangdong <liuxiangdong5@huawei.com>
---
  hw/net/vhost_net.c | 5 +++--
  1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
index a98575ffbc..bea053a742 100644
--- a/hw/net/vhost_net.c
+++ b/hw/net/vhost_net.c
@@ -143,8 +143,9 @@ uint64_t vhost_net_get_acked_features(VHostNetState 
*net)

  void vhost_net_save_acked_features(NetClientState *nc)
  {
-    assert(nc->info->type == NET_CLIENT_DRIVER_VHOST_USER);
-    vhost_user_save_acked_features(nc);
+    if (nc->info->type == NET_CLIENT_DRIVER_VHOST_USER) {
+        vhost_user_save_acked_features(nc);
+    }
  }

  static int vhost_net_get_fd(NetClientState *backend)
-- 
Gitee



