Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B666E8D01
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 10:42:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppPrV-0003n0-RK; Thu, 20 Apr 2023 04:41:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppPrU-0003mq-MU
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 04:41:52 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppPrS-0003DI-Qc
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 04:41:52 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 eo4-20020a05600c82c400b003f05a99a841so723845wmb.3
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 01:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681980109; x=1684572109;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MLJTOimefXT549nLNIaSAAp82gvunElyUIc+U97TVCw=;
 b=mEQMxRIsECDxWNxTSC8uPWiiAPrtKdGzJoQtovDDNXLCNM+JPQRw9PXnUVZWx+seoC
 Sn2wXEm4njpCn+QiZhiloXhZ2/XkHd+MBScZUq9zbYpHef8sLsPHh4CUynmRc8PDH/Fi
 oI9mKyXwDlJnqJzZcqy6kVkJob3Qdp81kGkvfxO4ShI5Moj/O+rarQSMAiuKG/uw2D5K
 N0w6YssUOL+NoqgAOIi+hqKqgOrC6REBGZC0dDr6A+o+w/isyW7XpVEsTCVsVANzBYWY
 3/SSXBETgBQ6+azdvhg2zkZPUByu0OEZUIt6ujTb1/Jheti0TI/G6IlJaH76UDbap7Lr
 1KLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681980109; x=1684572109;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MLJTOimefXT549nLNIaSAAp82gvunElyUIc+U97TVCw=;
 b=BuDl43EErmqUlyvCpvdh0nShHhHRNeMv74LafokH0dNu6cFnvHCl677wCVe11CJjqO
 hME+Bs4ywm+QpJBlTDgPJhb2xh+0YVCuit2O/sScwdmcpY39+z0tGBrf3nHF7/N1nv+h
 7SUBlaNLZfcJgURkXQnZrru8x6vCWESmhqXx+I6sBkbC5VPJkZJiDg/8SDd+RGBlBF2M
 raXtB/iPk+KyWGrARgu+TDWhxlqxFRNB3tXL3+W4f5WG2U3RxkLFpidK3maqPFV/z9Cd
 oeqmk/R3cs/FjBlrTiddlCLRrPmxVFqGk9bYPg5zOgWcZy4gWuo9W9On4x/Cjzq4q9/j
 5x6g==
X-Gm-Message-State: AAQBX9eu4AU4BMU/NTAPHrlivD1IJ4BDuigrY8vk9nHcP1AsjgmYnY5M
 jrMBNFQ4xutAnrh9foJozASTLA==
X-Google-Smtp-Source: AKy350bpVRWYbnCRIPAIF8kOxXvF66a+y/ORhP5FTBjVWr9+fItbzTqTbp7prZuDb3z/lijquqZqTA==
X-Received: by 2002:a05:600c:3507:b0:3f1:72d8:a1b1 with SMTP id
 h7-20020a05600c350700b003f172d8a1b1mr4437039wmq.7.1681980109076; 
 Thu, 20 Apr 2023 01:41:49 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 p8-20020a05600c358800b003f1738d0d13sm6614366wmq.1.2023.04.20.01.41.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 01:41:48 -0700 (PDT)
Message-ID: <6c9b3360-e632-b41a-b890-288863f2c910@linaro.org>
Date: Thu, 20 Apr 2023 10:41:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH 2/3] softmmu/ioport.c: QOMify MemoryRegionPortioList
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, pbonzini@redhat.com,
 qemu-devel@nongnu.org
References: <20230419151652.362717-1-mark.cave-ayland@ilande.co.uk>
 <20230419151652.362717-3-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230419151652.362717-3-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.597,
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

In all uses this opaque pointer is a Object*. Almost all cases are
a DeviceState* and one is a BusState* (IDEBus).

Could this opaque become 'Object *owner' (simplifying the next patch)?

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

