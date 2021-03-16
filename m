Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23DCB33D01C
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 09:51:30 +0100 (CET)
Received: from localhost ([::1]:44766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM5QG-0005P0-MW
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 04:51:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lM5Ol-0004ve-B0
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 04:49:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lM5Oh-0004Ph-NC
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 04:49:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615884590;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nLraiJRQV9lEuje1EY+QxsBy6ANj/9rSjZA42C6Ah5s=;
 b=fIEOFXdIsijpHz/bUtNF/SU49Ng3nSuqJ02HdazcsU3EOqf3jFZ3o+1OX5+o7dUm5p8pL3
 4LswIDaWU3fsZMBCJSW7wylw2O0kidBkjxEC02vOGWsIZu44ZWh0G2VCO8Zqn3txFrqXvN
 656Poh5yjuq8kTevDFNueBwrK8+xJmY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-124-oV8fLYUsPt6v0WhgQuAmJw-1; Tue, 16 Mar 2021 04:49:48 -0400
X-MC-Unique: oV8fLYUsPt6v0WhgQuAmJw-1
Received: by mail-wr1-f69.google.com with SMTP id b6so993374wrq.22
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 01:49:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nLraiJRQV9lEuje1EY+QxsBy6ANj/9rSjZA42C6Ah5s=;
 b=TfboD+BjQpU8PugAELEY1l5MoZyyWkNWWwcFU+KE9AAj4XMEKJz13+oM8n0bFepv4j
 W5WxnYNYekyGZnJPiaT8qaMQ0cf1if+0zw6QbBbuHhrSqMqa6xcuejs79W/+0Ys/dgHW
 YKgIPF4ZHvqh1KPjSjSj27TrM4SxqIf8wZK9ZA8VxpVqkwkrWxUNb3Cl1aoMexZKbt+K
 axmtgnLOpJ2hwsDIYQ4Jxzl9KiA98i0b3+bJvlmiERtyF8UbuhAJv/lLmCzL3Kpyc+Lz
 g0ljdWPDCuSHMi65xMpHCLdTRLOWttS7NPyjbgWM01cuWNJSPIZ5fys4SvoN9hBupHNe
 ccvA==
X-Gm-Message-State: AOAM530q36MRb+z7yGgtWV1KRYHOkWuu/2Eel9EmGJGEoKWbp2xgczwG
 NEu5P1o67LnfmkbGpEdtUeKw1BEkqMC7AVNNxKllVvBD8CkqdlzNWE/WTIpCN2gYIaPKc8BLdHz
 hO5Zyw9UkfyOiBpi1Pr62Xrm3n8IbLeEvf2Ge0u+4qt63kFFCGrH57TYNt2Cvx7bI
X-Received: by 2002:adf:ed46:: with SMTP id u6mr3630131wro.350.1615884587234; 
 Tue, 16 Mar 2021 01:49:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx7M4LetCw6YUst444p6QY5Q/fJjUp2TJ1p2j4Ln4JQoyaoolAtN3NvEf5yk0UPceuwNZsETw==
X-Received: by 2002:adf:ed46:: with SMTP id u6mr3630098wro.350.1615884586929; 
 Tue, 16 Mar 2021 01:49:46 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id s16sm21297187wru.91.2021.03.16.01.49.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Mar 2021 01:49:46 -0700 (PDT)
Subject: Re: [PATCH v3 01/13] net: eth: Add a helper to pad a short ethernet
 frame
To: Bin Meng <bmeng.cn@gmail.com>, Jason Wang <jasowang@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210316081254.72684-1-bmeng.cn@gmail.com>
 <20210316081254.72684-2-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <cea98a59-0327-0a80-8a9f-1f4a8008cd4b@redhat.com>
Date: Tue, 16 Mar 2021 09:49:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210316081254.72684-2-bmeng.cn@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/16/21 9:12 AM, Bin Meng wrote:
> Add a helper to pad a short ethernet frame to the minimum required
> length, which can be used by backend codes.
> 
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> 
> ---
> 
> Changes in v3:
> - use 'without' instead of 'sans'
> - add a helper to pad short frames
> 
>  include/net/eth.h | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/include/net/eth.h b/include/net/eth.h
> index 0671be6916..bc064f8e52 100644
> --- a/include/net/eth.h
> +++ b/include/net/eth.h
> @@ -31,6 +31,31 @@
>  
>  #define ETH_ALEN 6
>  #define ETH_HLEN 14
> +#define ETH_ZLEN 60     /* Min. octets in frame without FCS */
> +
> +/**
> + * pad_short_frame - pad a short frame to the minimum ethernet frame length
> + *
> + * If the ethernet frame size is shorter than 60 bytes, it will be padded to
> + * 60 bytes at the address @min_pkt.
> + *
> + * @min_pkt: buffer address to hold the padded frame
> + * @pkt: address to hold the original ethernet frame
> + * @size: size of the original ethernet frame
> + * @return true if the frame is padded, otherwise false
> + */
> +static inline bool pad_short_frame(uint8_t *min_pkt, const uint8_t *pkt,
> +                                   int size)
> +{
> +    if (size < ETH_ZLEN) {
> +        /* pad to minimum ethernet frame length */
> +        memcpy(min_pkt, pkt, size);
> +        memset(&min_pkt[size], 0, ETH_ZLEN - size);
> +        return true;
> +    }
> +
> +    return false;
> +}

I don't want to be too nitpicky but since I'm Cc'ed...

- 'ethernet' -> 'Ethernet'

- I'm not sure inlining is justified

- The same function is used for 2 different operations,
  . check if padding is required
  . do the padding

- If we provide a function a buffer to fill, we need to check the
  buffer size is big enough to avoid overflow

What about something like:

  bool pad_short_frame(char *padded_pkt, size_t *padded_buflen,
                       const void *pkt, size_t pkt_size);
  {
      assert(padded_buflen && *padded_buflen >= ETH_ZLEN);
      if (src_size >= ETH_ZLEN) {
          return false;
      }
      /* pad to minimum ethernet frame length */
      memcpy(padded_pkt, pkt, pkt_size);
      memset(&padded_pkt[pkt_size], 0, ETH_ZLEN - padded_buflen);
      *padded_buflen = ETH_ZLEN;

      return true;
  }

What do you think?


