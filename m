Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FCD46C2CDC
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 09:48:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peXed-0005Me-67; Tue, 21 Mar 2023 04:47:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1peXeb-0005ME-BQ
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 04:47:37 -0400
Received: from smtp-out2.suse.de ([195.135.220.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1peXeZ-00039t-Ah
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 04:47:36 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 702381FD6D;
 Tue, 21 Mar 2023 08:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1679388453; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dy7pVUy6QCuqQOZrzplj4TYF/fcnD/hRxMkZfem7SCY=;
 b=LGdhQ/pafYEkYxFtz1/PunfTEFh62p+sFMvIF2fnYNybceeOmzUTdEcBt7qxq2yK87F1cn
 zIm7KLXJPGu9dNoE6+dJdfu4i/IgUxfQAsbDoMERfalXVnfg3F1aVVb0f60On4wC5/97xl
 6U0LbYHJU2CC+F8y832BqQ1j3gqWTxc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1679388453;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dy7pVUy6QCuqQOZrzplj4TYF/fcnD/hRxMkZfem7SCY=;
 b=UOqyhH19j2OuXJF0IIrkrvcIIOGfGIM8zE84H7vJcA2YE+GB6asPmoJ9mfsyxj1vOoIDOR
 LFJlDg4c891cqeBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 22EB913451;
 Tue, 21 Mar 2023 08:47:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 7XzkBiVvGWRVUwAAMHmgww
 (envelope-from <cfontana@suse.de>); Tue, 21 Mar 2023 08:47:33 +0000
Message-ID: <a886906c-2933-c072-1202-597f53c36660@suse.de>
Date: Tue, 21 Mar 2023 09:47:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 03/10] accel/tcg: move i386 halt handling to sysemu_ops
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Alessandro Di Federico <ale@rev.ng>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Fabiano Rosas <fabiano.rosas@suse.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20230320101035.2214196-1-alex.bennee@linaro.org>
 <20230320101035.2214196-4-alex.bennee@linaro.org>
 <9abe3d28-9d35-85cc-118c-083cb267db59@suse.de>
 <15e31292-9365-7eb4-6bcd-d74c1a50c5a0@linaro.org>
From: Claudio Fontana <cfontana@suse.de>
In-Reply-To: <15e31292-9365-7eb4-6bcd-d74c1a50c5a0@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=cfontana@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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

On 3/20/23 16:34, Philippe Mathieu-Daudé wrote:
> On 20/3/23 16:23, Claudio Fontana wrote:
>> Hi Alex, all,
>>
>> again, this moves TCG-only code to common code, no?
> 
> Oh, good point.
> 
>> Even if this happens to work, the idea is to avoid adding unneeded accel TCG code to a KVM-only binary.
> 
> Could yet another AccelSysemuCPUOps *accel struct in SysemuCPUOps
> help being stricter? ...

Just a thought, in general I wonder if we could devise a less error prone way to keep things in the right place.
Just thinking out loud here, something like a QEMU_ATTRIBUTE_TCG, _KVM, ... to add to symbols to avoid ending up in the wrong binary.

Keeping in mind all these dimensions is probably very taxing, maybe getting some support from the build system would be beneficial,
checking that a build requested with specific features contains only compatible objects.

Any ideas?

Ciao,

C

> 
>> We need to keep in mind all dimensions when we do refactorings:
>>
>> user-mode vs sysemu,
>> the architecture,
>> the accel, in particular tcg, non-tcg (which could be not compiled in, built-in, or loaded as separate module).
>>
>> In many cases, testing with --disable-tcg --enable-kvm helps to avoid breakages,
>> but it is possible also to move in unneeded code in a way that does not generate compile or link-time errors, so we need to be a bit alert to that.
>>
>> Ciao,
>>
>> C
>>
>>
>> On 3/20/23 11:10, Alex Bennée wrote:
>>> We don't want to be polluting the core run loop code with target
>>> specific handling, punt it to sysemu_ops where it belongs.
>>>
>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>> ---
>>>   include/hw/core/sysemu-cpu-ops.h |  5 +++++
>>>   target/i386/cpu-internal.h       |  1 +
>>>   accel/tcg/cpu-exec.c             | 14 +++-----------
>>>   target/i386/cpu-sysemu.c         | 12 ++++++++++++
>>>   target/i386/cpu.c                |  1 +
>>>   5 files changed, 22 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/include/hw/core/sysemu-cpu-ops.h b/include/hw/core/sysemu-cpu-ops.h
>>> index ee169b872c..c9d30172c4 100644
>>> --- a/include/hw/core/sysemu-cpu-ops.h
>>> +++ b/include/hw/core/sysemu-cpu-ops.h
>>> @@ -48,6 +48,11 @@ typedef struct SysemuCPUOps {
>>>        * GUEST_PANICKED events.
>>>        */
>>>       GuestPanicInformation* (*get_crash_info)(CPUState *cpu);
>>> +    /**
>>> +     * @handle_cpu_halt: Callback for special handling during cpu_handle_halt()
>>> +     * @cs: The CPUState
>>> +     */
> 
> Perhaps insert within a 'tcg' structure for now.
> 
>      #ifdef CONFIG_TCG
>      struct {
> 
>>> +    void (*handle_cpu_halt)(CPUState *cpu);
> 
>      } tcg;
>      #endif
> 
> Then we could extract as accel.
> 
>>>       /**
>>>        * @write_elf32_note: Callback for writing a CPU-specific ELF note to a
>>>        * 32-bit VM coredump.
> 
> 


