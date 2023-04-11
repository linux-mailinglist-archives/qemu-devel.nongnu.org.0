Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E8E6DD7FA
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 12:34:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmBK0-000700-6F; Tue, 11 Apr 2023 06:33:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pmBJy-0006zs-Ik
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 06:33:54 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pmBJw-00009M-Rk
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 06:33:54 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 i8-20020a05600c354800b003ee93d2c914so5471078wmq.2
 for <qemu-devel@nongnu.org>; Tue, 11 Apr 2023 03:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681209231;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ArkUW7iaAaPej1MYS9ceFThNgs9QN0/hLqFDI2tF4TA=;
 b=KyHsF+QuOjHaTSWv9s+Y/HcVAUxl23iTrVTNGuG8BD7Zc581HcnJPXZu373QkJmsK9
 kPePInOGv6GjtO8XuImznCOgOxNxzYd03Sb3uKN9n4i7vdcMx8jKmMaWPxZBw8wwJGBB
 9PSI41L1RG19ibIx63GBWksJyhYV5FknxrLcgp0hEx3rIP34lz94eo6BGxxnreIIibR2
 l8GNJsU+osqA6DYflqRvBKfdyHO2IvcI/e9OSt5W7uZhFd5kGEbJ13Ba4bPS78zRA8kf
 vGrFoG6dyliH/B1ThG5mdjrssPPVcnw382SJsPkQW10wOuoAa5mrkk9NTq1g6FoZjJul
 8/gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681209231;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ArkUW7iaAaPej1MYS9ceFThNgs9QN0/hLqFDI2tF4TA=;
 b=pfvIFI9a0DFeFDIk1welu+QP3p/UUwmN8BsB0sK3tnURq4CyC+B5f7v9nFCzylbZUn
 FvxWq2SJu2/CO5T2W8tOORSk6BT5sNF4Vjcjndy9Sfp8b3X7v9pmnUTP5ysULMZsMRCp
 RvkgP7EwhmKs/vktP/XEL5Vs0LxA6fnU3XXhLA/+54V1/MMnd6FluGxdWBEhQNryPsP/
 nHRgU9S8O9K6tp1tw0G2kTjOcKbMsYZIbQT90b/ZWcOIWazlIsMDgIdnNttajY/1BlbM
 tCijDhGXxMkVp7NDuzAREIf0at/BDGjdkNV4XMNd0fS0L0aPV95XxFlxSaDzpnZMaPCf
 Q4jw==
X-Gm-Message-State: AAQBX9cShP9kKvlGox58J4GZwpmbvIGjWWy288RvOEBzmFcI2j6aX474
 IaeLnGE7mRMD6Iy2bgr+x2MNzw==
X-Google-Smtp-Source: AKy350ZomvHggQWEPhSmAiPKw2k9EH5sUHYtlgzRRkpNLV3kNEATsOM+VBtGCIK/lfl8ovIzkw7TAA==
X-Received: by 2002:a7b:cc07:0:b0:3ee:6d88:774a with SMTP id
 f7-20020a7bcc07000000b003ee6d88774amr7825242wmh.14.1681209231467; 
 Tue, 11 Apr 2023 03:33:51 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.195.239])
 by smtp.gmail.com with ESMTPSA id
 y10-20020a7bcd8a000000b003e203681b26sm16494942wmj.29.2023.04.11.03.33.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Apr 2023 03:33:51 -0700 (PDT)
Message-ID: <686bb7fb-9939-40d9-cf06-99d910f60ad1@linaro.org>
Date: Tue, 11 Apr 2023 12:33:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [PATCH-for-8.0? v1] hw/pvrdma: Protect against buggy or malicious
 guest driver
Content-Language: en-US
To: Yuval Shaia <yuval.shaia.ml@gmail.com>
References: <20230301142926.18686-1-yuval.shaia.ml@gmail.com>
Cc: qemu-devel@nongnu.org, soulchen8650@gmail.com, mcascell@redhat.com,
 marcel.apfelbaum@gmail.com, Paolo Bonzini <pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230301142926.18686-1-yuval.shaia.ml@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.246,
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

On 1/3/23 15:29, Yuval Shaia wrote:
> Guest driver allocates and initialize page tables to be used as a ring
> of descriptors for CQ and async events.
> The page table that represents the ring, along with the number of pages
> in the page table is passed to the device.
> Currently our device supports only one page table for a ring.
> 
> Let's make sure that the number of page table entries the driver
> reports, do not exceeds the one page table size.
> 

Fixes: CVE-2023-1544

> Reported-by: Soul Chen <soulchen8650@gmail.com>
> Signed-off-by: Yuval Shaia <yuval.shaia.ml@gmail.com>
> ---
> v0 -> v1:
> 	* Take ring-state into account
> 	* Add Reported-by
> ---
>   hw/rdma/vmw/pvrdma_main.c | 16 +++++++++++++++-
>   1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/rdma/vmw/pvrdma_main.c b/hw/rdma/vmw/pvrdma_main.c
> index 4fc6712025..55b338046e 100644
> --- a/hw/rdma/vmw/pvrdma_main.c
> +++ b/hw/rdma/vmw/pvrdma_main.c
> @@ -91,19 +91,33 @@ static int init_dev_ring(PvrdmaRing *ring, PvrdmaRingState **ring_state,
>                            dma_addr_t dir_addr, uint32_t num_pages)
>   {
>       uint64_t *dir, *tbl;
> -    int rc = 0;
> +    int max_pages, rc = 0;
>   
>       if (!num_pages) {
>           rdma_error_report("Ring pages count must be strictly positive");
>           return -EINVAL;
>       }
>   
> +    /*
> +     * Make sure we can satisfy the requested number of pages in a single
> +     * TARGET_PAGE_SIZE sized page table (taking into account that first entry
> +     * is reserved for ring-state)
> +     */

Worth a definition? Or maybe better an enum.

> +    max_pages = TARGET_PAGE_SIZE / sizeof(dma_addr_t) - 1;

Possibly clearer as a #define in pvrdma_dev_ring.h.

> +    if (num_pages > max_pages) {
> +        rdma_error_report("Maximum pages on a single directory must not exceed %d\n",
> +                          max_pages);
> +        return -EINVAL;
> +    }
> +
>       dir = rdma_pci_dma_map(pci_dev, dir_addr, TARGET_PAGE_SIZE);
>       if (!dir) {
>           rdma_error_report("Failed to map to page directory (ring %s)", name);
>           rc = -ENOMEM;
>           goto out;
>       }
> +
> +    /* We support only one page table for a ring */
>       tbl = rdma_pci_dma_map(pci_dev, dir[0], TARGET_PAGE_SIZE);
>       if (!tbl) {
>           rdma_error_report("Failed to map to page table (ring %s)", name);

Now looking at the following pvrdma_ring_init() call, I see too many
magic values for my taste, so feel unsafe to review:

     /* RX ring is the second */
     (*ring_state)++;
     rc = pvrdma_ring_init(ring, name, pci_dev,
                           (PvrdmaRingState *)*ring_state,
                           (num_pages - 1) * TARGET_PAGE_SIZE /
                           sizeof(struct pvrdma_cqne),
                           sizeof(struct pvrdma_cqne),
                           (dma_addr_t *)&tbl[1],
                           (dma_addr_t)num_pages - 1);

