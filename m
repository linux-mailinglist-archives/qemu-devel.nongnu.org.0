Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 576252D7D4F
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 18:52:45 +0100 (CET)
Received: from localhost ([::1]:60292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knmay-0005xi-A8
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 12:52:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1knmDj-0004KO-2n
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:28:43 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:41395)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1knmDh-0000zc-0w
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:28:42 -0500
Received: by mail-ot1-x342.google.com with SMTP id x13so8906107oto.8
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 09:28:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OV9MbGHfVbUkjbx0MIwT0kdacZmwG4Zsoqb9GHZwd44=;
 b=dmwNRACQXczOd4n8E2PkKHsE+2KDZvuy+PskMlamfspKRbfD5+cH/xdFlZ4m7ti5w2
 dbDkh20zAtP97pbfpCm4AXjLdzybyVd+dnd2lhjtHYFYBlmg9VaINhYpzqpMNxr3S2rw
 /dk4Bi6QCgMGeZiQC1yqzYyK2uoD/JpjxIslgNwZGhW60rz5v3HzotBevWjE+9B/ohVI
 z7I0zgDGUOwuWJwUVDpIRgatrN7wHcq/tnaoEr0dfMKUawRZYm2Fu/S4bUjkKWVsV7dV
 d+pIQFDdO1xBLVrq8EYIZq5M2v+/0+m4SYPcuJnhU3dMLrvrXP6OUJig2ZETZhaGRlSZ
 JC5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OV9MbGHfVbUkjbx0MIwT0kdacZmwG4Zsoqb9GHZwd44=;
 b=UYOoTSGqwGwQSN5rcRnbHKQxwbQIQfDjux3kl7cfCHJ/rNYlyVoJ6ff0nHcGO3wPeR
 MWPX6A9kVcpMPlYiJx/bar6fKM7zmUgUuwuj3Fgjq2LYCP0L7y9PcNrvnK66YoBzVHer
 YnY0iXf6eDPTt2mVbAjzoU53ZzW1JoYM6sVeDmcusFHovFgZ+jQILF0S4BIrRaxLNR0y
 ApEiC/F8X3MJN4ByMdlrvRjds1ttnFQKnmiDS5F+/P0lGLUqx2YxW8M3T5SOpcKLDh1q
 Z5c41XVq6xPMIVnydCLkl9VKpPQ2mcIKxLJtV4tTIbUFsHh27dVwEIhVB8ePKmMORzmh
 OSgw==
X-Gm-Message-State: AOAM530nqpsGD+2BYYWGaY55GmlbeABVTMjNTTjGyyp4jWoDTCkQ+W52
 EC8UbJX7dY3s7ohx+dzlfznpZA==
X-Google-Smtp-Source: ABdhPJxb9hq1Xyx4e2MO4sAL7kukUMUVZlVeUWZKUGUAGI5lWdbAsdveWs76sPfIp+UZxuTvjVkZNw==
X-Received: by 2002:a9d:e91:: with SMTP id 17mr10519380otj.237.1607707719632; 
 Fri, 11 Dec 2020 09:28:39 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id m10sm2039424oig.27.2020.12.11.09.28.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Dec 2020 09:28:38 -0800 (PST)
Subject: Re: [PATCH v11 18/25] cpu: Move synchronize_from_tb() to tcg_ops
To: Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20201211083143.14350-1-cfontana@suse.de>
 <20201211083143.14350-19-cfontana@suse.de>
 <78a7119d-1b4b-47dc-8f16-510708c9fcd4@linaro.org>
 <cca08e8d-9235-46da-3610-8acafbc2de14@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <15b884b7-94e4-1476-f883-e84379b2661e@linaro.org>
Date: Fri, 11 Dec 2020 11:28:35 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <cca08e8d-9235-46da-3610-8acafbc2de14@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x342.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Jason Wang <jasowang@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 Dario Faggioli <dfaggioli@suse.com>, Cameron Esfahani <dirty@apple.com>,
 haxm-team@intel.com, Colin Xu <colin.xu@intel.com>,
 Anthony Perard <anthony.perard@citrix.com>, Bruce Rogers <brogers@suse.com>,
 Olaf Hering <ohering@suse.de>, "Emilio G . Cota" <cota@braap.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/11/20 11:10 AM, Claudio Fontana wrote:
