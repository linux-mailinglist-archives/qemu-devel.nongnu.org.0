Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C14E6E2665
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 17:03:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnKxC-0008FU-LA; Fri, 14 Apr 2023 11:03:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pnKx8-0008FL-Kq
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 11:03:06 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pnKx6-0002a5-SO
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 11:03:06 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 o6-20020a05600c4fc600b003ef6e6754c5so8271859wmq.5
 for <qemu-devel@nongnu.org>; Fri, 14 Apr 2023 08:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681484583; x=1684076583;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ukuz6ddoWBVkD1dtwfW2N2AUYoVN9yMiLSBNKHwAekc=;
 b=j3Oh2QWw2L8fhnioSF8KORiZLHQFzB/DYqKfdtYiNouPz3xbCYsHO4W+yqwQPrQO5F
 hk+ZPkfgj3k0wiU2fTtUgHHGFmXL9pg6eBmvBXlPt7vO/gvEyVEM2seVfW0xNG1w+iEL
 C0wUeWRG8xp32gYTOw9Gq+QPMfK3v6IIPWG16jy5sYIlojemhBd/ndpICtD4fpc1+6Cs
 qLICxLCBnb0mnz5cir2ou4TOlaWqqvDwe30Vb7xVIeVMuewE+8KelpnldnjVXsjFjv+s
 S7edje9Kbu8kCLcZXfwFi6gvwLi/9L+XuAj3lIJN/oWnVGjPpp1J8FlYcrET0GR4JcuI
 6Nsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681484583; x=1684076583;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ukuz6ddoWBVkD1dtwfW2N2AUYoVN9yMiLSBNKHwAekc=;
 b=kErJ8RgM2yE4woaeWN8rTOn6iUFR1jV5yp0S7rhvG5tlln5FQafSlcAGG1f5X9tDQK
 IEDFlua+gZEJvyoMCJzcqXFgniKWBEKhMRMK652/xN/3c6y2ARZokkyjS6g198ANYT+2
 hNwsVY9tE8JVA75tDrPosIUW2kOUQxGOJd0vARFE4XdkzQWQe+f/QHCB0BGZqJET+jiZ
 83s974q7GQ33ilJxC59hzAD9bhci5GK59/lBOIdIdrQYUfVxdfY65wSFnvcEclIgFm7z
 Knj6qMc3LaMJO3ef61B3j5iwCAJEscNMkVTPpq/3WHvfKr44PwnDRgKmFZmOc8E5U3Ii
 +W4w==
X-Gm-Message-State: AAQBX9eiCZyBqn4ZAQfLBkOy6HILdslfvKtokrlD85OjIQ+ZoAZhpKZ8
 UTo8Uz/wz32bH/sew5xfTbQqDQ==
X-Google-Smtp-Source: AKy350aQZuLDIX3K7AXcrThHMym98V3Rb2n12BJU5IPAQMiu8bXWIzzsDiYWy09cWyot4n8sFvXqZw==
X-Received: by 2002:a05:600c:2286:b0:3ee:5754:f139 with SMTP id
 6-20020a05600c228600b003ee5754f139mr4908126wmf.13.1681484583072; 
 Fri, 14 Apr 2023 08:03:03 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.204.198])
 by smtp.gmail.com with ESMTPSA id
 h4-20020a1ccc04000000b003f071466229sm4451973wmb.17.2023.04.14.08.03.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Apr 2023 08:03:02 -0700 (PDT)
Message-ID: <5810a3c4-e8c1-7282-513f-0659475a47e8@linaro.org>
Date: Fri, 14 Apr 2023 17:03:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [PATCH 15/40] e1000x: Take CRC into consideration for size check
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Jason Wang <jasowang@redhat.com>, Dmitry Fleytman
 <dmitry.fleytman@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org
References: <20230414113737.62803-1-akihiko.odaki@daynix.com>
 <20230414113737.62803-16-akihiko.odaki@daynix.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230414113737.62803-16-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.282,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 14/4/23 13:37, Akihiko Odaki wrote:
> Section 13.7.15 Receive Length Error Count says:
>>   Packets over 1522 bytes are oversized if LongPacketEnable is 0b
>> (RCTL.LPE). If LongPacketEnable (LPE) is 1b, then an incoming packet
>> is considered oversized if it exceeds 16384 bytes.
> 
>> These lengths are based on bytes in the received packet from
>> <Destination Address> through <CRC>, inclusively.
> 
> As QEMU processes packets without CRC, the number of bytes for CRC
> need to be subtracted.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>   hw/net/e1000x_common.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/net/e1000x_common.c b/hw/net/e1000x_common.c
> index 6cc23138a8..b4dfc74b66 100644
> --- a/hw/net/e1000x_common.c
> +++ b/hw/net/e1000x_common.c
> @@ -142,10 +142,10 @@ bool e1000x_is_oversized(uint32_t *mac, size_t size)
>   {
>       /* this is the size past which hardware will
>          drop packets when setting LPE=0 */
> -    static const int maximum_ethernet_vlan_size = 1522;
> +    static const int maximum_ethernet_vlan_size = 1522 - 4;
>       /* this is the size past which hardware will
>          drop packets when setting LPE=1 */
> -    static const int maximum_ethernet_lpe_size = 16 * KiB;
> +    static const int maximum_ethernet_lpe_size = 16 * KiB - 4;
>   
>       if ((size > maximum_ethernet_lpe_size ||
>           (size > maximum_ethernet_vlan_size

IMHO this function could be simplified. Something like:

   bool long_packet_enabled = mac[RCTL] & E1000_RCTL_LPE;
   size_t oversize = long_packet_enabled ? 16 * KiB : ETH_VLAN_MAXSIZE;
   size_t crc32_size = sizeof(uint32_t);

   if (mac[RCTL] & E1000_RCTL_SBP) {
     return false;
   }

   if (size + crc32_size > oversize ) {
     ...
     return true;
   }

   return false;
}

