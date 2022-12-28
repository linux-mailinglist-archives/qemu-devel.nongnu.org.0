Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 824C665764E
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Dec 2022 13:08:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAVDX-00077f-Ba; Wed, 28 Dec 2022 07:07:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pAVDU-00077M-Sv
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 07:07:29 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pAVDT-0006qI-Af
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 07:07:28 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 b24-20020a05600c4a9800b003d21efdd61dso11143739wmp.3
 for <qemu-devel@nongnu.org>; Wed, 28 Dec 2022 04:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oEQe7+o8R4s1KscmT7rQL4j/RlGUjCQYw7GvSEg0FlU=;
 b=XU3FskNedkpqdRL06WDu/uPKmHOJYHNvQA0tKqQ/YiWQvu5SCyWrARfCRjhOXx8pJf
 Lz3Djp8oghygObGC3zyLxkpHpIMwvrO3dgdWkgCKsXLZnVOKLEsHcjpDSmDV1GFU5VqD
 a9FDHAApk+6O9FK/pcscVgWT7n6MOPC27hA8cByLjzv55DAK7rsu+abMxJg4Z+Zel6LP
 4xI+4gjIgEtrr9bhJrLQtPSqkcDPgUqyMcgRsOskJxUlRwuj2FxEljZvNsWo1Lk2aZNz
 EIBcm+Grbc+Oaie9I7dHh13VZwpKEz/aj75azejsX8uvTTSPB//26DpRaH6hgYlWVXvz
 RACA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oEQe7+o8R4s1KscmT7rQL4j/RlGUjCQYw7GvSEg0FlU=;
 b=TAtjo1X8vEHVGvVwsaVkO72D5ihMH7RqpL3P+7/RCLmWEfRlct736LlFKXMoUohwAd
 qzJOavlkjrCN8Ae/1bHZvw8EHPma2/nfeqUnkcRmpQhSV7rrWzAvwd+7aM44abZL/vTX
 312qvsbAH3r2NJfU07YUrHI41TGSR2Nw9yq+eSa8vXmeCxgfcHK7qsOE5t1Tj2WzV6Qn
 9jyPopYJi0K9UUGXKsWzdBE6Xqy4twU2Hi3tSFvcL1vviE9c+HOxUWK59WsCVo7Q5FN/
 IH+Ft/POvWEx+qkAiArY7eyOXMiPYtyGZTfY8Q9ITwb4eqtO1g6Yh8bGVZxLTwl3tld/
 zkpA==
X-Gm-Message-State: AFqh2kpTGrlLenMRZtKfdGKZbRF+yVVoB7g5GTA/frnVjTe58HiSTctC
 SP+IeNm+O7iUF4lUbhw4suhdJw==
X-Google-Smtp-Source: AMrXdXu1/BjoHuuuaEk/tAOIuLL5U1w+BjIOzD8UJTbbHGnbbA8DjhbgigYslv6Xiy/SiW8Bjx1Dyg==
X-Received: by 2002:a05:600c:c07:b0:3d9:73fe:96f8 with SMTP id
 fm7-20020a05600c0c0700b003d973fe96f8mr9431055wmb.32.1672229245468; 
 Wed, 28 Dec 2022 04:07:25 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 o15-20020a05600c4fcf00b003c6f3f6675bsm27699990wmq.26.2022.12.28.04.07.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Dec 2022 04:07:25 -0800 (PST)
Message-ID: <10c0588b-9b94-9ed7-4c1d-15eec7096e16@linaro.org>
Date: Wed, 28 Dec 2022 13:07:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] virtio-mem: Fix the iterator variable in a vmem->rdl_list
 loop
Content-Language: en-US
To: Chenyi Qiang <chenyi.qiang@intel.com>,
 David Hildenbrand <david@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-stable@nongnu.org
References: <20221228090312.17276-1-chenyi.qiang@intel.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221228090312.17276-1-chenyi.qiang@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.147,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 28/12/22 10:03, Chenyi Qiang wrote:
> It should be the variable rdl2 to revert the already-notified listeners.
> 
> Fixes: 2044969f0b ("virtio-mem: Implement RamDiscardManager interface")
> Signed-off-by: Chenyi Qiang <chenyi.qiang@intel.com>
> ---
>   hw/virtio/virtio-mem.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
> index d96bde1fab..88c9c10318 100644
> --- a/hw/virtio/virtio-mem.c
> +++ b/hw/virtio/virtio-mem.c
> @@ -341,7 +341,7 @@ static int virtio_mem_notify_plug(VirtIOMEM *vmem, uint64_t offset,
>       if (ret) {
>           /* Notify all already-notified listeners. */
>           QLIST_FOREACH(rdl2, &vmem->rdl_list, next) {
> -            MemoryRegionSection tmp = *rdl->section;
> +            MemoryRegionSection tmp = *rdl2->section;
>   
>               if (rdl2 == rdl) {
>                   break;

Cc: qemu-stable@nongnu.org
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


