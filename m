Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB6B64C52B
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 09:39:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5N3s-0005uX-0Q; Wed, 14 Dec 2022 03:24:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1p5N3n-0005tp-6E
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 03:24:15 -0500
Received: from prt-mail.chinatelecom.cn ([42.123.76.226] helo=chinatelecom.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1p5N3k-00067N-Bg
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 03:24:14 -0500
HMM_SOURCE_IP: 172.18.0.48:48024.124070021
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-125.69.42.1 (unknown [172.18.0.48])
 by chinatelecom.cn (HERMES) with SMTP id 310CC280097;
 Wed, 14 Dec 2022 16:23:51 +0800 (CST)
X-189-SAVE-TO-SEND: huangy81@chinatelecom.cn
Received: from  ([125.69.42.1])
 by app0024 with ESMTP id e15cc3f82791484a98db0e33121b5925 for
 liuxiangdong5@huawei.com; Wed, 14 Dec 2022 16:24:00 CST
X-Transaction-ID: e15cc3f82791484a98db0e33121b5925
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 125.69.42.1
X-MEDUSA-Status: 0
Message-ID: <f22dfe64-730b-07d0-6b1f-42d1c0ffe1ae@chinatelecom.cn>
Date: Wed, 14 Dec 2022 16:23:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v4 3/3] vhost-user: Fix the virtio features negotiation
 flaw
To: Liuxiangdong <liuxiangdong5@huawei.com>
Cc: armbru@redhat.com, dgilbert@redhat.com, eblake@redhat.com,
 jasowang@redhat.com, lvivier@redhat.com, mst@redhat.com,
 pbonzini@redhat.com, qemu-devel@nongnu.org, raphael.norwitz@nutanix.com,
 sgarzare@redhat.com, thuth@redhat.com, tugy@chinatelecom.cn,
 "Fangyi (Eric)" <eric.fangyi@huawei.com>, yezengruan@huawei.com
References: <3e937591a7c96bfb7bc9ac8da7b1e41ff06d7305.1668702822.git.huangy81@chinatelecom.cn>
 <63998620.1030707@huawei.com>
From: Hyman Huang <huangy81@chinatelecom.cn>
In-Reply-To: <63998620.1030707@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.226;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Thanks xiangdong for the testing and reporting, indeed, vhost-user 
negotiaion features saving only apply on dpdk interface, vhost-net and 
vdpa interface can be ingored. I'll apply it next version.

Yong

在 2022/12/14 16:15, Liuxiangdong 写道:
> QEMU will coredump when vm starts.
> 
> Using command line:
> 
> ./build/qemu-system-x86_64 \
>      -nodefaults \
>      -m 4G \
>      -machine pc-i440fx-4.1 \
>      -accel kvm \
>      -cpu host \
>      -smp 4 \
>      -device qemu-xhci -device usb-kbd -device usb-tablet \
>      -drive if=none,id=linux,file=test.img,format=raw \
>      -device virtio-blk-pci,drive=linux,disable-legacy=on \
>      -vnc :0 \
>      -d all \
>      -D %dlog \
>      -netdev tap,id=hostnet0,ifname=tap0,vhost=on,script=no,downscript=no \
>      -device virtio-net-pci,netdev=hostnet0,id=net0,mac=52:54:00:6b:0d:a1 \
>      -device cirrus-vga \
>      -msg timestamp=on
> 
> 
> And then:
> qemu-system-x86_64: ../hw/net/vhost_net.c:149: 
> vhost_net_save_acked_features: Assertion `nc->info->type == 
> NET_CLIENT_DRIVER_VHOST_USER' failed.
> Aborted (core dumped)
> 
> Because it may be a tap or vdpa besides vhost user when function 
> "get_vhost_net(nc->peer)" returns ture.
> 
> 
> 
> 
> 
> From: liuxiangdong <liuxiangdong5@huawei.com>
> Date: Mon, 5 Dec 2022 07:11:28 +0800
> Subject: [PATCH] vhost_net: keep acked_feature only for
>   NET_CLIENT_DRIVER_VHOST_USER
> 
> Keep acked_features in NetVhostUserState up-to-date by function 
> vhost_net_save_acked_features
> in function virtio_net_set_features. But nc->peer->info->type maybe 
> NET_CLIENT_DRIVER_TAP or
> NET_CLIENT_DRIVER_VHOST_VDPA besides NET_CLIENT_DRIVER_VHOST_USER.
> 
> Don't keep acked_features in other type now except 
> NET_CLIENT_DRIVER_VHOST_USER
> 
> Fix:  vhost-user: Fix the virtio features negotiation flaw
> 
> Signed-off-by: liuxiangdong <liuxiangdong5@huawei.com>
> ---
>   hw/net/vhost_net.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> index a98575ffbc..bea053a742 100644
> --- a/hw/net/vhost_net.c
> +++ b/hw/net/vhost_net.c
> @@ -143,8 +143,9 @@ uint64_t vhost_net_get_acked_features(VHostNetState 
> *net)
> 
>   void vhost_net_save_acked_features(NetClientState *nc)
>   {
> -    assert(nc->info->type == NET_CLIENT_DRIVER_VHOST_USER);
> -    vhost_user_save_acked_features(nc);
> +    if (nc->info->type == NET_CLIENT_DRIVER_VHOST_USER) {
> +        vhost_user_save_acked_features(nc);
> +    }
>   }
> 
>   static int vhost_net_get_fd(NetClientState *backend)

-- 
Best regard

Hyman Huang(黄勇)

