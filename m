Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF95406D1B
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 15:48:40 +0200 (CEST)
Received: from localhost ([::1]:44818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOgtP-00078T-O7
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 09:48:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mOgrU-0005Xl-OV
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 09:46:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26117)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mOgrS-0001bt-3I
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 09:46:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631281593;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0mZQUvLiWYq/9JPFmg2cSBr64+OrOmoAfLHO/orCtsg=;
 b=NYR4trPPb9r//mzDcfn2roipIbbFwbUlDBMQ5ah9hVFNzIxnRfqG2n1EurCqxrd2MDinvr
 36XjE4tt3DseY/uUYpCtTHym4ub7fXyZ4wzLJ5jGeItCtROSpNE/bcg/P2R0ljfyLSgroJ
 VGETcZu5y9tRBZaAMKHVEBLj0FOO9Fc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-44-fr4MUVPrMoqcdVoS-Yd_3w-1; Fri, 10 Sep 2021 09:46:31 -0400
X-MC-Unique: fr4MUVPrMoqcdVoS-Yd_3w-1
Received: by mail-wr1-f72.google.com with SMTP id
 p18-20020a5d4e12000000b0015940dc586aso536369wrt.6
 for <qemu-devel@nongnu.org>; Fri, 10 Sep 2021 06:46:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:to:cc:references:from:organization:subject
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=0mZQUvLiWYq/9JPFmg2cSBr64+OrOmoAfLHO/orCtsg=;
 b=07bzqo8pgnk2RB50BKy8jWAAOL6g5g3DDYgzog7dyKuq8YTe7WyHiyeo9TvSMXiHbi
 fDPInU8+qd6q97mKVsfZ05/SGRvKODG7NWYFSGS/ik70vYgKHuZ90Yf+an9mppkCR1XM
 CAjmHyBkSBNa3PMM4CjnIg+i2nbYJ/Ddm7WZTuAha90kTqq+f6IO+JIWk4qnlcdcguzR
 bJEwv88qf4zu/PcVAeUBLIdZZOERAd3LhZnLOF3DA50fAipLpCQ79d67/sF+JCQx9Vxc
 yXXv0vXG8cxk3rLijEWr5IId1voDyy8YQsSAsvPCkHNJKPLrAhiCH2FKpE7isiEmDMPV
 sqkg==
X-Gm-Message-State: AOAM53320PtPfmfvUvc7W8HTwEa6C6JhhfKSY1/n4l8kUA8ANo+HVb2M
 7ebYGYSULGSv8wUEEI7zlOCotbvp4Ti/VxIT9DBfTFf8z50zIkIXGc2MrKu0h0wt1O41fougdgv
 wuutKCIKSa4yKjmE=
X-Received: by 2002:a05:6000:18c2:: with SMTP id
 w2mr9788366wrq.282.1631281590419; 
 Fri, 10 Sep 2021 06:46:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwQfodu9AW64NX8rvngPMkl5d8shP91GZVK+dAsPF1JKFW3rTueGROFXnIrxWD2YZV2S6DyEw==
X-Received: by 2002:a05:6000:18c2:: with SMTP id
 w2mr9788347wrq.282.1631281590203; 
 Fri, 10 Sep 2021 06:46:30 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c600c.dip0.t-ipconnect.de. [91.12.96.12])
 by smtp.gmail.com with ESMTPSA id
 129sm4294258wmz.26.2021.09.10.06.46.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Sep 2021 06:46:29 -0700 (PDT)
To: Richard Henderson <richard.henderson@linaro.org>,
 Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>, qemu-devel@nongnu.org
References: <163101424137.678744.18360776310711795413.stgit@pasha-ThinkPad-X280>
 <f103375f-9c3b-9b5b-6ef1-5437b4990c23@redhat.com>
 <9bbee49c-f175-fa6e-3bda-7d117f1459b1@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH] softmmu: fix watchpoint processing in icount mode
