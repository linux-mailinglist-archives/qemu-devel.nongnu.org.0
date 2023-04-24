Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4453A6ED38E
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 19:34:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pr03f-0006OX-3H; Mon, 24 Apr 2023 13:32:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pr03b-0006Nk-QQ
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 13:32:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pr03W-0003Jt-6p
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 13:32:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682357568;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bj9gf2QAgGJ/dUvg5I13BerTwODdA6mcmgvWykoqsjQ=;
 b=PCbqjAG7A4JAiRcXArOer3QgRxqvBKaSJS38UKkTzdh9QBIDc12+MQhLNHn33AakHWMyq2
 x4rHBZXsF1e04qAQPzDFeyOFj/hiQPg0DyBeOWaFgWpJXZpi/DnzZk/e10EQU25krhFF/7
 pBup9VuFdLlL1DLur7m3ZPFG5805KcI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-68-kVcOTjQsOn6whJNvSraneQ-1; Mon, 24 Apr 2023 13:32:47 -0400
X-MC-Unique: kVcOTjQsOn6whJNvSraneQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3f1912ed0daso13471685e9.1
 for <qemu-devel@nongnu.org>; Mon, 24 Apr 2023 10:32:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682357566; x=1684949566;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bj9gf2QAgGJ/dUvg5I13BerTwODdA6mcmgvWykoqsjQ=;
 b=A4crUV81sSeZC3DLqTJISJQAcl+qcsSGCqIpOmZd1m8NABwIu+6uKde2OnQEMgMQ8D
 xiecB34JSOKf5hHTxepsF/3AEPPGkKm5toCBzrcXOLH+UD8KvHEKa3NbCJde4QBphV4c
 QUL5XOs7mfWBpaYb7mj9WCrvzBiq3zk9NRm0YVUIHeDmoO7bAnVXsdDRBevL3Zg/ihUp
 lmaoJMIu+qK6eW3CEA49XgT30kI/i6FX7BNakpjmodlex0WeGWlLlwqkQ4tb4s4K1gMp
 45hNclrpzBYjxmOjfhWwWo14wvchasB0a9Zr5Fqor8u/sQ52hTJSBQwTiWsHJSFINUCI
 P+kw==
X-Gm-Message-State: AAQBX9fHKrV3Lvm2hdfEt8Fc+OJ2Oe86eLcFg1UoVfqqsc2kXH1pMk/B
 0pCxJ6gC520WS912+BgJM+EYhkVrg6zZRUEgfo4KUM5hp7CwXnpzqr5b3qcLgj1VzHi8dtAz86M
 xa4pGLb4FXZZlkzM=
X-Received: by 2002:a1c:cc14:0:b0:3f1:7a44:317c with SMTP id
 h20-20020a1ccc14000000b003f17a44317cmr8023270wmb.24.1682357566273; 
 Mon, 24 Apr 2023 10:32:46 -0700 (PDT)
X-Google-Smtp-Source: AKy350aQ2lCEmBajMWjrIc5fGYoAR97l03B8K4aYFlNRdXUi+qs8dQjH5UIX0O5Z9wd+3ZMo777WSA==
X-Received: by 2002:a1c:cc14:0:b0:3f1:7a44:317c with SMTP id
 h20-20020a1ccc14000000b003f17a44317cmr8023254wmb.24.1682357565943; 
 Mon, 24 Apr 2023 10:32:45 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-178-102.web.vodafone.de.
 [109.43.178.102]) by smtp.gmail.com with ESMTPSA id
 m18-20020a7bcb92000000b003f24f245f57sm3911695wmi.42.2023.04.24.10.32.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Apr 2023 10:32:45 -0700 (PDT)
Message-ID: <07e0ee40-31cb-da2e-6f2e-7aa3a7622e9a@redhat.com>
Date: Mon, 24 Apr 2023 19:32:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 1/2] hw/sd/allwinner-sdhost: Correctly byteswap descriptor
 fields
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Beniamino Galvani <b.galvani@gmail.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>, qemu-stable@nongnu.org,
 qemu-s390x <qemu-s390x@nongnu.org>
