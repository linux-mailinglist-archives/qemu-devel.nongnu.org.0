Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D5CD33068B
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 04:52:00 +0100 (CET)
Received: from localhost ([::1]:54556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJ6w3-0007ZO-En
	for lists+qemu-devel@lfdr.de; Sun, 07 Mar 2021 22:51:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lJ6t4-0006oT-GP
 for qemu-devel@nongnu.org; Sun, 07 Mar 2021 22:48:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lJ6t1-0004ye-VK
 for qemu-devel@nongnu.org; Sun, 07 Mar 2021 22:48:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615175329;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OhkRzQzeRj0zW89HID/a4cHu8LqHa5SNx5be9C/6wJM=;
 b=ELzaA3HP9Xk/hTbRPOw6x1nfAfhjlh3kBD22BXMwMirP1ZAjjz4rLVEmhA9MsTpCizPd7b
 fmJerQiHdgItCQz17U/7VFFCIz4EWlR3H/cZSV8zXOWhSqhIWAMtSac01wecAl+L3EemiN
 Qt06Jo4HUnm+zgKV0duaCxtVNqQr5Bw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-11-R6i29BV0O9GSBO6AnPZddQ-1; Sun, 07 Mar 2021 22:48:46 -0500
X-MC-Unique: R6i29BV0O9GSBO6AnPZddQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 93E3C814314;
 Mon,  8 Mar 2021 03:48:44 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-13-193.pek2.redhat.com
 [10.72.13.193])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4976E196E3;
 Mon,  8 Mar 2021 03:48:40 +0000 (UTC)
Subject: Re: [RFC PATCH v3 02/10] net: Pad short frames to minimum size before
 send from SLiRP/TAP
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210303191205.1656980-1-philmd@redhat.com>
 <20210303191205.1656980-3-philmd@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <36123f35-06ab-d0da-37d2-6f8324e7f582@redhat.com>
Date: Mon, 8 Mar 2021 11:48:38 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210303191205.1656980-3-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Bin Meng <bin.meng@windriver.com>, Peter Maydell <peter.maydell@linaro.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2021/3/4 3:11 上午, Philippe Mathieu-Daudé wrote:
> From: Bin Meng <bin.meng@windriver.com>
>
> The minimum Ethernet frame length is 60 bytes. For short frames with
> smaller length like ARP packets (only 42 bytes), on a real world NIC
> it can choose either padding its length to the minimum required 60
> bytes, or sending it out directly to the wire. Such behavior can be
> hardcoded or controled by a register bit. Similarly on the receive
> path, NICs can choose either dropping such short frames directly or
> handing them over to software to handle.
>
> On the other hand, for the network backends SLiRP/TAP, they don't
> expose a way to control the short frame behavior. As of today they
> just send/receive data from/to the other end connected to them,
> which means any sized packet is acceptable. So they can send and
> receive short frames without any problem. It is observed that ARP
> packets sent from SLiRP/TAP are 42 bytes, and SLiRP/TAP just send
> these ARP packets to the other end which might be a NIC model that
> does not allow short frames to pass through.


Do we need to care about other type of networking backends? E.g socket.

Or at least we should keep the padding logic if we can't audit all of 
the backends.

Thanks


>
> To provide better compatibility, for packets sent from SLiRP/TAP, we
> change to pad short frames before sending it out to the other end.
> This ensures SLiRP/TAP as an Ethernet sender do not violate the spec.
> But with this change, the behavior of dropping short frames in the
> NIC model cannot be emulated because it always receives a packet that
> is spec complaint. The capability of sending short frames from NIC
> models are still supported and short frames can still pass through
> SLiRP/TAP interfaces.
>
> This commit should be able to fix the issue as reported with some
> NIC models before, that ARP requests get dropped, preventing the
> guest from becoming visible on the network. It was workarounded in
> these NIC models on the receive path, that when a short frame is
> received, it is padded up to 60 bytes.
>
> The following 2 commits seem to be the one to workaround this issue
> in e1000 and vmxenet3 before, and should probably be reverted.
>
>    commit 78aeb23eded2 ("e1000: Pad short frames to minimum size (60 bytes)")
>    commit 40a87c6c9b11 ("vmxnet3: Pad short frames to minimum size (60 bytes)")
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> Message-Id: <1614763306-18026-2-git-send-email-bmeng.cn@gmail.com>
> [PMD: Use struct iovec for zero-copy]
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   include/net/eth.h |  1 +
>   net/net.c         | 14 ++++++++++++++
>   2 files changed, 15 insertions(+)
>
> diff --git a/include/net/eth.h b/include/net/eth.h
> index 0671be69165..7c825ecb2f7 100644
> --- a/include/net/eth.h
> +++ b/include/net/eth.h
> @@ -31,6 +31,7 @@
>   
>   #define ETH_ALEN 6
>   #define ETH_HLEN 14
> +#define ETH_ZLEN 60     /* Min. octets in frame sans FCS */
>   
>   struct eth_header {
>       uint8_t  h_dest[ETH_ALEN];   /* destination eth addr */
> diff --git a/net/net.c b/net/net.c
> index 159e4d0ec25..d42ac9365eb 100644
> --- a/net/net.c
> +++ b/net/net.c
> @@ -620,6 +620,7 @@ static ssize_t qemu_send_packet_async_with_flags(NetClientState *sender,
>                                                    const uint8_t *buf, int size,
>                                                    NetPacketSent *sent_cb)
>   {
> +    static const uint8_t null_buf[ETH_ZLEN] = { };
>       NetQueue *queue;
>       int ret;
>       int iovcnt = 1;
> @@ -628,6 +629,10 @@ static ssize_t qemu_send_packet_async_with_flags(NetClientState *sender,
>               .iov_base = (void *)buf,
>               .iov_len = size,
>           },
> +        [1] = {
> +            .iov_base = (void *)null_buf,
> +            .iov_len = ETH_ZLEN,
> +        },
>       };
>   
>   #ifdef DEBUG_NET
> @@ -639,6 +644,15 @@ static ssize_t qemu_send_packet_async_with_flags(NetClientState *sender,
>           return size;
>       }
>   
> +    /* Pad to minimum Ethernet frame length for SLiRP and TAP */
> +    if (sender->info->type == NET_CLIENT_DRIVER_USER ||
> +        sender->info->type == NET_CLIENT_DRIVER_TAP) {
> +        if (size < ETH_ZLEN) {
> +            iov[1].iov_len = ETH_ZLEN - size;
> +            iovcnt = 2;
> +        }
> +    }
> +
>       /* Let filters handle the packet first */
>       ret = filter_receive_iov(sender, NET_FILTER_DIRECTION_TX,
>                                sender, flags, iov, iovcnt, sent_cb);


