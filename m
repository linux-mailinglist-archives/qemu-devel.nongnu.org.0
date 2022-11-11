Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5A5625B1C
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 14:25:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otU0F-0003Qc-Sw; Fri, 11 Nov 2022 08:23:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1otU07-0003Q5-25
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 08:23:23 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1otU02-0006zD-9L
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 08:23:18 -0500
Received: by mail-wr1-x42b.google.com with SMTP id l14so6487976wrw.2
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 05:23:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qXgo7Mw6qt0EJsFqvbTbEi1XSmF0KPUKKh4M2kBzFCI=;
 b=KOCHQYp32bE3vJriEGdnIqwr5wFjnqlkR5vP0MqAUYkgtGP97xKIUhOmdtDiojGemw
 K8qDIutC+p8cmjOiiH9FTy+qGOrzGOrGPLMmhVANDAonzxwstmlRL58PlB4OJwnjI4im
 mDPj4C8fZhaEEAX6026JU5aSUlcr71zLHP3ljBP8V1BIyMD/hKpgaeCgKktA8DBwTqPD
 wCgr05F4kf7uKOtEaMuLvzIuS5EzKWzZ59i5QlpQfbtF248dzPvsyNtSe/uRzViYv6BX
 g9A3FlRojOirT/0lyv7rY1LilBRdxcYEGH4gN41aIaOgwQNSxvXzQFuDfK115QsZQvKy
 P3dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qXgo7Mw6qt0EJsFqvbTbEi1XSmF0KPUKKh4M2kBzFCI=;
 b=0O2RvLrLffhlGvrAJ8Po/sDwYpmGqsZoBd9Sc7Bqod8XO2OAWdMhyBIoKd/im1RQE6
 WOiZAs2FyYFrqHn8Op+MomQntkO2h7FpND2bWPdY4ng/0TcCyCr1YjDdKAeSrXc996CG
 Lop+e9Coj3hSQCuSLrnMFf/KWVtZlYA8z1Bz5lT1DPuITaStpZ77Z2Sg8S/b9fthJAZx
 YQxwE9XiWwVPvlQkuFWvF3H2a1OiBYbbktlzCP2+1+Z9ySJLQannWPUm/R8xzeP2gNFM
 jxaE9LU6Nf3dBCB+JeAy29KY/JM7JazD5ceBbo8Z6OFB+asP60/F2hU6S8k3fy563oZk
 vZoA==
X-Gm-Message-State: ANoB5plEJCZbkRli6v5KfryaQEdKD0B3BxVlRNEn4c+nqUTlvsJ9c83s
 PGUFp/o1uQQAXMSezPTwmJD5bg==
X-Google-Smtp-Source: AA0mqf7BWg7m4kGogxRprL5RpzQBUPyLl4H7d8IWYT2apA9hfZk6+UdRhe0qjh848FgCmbM+vR5vQQ==
X-Received: by 2002:adf:eb51:0:b0:236:6253:e2c7 with SMTP id
 u17-20020adfeb51000000b002366253e2c7mr1238298wrn.434.1668172991458; 
 Fri, 11 Nov 2022 05:23:11 -0800 (PST)
Received: from [10.50.0.10]
 (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
 by smtp.gmail.com with ESMTPSA id
 q10-20020adff94a000000b0022cc6b8df5esm1929843wrr.7.2022.11.11.05.23.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Nov 2022 05:23:10 -0800 (PST)
Message-ID: <cb28a138-a82d-0604-a8cf-b302493ff286@linaro.org>
Date: Fri, 11 Nov 2022 14:23:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH v3 01/15] hw: encode accessing CPU index in MemTxAttrs
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Peter Xu <peterx@redhat.com>, Jason Wang <jasowang@redhat.com>
References: <20220927141504.3886314-1-alex.bennee@linaro.org>
 <20220927141504.3886314-2-alex.bennee@linaro.org>
 <769e0e8a-7787-b02b-9e26-87eca955666b@linaro.org>
 <CAFEAcA-0zoNS0nWrYu6hM1=8tG4i4GkjHLL2v4OMmJv5GaDAMg@mail.gmail.com>
 <87r0znlnmm.fsf@linaro.org>
 <CAFEAcA8Ft_YAC2TRCSErUJxY8_kZOQdF7Qa6oM6VF2RpAeHrBA@mail.gmail.com>
 <b1a845ca-0972-1800-0c58-03f68d0c94a0@linaro.org>
 <CAFEAcA-jvg4t1O-wE+19rJgzdiSZqF+X-XmEDLnrJYZCo233Sw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA-jvg4t1O-wE+19rJgzdiSZqF+X-XmEDLnrJYZCo233Sw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 31/10/22 14:03, Peter Maydell wrote:
> On Mon, 31 Oct 2022 at 12:08, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> On 4/10/22 16:54, Peter Maydell wrote:
>>> On Tue, 4 Oct 2022 at 14:33, Alex Bennée <alex.bennee@linaro.org> wrote:
>>>>
>>>>
>>>> Peter Maydell <peter.maydell@linaro.org> writes:
>>>>> The MSC is in the address map like most other stuff, and thus there is
>>>>> no restriction on whether it can be accessed by other things than CPUs
>>>>> (DMAing to it would be silly but is perfectly possible).
>>>>>
>>>>> The intent of the code is "pass this transaction through, but force
>>>>> it to be Secure/NonSecure regardless of what it was before". That
>>>>> should not involve a change of the requester type.
>>>>
>>>> Should we assert (or warn) when the requester_type is unspecified?
>>>
>>> Not in the design of MemTxAttrs that's currently in git, no:
>>> in that design it's perfectly fine for something generating
>>> memory transactions to use MEMTXATTRS_UNSPECIFIED (which defaults
>>> to meaning a bunch of things including "not secure").
>>
>> In tz_mpc_handle_block():
>>
>> static MemTxResult tz_mpc_handle_block(TZMPC *s, hwaddr addr, MemTxAttrs
>> attrs)
>> {
>>       /* Handle a blocked transaction: raise IRQ, capture info, etc */
>>       if (!s->int_stat) {
>>
>>           s->int_info1 = addr;
>>           s->int_info2 = 0;
>>           s->int_info2 = FIELD_DP32(s->int_info2, INT_INFO2, HMASTER,
>>                                     attrs.requester_id & 0xffff);
>>           s->int_info2 = FIELD_DP32(s->int_info2, INT_INFO2, HNONSEC,
>>                                     ~attrs.secure);
>>           s->int_info2 = FIELD_DP32(s->int_info2, INT_INFO2, CFG_NS,
>>                                     tz_mpc_cfg_ns(s, addr));
>>
>>
>> Should we check whether the requester is MTRT_CPU?
> 
> That code is basically assuming that the requester_id is the AMBA AHB
> 'HMASTER' field (i.e. something hopefully unique to all things that
> send out transactions, not necessarily limited only to CPUs), which is a
> somewhat bogus assumption given that it isn't currently any such thing...
> 
> I'm not sure if/how this patchset plans to model generic "ID of transaction
> generator".

Does your 'generic "ID of transaction generator"' fit into MTRT_MACHINE 
described as "for more complex encoding":

   'MACHINE indicates a machine specific encoding which needs further
    processing to decode into its constituent parts.'

?

> 
> -- PMM


