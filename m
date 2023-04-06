Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C47C76D916F
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 10:24:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkKtf-000304-4D; Thu, 06 Apr 2023 04:23:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pkKtY-0002yx-Oq
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 04:23:02 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pkKtU-0004kp-Nn
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 04:23:00 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 n9-20020a05600c4f8900b003f05f617f3cso4165529wmq.2
 for <qemu-devel@nongnu.org>; Thu, 06 Apr 2023 01:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680769373;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=f+vv1701z4r3GsWrWzYSdehjnmgPql22xoY5uBZzFYQ=;
 b=gHfZ72U8PDz3pJ0wSpvqzO56iy9RJ0imX7saOaCqxClUJyiEnArU+wNiP3jmx7GuRy
 hjYFHxs1VXKfQs6JeZuQN66v0h/MzWbkw/54erYOfqqRP4IvqRVebixWdejcycrQluvq
 cmFmI/l/3QGAaSDd0eF8KOrr+8Q0lO20Ymt9Qbsp+wHD4MRuYJTrHY8kQMa0iSuuyBV8
 EX0Mw0dI1i5p2m8GUqybfr/A9WAjUtFpbzvpcnshWY6fp2YHYQQNwatnwEwKYWFkQsVc
 hQpbvVFJA8PHRVwsFGuJChPbxSpU/kzukOpWkkyd6JHj/DpPbGk7w8fTt/6S9io95/0R
 yleQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680769373;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=f+vv1701z4r3GsWrWzYSdehjnmgPql22xoY5uBZzFYQ=;
 b=qwzCfWVf6ctLn6gch3LAcbArKXFYPBD36p5UCR0hcPCXX1oSnAVJRyDJ9pv+gTj96k
 bFeq4AuQ6LausnTpixxmwqUS3U+mkU5W+fDXgEByzpewlEvvwKx6080vi3+uivyZvxRt
 QD6bO3EM1mVrZuuhwBt7gFMaIibvDiTomHrQwcvWCvaykqbSTAXywFzBzHwt0PXUWz6c
 E8OfVAVbc8laWu8bawS5DzKFUM9hmyfK2uZBc58nhgxgljXWqkzhL6AVDjfKxq/2puMz
 l2r+B7bgxYfOvg/gON3oLolNIws5G89AqDdxJJAuyOxcAdE7AiFFevM7InnDlDaDpmKG
 3YAQ==
X-Gm-Message-State: AAQBX9fzHBHcVgli0y5d0PMmC8EK0HXYUfRHkbKH5eJzVYWD5lcvFDWf
 p4TXAzCo7REPTx9fnk5jbtKa0w==
X-Google-Smtp-Source: AKy350bcVUwtarMk34DWCLPwzCwjECA0NL2+n2OBSiBjCe9BW3F4CnRqEgBhgifFneH5j/sjzSbckw==
X-Received: by 2002:a1c:7c05:0:b0:3f0:3377:c15f with SMTP id
 x5-20020a1c7c05000000b003f03377c15fmr6665588wmc.12.1680769373564; 
 Thu, 06 Apr 2023 01:22:53 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 iv15-20020a05600c548f00b003ef5b285f65sm4614032wmb.46.2023.04.06.01.22.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Apr 2023 01:22:53 -0700 (PDT)
Message-ID: <c47e1b5a-38bb-fe08-8020-29361fd0e99a@linaro.org>
Date: Thu, 6 Apr 2023 10:22:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [PATCH 10/10] hw/s390x: Rename pv.c -> pv-kvm.c
Content-Language: en-US
To: Janosch Frank <frankja@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org, Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 kvm@vger.kernel.org, qemu-ppc@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>
References: <20230405160454.97436-1-philmd@linaro.org>
 <20230405160454.97436-11-philmd@linaro.org>
 <3cccc7e6-3a39-b3b4-feaf-85a3faa58570@redhat.com>
 <3fe240da-9a75-0e39-7762-cd91af9ed3f0@linux.ibm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <3fe240da-9a75-0e39-7762-cd91af9ed3f0@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.355,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 6/4/23 10:04, Janosch Frank wrote:
> On 4/6/23 09:50, Thomas Huth wrote:
>> On 05/04/2023 18.04, Philippe Mathieu-Daudé wrote:
>>> Protected Virtualization is specific to KVM.
>>> Rename the file as 'pv-kvm.c' to make this clearer.
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>> ---
>>>    hw/s390x/{pv.c => pv-kvm.c} | 0
>>>    hw/s390x/meson.build        | 2 +-
>>>    2 files changed, 1 insertion(+), 1 deletion(-)
>>>    rename hw/s390x/{pv.c => pv-kvm.c} (100%)
>>>
>>> diff --git a/hw/s390x/pv.c b/hw/s390x/pv-kvm.c
>>> similarity index 100%
>>> rename from hw/s390x/pv.c
>>> rename to hw/s390x/pv-kvm.c
>>> diff --git a/hw/s390x/meson.build b/hw/s390x/meson.build
>>> index f291016fee..2f43b6c473 100644
>>> --- a/hw/s390x/meson.build
>>> +++ b/hw/s390x/meson.build
>>> @@ -22,7 +22,7 @@ s390x_ss.add(when: 'CONFIG_KVM', if_true: files(
>>>      'tod-kvm.c',
>>>      's390-skeys-kvm.c',
>>>      's390-stattrib-kvm.c',
>>> -  'pv.c',
>>> +  'pv-kvm.c',
>>>      's390-pci-kvm.c',
>>>    ))
>>>    s390x_ss.add(when: 'CONFIG_TCG', if_true: files(
>>
>> Hmmm, maybe we should rather move it to target/s390x/kvm/ instead?
>>
>> Janosch, what's your opinion?
>>
>>    Thomas
>>
>>
> 
> Don't care as long as the file is not deleted :)

I followed the current pattern:

$ ls -1 hw/s390x/*kvm*
hw/s390x/s390-pci-kvm.c
hw/s390x/s390-skeys-kvm.c
hw/s390x/s390-stattrib-kvm.c
hw/s390x/tod-kvm.c

I'm still unsure where is the best place to put hw files which are
arch (and accel) specific.

