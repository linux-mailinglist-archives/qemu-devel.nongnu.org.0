Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 007892CEF4E
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 15:04:20 +0100 (CET)
Received: from localhost ([::1]:51856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klBh4-0006cf-IP
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 09:04:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1klBeE-00058J-FT
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 09:01:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20225)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1klBe5-0004SU-KI
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 09:01:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607090472;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yJAs8ii1wmHvkJCWqE+GXG/dIj5JOlXmlp7UhWU2A50=;
 b=KJdJxki+5p17ECkXGIjsYw/8Lx4YR4dh8RUuFOcWRDF8ZQB4sXjO59DRyhQvhFWao8+vhY
 wxb8EBR/N/NZk0AD87wpu3mkvTn31vIZHDbC4ArsQfqa6YH22ynJWzIxykHwzspWao5EN+
 m1n+wxcHTokUUZ/0Wy0nEpd+KMHR7NU=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-127-xhCt_WwZNwmkpjgfSQITsA-1; Fri, 04 Dec 2020 09:01:11 -0500
X-MC-Unique: xhCt_WwZNwmkpjgfSQITsA-1
Received: by mail-ej1-f72.google.com with SMTP id z10so2095044eje.5
 for <qemu-devel@nongnu.org>; Fri, 04 Dec 2020 06:01:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iABL3hwDgYI28Fe4n1KiDUSufX1pa3x3fiXYiYu2HRw=;
 b=bINcvcs8Eegy1w6gH6Y9Ulo8mqFyDgqq+t1+tBJN3GBBkg6YGK1XWNHwPgJcjKmmsX
 f2c7Jnzg8qnhW9fArytD7+nLd8UPi4dQeksp8t2IazBQhItXa5Q/RYXu8em6G7chqN7p
 5jWQGiSoHisxSZLiHFfZ2cDtJFdxZzDENsuCdgoUKT/S35cyah2TZNKViyS+27RNwb9Z
 WWYeOY7I5FeFISVaEDrPCanuogAvrgmXPhMo9aMgJ+mhSLpV2K4oPITtWiiOHHa4Z0E0
 z+unckQc5VR/VkJhpnUc9YCTvaqjIp8RdcyQcGewD0APHUvGyHdD2hf2ziGJEvUvStum
 R5Hg==
X-Gm-Message-State: AOAM531vjrmWdz+wYtayhS2GjvP5ThbBFx8ssYidUOvDq3pABI1FF9hE
 Ow/WkZ7eTYUrB7HK9QK7W5fCecvRGOOq8uzC3eJP6EXmk0l3DGpbvxewhJ5tX6lXO748BUmi8a3
 TEmmolUk6aJnNC0Q=
X-Received: by 2002:a17:906:ce3c:: with SMTP id
 sd28mr7159802ejb.485.1607090467005; 
 Fri, 04 Dec 2020 06:01:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw89lnrJh5m5a1g+gCDVpcehOmgOqQF4No4ymbqBSFTa5TLSmidRng1RH1Jv09HzklHi1YHlQ==
X-Received: by 2002:a17:906:ce3c:: with SMTP id
 sd28mr7159779ejb.485.1607090466805; 
 Fri, 04 Dec 2020 06:01:06 -0800 (PST)
Received: from [192.168.1.36] (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id b9sm3195266eju.8.2020.12.04.06.01.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Dec 2020 06:01:05 -0800 (PST)
Subject: Re: [RFC PATCH-for-5.2 1/2] net: Do not accept packets bigger then
 NET_BUFSIZE
To: P J P <ppandit@redhat.com>
References: <20201127154524.1902024-1-philmd@redhat.com>
 <20201127154524.1902024-2-philmd@redhat.com>
 <o5n678r1-r38n-3n85-64r5-83sr9qr9124q@erqung.pbz>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <4f1412f9-4bb3-1a39-1679-349d2bd5cbd1@redhat.com>
Date: Fri, 4 Dec 2020 15:01:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <o5n678r1-r38n-3n85-64r5-83sr9qr9124q@erqung.pbz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-15
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/4/20 11:03 AM, P J P wrote:
> +-- On Fri, 27 Nov 2020, Philippe Mathieu-DaudÃ© wrote --+
> | Do not allow qemu_send_packet*() and qemu_net_queue_send()
> | functions to accept packets bigger then NET_BUFSIZE.
> | 
> | We have to put a limit somewhere. NET_BUFSIZE is defined as:
> |  /* Maximum GSO packet size (64k) plus plenty of room for
> |   * the ethernet and virtio_net headers
> |   */
> |  #define NET_BUFSIZE (4096 + 65536)
> | 
> | +    if (size > NET_BUFSIZE) {
> | +        return -1;
> | +    }
> | +
> 
> /usr/include/linux/if_ether.h
>   #define ETH_MIN_MTU 68        /* Min IPv4 MTU per RFC791  */                      
>   #define ETH_MAX_MTU 0xFFFFU   /* 65535, same as IP_MAX_MTU    */
> 
>   if (size < ETH_MIN_MTU || size > ETH_MAX_MTU) {
>       return -1;
>   }
> 
> Should there be similar check for minimum packet size?

I don't think so, because this API is not restricted to Ethernet
frames (i.e. CAN frames are much shorter).
We also want developers be able to experiment with new protocols.

I'd rather not relate this with any protocol. Using an upper limit
doesn't hurt. Maybe not accepting frames bigger than 1 GiB is enough
from a security point of view.

> 
> Thank you.
> --
> Prasad J Pandit / Red Hat Product Security Team
> 8685 545E B54C 486B C6EB 271E E285 8B5A F050 DE8D
> 


