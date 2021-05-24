Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E162D38E077
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 06:48:33 +0200 (CEST)
Received: from localhost ([::1]:40944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ll2W1-0005Kb-1C
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 00:48:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ll2V0-00044r-8x
 for qemu-devel@nongnu.org; Mon, 24 May 2021 00:47:30 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:34783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ll2Uy-00074s-K8
 for qemu-devel@nongnu.org; Mon, 24 May 2021 00:47:29 -0400
Received: by mail-pl1-x62e.google.com with SMTP id e15so7380506plh.1
 for <qemu-devel@nongnu.org>; Sun, 23 May 2021 21:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NI58QujOyCS/R+NEz4lqityKfRLdAWtPJJj/pvVYCqU=;
 b=DBZ0NbQmIgph+LZ6MOo8SjRzRAaLfRekauGMXHF00FKgSxlwVNXqNQjTyW6G6iSGgZ
 H9iLOutj3sqBS/iKIR1/eBbNtI7CqJL/SLDB+8IRTblK2aaZPrVoBpFBf2GJrTdiBDrk
 L1xyITtVLC75evr0UMPprnfNB4gp6iHB42+Tv8qDjD2oEWEtCV2DV02BlyVL7OH0nmL3
 ZNe8T8/iQntY8oRiSayE0vlRkDy1poiYDK5L43TZ4QvyLsgIdqdqmcvwZvls1UoRC2vR
 1pa9D/vTWiCn4wpIhxW9Qry1zQkD3gdrewt7l+xtWN/IzBptbNxsL9BCLiALIlmkSGvX
 UXYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NI58QujOyCS/R+NEz4lqityKfRLdAWtPJJj/pvVYCqU=;
 b=X6nzSOk7NnwI2V/eDPXfcB76OsO5P7YaWMqW81H/S2BYkGoxUDxx5FVsVghv1mOaOt
 kL5NW+CyO1GeusNakR3N3eZqgc8KgdrKAmp8iYHB7i9dTS7bPRuk2dbTjjmR+XaARt3f
 aIw0i93ASZmj+jZ9yPZGM4UgBX+2hDPTI5HgaWyJxsuowRdPLMayOMoGbuBwJug70HfJ
 oztUfjFnfLkQQo8mm+bn+p2IyuakkpusosV0+G1R5HNu0YGj2uxPsDToqVmCyu5vt+0D
 S8BUX1gJUP78gK3kzC4sIi1/GF8CHDLtN/G45Cs+1H0okIST8VakfKvngiB3iLw2Z0CM
 P4Pw==
X-Gm-Message-State: AOAM531kiw68WipPS+1+7hsL52zD5BcBEE4GkzvlAkPFSJtLvjO6kp7Q
 SXoWrWrDfyXz9gHcVZXXBMqOzQ==
X-Google-Smtp-Source: ABdhPJxn7jPti/w7JX1gwbASLCskfzbtmOZoUP4Bc4P7VDfMpR5HAaEJvOC1QCHr4DMYvqhN6WxYSg==
X-Received: by 2002:a17:90a:4bc3:: with SMTP id
 u3mr23454119pjl.158.1621831647392; 
 Sun, 23 May 2021 21:47:27 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 u28sm1199340pfl.140.2021.05.23.21.47.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 May 2021 21:47:27 -0700 (PDT)
Subject: Re: [PATCH 00/24] target/ppc: Clean up mmu translation
To: David Gibson <david@gibson.dropbear.id.au>
References: <20210518201146.794854-1-richard.henderson@linaro.org>
 <YKR9bZmPxOHKlnnP@yekko> <7a4c91d4-c813-2803-e5e7-4f8fe6d6f05d@linaro.org>
 <6bc68cda-a6aa-68c9-2c6f-f7c6ff95b7db@linaro.org> <YKsczpMuwDn006S4@yekko>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <133f0451-9083-b57e-20d5-019a8aec89ba@linaro.org>
Date: Sun, 23 May 2021 23:47:25 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YKsczpMuwDn006S4@yekko>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/23/21 10:26 PM, David Gibson wrote:
> On Wed, May 19, 2021 at 05:47:05PM -0500, Richard Henderson wrote:
>> On 5/19/21 3:37 PM, Richard Henderson wrote:
>>> On 5/18/21 9:52 PM, David Gibson wrote:
>>>> I've applied 1..15, still looking at the rest.
>>>
>>> Please dequeue.  I want to create a new mmu-internal.h, which affects
>>> all the patches from #1.
>>
>> Alternately, don't.  I can move the function later, and it may be a while
>> before I can get back to this.
> 
> Ok, I'll leave them in, since they're good cleanups even without the
> rest of the series.
> 
>>
>> Two outstanding bugs:
>>
>> (1) mmu-radix64.c vs hypervisors.  You'll not see these unless you run kvm
>> inside of tcg.
>>
>> Basically, all usage of msr_{hv,pr,ir,dr} within ppc_*_xlate is incorrect.
>> We should be pulling these from the 3 bits of mmu_idx, as outlined in the
>> table in hreg_compute_hflags_value.
> 
> Ah, that's probably my fault.  I reworked those substantially from the
> original code (closer to mmu_helper.c).  I guess I didn't (and I
> suspect I still don't) really understand how the softmmu works.
> 
>> When you start propagating that around, you see that the second-level
>> translation for loading the pte (2 of the 3 calls to
>> ppc_radix64_partition_scoped_xlate) should not be using the mmu_idx related
>> to the user-mode guest access, but should be using the mmu_idx of the
>> kernel/hypervisor that owns the page table.
>>
>> I can't see that mmu-radix64.c has the same problem.  I'm not really sure
>> how the second-level translation for hypervisors works there.  Is it by the
>> hypervisor altering the hash table as it is loaded?
> 
> Uh.. you started by saying mmu-radix64.c then talked about the hash
> table, so I'm not sure which model you're talking about.

radix64 definitely has a problem.
Then I wondered if hash64 had the same problem.

> 
> For hash + hypervisor, then yes, there is no hardware 2-level
> translation, it all works by paravirtualizing updates to the hash
> table (this is the H_ENTER etc. code in hw/ppc/spapr_softmmu.c).

Ah, gotcha.  So, no, hash64 is unaffected.

> Indeed.  Direct store segments are basically ancient history of the
> POWER architecture which Linux never used, and I don't think much else
> did either.  So I'm inclined to go with
> 
>    (D) Just rip out all the direct store segment code and replace with
>        some LOG_UNIMPs.  Re-adding it working can be the job of the
>        probably non-existent person who has an actual use case using
>        them.

Fair enough.


r~

