Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4AB43B87B
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 19:45:04 +0200 (CEST)
Received: from localhost ([::1]:43362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfQVS-00060A-Ka
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 13:45:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfQPl-0004i4-6g
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 13:39:09 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:47030)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfQPi-0005Ra-Rh
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 13:39:08 -0400
Received: by mail-pl1-x633.google.com with SMTP id c4so38199plg.13
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 10:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/QUKz71NNtyqMi/+Xo5gUZTHFrNupxeQDR+O08XzWgE=;
 b=FTdiFr25+TLVi6349WtyhhRuoJ5Gyx+Wn4qEwxhS9RozZriaIOSHkvTnWxs3VMNsJU
 T8upH0z3jcVZP1mIgxljiW/azvZiwCWDiQzdMlvWroAdQy7uFFIu3Hz0XwI+Zrp6mD/L
 BTyuwcQrPgHfow3TJaeqoX+1Blkgtj76q5O5pOvn4nzlvORT3rDdceZIqJOXvPcExhtA
 cw4Ip1JMT96waVMRixNcIDqFMX+1uonohCl1vJlEC885EtXS57a1ozryiEsE4R2yXouh
 E1wfwzMwxfMKOU4O99DXnBbkL7mjIRH3WLvxZ/kdTUpa5Vk5g4CY7HzvmAFpxeU+AJv2
 /xcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/QUKz71NNtyqMi/+Xo5gUZTHFrNupxeQDR+O08XzWgE=;
 b=5eV6H1Pt4S7MAVFj/tgqYdiwtE++9j8QqV1w5rxfoClLUlUp6ICwoTNM3q47UfShbk
 zahG5wdLQA+sjrMkTRJmR+nymonD5qZv5DnYzljEiThyfDb0kS2tSrYTiwBWm6vsEiMG
 opx0FErhfUng+uXlv3r8HUN4SyKNfDReSnvGGkP+n/fNC3R/6GrAJkXSdPtZI2CUPnOe
 6OR2I455i504ljeX8UlUu0y1DVu4EZNQXmgJLjlmtwYLZnEK41YZTNWWmQRpjIeF81si
 V6L9etLS2dnKpC2wckF3JPDSPl/fBWPOLdODME8hoby2AyuIugERs6wxOOmTduBF8Gvt
 MOtw==
X-Gm-Message-State: AOAM532l4ROBhElJYkyheMlQsziWRhHaa+oY6Ie1bFiOjjDM3oVYR4Xn
 5pD44GuosMW2DcpuPmjPEo3Bgw==
X-Google-Smtp-Source: ABdhPJz2YQ7c32Zmrgy31OahqHzzrBc9Gk5wHi56UdrPRgXQytqVDDHMtotTPaigQmxFq/1/LjI8cA==
X-Received: by 2002:a17:90a:a609:: with SMTP id
 c9mr137106pjq.134.1635269944829; 
 Tue, 26 Oct 2021 10:39:04 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id q18sm539952pfu.219.2021.10.26.10.39.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Oct 2021 10:39:04 -0700 (PDT)
Subject: Re: [PATCH v2] hvf: arm: Ignore cache operations on MMIO
To: Alexander Graf <agraf@csgraf.de>
References: <13a13852-4fb4-a0f8-6740-354c8054aed1@linaro.org>
 <27B816F7-3670-428C-AA42-95BC7DD635CC@csgraf.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8373048b-e930-6c69-54cd-aca33338cb76@linaro.org>
Date: Tue, 26 Oct 2021 10:39:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <27B816F7-3670-428C-AA42-95BC7DD635CC@csgraf.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.215,
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
Cc: kettenis@openbsd.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Cameron Esfahani <dirty@apple.com>, qemu-devel@nongnu.org,
 Roman Bolshakov <r.bolshakov@yadro.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/26/21 9:38 AM, Alexander Graf wrote:
>> ﻿On 10/26/21 12:12 AM, Alexander Graf wrote:
>>> +        if (cm) {
>>> +            /* We don't cache MMIO regions */
>>> +            advance_pc = true;
>>> +            break;
>>> +        }
>>> +
>>>           assert(isv);
>>
>> The assert should come first.  If the "iss valid" bit is not set, then nothing else in the word is defined.
>>
>> Otherwise,
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> 
> Yes, but isv=0 for cm=1. And even in other isv=0 situations most other fields are valid (post-idx provides the correct va/pa too for example).
> 
> Does cm=1 really give you isv=1 on other hardware?

Ah hah.  From 0487G.a, page D13-3191:

# For other faults reported in ESR_EL2, ISV is 0 except
# for the following stage 2 aborts...

(which incidentally sounds like documenting around a historic chip bug, since both EL1 and 
EL3 do get ISV set).  And of course HVF would be passing along the EL2 version, being the 
hypervisor.

I guess the assert can stand where it is, because everything below should be one of those 
"following stage 2 aborts".   The only thing that could be improved is a bit of commentary 
there at the assert.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

