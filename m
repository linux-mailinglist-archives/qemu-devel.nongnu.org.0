Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D08681F56
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 00:05:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMdBt-0007xd-9j; Mon, 30 Jan 2023 18:03:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pMdBf-0007v0-Jw
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 18:03:55 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pMdBd-00040e-8c
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 18:03:42 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 d4-20020a05600c3ac400b003db1de2aef0so9361940wms.2
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 15:03:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CskbMQCQAi8Y9Et0H0LQ/DW7FMhYf3Zpl45qIEtq6uE=;
 b=Ne5NjDNWLF3id+b57F/eI2P64r1Y5wFwqZnFU6IMKCfqJ0QxpzGVhRRmZqeQj56low
 /p2rKl311jgZEf6Ho56WF/LZlotT1eAWZK9F0TnYZXUNXKWK70mD4fptSuiiHF5+4yw/
 PCh4nYWnlQ07Hx4WR5s9BCk/4/ABJhNTDEJg5PrXo6oSNvdHIV3O5CoZDyw7yu3T7nxj
 TCw5Y8H1YSrV3cDIUKm6POr7TFJGTfuP8wkMs/v2yrcn+nsvjvepz0myvnBALBH32wy3
 J0pOAEtkEIopJQqxfFcLyKAsVFnd8Uy8lk/xQcpkkcDcAIDGc9gqlHF1FqxgJDSTeC9+
 0Dtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CskbMQCQAi8Y9Et0H0LQ/DW7FMhYf3Zpl45qIEtq6uE=;
 b=2r4WtxodXQb36JowEaIvUsEpbeH6EKGJyO0+RhRArfjysl78CVficlHmvS/AN0wpbZ
 nqsU4QZ28EXMZDrBjWf9imHpZDRi7yLomTvguWqtbtmbnkFluz2FY/INZPuqdF9CBP8l
 tZdyBmGwF0kFAldrXqTRyavsq7R7KuFy/cMcf7R8d3UEL8y7FlXlgPTY1HlzHSHVOFWC
 /lRCWSQOO3YZbpi821WHEiYn6qZGZWXVJ6go/ZEZ23Jf1fhpUUC2vufmt7tMQhwsMJzY
 5HHW5VIfM2zaMLMVvxM2sn60UYEXKJnSHUMPFWawWSIo9PzZZZpPe7hfPSJ9WtpukLbA
 lF+w==
X-Gm-Message-State: AFqh2krj1NpHYhKQl6tBTkdG3yrP9+V1WaHDlB7b1YCKBte0fapcBGar
 tOZMuI2zl51xKs1L96T3jE5K3w==
X-Google-Smtp-Source: AMrXdXsfRcCtTLYODZmuDMhVxV9AfTzZ3B+yY2iGgqrFrc+jpHT34Gi98kJqmiq9AhfgYGmwiCxl1g==
X-Received: by 2002:a05:600c:3ac8:b0:3da:f67c:aca6 with SMTP id
 d8-20020a05600c3ac800b003daf67caca6mr49821568wms.34.1675119819362; 
 Mon, 30 Jan 2023 15:03:39 -0800 (PST)
Received: from [192.168.1.4] ([41.141.105.34])
 by smtp.gmail.com with ESMTPSA id
 n17-20020a1c7211000000b003dc3f07c876sm11296567wmc.46.2023.01.30.15.03.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jan 2023 15:03:39 -0800 (PST)
Message-ID: <340d48d4-b6b3-d34d-2705-aa1421360b44@linaro.org>
Date: Tue, 31 Jan 2023 00:03:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] softmmu: Use memmove in flatview_write_continue
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: qemu-devel@nongnu.org, David Hildenbrand <david@redhat.com>,
 Peter Xu <peterx@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>
References: <20230130135152.76882-1-akihiko.odaki@daynix.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230130135152.76882-1-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 30/1/23 14:51, Akihiko Odaki wrote:
> We found a case where the source passed to flatview_write_continue() may
> overlap with the destination when fuzzing igb, a new proposed network
> device with sanitizers.
> 
> igb uses pci_dma_map() to get Tx packet, and pci_dma_write() to write Rx
> buffer. While pci_dma_write() is usually used to write data from
> memory not mapped to the guest, if igb is configured to perform
> loopback, the data will be sourced from the guest memory. The source and
> destination can overlap and the usage of memcpy() will be invalid in
> such a case.
> 
> While we do not really have to deal with such an invalid request for
> igb, detecting the overlap in igb code beforehand requires complex code,
> and only covers this specific case. Instead, just replace memcpy() with
> memmove() to torelate overlaps. Using memmove() will slightly damage the

"tolerate"?

> performance as it will need to check overlaps before using SIMD
> instructions for copying, but the cost should be negiligble, considering

"negligible"

> the inherent complexity of flatview_write_continue().
> 
> The test cases generated by the fuzzer is available at:
> https://patchew.org/QEMU/20230129053316.1071513-1-alxndr@bu.edu/
> 
> The fixed test case is:
> fuzz/crash_47dfe62d9f911bf523ff48cd441b61c0013ed805
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>   softmmu/physmem.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> index cb998cdf23..3cd27b1c9d 100644
> --- a/softmmu/physmem.c
> +++ b/softmmu/physmem.c
> @@ -2828,7 +2828,7 @@ static MemTxResult flatview_write_continue(FlatView *fv, hwaddr addr,
>           } else {
>               /* RAM case */
>               ram_ptr = qemu_ram_ptr_length(mr->ram_block, addr1, &l, false);
> -            memcpy(ram_ptr, buf, l);
> +            memmove(ram_ptr, buf, l);
>               invalidate_and_set_dirty(mr, addr1, l);
>           }
>   


