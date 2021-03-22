Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D32D343D5C
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 10:59:27 +0100 (CET)
Received: from localhost ([::1]:38838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOHLK-0001L3-3Y
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 05:59:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lOHKQ-0000qO-Jv
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 05:58:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39200)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lOHKP-00055M-3B
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 05:58:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616407107;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Co213FGBvjwvpyN+rtQ0/RKrI0LBynq9uEej08NP5a4=;
 b=WRZoNAxHfK+oa5240AnuE0x4+1Iz61SQlVlb8nYvWLDJVMzgru9LeKcNwuYqu3k9OG9aiN
 7zDlH/p+gn0a8WGhwEsklR7LXdtg9Mt7LfOEX19g/aCVJ+mLq23Q3P8x2Z862E7pgJL/pE
 d0A9soZckUsqWVLJPqqkoE32Lqkl/qs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-186-G66y04a4M8myp5avKPRjWA-1; Mon, 22 Mar 2021 05:58:26 -0400
X-MC-Unique: G66y04a4M8myp5avKPRjWA-1
Received: by mail-wm1-f71.google.com with SMTP id v5so14822188wml.9
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 02:58:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Co213FGBvjwvpyN+rtQ0/RKrI0LBynq9uEej08NP5a4=;
 b=af3ITiNt3wPJ7qnUn+UWylrDSRBHWUCU2YUGkdfPAYRuUsiFHzz+uS4wkwnwYHTGdf
 24OZS1cJ6DKlf6mVb7SvOo2tgOayORoJ8VlEVATHf1bCn+V9uzxtjv5NXV/qxotPPgrT
 ZDfEODjF9KQ0Yoh4LnhEBmG9zqrvA0VXuMCIBECnX6h5g0TACYQTcsAKQbq2LOV+uyik
 xppwVFC1/hSdiirChq3/6iPuR8z7a1nl+eU3SZnkhyqheWJ6dz8T7it6F/fQjMjltXQk
 IiIjRVUMKch56+RgD7Dw25j7Kgjy8Pu6erULUFjz+I5xlkSu6nQX3RRKTEqaNEuLaBfT
 OVzw==
X-Gm-Message-State: AOAM531yuCjSDi2MNyG6UxGWa5z1j8050htQlHeDUpTDt/PeXEC6kHiw
 lM51AUXV5hpUhPk/P9JoeeIjdMiTjGvlMskPugQwMZhThNgJjrgivDzYOE6cm6lC8IIFbxgpp+Y
 SAlv2eBP1evO7rdM=
X-Received: by 2002:adf:a406:: with SMTP id d6mr17484965wra.141.1616407105046; 
 Mon, 22 Mar 2021 02:58:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzKDLpriUjZijqxylWOGtLSM+jfzG1pT7dZmNVhiHxECFzt6Pk1p5hb5XZz3uTqR9VA3+1SKg==
X-Received: by 2002:adf:a406:: with SMTP id d6mr17484944wra.141.1616407104841; 
 Mon, 22 Mar 2021 02:58:24 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id z25sm17917274wmi.23.2021.03.22.02.58.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Mar 2021 02:58:24 -0700 (PDT)
Subject: Re: [PATCH] nvme: expose 'bootindex' property
To: Joelle van Dyne <j@getutm.app>, qemu-devel@nongnu.org
References: <20210322082444.12916-1-j@getutm.app>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <a7030c4b-943d-c88d-655d-dfd6398d68d5@redhat.com>
Date: Mon, 22 Mar 2021 10:58:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210322082444.12916-1-j@getutm.app>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Keith Busch <kbusch@kernel.org>, "open list:nvme" <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/22/21 9:24 AM, Joelle van Dyne wrote:
> The check for `n->namespace.blkconf.blk` always fails because
> this is in the initialization function.

This usually mean the code depends to some state only available
during the QOM 'realization' step, so this code should be in
nvme_realize(). Maybe in this case we don't need it there and
can add the property regardless a block drive is provided, I
haven't checked.

> 
> Signed-off-by: Joelle van Dyne <j@getutm.app>
> ---
>  hw/block/nvme.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> index 6842b01ab5..42605fc55d 100644
> --- a/hw/block/nvme.c
> +++ b/hw/block/nvme.c
> @@ -6330,11 +6330,9 @@ static void nvme_instance_init(Object *obj)
>  {
>      NvmeCtrl *n = NVME(obj);
>  
> -    if (n->namespace.blkconf.blk) {
> -        device_add_bootindex_property(obj, &n->namespace.blkconf.bootindex,
> -                                      "bootindex", "/namespace@1,0",
> -                                      DEVICE(obj));
> -    }
> +    device_add_bootindex_property(obj, &n->namespace.blkconf.bootindex,
> +                                  "bootindex", "/namespace@1,0",
> +                                  DEVICE(obj));
>  
>      object_property_add(obj, "smart_critical_warning", "uint8",
>                          nvme_get_smart_warning,
> 


