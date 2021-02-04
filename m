Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CFDC30FB71
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 19:30:57 +0100 (CET)
Received: from localhost ([::1]:34798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7jP6-0005rZ-2e
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 13:30:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7iVG-00051p-4d
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 12:33:14 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:51178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7iVD-0003Bn-RW
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 12:33:13 -0500
Received: by mail-pj1-x1030.google.com with SMTP id cl8so2102161pjb.0
 for <qemu-devel@nongnu.org>; Thu, 04 Feb 2021 09:33:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=AimpCFcfledhvgAWKoJZuslhiZ6vqPcqv9Wk/w3Diu4=;
 b=X+q1ht3pZkPlKc6IhTTbOkfCTwYPhUb8vZMWjUwPX0VFTtgC5K+dtVr3x8Bte6alA1
 MtlfnwA+bE1/o4O2ObgsKMwvacobNVkQTtTgrRLW96CcmsfTUbuTQ7xaM6bEocCtUkti
 5rzGww4Nv7tvPrct2SvOOmNkAl/ao3DELdmWC1JUlAsVmcMqmlKODH6OYvTKZ9NbbcXS
 6H7T9lnvc0A2r9S9ukvG29T6p5JE9B6uTahkkfCvmZoxwExZ/xfx/Qhf9ufvvvnjqjW1
 CXmpUjEjJdTzhWVwgjJkJL2DXivkc1z8LQC2zHZP8dG5LCmRHIxCdkqgS0rMMH6/6lXG
 HOVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AimpCFcfledhvgAWKoJZuslhiZ6vqPcqv9Wk/w3Diu4=;
 b=VR3PXtYYCwkZCZbGT8w4S4PJmALA3dKwdCPH4e3TN6DgGPQ8dNq1z+VjsTfEFBLx1k
 yCdsouMIIpm4bt/U9g5ICdxeR5t+m1yhjuhHc0q7H0xjO6+oTIX/BmoSsPaJ3Ow0A8Pe
 Y8E4bBuom/Tbs0ZB34gE9RRMqNMAOtfsrrKegYmR/CpGB0X6qvrQWU3hbNbgqka71u59
 MGp8AufT+xKQMHvafQ9l/ua/oQ80W+9IwhhE/E+im6CaFqC+ODHiqxJFMCUNlZvfsbME
 /3s1npDOo9T8jgMePsIw/eGAQrDd6mQWSKR0dAIvbeV9XE1lWyk66E9opJM/1DDRsh0c
 Fxfg==
X-Gm-Message-State: AOAM532Vxl8Gt68hsJWlPVUACAzTEzviPjims4YUXS5kNtpHNV/tlVuF
 XI16EKr3Y0tdgYjQ9QwYmkpOLA==
X-Google-Smtp-Source: ABdhPJx8TsxiKBi+N+H3fp0gUWfPhGcB/lC5gMOkR3ajcMIQVX/Jit4tDeB2ssp8FX+cU1R2pRJUEA==
X-Received: by 2002:a17:902:988e:b029:e1:2c5b:321c with SMTP id
 s14-20020a170902988eb02900e12c5b321cmr356190plp.54.1612459990006; 
 Thu, 04 Feb 2021 09:33:10 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id h15sm3763719pfo.84.2021.02.04.09.33.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Feb 2021 09:33:08 -0800 (PST)
Subject: Re: [PULL 11/24] tcg/optimize: Use tcg_constant_internal with
 constant folding
To: David Hildenbrand <david@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 "Richard W.M. Jones" <rjones@redhat.com>
References: <28457ae1-7e9b-4428-cb10-3b79ebeac8d0@linaro.org>
 <19D304C1-6401-4D16-AB54-DD19C978D04D@redhat.com>
 <db32a1f5-ad73-a341-f5e7-1c8f592d3d5b@redhat.com>
 <bd7154e1-4d6c-5b98-9e80-ec04f8476373@redhat.com>
 <20210204090351.GN30079@redhat.com> <20210204092916.GS27779@redhat.com>
 <b94570e3-9f87-d259-a338-adef1d552d1a@redhat.com>
 <e1bc591d-009f-3b0f-83a0-36095efff7ee@amsat.org>
 <74c25c22-eacd-1120-80d4-f721ca9a87ba@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9fea0d6d-6068-30e9-3026-8711931f326a@linaro.org>
Date: Thu, 4 Feb 2021 07:33:04 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <74c25c22-eacd-1120-80d4-f721ca9a87ba@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.182,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/4/21 6:29 AM, David Hildenbrand wrote:
> On 04.02.21 17:04, Philippe Mathieu-Daudé wrote:
>> On 2/4/21 10:37 AM, David Hildenbrand wrote:
>>> On 04.02.21 10:29, Richard W.M. Jones wrote:
>>>>>> commit 8f17a975e60b773d7c366a81c0d9bbe304f30859
>>>>>> Author: Richard Henderson <richard.henderson@linaro.org>
>>>>>> Date:   Mon Mar 30 19:52:02 2020 -0700
>>>>>>
>>>>>>       tcg/optimize: Adjust TempOptInfo allocation
>>>>>>
>>>>>> The image boots just fine on s390x/TCG as well.
>>>>>
>>>>> Let me try this in a minute on my original test machine.
>>>>
>>>> I got the wrong end of the stick as David pointed out in the other email.
>>>>
>>>> However I did test things again this morning (all on s390 host), and
>>>> current head (1ed9228f63ea4b) fails same as before ("mount" command
>>>> fails).
>>>>
>>>> Also I downloaded:
>>>>
>>>>   
>>>> https://dl.fedoraproject.org/pub/fedora-secondary/releases/33/Cloud/s390x/images/Fedora-Cloud-Base-33-1.2.s390x.qcow2
>>>>
>>>>
>>>>
>>>> and booted it on 1ed9228f63ea4b using this command:
>>>>
>>>>     $ ~/d/qemu/build/s390x-softmmu/qemu-system-s390x -machine accel=tcg
>>>> -m 2048 -drive
>>>> file=Fedora-Cloud-Base-33-1.2.s390x.qcow2,format=qcow2,if=virtio
>>>> -serial stdio
>>>>
>>>> Lots of core dumps inside the guest, same as David saw.
>>>>
>>>> I then reset qemu back to 8f17a975e60b773d ("tcg/optimize: Adjust
>>>> TempOptInfo allocation"), rebuilt qemu, tested the same command and
>>>> cloud image, and that booted up much happier with no failures or core
>>>> dumps.
>>>>
>>>> Isn't it kind of weird that this would only affect an s390 host?  I
>>>> don't understand why the host would make a difference if we're doing
>>>> TCG.
>>>
>>> I assume an existing BUG in the s390x TCG backend ... which makes it
>>> harder to debug :)
>>
>> This seems to fix it:
>>
>> -- >8 --
>> diff --git a/tcg/s390/tcg-target.c.inc b/tcg/s390/tcg-target.c.inc
>> index 8517e552323..32d03dbfbaf 100644
>> --- a/tcg/s390/tcg-target.c.inc
>> +++ b/tcg/s390/tcg-target.c.inc
>> @@ -1094,10 +1094,16 @@ static int tgen_cmp(TCGContext *s, TCGType type,
>> TCGCond c, TCGReg r1,
>>                   op = (is_unsigned ? RIL_CLFI : RIL_CFI);
>>                   tcg_out_insn_RIL(s, op, r1, c2);
>>                   goto exit;
>> -            } else if (c2 == (is_unsigned ? (uint32_t)c2 : (int32_t)c2)) {
>> -                op = (is_unsigned ? RIL_CLGFI : RIL_CGFI);
>> -                tcg_out_insn_RIL(s, op, r1, c2);
>> -                goto exit;
>> +            } else if (is_unsigned) {
>> +                if (c2 == (uint32_t)c2) {
>> +                    tcg_out_insn_RIL(s, RIL_CLGFI, r1, c2);
>> +                    goto exit;
>> +                }
>> +            } else {
>> +                if (c2 == (int32_t)c2) {
>> +                    tcg_out_insn_RIL(s, RIL_CGFI, r1, c2);
>> +                    goto exit;
>> +                }
>>               }
>>           }
>> ---
>>
> 
> This works as well I think. Broken casting.
> 
> diff --git a/tcg/s390/tcg-target.c.inc b/tcg/s390/tcg-target.c.inc
> index 8517e55232..f41ca02492 100644
> --- a/tcg/s390/tcg-target.c.inc
> +++ b/tcg/s390/tcg-target.c.inc
> @@ -1094,7 +1094,7 @@ static int tgen_cmp(TCGContext *s, TCGType type, TCGCond
> c, TCGReg r1,
>                  op = (is_unsigned ? RIL_CLFI : RIL_CFI);
>                  tcg_out_insn_RIL(s, op, r1, c2);
>                  goto exit;
> -            } else if (c2 == (is_unsigned ? (uint32_t)c2 : (int32_t)c2)) {
> +            } else if (c2 == (is_unsigned ? (TCGArg)(uint32_t)c2 :
> (TCGArg)(int32_t)c2)) {
>                  op = (is_unsigned ? RIL_CLGFI : RIL_CGFI);
> 
> (int32_t)c2 will be converted to (uint32_t) first, then to (TCGArg).
> Which is different than casting directly from (int32_t)c2 to (TCGArg).
> 
> Nasty.

Oh excellent.  Thanks for the find and analysis, guys.
I totally agree that this is a bug.

And it makes sense that extra constant propagation from the optimizer from the
patch in question might tickle this problem.



r~

