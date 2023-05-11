Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67AE76FF35D
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 15:47:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px6ck-0007Qo-In; Thu, 11 May 2023 09:46:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1px6cc-0007QZ-6e
 for qemu-devel@nongnu.org; Thu, 11 May 2023 09:46:18 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1px6ca-0007d8-Ic
 for qemu-devel@nongnu.org; Thu, 11 May 2023 09:46:17 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-307664010fdso7984591f8f.0
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 06:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683812775; x=1686404775;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kdrRjQ49zNkDCzmgZ75Dyp+vrNUeCS3LJz/KJvCz2LM=;
 b=TLKp68Am8rpmSd2m+2RAd5F87ToI8Bq6l+bn1h+zxVOj187rEMhRZWghOi/BBxMc8d
 yw7auJOCDU9x+n7IIi6aDTjMAshDFOUYb4r4JnBsTpGpi7JaMXUmOoDnlhVEOKD8b0Vm
 rv157RMhtrN/8UXwS4NKJXQCgxYauHJlCfTc0DzJWLrLK/FvmvzgJ6saqkM0inDT6iDd
 ZRORIh2nZi1lLblpw4PVnSgJVKdwsKCggR242e89/MEI1VYazV8Js64dyPzCob5VhHXb
 OZm6Kl+i0djrx5ng3KKVdWJzwzIA78+fUCYwQ89OKwwV6LUWZ2OSmb1OX7AZhuDmClP+
 wQlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683812775; x=1686404775;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kdrRjQ49zNkDCzmgZ75Dyp+vrNUeCS3LJz/KJvCz2LM=;
 b=fctKNy33xMqz8stLAq/2wtuZfh42Ptz3uxJFyg5PNaL2LvIC+yCxfWWm1lpmrp29Gq
 /O7xzTV1Bxkix1zKTFIibHWHcXC+HrwwXkKdMr7TTL33OFCsIFRwUb+rt8Tw82CdClkk
 emq9aqVOYne03Cm1CJSzvMqP0C/yiyQnuyIu6gM221tAO5nVLnZQfYiZ85P4L7eaz/C9
 UMNwcxYiswBJOAnLe5E6kZ44Mt+MTykHlv/C4R5LgrCfP/NiAGBz6S7A07/OU8vRev/F
 Qtosurwaw7Jswwand8d3Q4SgO4WmGsnAp9tU7mGZKVh/vgl+w9tIyBx6V0bOU2woSS1s
 JSvQ==
X-Gm-Message-State: AC+VfDzULNGzD8sLVhU8bQGs7GwnNeI7CgWup16XPXlz6xgIsXf96K8l
 xTlppT1haH1aFlKD0pX3l30MWiYgffAbPjC28fh53g==
X-Google-Smtp-Source: ACHHUZ787L3TJMHcM88nHBPD2FvnzHek7ljw/46+51BxgioYocPZKrbhjPoVV3Omgs95MEBQL8AraQ==
X-Received: by 2002:adf:f790:0:b0:2f2:7a0e:5cc9 with SMTP id
 q16-20020adff790000000b002f27a0e5cc9mr13158159wrp.19.1683812774871; 
 Thu, 11 May 2023 06:46:14 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.152.186])
 by smtp.gmail.com with ESMTPSA id
 q4-20020a5d61c4000000b003063772a55bsm20495788wrv.61.2023.05.11.06.46.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 May 2023 06:46:14 -0700 (PDT)
Message-ID: <68cca2b7-a61f-325b-2a45-33d6f3bb0c24@linaro.org>
Date: Thu, 11 May 2023 15:46:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.1
Subject: Re: [PATCH 2/3] softmmu/ioport.c: QOMify MemoryRegionPortioList
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, pbonzini@redhat.com,
 qemu-devel@nongnu.org
References: <20230419151652.362717-1-mark.cave-ayland@ilande.co.uk>
 <20230419151652.362717-3-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230419151652.362717-3-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.124,
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

On 19/4/23 17:16, Mark Cave-Ayland wrote:
> The aim of QOMification is so that the lifetime of the MemoryRegionPortioList
> structure can be managed using QOM's in-built refcounting instead of having to
> handle this manually.
> 
> Due to the use of an opaque pointer it isn't possible to model the new
> TYPE_MEMORY_REGION_PORTIO_LIST directly using QOM properties, however since
> use of the new object is restricted to the portio API we can simply set the
> opaque pointer (and the heap-allocated port list) internally.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>   softmmu/ioport.c | 25 ++++++++++++++++++++++---
>   1 file changed, 22 insertions(+), 3 deletions(-)
> 
> diff --git a/softmmu/ioport.c b/softmmu/ioport.c
> index d0d5b0bcaa..238625a36f 100644
> --- a/softmmu/ioport.c
> +++ b/softmmu/ioport.c
> @@ -32,11 +32,16 @@
>   #include "exec/address-spaces.h"
>   #include "trace.h"
>   
> -typedef struct MemoryRegionPortioList {
> +struct MemoryRegionPortioList {
> +    Object obj;
> +
>       MemoryRegion mr;
>       void *portio_opaque;
>       MemoryRegionPortio *ports;
> -} MemoryRegionPortioList;
> +};
> +
> +#define TYPE_MEMORY_REGION_PORTIO_LIST "memory-region-portio-list"

Possibly simpler as: TYPE_MEMORY_REGION_PORTIO "memory-region-portio"

Otherwise:

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


