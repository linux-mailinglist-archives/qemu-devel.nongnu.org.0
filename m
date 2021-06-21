Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4623AE401
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 09:22:24 +0200 (CEST)
Received: from localhost ([::1]:60304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvEGF-0000uE-0f
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 03:22:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lvEES-00006A-M3
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 03:20:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49000)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lvEEP-00059I-Nv
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 03:20:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624260025;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vsXUSK6ZD4Fee1nNz6aLER3jhcLjEILpG4euEHcmUY0=;
 b=T+p46OO2f+Mh/+PNYOUaxqQFl/7JtyZsDNTQlVDy1uvAGcPIK2vFibk/CxjuhBy644xRSu
 bvV5F3rW7F+yiRpldDcgPrgpriwNKKytRlaEr+ps+384ZlqSZIkInhkQmxcNN+0gqu8I+c
 5yc0WXk7RPrGzE2yHjAkBcWUdz0pN34=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-525-WuwUOZYdO8eJ8DhD6Sro_w-1; Mon, 21 Jun 2021 03:20:22 -0400
X-MC-Unique: WuwUOZYdO8eJ8DhD6Sro_w-1
Received: by mail-pg1-f198.google.com with SMTP id
 t28-20020a63461c0000b0290221e90ef795so11298065pga.6
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 00:20:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=vsXUSK6ZD4Fee1nNz6aLER3jhcLjEILpG4euEHcmUY0=;
 b=aKb2RT0xtGtU98C5TiXQUg8rbe/08tlKTbb04DucvxEAHx07Yk2kdYZqsW1Xa2WR3G
 twxeiqPn43h2ltHNBfh/VwiF2zrjkuXuK3K6PKhsl0RzGKFAwl6PaS3m/JW6+u+eiAI4
 7lJAlyp2PVFaytgj3k7gdLyccgLygS5zWhPm6dbDHEBrHFy9YvRvW/9Tshjil5NRHlmt
 cA7POnOT6LiBiMucbHQaR+oWB6SIUiPdDD+My7SJCykAPBpfy/i1tfu+LooE33GKIAH2
 hJbER2V9sCvBAGsUXua1dW3Slnxn5LeEJgchb5oR3KpnisusEqdzzwXA3GCrB4rxT+QK
 3MXQ==
X-Gm-Message-State: AOAM533XyW7xnpcLQjsGwY+Bar5Z04tfUZ9/oJq0+5n5RoMbVTXLGjrB
 7c7REYrZrrMry389ibBFzVCmX1hnr0HnZY/FXfNhNLq66iyWU7kghImOx2WCWfRTBxkTQuw36HN
 MUOoqdSbYMxQ7M6U=
X-Received: by 2002:a63:2503:: with SMTP id l3mr5514635pgl.237.1624260021810; 
 Mon, 21 Jun 2021 00:20:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwpzISdRRDkzKzZcGV1vyGwNT1mAuCWdaQeH8obTbujSecUlti53hAKXfeVsaqKM7149aaFug==
X-Received: by 2002:a63:2503:: with SMTP id l3mr5514622pgl.237.1624260021583; 
 Mon, 21 Jun 2021 00:20:21 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id g5sm8711666pfb.191.2021.06.21.00.20.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jun 2021 00:20:21 -0700 (PDT)
Subject: Re: [PATCH 09/15] hw/net/e1000e: Fix impl.min_access_size
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210619172626.875885-1-richard.henderson@linaro.org>
 <20210619172626.875885-10-richard.henderson@linaro.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <cfa1068b-0f43-580b-177a-0408b65ea473@redhat.com>
Date: Mon, 21 Jun 2021 15:20:15 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210619172626.875885-10-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.299,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
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
Cc: alex.bennee@linaro.org, pbonzini@redhat.com,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, mark.cave-ayland@ilande.co.uk,
 f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/6/20 上午1:26, Richard Henderson 写道:
> There are certainly architectural 2 byte writes, as evidenced
> by the e1000e_set_16bit function.  I also saw a 1 byte write,
> though that may have been the fuzzer.
>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: Dmitry Fleytman <dmitry.fleytman@gmail.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   hw/net/e1000e.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/net/e1000e.c b/hw/net/e1000e.c
> index ea3347fbb4..ad73e39ebc 100644
> --- a/hw/net/e1000e.c
> +++ b/hw/net/e1000e.c
> @@ -185,7 +185,7 @@ static const MemoryRegionOps mmio_ops = {
>       .write = e1000e_mmio_write,
>       .endianness = DEVICE_LITTLE_ENDIAN,
>       .impl = {
> -        .min_access_size = 4,
> +        .min_access_size = 1,


I'm not sure this can work. Looks like at least 
e1000e_get_reg_index_with_offset() was wrote with the assumption that 
min_access_size is 4:

static inline uint16_t
e1000e_get_reg_index_with_offset(const uint16_t *mac_reg_access, hwaddr 
addr)
{
     uint16_t index = (addr & 0x1ffff) >> 2;
     return index + (mac_reg_access[index] & 0xfffe);
}

Thanks


>           .max_access_size = 4,
>       },
>   };
> @@ -195,7 +195,7 @@ static const MemoryRegionOps io_ops = {
>       .write = e1000e_io_write,
>       .endianness = DEVICE_LITTLE_ENDIAN,
>       .impl = {
> -        .min_access_size = 4,
> +        .min_access_size = 1,
>           .max_access_size = 4,
>       },
>   };


