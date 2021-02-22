Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BCCC32188D
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 14:26:43 +0100 (CET)
Received: from localhost ([::1]:54840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEBEY-0000Bf-4l
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 08:26:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lEB4s-0006kz-4u
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 08:16:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lEB4l-0001UW-11
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 08:16:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613999794;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cYAalV0d6cGh8GViaNhHQGdfNkGt7YgzzFZtwlMp4Ho=;
 b=AXg0wFh6SfD7JJ1hn6EBUtF6dEVuOw8HnGLgUXT1rDalXK3PLBrEkKdBqqUxZsRIU3I977
 Zh7CrZbHTb6Bt3WK40AFC++6oum9rPTFOLIMgbD3l3MykIPgBHSj85sdK4rARBSGn3MDeC
 IYFYiA+iluo5x/8+rViU+yIX9XsdYVc=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-449-dnflicQkMt-8A23nIwutKQ-1; Mon, 22 Feb 2021 08:16:32 -0500
X-MC-Unique: dnflicQkMt-8A23nIwutKQ-1
Received: by mail-ed1-f69.google.com with SMTP id s26so1889872edq.18
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 05:16:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cYAalV0d6cGh8GViaNhHQGdfNkGt7YgzzFZtwlMp4Ho=;
 b=ogN/OGtOL9LbWZPmKvi5cYneJPZaPAXVx0sGkM64x3CGGed9KKzVxSlHsBq5sdpUxX
 tT+Loe97rYRzOlMqOEVW+rP/YXUc272MJpU7bB4AQJwc7khjPHknbOgKdShr4we89Ens
 WBgvOe5Alc2FQtdwHx/1WqTUB+hGJcYYLT3yFj+Du/FFpN/yioXUZ9DTmo+o0VEs8IqM
 eiakUVaq00QppgsuElojzZlF0bv0DGWu75bsE24/Ler+Pnr8ZhFUOv7UxWWnCfnsURY/
 Q4OaZHaZJlL731kyCJ3r6iPfIk+pUOR7vcS33xT+iA7YFYX2EVbx5Fq+zSUjBJk6Xthv
 sk0Q==
X-Gm-Message-State: AOAM533ITiJe7olhsq/sX42pb0nBMQsAadS4tCyLpZ/OTmz63sHhx+5w
 lMN5zzImmBhAldS6eOdxU9VfARRJ/emEJKF1HwvtK/hlt/3ittU1LH+erasaRLWq1P0xb5Cmg+u
 EYcUh3n4ZbCAe1uo=
X-Received: by 2002:a17:907:75fa:: with SMTP id
 jz26mr9682977ejc.457.1613999791527; 
 Mon, 22 Feb 2021 05:16:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw19RVj/Ej2GkRgf8IH/oE3F2PncpNNsidIh5xjUgdoq5GmZanOPTCwWu+0iT+/kO5PlhBlSQ==
X-Received: by 2002:a17:907:75fa:: with SMTP id
 jz26mr9682959ejc.457.1613999791398; 
 Mon, 22 Feb 2021 05:16:31 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id bw22sm10417521ejb.78.2021.02.22.05.16.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Feb 2021 05:16:30 -0800 (PST)
Subject: Re: [PATCH 2/3] hw/block/nvme: fix potential compilation error
To: Klaus Jensen <its@irrelevant.dk>, qemu-devel@nongnu.org
References: <20210222070615.9177-1-its@irrelevant.dk>
 <20210222070615.9177-3-its@irrelevant.dk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <7a058a77-3124-bc37-1e6e-7f20e8376592@redhat.com>
Date: Mon, 22 Feb 2021 14:16:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210222070615.9177-3-its@irrelevant.dk>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/22/21 8:06 AM, Klaus Jensen wrote:
> From: Gollu Appalanaidu <anaidu.gollu@samsung.com>
> 
> assert may be compiled to a noop and we could end up returning an
> uninitialized status.

Per commit 262a69f4282 ("osdep.h: Prohibit disabling assert()
in supported builds") this shouldn't be possible. Anyhow cleanup
is good.

> 
> Fix this by always returning Internal Device Error as a fallback.
> 
> Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> ---
>  hw/block/nvme.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> index ddc83f7f7a19..897b9ff0db91 100644
> --- a/hw/block/nvme.c
> +++ b/hw/block/nvme.c
> @@ -1232,7 +1232,7 @@ static uint16_t nvme_check_zone_write(NvmeNamespace *ns, NvmeZone *zone,
>  
>  static uint16_t nvme_check_zone_state_for_read(NvmeZone *zone)
>  {
> -    uint16_t status;
> +    uint64_t zslba = zone->d.zslba;
>  
>      switch (nvme_get_zone_state(zone)) {
>      case NVME_ZONE_STATE_EMPTY:
> @@ -1241,16 +1241,15 @@ static uint16_t nvme_check_zone_state_for_read(NvmeZone *zone)
>      case NVME_ZONE_STATE_FULL:
>      case NVME_ZONE_STATE_CLOSED:
>      case NVME_ZONE_STATE_READ_ONLY:
> -        status = NVME_SUCCESS;
> -        break;
> +        return NVME_SUCCESS;
>      case NVME_ZONE_STATE_OFFLINE:
> -        status = NVME_ZONE_OFFLINE;
> -        break;
> +        trace_pci_nvme_err_zone_is_offline(zslba);
> +        return NVME_ZONE_OFFLINE;
>      default:
>          assert(false);
>      }
>  
> -    return status;
> +    return NVME_INTERNAL_DEV_ERROR;
>  }
>  
>  static uint16_t nvme_check_zone_read(NvmeNamespace *ns, uint64_t slba,
> 


