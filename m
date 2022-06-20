Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED9BE552287
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 18:56:51 +0200 (CEST)
Received: from localhost ([::1]:54308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3Khn-0005Lj-35
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 12:56:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3Kf7-0003T9-Ta
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 12:54:05 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:36719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3Kf6-00010h-1h
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 12:54:05 -0400
Received: by mail-pl1-x62d.google.com with SMTP id m2so2992686plx.3
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 09:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=kLdmTBIBP9HpHiS22Di8KK93Of/BrBpiUVTPzq/66m8=;
 b=hjQL6/8sq54vMEqdbUdrjRP0TKWgTnmgyc3/veaCCSKvHh8+hVedU78i3tiFTXFmrV
 uQBmUOzXh2/ddbYU8Lvvdmap7aZD7tvJGsIa5WbbDILaWfTyUHKHR9IO88+RslXX0HLH
 YfCuTMxGH721rtNpoYFEWhbRgFx/Lq9Eqq8Lv2Ky9pw93crsEF5vtcp/7jwJfujlo4eW
 TbHIIWorg4q9zTOfE2oZYHGqMNaqSY1oWL3Ey6T0IgBWJH2jB/mfC37dOghPk3q87iTX
 ewA/ADzsS+sddYlZ36ElOvflAp99t78U+dwYocsZIioVsOCbEVDSgfr1mSgouPa+aPa8
 u6+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kLdmTBIBP9HpHiS22Di8KK93Of/BrBpiUVTPzq/66m8=;
 b=fPY95Jj5FxJ0zNeo+yh+oTAw0xbGrN6OTHN3m7IQKIj/Jx+GJQZlB7NBos0vonxhvJ
 gB9eBGKhy9bb/CpgpHCQuxPRr44z2mS0vdLSj5ptvawaRT94Q/XK8DuIDI6CENGz0Jay
 Sp2+S0XYlX67QTVVTOb5vxENyqfN/Ezz4ZzAUYY9CrSTbsm3ooJoBig2oTBwwssoSsW/
 KPqoyO9Hi1Vx40fuq0eLV9WqjgyZ+gjZqEYnB7LvGyJdoSOMKVKJZdqfa7eEHOv++Xwp
 5pwd2O0JQ911FZQp551a+1OBx/xqoGEURNFq7GR+gCAD3bvASdae4K1W1XRISF6fVHqM
 0z/g==
X-Gm-Message-State: AJIora8MMLrhAGiWil4lIQU2uTmMKxUUItAb0fjv/UF6ug1uAPBSbLJB
 IFcxU6GXPkStuEnPhKfLKa9/4w==
X-Google-Smtp-Source: AGRyM1vEdfs6/IDdBw56OGuC/nVI79zYDWWqqQCONmDLp/k3c9tfOR9q8EFgJHOPV0N5g+OuELuIAQ==
X-Received: by 2002:a17:902:ea04:b0:16a:1f33:cb0d with SMTP id
 s4-20020a170902ea0400b0016a1f33cb0dmr7637982plg.103.1655744040375; 
 Mon, 20 Jun 2022 09:54:00 -0700 (PDT)
Received: from ?IPV6:2602:47:d49e:3c01:a3e0:8a80:7b85:aea6?
 ([2602:47:d49e:3c01:a3e0:8a80:7b85:aea6])
 by smtp.gmail.com with ESMTPSA id
 bc10-20020a170902930a00b0016413dbbf92sm8948761plb.234.2022.06.20.09.53.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jun 2022 09:53:59 -0700 (PDT)
Message-ID: <fa9f1337-e294-524c-5988-188b503171fc@linaro.org>
Date: Mon, 20 Jun 2022 09:53:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] softmmu: Always initialize xlat in
 address_space_translate_for_iotlb
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org
References: <20220615163846.313229-1-richard.henderson@linaro.org>
 <CAFEAcA9FvaJKD4=jBuWijd3ym1+aj=RJfr=7mugrFTLMCEfq+A@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA9FvaJKD4=jBuWijd3ym1+aj=RJfr=7mugrFTLMCEfq+A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/20/22 05:52, Peter Maydell wrote:
> On Wed, 15 Jun 2022 at 17:43, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> The bug is an uninitialized memory read, along the translate_fail
>> path, which results in garbage being read from iotlb_to_section,
>> which can lead to a crash in io_readx/io_writex.
>>
>> The bug may be fixed by writing any value with zero
>> in ~TARGET_PAGE_MASK, so that the call to iotlb_to_section using
>> the xlat'ed address returns io_mem_unassigned, as desired by the
>> translate_fail path.
>>
>> It is most useful to record the original physical page address,
>> which will eventually be logged by memory_region_access_valid
>> when the access is rejected by unassigned_mem_accepts.
>>
>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1065
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   softmmu/physmem.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
>> index 657841eed0..fb0f0709b5 100644
>> --- a/softmmu/physmem.c
>> +++ b/softmmu/physmem.c
>> @@ -681,6 +681,9 @@ address_space_translate_for_iotlb(CPUState *cpu, int asidx, hwaddr addr,
>>       AddressSpaceDispatch *d =
>>           qatomic_rcu_read(&cpu->cpu_ases[asidx].memory_dispatch);
>>
>> +    /* Record the original phys page for use by the translate_fail path. */
>> +    *xlat = addr;
> 
> There's no doc comment for address_space_translate_for_iotlb(),
> so there's nothing that says explicitly that addr is obliged
> to be page aligned, although it happens that its only caller
> does pass a page-aligned address. Were we already implicitly
> requiring a page-aligned address here, or does not masking
> addr before assigning to *xlat impose a new requirement ?

I have no idea.  The whole lookup process is both undocumented and twistedly complex.  I'm 
willing to add an extra masking operation here, if it seems necessary?


r~