> On 12/11/20 6:05 PM, Richard Henderson wrote:
>> On 12/11/20 2:31 AM, Claudio Fontana wrote:
>>> From: Eduardo Habkost <ehabkost@redhat.com>
>>>
>>> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
>>> [claudio: wrapped in CONFIG_TCG]
>>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>>> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
>>> ---
>>>  include/hw/core/cpu.h         |  8 --------
>>>  include/hw/core/tcg-cpu-ops.h | 12 ++++++++++++
>>>  accel/tcg/cpu-exec.c          |  4 ++--
>>>  target/arm/cpu.c              |  4 +++-
>>>  target/avr/cpu.c              |  2 +-
>>>  target/hppa/cpu.c             |  2 +-
>>>  target/i386/tcg/tcg-cpu.c     |  2 +-
>>>  target/microblaze/cpu.c       |  2 +-
>>>  target/mips/cpu.c             |  4 +++-
>>>  target/riscv/cpu.c            |  2 +-
>>>  target/rx/cpu.c               |  2 +-
>>>  target/sh4/cpu.c              |  2 +-
>>>  target/sparc/cpu.c            |  2 +-
>>>  target/tricore/cpu.c          |  2 +-
>>>  14 files changed, 29 insertions(+), 21 deletions(-)
>>>
>>> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
>>> index ea648d52ad..83007d262c 100644
>>> --- a/include/hw/core/cpu.h
>>> +++ b/include/hw/core/cpu.h
>>> @@ -110,13 +110,6 @@ struct TranslationBlock;
>>>   *       If the target behaviour here is anything other than "set
>>>   *       the PC register to the value passed in" then the target must
>>>   *       also implement the synchronize_from_tb hook.
>>> - * @synchronize_from_tb: Callback for synchronizing state from a TCG
>>> - *       #TranslationBlock. This is called when we abandon execution
>>> - *       of a TB before starting it, and must set all parts of the CPU
>>> - *       state which the previous TB in the chain may not have updated.
>>> - *       This always includes at least the program counter; some targets
>>> - *       will need to do more. If this hook is not implemented then the
>>> - *       default is to call @set_pc(tb->pc).
>>>   * @tlb_fill: Callback for handling a softmmu tlb miss or user-only
>>>   *       address fault.  For system mode, if the access is valid, call
>>>   *       tlb_set_page and return true; if the access is invalid, and
>>> @@ -193,7 +186,6 @@ struct CPUClass {
>>>      void (*get_memory_mapping)(CPUState *cpu, MemoryMappingList *list,
>>>                                 Error **errp);
>>>      void (*set_pc)(CPUState *cpu, vaddr value);
>>> -    void (*synchronize_from_tb)(CPUState *cpu, struct TranslationBlock *tb);
>>>      bool (*tlb_fill)(CPUState *cpu, vaddr address, int size,
>>>                       MMUAccessType access_type, int mmu_idx,
>>>                       bool probe, uintptr_t retaddr);
>>> diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.h
>>> index 4475ef0996..e1d50b3c8b 100644
>>> --- a/include/hw/core/tcg-cpu-ops.h
>>> +++ b/include/hw/core/tcg-cpu-ops.h
>>> @@ -10,6 +10,8 @@
>>>  #ifndef TCG_CPU_OPS_H
>>>  #define TCG_CPU_OPS_H
>>>  
>>> +#include "hw/core/cpu.h"
>>
>> This include is circular.
> 
> Yes, it's protected though, it was asked that way.

Well, in my strong opinion, someone asked incorrectly.  It's "harmless" because
of the protection ifdefs, but it's Wrong because it has the potential to hide bugs.

What is it that you thought you needed from core/cpu.h anyway?

>> Are you sure that splitting out hw/core/tcg-cpu-ops.h from hw/core/cpu.h in
>> patch 15 is even useful?
> 
> it avoids a huge #ifdef CONFIG_TCG

So?  The question should be: is it useful on its own, and I think the answer to
that is clearly not.  Thus it should not pretend to be a standalone header file.


r~