Message-ID: <31e9ded8-6187-bced-51b8-45e35d2e9f06@redhat.com>
Date: Fri, 10 Sep 2021 15:46:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <9bbee49c-f175-fa6e-3bda-7d117f1459b1@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.349, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, alex.bennee@linaro.org, peterx@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10.09.21 15:34, Richard Henderson wrote:
> On 9/10/21 1:15 PM, David Hildenbrand wrote:
>> On 07.09.21 13:30, Pavel Dovgalyuk wrote:
>>> Watchpoint processing code restores vCPU state twice:
>>> in tb_check_watchpoint and in cpu_loop_exit_restore/cpu_restore_state.
>>> Normally it does not affect anything, but in icount mode instruction
>>> counter is incremented twice and becomes incorrect.
>>> This patch eliminates unneeded CPU state restore.
>>>
>>> Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
>>> ---
>>>    softmmu/physmem.c |    5 +----
>>>    1 file changed, 1 insertion(+), 4 deletions(-)
>>>
>>> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
>>> index 23e77cb771..4025dfab11 100644
>>> --- a/softmmu/physmem.c
>>> +++ b/softmmu/physmem.c
>>> @@ -941,14 +941,11 @@ void cpu_check_watchpoint(CPUState *cpu, vaddr addr, vaddr len,
>>>                    if (wp->flags & BP_STOP_BEFORE_ACCESS) {
>>>                        cpu->exception_index = EXCP_DEBUG;
>>>                        mmap_unlock();
>>> -                    cpu_loop_exit_restore(cpu, ra);
>>> +                    cpu_loop_exit(cpu);
>>>                    } else {
>>>                        /* Force execution of one insn next time.  */
>>>                        cpu->cflags_next_tb = 1 | curr_cflags(cpu);
>>>                        mmap_unlock();
>>> -                    if (ra) {
>>> -                        cpu_restore_state(cpu, ra, true);
>>> -                    }
>>>                        cpu_loop_exit_noexc(cpu);
>>>                    }
>>>                }
>>>
>>>
>>
>> I'm not an expert on that code, but it looks good to me.
>>
>> Maybe we could have added a comment above the tb_check_watchpoint() call to highlight that
>> the restore will happen in there.
> 
> Hmm.  Curious.
> 
> Looking at tb_check_watchpoint, I have trouble seeing how it could be correct.
> Watchpoints can happen at any memory reference within the TB.  We should be rolling back
> to the cpu state at the memory reference (cpu_retore_state) and not the cpu state at the
> start of the TB (cpu_restore_state_from_tb).

cpu_restore_state() ends up calling cpu_restore_state_from_tb() with essentially
the same parameters or what am I missing?

So AFAIU this patch shouldn't change the situation -- but valid point that the
current behavior might be bogus.

> 
> I'm also not sure why we're invalidating tb's.  Why does watchpoint hit imply that we
> should want to ditch the TB?  If we want different behaviour from the next execution, we
> should be adjusting cflags.

It goes back to

commit 06d55cc19ac84e799d2df8c750049e51798b00a4
Author: aliguori <aliguori@c046a42c-6fe2-441c-8c8c-71466251a162>
Date:   Tue Nov 18 20:24:06 2008 +0000

     Restore pc on watchpoint hits (Jan Kiszka)
     
     In order to provide accurate information about the triggering
     instruction, this patch adds the required bits to restore the pc if the
     access happened inside a TB. With the BP_STOP_BEFORE_ACCESS flag, the
     watchpoint user can control if the debug trap should be issued on or
     after the accessing instruction.
     
     Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
     Signed-off-by: Anthony Liguori <aliguori@us.ibm.com>


*trying to rememebr what we do on watchpoints* I think we want to
make sure that we end up with a single-instruction TB, right? So we
want to make sure to remove the old one.


-- 
Thanks,

David / dhildenb


