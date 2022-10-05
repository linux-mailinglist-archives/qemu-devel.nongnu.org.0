Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A435F50BB
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Oct 2022 10:20:09 +0200 (CEST)
Received: from localhost ([::1]:37594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofzdQ-0008Tq-5G
	for lists+qemu-devel@lfdr.de; Wed, 05 Oct 2022 04:20:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1ofzbC-00073S-CK
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 04:17:50 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.219]:49704
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1ofzb9-0004y9-Nu
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 04:17:50 -0400
HMM_SOURCE_IP: 172.18.0.218:46232.830128540
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-118.116.19.226 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id AC1DC2800AC;
 Wed,  5 Oct 2022 16:17:32 +0800 (CST)
X-189-SAVE-TO-SEND: huangy81@chinatelecom.cn
Received: from  ([118.116.19.226])
 by app0025 with ESMTP id fb1f5bd2c77c4f3c88e1f9be902a0194 for
 qemu-devel@nongnu.org; Wed, 05 Oct 2022 16:17:34 CST
X-Transaction-ID: fb1f5bd2c77c4f3c88e1f9be902a0194
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 118.116.19.226
X-MEDUSA-Status: 0
Message-ID: <fddba10c-5b3e-c166-d464-8c7cc2ac7ffc@chinatelecom.cn>
Date: Wed, 5 Oct 2022 16:17:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 0/2] Fix the virito features negotiation flaw
To: qemu-devel <qemu-devel@nongnu.org>
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
 tugy@chinatelecom.cn, baiyw2@chinatelecom.cn, dengpc12@chinatelecom.cn,
 liuym16@chinatelecom.cn, yangchg@chinatelecom.cn, yuanmh12@chinatelecom.cn,
 zhoupx@chinatelecom.cn, lic121@chinatelecom.cn
References: <20220926063641.25038-1-huangy81@chinatelecom.cn>
From: Hyman Huang <huangy81@chinatelecom.cn>
In-Reply-To: <20220926063641.25038-1-huangy81@chinatelecom.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.219;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.449,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping,
    Hi, Michael and Jason, how does this patchset feel think? :)
    Sorry if i made noise.

Yong

