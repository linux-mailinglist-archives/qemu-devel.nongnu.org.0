Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A93033CB61
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 03:26:50 +0100 (CET)
Received: from localhost ([::1]:46612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLzQ0-0005lU-MI
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 22:26:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lLzOX-0004fw-Bq
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 22:25:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lLzOT-0006Jj-DD
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 22:25:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615861511;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0oi8lt5NYXeAJkGTxLIqJSwnLCppu7leWSpMqwW88dA=;
 b=GqLGbOBdV9yXEE0mkOm9cZ9cPQYV3pny9KI1N15FTF/jhjfODtfiQxlnkv0eJY3dnIKIDv
 KwknTshM4e/YtE3fzQrjCPZk8dJQE1RapszhvZCMzuuB+g6XdEFhMJvgULilRA489dD01R
 tdLaxZ3GFekDbpeNlao8vh/Qh5hFUbk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-488-TiMbwOf-PE6PtQ0ioe7xNg-1; Mon, 15 Mar 2021 22:25:09 -0400
X-MC-Unique: TiMbwOf-PE6PtQ0ioe7xNg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9B541100C61F;
 Tue, 16 Mar 2021 02:25:08 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-12-229.pek2.redhat.com
 [10.72.12.229])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4ABEA19D7C;
 Tue, 16 Mar 2021 02:25:06 +0000 (UTC)
Subject: Re: [PATCH v2 03/13] net: slirp: Pad short frames to minimum size
 before send
To: Bin Meng <bmeng.cn@gmail.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org
References: <20210315075718.5402-1-bmeng.cn@gmail.com>
 <20210315075718.5402-4-bmeng.cn@gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <51a74aaf-c2c1-4222-2fa3-af6143913134@redhat.com>
Date: Tue, 16 Mar 2021 10:25:05 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210315075718.5402-4-bmeng.cn@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_CHARSET_FARAWAY=2.45, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


ÔÚ 2021/3/15 ÏÂÎç3:57, Bin Meng Ð´µÀ:
> The minimum Ethernet frame length is 60 bytes. For short frames with
> smaller length like ARP packets (only 42 bytes), on a real world NIC
> it can choose either padding its length to the minimum required 60
> bytes, or sending it out directly to the wire. Such behavior can be
> hardcoded or controled by a register bit. Similarly on the receive
> path, NICs can choose either dropping such short frames directly or
> handing them over to software to handle.
>
> On the other hand, for the network backends like SLiRP/TAP, they
> don't expose a way to control the short frame behavior. As of today
> they just send/receive data from/to the other end connected to them,
> which means any sized packet is acceptable. So they can send and
> receive short frames without any problem. It is observed that ARP
> packets sent from SLiRP/TAP are 42 bytes, and SLiRP/TAP just send
> these ARP packets to the other end which might be a NIC model that
> does not allow short frames to pass through.
>
> To provide better compatibility, for packets sent from QEMU network
> backends, we change to pad short frames before sending it out to the
> other end. This ensures a backend as an Ethernet sender does not
> violate the spec. But with this change, the behavior of dropping
> short frames in the NIC model cannot be emulated because it always
> receives a packet that is spec complaint. The capability of sending
> short frames from NIC models cannot be supported as well.
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
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> ---
>
>   net/slirp.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
>
> diff --git a/net/slirp.c b/net/slirp.c
> index be914c0be0..ad2db03182 100644
> --- a/net/slirp.c
> +++ b/net/slirp.c
> @@ -31,6 +31,7 @@
>   #include <pwd.h>
>   #include <sys/wait.h>
>   #endif
> +#include "net/eth.h"
>   #include "net/net.h"
>   #include "clients.h"
>   #include "hub.h"
> @@ -115,6 +116,17 @@ static ssize_t net_slirp_send_packet(const void *pkt, size_t pkt_len,
>                                        void *opaque)
>   {
>       SlirpState *s = opaque;
> +    uint8_t min_buf[ETH_ZLEN];
> +
> +    if (!s->nc.peer->do_not_pad) {
> +        /* Pad to minimum Ethernet frame length */
> +        if (pkt_len < ETH_ZLEN) {
> +            memcpy(min_buf, pkt, pkt_len);
> +            memset(&min_buf[pkt_len], 0, ETH_ZLEN - pkt_len);
> +            pkt = min_buf;
> +            pkt_len = ETH_ZLEN;
> +        }
> +    }


Let's introduce a helper for this padding then it could be reused by at 
least TAP?

Thanks


>   
>       return qemu_send_packet(&s->nc, pkt, pkt_len);
>   }


