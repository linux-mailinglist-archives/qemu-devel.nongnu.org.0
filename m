Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FDBC326143
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 11:30:32 +0100 (CET)
Received: from localhost ([::1]:56534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFaOE-0003IO-FR
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 05:30:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lFaN2-0002pa-RK
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 05:29:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lFaN0-0006fb-AE
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 05:29:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614335352;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dyn6k+mjoOSfWyl37d3Xqbige20JB7IKp++447PM8FM=;
 b=Lnp1ocV6qhgnOQQOM1lMTGzQcNJwsTWMzVkogZfDTakyBlTsdVcRNQE7cvnWEhtnfakhmn
 /NvYDcmle4DEf411HB1T/HDYB+OZ3785aieQI/DWD3cQh2cAPkB9ODp7qf1hDbKAXV1AE0
 4Ct2r4mF/a0gFhJ/O8Uv5bP97zFzKtY=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-108-7SE5u9NmNSyfx0QAGAzIaA-1; Fri, 26 Feb 2021 05:29:10 -0500
X-MC-Unique: 7SE5u9NmNSyfx0QAGAzIaA-1
Received: by mail-ed1-f71.google.com with SMTP id f11so4253404edk.13
 for <qemu-devel@nongnu.org>; Fri, 26 Feb 2021 02:29:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dyn6k+mjoOSfWyl37d3Xqbige20JB7IKp++447PM8FM=;
 b=CsmrUV+3OdHUWY0i9+8RDjAVUwfIGYNAvQFdzRuthKn+ftPOHQJPv3yHjKxILP6HDL
 z45q6pMcdVk/wmTf7gNAgkKDlYBf3vIIIOoc120tu0SnSzOGsaLsOCq7s0xyR36VtF28
 ADO48X4D/BgSv7v2Cu9blhjqqY65kXfbZhUrg5E9tL0F9XuC3JFjM2BJQcXlPwXI7aZa
 YBp3wYIyHSEjT1xPUg6OTxrNzJb350CRZxsP2qKEthbtEX4QYujNzLzlkUF/3tV+WH3r
 2ZxJw/rwGMeHYq5zkMynptoa5UAeITT1tLB6aLPa47b9ksuSh38XoYttvT3Dwjq6LIp/
 g55A==
X-Gm-Message-State: AOAM532VAgR8TSQrvEVFlSx0PhLtkzrVG9VsxVL56EvxVqJCzIORcXmZ
 F0b2kKxoEcQC8OKnzQjiheuN3/8rVhBaIJzkoKDf8vkzxAiB4x5N8MCv9oxUBteMH3VRTEgW3Kt
 U8sjihywhl1dLhyE=
X-Received: by 2002:a17:906:8546:: with SMTP id
 h6mr1940584ejy.23.1614335349726; 
 Fri, 26 Feb 2021 02:29:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw/vsNZlm2JZ7NOmYqYoCOgEQTWtGpxMo3jB3JESX/jmDuh3wGn9LKluni77KEikLK9P8ry5A==
X-Received: by 2002:a17:906:8546:: with SMTP id
 h6mr1940569ejy.23.1614335349568; 
 Fri, 26 Feb 2021 02:29:09 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id n5sm5353733edw.7.2021.02.26.02.29.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Feb 2021 02:29:09 -0800 (PST)
Subject: Re: [RFC PATCH 1/3] net: Pad short frames to minimum size (60 bytes)
To: Bin Meng <bmeng.cn@gmail.com>, Jason Wang <jasowang@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <1614333786-74258-1-git-send-email-bmeng.cn@gmail.com>
 <1614333786-74258-2-git-send-email-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <b9c3f883-7365-f30c-0b22-15b5e089268a@redhat.com>
Date: Fri, 26 Feb 2021 11:29:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <1614333786-74258-2-git-send-email-bmeng.cn@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.435, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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

On 2/26/21 11:03 AM, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> The minimum Ethernet frame length is 60 bytes, and we should pad
> frames whose length is smaller to the minimum size.
> 
> This commit fixes the issue as seen with various ethernet models,
> that ARP requests get dropped, preventing the guest from becoming
> visible on the network.

Is it also used in commit 18995b9808d ("Send a RARP packet after
migration.")?

> The following 2 commits that attempted to workaround this issue
> in e1000 and vmxenet3 before, should be reverted.
> 
>   commit 78aeb23eded2 ("e1000: Pad short frames to minimum size (60 bytes)")
>   commit 40a87c6c9b11 ("vmxnet3: Pad short frames to minimum size (60 bytes)")
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
> 
>  net/net.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/net/net.c b/net/net.c
> index b038370..34004da 100644
> --- a/net/net.c
> +++ b/net/net.c
> @@ -638,6 +638,7 @@ static ssize_t qemu_send_packet_async_with_flags(NetClientState *sender,
>                                                   NetPacketSent *sent_cb)
>  {
>      NetQueue *queue;
> +    uint8_t min_buf[60];

Can you add a definition instead of a magic value?
Maybe ETH_FRAME_MIN_LEN in "net/eth.h"?

>      int ret;
>  
>  #ifdef DEBUG_NET
> @@ -649,6 +650,14 @@ static ssize_t qemu_send_packet_async_with_flags(NetClientState *sender,
>          return size;
>      }
>  
> +    /* Pad to minimum Ethernet frame length */
> +    if (size < sizeof(min_buf)) {
> +        memcpy(min_buf, buf, size);
> +        memset(&min_buf[size], 0, sizeof(min_buf) - size);
> +        buf = min_buf;
> +        size = sizeof(min_buf);
> +    }
> +
>      /* Let filters handle the packet first */
>      ret = filter_receive(sender, NET_FILTER_DIRECTION_TX,
>                           sender, flags, buf, size, sent_cb);
> 