在 2022/9/26 14:36, huangy81@chinatelecom.cn 写道:
> From: "Hyman Huang(黄勇)" <huangy81@chinatelecom.cn>
> 
> This patchset aim to fix the unexpected negotiation features for
> vhost-user netdev interface.
> 
> Steps to reproduce the issue:
> Prepare a vm (CentOS 8 in my work scenario) with vhost-user
> backend interface and configure qemu as server mode. So dpdk
> would connect qemu's unix socket periodically.
> 
> 1. start vm in background and restart openvswitch service
>     concurrently and repeatedly in the process of vm start.
> 
> 2. check if negotiated virtio features of port is "0x40000000" at
>     dpdk side by executing:
>     ovs-vsctl list interface | grep features | grep {port_socket_path}
>         
> 3. if features equals "0x40000000", go to the vm and check if sending
>     arp package works, executing:
>     arping {IP_ADDR}
>     if vm interface is configured to boot with dhcp protocol, it
>     would get no ip.
> 
> After doing above steps, we'll find the arping not work, the ovs on
> host side has forwarded unexpected arp packages, which be added 0x0000
> in the head of ethenet frame.  Though qemu report some error when
> read/write cmd of vhost protocol during the process of vm start,
> like the following:
> 
> "Failed to set msg fds"
> "vhost VQ 0 ring restore failed: -22: Invalid argument (22)"
> 
> The vm does not stop or report more suggestive error message, it
> seems that everthing is ok.
> 
> The root cause is that dpdk port negotiated nothing but only one
> VHOST_USER_F_PROTOCOL_FEATURES feature with vhost-user interface at
> qemu side, which is an unexpected behavior. qemu only load the
> VHOST_USER_F_PROTOCOL_FEATURES when VHOST_USER_SET_FEATURES and loss
> the guest features configured by front-end virtio driver using the
> VIRTIO_PCI_COMMON_GF addr, which is stored in acked_features field
> of struct vhost_dev.
> 
> To explain how the acked_features disappear, we may need to know the
> lifecyle of acked_features in vhost_dev during feature negotiation.
> 
> 1. qemu init acked_features field of struct vhost_dev in vhost_net_init()
>     by calling vhost_net_ack_features(), the init value fetched from
>     acked_features field of struct NetVhostUserState, which is the backup
>     role after vhost stopping or unix socket closed.
>     In the first time, the acked_features of struct NetVhostUserState is 0
>     so the init value of vhost_dev's acked_features also 0.
> 
> 2. when guest virtio driver set features, qemu accept the features and
>     call virtio_set_features to store the features as acked_features in
>     vhost_dev.
> 
> 3. when unix socket closed or vhost_dev device doesn't work and be
>     stopped unexpectedly, qemu will call chr_closed_bh or vhost_user_stop,
>     which will copy acked_features from vhost_dev to NetVhostUserState and
>     cleanup the vhost_dev. Since virtio driver not allowed to set features
>     once status of virtio device changes to VIRTIO_CONFIG_S_FEATURE_OK,
>     qemu need to backup it in case of loss.
>      
> 4. once unix socket return to normal and get connected, qemu will
>     call vhost_user_start to restore the vhost_dev and fetch the
>     acked_features stored in NetVhostUserState previously.
> 
> The above flow works fine in the normal scenarios, but it doesn't cover
> the scenario that openvswitch service restart in the same time of
> virtio features negotiation.
> 
> Let's analyze such scenario:
>         qemu                                 dpdk
> 
>     vhost_net_init()
>           |                      systemctl stop openvswitch.service
>     virtio_set_features()                     |
>           |                      systemctl start openvswitch.service
>     virtio_set_status()
> 
> Ovs stop service before guset setting virtio features, chr_closed_bh()
> be called and fetch acked_features in vhost_dev, if may store the
> incomplete features to NetVhostUserState since it doesn't include
> guest features, eg "0x40000000".
> 
> Guest set virtio features with another features, eg "0x7060a782",
> this value will store in acked_features of vhost_dev, which is the
> right and up-to-date features.
> 
> After ovs service show up, qemu unix socket get connected and call
> vhost_user_start(), which will restore acked_features of vhost_dev
> using NetVhostUserState and "0x40000000" be loaded, which is obsolete.
> 
> Guest set virtio device status and therefore qemu call
> virtio_net_vhost_status finally, checking if vhost-net device has
> started, start it if not, consequently the obsolete acked_features
> "0x40000000" be negotiated after calling vhost_dev_set_features().
> 
> So the key point of solving this issue making the acked_features
> in NetVhostUserState up-to-date, these patchset provide this
> solution.
> 
> [PATCH 1/2]: Abstract the existing code of saving acked_features
>               into vhost_user_save_acked_features so the next
>               patch seems clean.
> 
> [PATCH 2/2]: Save the acked_features to NetVhostUserState once
>               Guest virtio driver configured. This step makes
>               acked_features in NetVhostUserState up-to-date.
> 
> Please review, any comments and suggestions are welcome.
> 
> Best regard.
> 
> Yong
> 
> Hyman Huang (2):
>    vhost-user: Refactor vhost acked features saving
>    vhost-net: Fix the virito features negotiation flaw
> 
>   hw/net/vhost_net.c       |  9 +++++++++
>   hw/net/virtio-net.c      |  5 +++++
>   include/net/vhost-user.h |  2 ++
>   include/net/vhost_net.h  |  2 ++
>   net/vhost-user.c         | 35 +++++++++++++++++++----------------
>   5 files changed, 37 insertions(+), 16 deletions(-)
> 

-- 
Best regard

Hyman Huang(黄勇)

