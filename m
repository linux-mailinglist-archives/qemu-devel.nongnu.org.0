Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DCE032B686
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 11:18:45 +0100 (CET)
Received: from localhost ([::1]:52668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHOaa-000278-7Z
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 05:18:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHOXK-0007jr-Vs
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 05:15:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHOXH-00013n-KC
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 05:15:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614766518;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6wckYGbhafAB1TP/C1A2eIMP1BYuYxJ34YK3xGy/UaY=;
 b=RcC0BgJEUc+qs1XzREgKQ56pOONWKyb4QMkqBx+r8G9BVjRBbVzA93+rmQEhTucKE4bolt
 mPesmY+imp6+njLfxCTlDJZ/+57dKcxv56JcS1k8Ubhn/TofFlkMQ3OE2gF9i2jRfbi2Of
 6uHMpIG8CBtNw6KxLnfG2P0/wCtngqw=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-356-ZROSX2-eMAihks-DOAkXVg-1; Wed, 03 Mar 2021 05:15:17 -0500
X-MC-Unique: ZROSX2-eMAihks-DOAkXVg-1
Received: by mail-ej1-f72.google.com with SMTP id fy8so5102671ejb.19
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 02:15:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6wckYGbhafAB1TP/C1A2eIMP1BYuYxJ34YK3xGy/UaY=;
 b=F5l3JLdxkk/gYiZ5Rbcl3X08Z2IFieZPMXRjoAnrG4y9iF9Tt3la8MUJTPNmSK6ke2
 Goc7oT94RRBpo2/vErio1gXqeQznW/Hhik9ilabHUcapBhXsxtwkzQCiqG+/sU9i5Y3n
 79j0j4mEBStfXqWVBPyTe9x5MXO9py6BvfNS0r+9UEJwAM60cDAdikXr3N9SNTaMkd7f
 plxL4GJCuyAgvjKWzyeJKZfoE3GmYSfVlA6nEdr10D2R3xiJ9Dml2QYsAFvo1J9I3Va+
 9xdKm6V/XjKcj+7qm6YIY6H/4YoTTVLH5sO/wQKTCrcWM9PQ7Kp8Z643g89SHQk1EzzN
 TV7w==
X-Gm-Message-State: AOAM533xHr60v0ifdXI0alD9blhPkM8HBnHbeV2KMy47AWO2dulCk13D
 5mYxU3PNoa67oaMdSdx5EgSLwV6a9n6L4gZhTAfcgUFvyAW/JyM+g9QYg57xk6d3G4CkvU0TILU
 euvUim/t7RkB1XWs=
X-Received: by 2002:a17:907:7692:: with SMTP id
 jv18mr9822446ejc.475.1614766515924; 
 Wed, 03 Mar 2021 02:15:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy1cSC2wb+v4EQCfDK16/wcJvnsuPGbae1iGLxalPRUhQUhd6YPX4VctUOD/R7w0MI2K0UG2A==
X-Received: by 2002:a17:907:7692:: with SMTP id
 jv18mr9822407ejc.475.1614766515737; 
 Wed, 03 Mar 2021 02:15:15 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id u18sm20212490ejc.76.2021.03.03.02.15.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Mar 2021 02:15:15 -0800 (PST)
Subject: Re: [RFC PATCH v2 1/9] net: Pad short frames to minimum size before
 send from SLiRP/TAP
To: Bin Meng <bmeng.cn@gmail.com>, Jason Wang <jasowang@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <1614763306-18026-1-git-send-email-bmeng.cn@gmail.com>
 <1614763306-18026-2-git-send-email-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <39d86853-45aa-2231-b9d5-e38985747b5d@redhat.com>
Date: Wed, 3 Mar 2021 11:15:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <1614763306-18026-2-git-send-email-bmeng.cn@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/3/21 10:21 AM, Bin Meng wrote:
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
>   commit 78aeb23eded2 ("e1000: Pad short frames to minimum size (60 bytes)")
>   commit 40a87c6c9b11 ("vmxnet3: Pad short frames to minimum size (60 bytes)")
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> 
> ---
> 
> Changes in v2:
> - only pad short frames for SLiRP/TAP interfaces
> 
>  include/net/eth.h |  1 +
>  net/net.c         | 12 ++++++++++++
>  2 files changed, 13 insertions(+)
> 
> diff --git a/include/net/eth.h b/include/net/eth.h
> index 0671be6..7c825ec 100644
> --- a/include/net/eth.h
> +++ b/include/net/eth.h
> @@ -31,6 +31,7 @@
>  
>  #define ETH_ALEN 6
>  #define ETH_HLEN 14
> +#define ETH_ZLEN 60     /* Min. octets in frame sans FCS */
>  
>  struct eth_header {
>      uint8_t  h_dest[ETH_ALEN];   /* destination eth addr */
> diff --git a/net/net.c b/net/net.c
> index 32d71c1..27c3b25 100644
> --- a/net/net.c
> +++ b/net/net.c
> @@ -638,6 +638,7 @@ static ssize_t qemu_send_packet_async_with_flags(NetClientState *sender,
>                                                   NetPacketSent *sent_cb)
>  {
>      NetQueue *queue;
> +    uint8_t min_buf[ETH_ZLEN];
>      int ret;
>  
>  #ifdef DEBUG_NET
> @@ -649,6 +650,17 @@ static ssize_t qemu_send_packet_async_with_flags(NetClientState *sender,
>          return size;
>      }
>  
> +    /* Pad to minimum Ethernet frame length for SLiRP and TAP */
> +    if (sender->info->type == NET_CLIENT_DRIVER_USER ||
> +        sender->info->type == NET_CLIENT_DRIVER_TAP) {
> +        if (size < ETH_ZLEN) {
> +            memcpy(min_buf, buf, size);
> +            memset(&min_buf[size], 0, ETH_ZLEN - size);
> +            buf = min_buf;
> +            size = ETH_ZLEN;
> +        }

We can have zero-copy by using a static zeroed buf and rewrite
this function to call the _iov() equivalents with a pair of
struct iovec.

> +    }
> +
>      /* Let filters handle the packet first */
>      ret = filter_receive(sender, NET_FILTER_DIRECTION_TX,
>                           sender, flags, buf, size, sent_cb);
> 