References: <20230424165053.1428857-1-peter.maydell@linaro.org>
 <20230424165053.1428857-2-peter.maydell@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230424165053.1428857-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.194, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 24/04/2023 18.50, Peter Maydell wrote:
> In allwinner_sdhost_process_desc() we just read directly from
> guest memory into a host TransferDescriptor struct and back.
> This only works on little-endian hosts. Abstract the reading
> and writing of descriptors into functions that handle the
> byte-swapping so that TransferDescriptor structs as seen by
> the rest of the code are always in host-order.
> 
> This fixes a failure of one of the avocado tests on s390.
> 
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/sd/allwinner-sdhost.c | 31 ++++++++++++++++++++++++++-----
>   1 file changed, 26 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/sd/allwinner-sdhost.c b/hw/sd/allwinner-sdhost.c
> index 51e5e908307..92a0f42708d 100644
> --- a/hw/sd/allwinner-sdhost.c
> +++ b/hw/sd/allwinner-sdhost.c
> @@ -302,6 +302,30 @@ static void allwinner_sdhost_auto_stop(AwSdHostState *s)
>       }
>   }
>   
> +static void read_descriptor(AwSdHostState *s, hwaddr desc_addr,
> +                            TransferDescriptor *desc)
> +{
> +    uint32_t desc_words[4];
> +    dma_memory_read(&s->dma_as, desc_addr, &desc_words, sizeof(desc_words),
> +                    MEMTXATTRS_UNSPECIFIED);
> +    desc->status = le32_to_cpu(desc_words[0]);
> +    desc->size = le32_to_cpu(desc_words[1]);
> +    desc->addr = le32_to_cpu(desc_words[2]);
> +    desc->next = le32_to_cpu(desc_words[3]);
> +}
> +
> +static void write_descriptor(AwSdHostState *s, hwaddr desc_addr,
> +                             const TransferDescriptor *desc)
> +{
> +    uint32_t desc_words[4];
> +    desc_words[0] = cpu_to_le32(desc->status);
> +    desc_words[1] = cpu_to_le32(desc->size);
> +    desc_words[2] = cpu_to_le32(desc->addr);
> +    desc_words[3] = cpu_to_le32(desc->next);
> +    dma_memory_write(&s->dma_as, desc_addr, &desc_words, sizeof(desc_words),
> +                     MEMTXATTRS_UNSPECIFIED);
> +}
> +
>   static uint32_t allwinner_sdhost_process_desc(AwSdHostState *s,
>                                                 hwaddr desc_addr,
>                                                 TransferDescriptor *desc,
> @@ -312,9 +336,7 @@ static uint32_t allwinner_sdhost_process_desc(AwSdHostState *s,
>       uint32_t num_bytes = max_bytes;
>       uint8_t buf[1024];
>   
> -    /* Read descriptor */
> -    dma_memory_read(&s->dma_as, desc_addr, desc, sizeof(*desc),
> -                    MEMTXATTRS_UNSPECIFIED);
> +    read_descriptor(s, desc_addr, desc);
>       if (desc->size == 0) {
>           desc->size = klass->max_desc_size;
>       } else if (desc->size > klass->max_desc_size) {
> @@ -356,8 +378,7 @@ static uint32_t allwinner_sdhost_process_desc(AwSdHostState *s,
>   
>       /* Clear hold flag and flush descriptor */
>       desc->status &= ~DESC_STATUS_HOLD;
> -    dma_memory_write(&s->dma_as, desc_addr, desc, sizeof(*desc),
> -                     MEMTXATTRS_UNSPECIFIED);
> +    write_descriptor(s, desc_addr, desc);
>   
>       return num_done;
>   }

Reviewed-by: Thomas Huth <thuth@redhat.com>


