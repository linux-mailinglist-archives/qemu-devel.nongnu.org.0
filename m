Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4896A6A1215
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 22:32:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVJCh-0002f3-1S; Thu, 23 Feb 2023 16:32:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVJCd-0002Wu-1g
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 16:32:37 -0500
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVJCb-0002rD-AO
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 16:32:34 -0500
Received: by mail-pl1-x642.google.com with SMTP id s5so14565097plg.0
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 13:32:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jLiM6BgnMyNKgPFHwQeyvRMgqpVZmkZwEF6a07MBfzo=;
 b=LlLZ/zBmf8eAidupjR/KzhFW4T7M0+EHljCvC/ddzRcEHftTE+aJ6TSDExrMJI3EVN
 gTFtLEQuOjdbqgLFYLpkBNxtRy3FAUUFQUodPxq46t5YI8WDmNBxyaVMtk2wj3xSPSWt
 YOsvyU1v6LAJlbpAoFhYWYwFyTtrS9JxQDhPb+UxezwvHrOhHWAADJKsprUytrPHBrGr
 gbzrf4AEYUtDy3tui6gjT3Nu+MVtwe/j0i/U/NiOCByz2YuOVsfSHEXJyrBxPE1XmnoW
 DY1seVc2j/duaIx47RJGuAwGaI4AK8cZEBUenGUr2okqX1UZlsl8oPbSDIAMaTRrwJxZ
 A6rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jLiM6BgnMyNKgPFHwQeyvRMgqpVZmkZwEF6a07MBfzo=;
 b=K8HJK/U86muq7cUZoN3GEjM2Y/o5VmuOAO5ksh4qWMQA1BQHLcHLByOPE2RoXUDl6v
 JCFa9waabpZ0eN3EUvZ/YlK01H1glUti9GBBsEqS5mb7Jbjl1oJxmE6AuSlvHm+JGOPs
 UwdZJl/S24WglUtkkyLdr+cwsN9tmLS3fQuVJTM4PShmdzutsvwVef1TjbJN3aeUHRGO
 BpY+xe9lJb3pQkV7qfqKZa8UuDeTVOaAguWjD6HBmUFJQ5FL+Be9GFsDU/Gue4Ur82bv
 m4gWd0Lx/eBz3C0AiBdm5W+e5kHS2Rg4pI5hNXIUxbVy990J5L1Efr2zGypsqJXl0eKv
 mOKw==
X-Gm-Message-State: AO0yUKVoFWCIrt3IlUegg6Kw3kVdbZ1uB5XL7q5nv88s5T8p3oKyOr5w
 OtH7WKpjb9lGE8AlmWJp/lQAgw==
X-Google-Smtp-Source: AK7set9RnEZzfrSBWBVxHGMht5/bE3dhNgWmGc+dRR2UPSxZiIJ/wX646yvxNFEPKzZO/LEwkL7Maw==
X-Received: by 2002:a17:902:d50b:b0:19a:97e0:60e8 with SMTP id
 b11-20020a170902d50b00b0019a97e060e8mr15700523plg.29.1677187951701; 
 Thu, 23 Feb 2023 13:32:31 -0800 (PST)
Received: from [192.168.54.227] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 a3-20020a1709027d8300b0019a837be977sm3258729plm.271.2023.02.23.13.32.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 13:32:31 -0800 (PST)
Message-ID: <d35d052f-758b-5149-8408-791a3d68aa99@linaro.org>
Date: Thu, 23 Feb 2023 11:32:27 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2] softmmu: Use memmove in flatview_write_continue
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, David Hildenbrand <david@redhat.com>,
 Peter Xu <peterx@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>
References: <20230131030155.18932-1-akihiko.odaki@daynix.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230131030155.18932-1-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::642;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x642.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 1/30/23 17:01, Akihiko Odaki wrote:
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
> memmove() to tolerate overlaps. Using memmove() will slightly damage the
> performance as it will need to check overlaps before using SIMD
> instructions for copying, but the cost should be negligible, considering
> the inherent complexity of flatview_write_continue().
> 
> The test cases generated by the fuzzer is available at:
> https://patchew.org/QEMU/20230129053316.1071513-1-alxndr@bu.edu/
> 
> The fixed test case is:
> fuzz/crash_47dfe62d9f911bf523ff48cd441b61c0013ed805
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> Acked-by: Alexander Bulekov <alxndr@bu.edu>
> ---
> V1 -> V2: Correct spellings in the message

Queued to tcg-next.


r~

> 
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


