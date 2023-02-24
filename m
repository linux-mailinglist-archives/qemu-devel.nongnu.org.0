Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA6E6A1828
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 09:42:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVTf3-0007mE-71; Fri, 24 Feb 2023 03:42:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pVTf0-0007lZ-SC
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 03:42:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pVTey-0004wv-Ja
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 03:42:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677228152;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SV9TbB7emtmbCwpcPA8oXUMRDRuKcrpUYmAVUnQXMe8=;
 b=fjUjpBHLhI4aIZ7yC3VWUZBY0PRnoXcukd4bLOekQyiw1yXxRElGwP7PVeiO8Bs56niF+W
 DIucN6KJU8U0R8Rj+IbA2mUpdw5763hIW3KFQiN+NqSyNFiYG7g1awsdcWV7FdoE2htpR3
 9kBHsR/ojQC98jMtLe4u/P0na1oHH3g=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-351-udhMf4WUNcK_WOTNlXDZVQ-1; Fri, 24 Feb 2023 03:42:30 -0500
X-MC-Unique: udhMf4WUNcK_WOTNlXDZVQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 j32-20020a05600c1c2000b003e9bdf02c9fso930442wms.6
 for <qemu-devel@nongnu.org>; Fri, 24 Feb 2023 00:42:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SV9TbB7emtmbCwpcPA8oXUMRDRuKcrpUYmAVUnQXMe8=;
 b=NhZhkJY0+atMzIF3OYL3OlSA54u3J5I4oKM9zNnJtNTlfcAzlZJOkvD6A2cYR8ZTi9
 N6467O5jRc25YPaP4fNIHjNMgwE+4D4UN08OiXKw34dr8C2aHOzjwOTZNs0riYR0+UOO
 FojH1qc9X8bJxIjhnxSbszwh0RRdD7uZqd3Arln7pKB8hM/38niNsvVJ/qhL24L1xBjd
 mV7g9c436PjIFGvNWtXhV0g7rFs1yR9FWEl0WsVHjchxuM2YHIXCAF9wxUKWlI4ZEAL5
 uLRsgHVbAkPgdjkHTYlZfpLhk3f0RX7gbmNT7Z1kAx/z6XtqBUiv3RTMNHXeEnre8E9o
 zKJg==
X-Gm-Message-State: AO0yUKVRKTpMBwLDvrYYRG/Up0WuVnyO5VtdtOSWqRPtAk53qNx7vn+I
 fV3Fr4gitMsKg1daWNxyy/db57HMSXrJelj0305KIXe6JfkDTUPcT4K8xjXxn96OC2QqiebvDRw
 oncEfVRwgJi3K7lM=
X-Received: by 2002:a5d:574b:0:b0:2c7:17e0:54f5 with SMTP id
 q11-20020a5d574b000000b002c717e054f5mr2077791wrw.13.1677228149182; 
 Fri, 24 Feb 2023 00:42:29 -0800 (PST)
X-Google-Smtp-Source: AK7set9EDB+zIuWhTpf+AtBJsl6FlZC5HGolRs/+QIG9I2zIzOjPd4ksMzOf6h2ozKEDegcyQDzI4Q==
X-Received: by 2002:a5d:574b:0:b0:2c7:17e0:54f5 with SMTP id
 q11-20020a5d574b000000b002c717e054f5mr2077778wrw.13.1677228148938; 
 Fri, 24 Feb 2023 00:42:28 -0800 (PST)
Received: from [192.168.8.100] (tmo-115-119.customers.d1-online.com.
 [80.187.115.119]) by smtp.gmail.com with ESMTPSA id
 o24-20020a5d58d8000000b002c7066a6f77sm9366251wrf.31.2023.02.24.00.42.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Feb 2023 00:42:28 -0800 (PST)
Message-ID: <1403abc1-63d7-dc24-b5b6-b6a63a5679f6@redhat.com>
Date: Fri, 24 Feb 2023 09:42:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 01/18] hw/isa: Rename isa_get_dma() -> isa_bus_get_dma()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-ppc@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>
References: <20230215161641.32663-1-philmd@linaro.org>
 <20230215161641.32663-2-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230215161641.32663-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 15/02/2023 17.16, Philippe Mathieu-Daudé wrote:
> isa_get_dma() returns a DMA channel handler from an ISABus.
> To emphasize this, rename it as isa_bus_get_dma().
> 
> Mechanical change using:
> 
>    $ sed -i -e 's/isa_get_dma/isa_bus_get_dma/g' \
>          $(git grep -l isa_get_dma)
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/audio/cs4231a.c   | 2 +-
>   hw/audio/gus.c       | 2 +-
>   hw/audio/sb16.c      | 4 ++--
>   hw/block/fdc-isa.c   | 2 +-
>   hw/dma/i82374.c      | 2 +-
>   hw/isa/isa-bus.c     | 2 +-
>   include/hw/isa/isa.h | 2 +-
>   7 files changed, 8 insertions(+), 8 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


