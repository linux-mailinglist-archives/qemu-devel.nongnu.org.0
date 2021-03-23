Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5963F346761
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 19:16:08 +0100 (CET)
Received: from localhost ([::1]:59360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOlZX-0003Zk-3N
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 14:16:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lOkRy-0005DV-4r
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 13:04:14 -0400
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d]:34379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lOkRs-0000Mj-Kn
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 13:04:12 -0400
Received: by mail-oi1-x22d.google.com with SMTP id l79so17737392oib.1
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 10:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NcjEKV84sLhSntwj/v1HgiOYRtuGbIkM/GywBnoX3so=;
 b=Q6aoemZCw1HWy2bpNf6MbA4WW200PVUnRA58M3E55HQSGHhmq2IjEubRdFzAkZDtla
 h43JQIiEAnI6hICDe/KmdeEUyxKoUQDvFMBOtQo7hM7bxm9XJgH3CfVAFIVRrNTNayxj
 4fgvOZLQmmmAJMywPL5RVi4dFaBrvC2scMdo3CKv3vCOnEVNucwsuzyladqAPrY//yRw
 VT00ZXCR6VzyMC1nYXDtYX4jKBzU4MBq+EK7il0H7o8s366IVVQhL8uczD/dYkhwLsQ7
 xfQGHKpHwkpVAzaNkhumsPV8RW8M0qF3nVooT7L14Wwo/B+jTLjFUSpzUhR+SY+HKIgO
 sSiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NcjEKV84sLhSntwj/v1HgiOYRtuGbIkM/GywBnoX3so=;
 b=J2XnRAW0pfjbvo04dAGmzAB2uj+wvSd+e5P0cFYwYtlg5Nxy8pHlU9nmt+AWD4cpis
 zzQliSo3y4U+ZgM2Yvw5+7ht7R4qbwKj7f5u3vpU4QyX9Rtrwd3xVjnQh1y/RIKzVDIg
 jTRXYOk5fOl6qRKapsFAV7Cg0o0g8lGb1T5KIcoM0YWXFMayr7oq5Nr1ZYVBUXqJ9/yd
 42UjHnAvf3aB0c2wntXi8+/F5tule+pseYivq/TyS2+o71zjHmV4IuMPI5YjU1k3FCJq
 9KnF2sEa7Htj1bnOJTXjnf0h/XULQ8nNHqhIpWkcLrGZUiQmWWKEuhN18Dr32Ck8Rmnc
 P9GA==
X-Gm-Message-State: AOAM533Zqd4phTr+XOFHpi2doPpcIGbaZ68tf9IXII5p+uHSxbd/hTWu
 vFQP5nnzZ9cd3ChoQi06yLm0MQ==
X-Google-Smtp-Source: ABdhPJyCONoCMx6m09f0lkxjqoCDBzZfYJyf2I0meadOZHgICu4xOHdGyVXmeBJJOuhbSXYqC6GTxQ==
X-Received: by 2002:aca:f44d:: with SMTP id s74mr4108999oih.168.1616519047237; 
 Tue, 23 Mar 2021 10:04:07 -0700 (PDT)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id t2sm3795809ool.18.2021.03.23.10.04.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Mar 2021 10:04:06 -0700 (PDT)
Subject: Re: [PATCH v4 07/17] target/ppc: Disconnect hflags from MSR
To: David Gibson <david@gibson.dropbear.id.au>
References: <20210315184615.1985590-1-richard.henderson@linaro.org>
 <20210315184615.1985590-8-richard.henderson@linaro.org>
 <YFgUkS3iyr/k9/hE@yekko.fritz.box>
 <47d0bf1d-b423-4503-645a-0f293eb95b87@linaro.org>
 <YFkuRwTMdauBTSHT@yekko.fritz.box>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <77f791b0-ae68-a646-c38d-484fc0d96961@linaro.org>
Date: Tue, 23 Mar 2021 11:04:03 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YFkuRwTMdauBTSHT@yekko.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22d.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Ivan Warren <ivan@vmfacility.fr>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/22/21 5:54 PM, David Gibson wrote:
> On Mon, Mar 22, 2021 at 10:55:46AM -0600, Richard Henderson wrote:
>> On 3/21/21 9:52 PM, David Gibson wrote:
>>>> +/*
>>>> + * Bits for env->hflags.
>>>> + *
>>>> + * Most of these bits overlap with corresponding bits in MSR,
>>>> + * but some come from other sources.  Be cautious when modifying.
>>>
>>> Yeah.. I'm not sure "be cautious" is enough of a warning.  The exact
>>> value of some but not all of these flags must equal that for the
>>> corresponding MSR bits, which is terrifyingly subtle.
>>
>> Fair.  How about, for the comment here, "This is validated in hreg_compute_hflags."
>>
>>>> +    /* Some bits come straight across from MSR. */
>>>> +    msr_mask = ((1 << MSR_LE) | (1 << MSR_PR) |
>>>> +                (1 << MSR_DR) | (1 << MSR_IR) |
>>>> +                (1 << MSR_FP) | (1 << MSR_SA) | (1 << MSR_AP));
>>
>> Here, and in every other spot within this function where we manipulate msr_mask,
>>
>>      QEMU_BUILD_BUG_ON(MSR_LE != HFLAGS_LE);
> 
> Seems reasonable.
> 

Hah.  Your paranoia was well-founded.  Typo in HFLAGS_PR.  :-)


r~

