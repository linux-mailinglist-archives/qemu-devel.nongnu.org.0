Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B80A33A9BE7
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 15:24:40 +0200 (CEST)
Received: from localhost ([::1]:46446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltVX5-0007zj-OA
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 09:24:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ltVUh-0005db-Pd
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 09:22:14 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:46062)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ltVUY-0001lC-Sl
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 09:22:11 -0400
Received: by mail-wr1-x42a.google.com with SMTP id z8so2651903wrp.12
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 06:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:in-reply-to:references:user-agent:date
 :message-id:mime-version:content-transfer-encoding;
 bh=glq1CpUiczmajF3a0eEJWk5hfwGWtPIlaP4yi1OlYsw=;
 b=mdQvA9yBfZb8yzTG2nMAPLtGHDFROOGEj+N4Bccm0gHXlM18qTJcJYjPbCsn2PW0/c
 TI1ktG9CJjleVmuiuKU5LIevPdh2MWAlxrbM+4YVfV3AfhGWGv1kBxpO5XydJyiJejv0
 FLl9inAXlsogh7SbN8wp/pimz/k/G0wyUf1He9qXLOG5yjR4+U6GMEq7X7iTEFx4PWCc
 pan7J7U7XWbu6WXpYVUxV0PuSxFYoR3bbyorltHbZBuQ4LLyWmsHk15xaY9yFK4++WGF
 RlDOcG2o/BVAgCoqeuqZxLuzVhuIdtrTcIqKlR/633dL+qTyuvTRNW8hhkRIU03gfImW
 zSMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:date:message-id:mime-version:content-transfer-encoding;
 bh=glq1CpUiczmajF3a0eEJWk5hfwGWtPIlaP4yi1OlYsw=;
 b=r8DDNDZUrAmZcsF2oMeAJ07GyI7hD84xCaOImW8YwQJxLWtrDiDV/JTfKda4PMsNO+
 WmjhgK1kwvuAi8Sj8w3FS7VvTG1evJpNwf4xWrkBYe069W859Z/dWorT/OnFTD9CBlcC
 asbA3QvTr5FweugzlQBQrjZuiZr7gIqD2fbR0Lz1W+R8GoRbTMvGCYboUGCSB+oV4+N9
 f753O0h1tVXuYyt2w8RyYuUqknFgtNvRo2e3OgNnFytRjlTEHV2UZv6G0T9zVzQhmE5M
 PRsIhMcDnJHwbwZ/34gBXikMTJi+2qroDWji3BFuhNBEgkHP9O/Z5hTGIt8FLqD8rhOP
 Fp6Q==
X-Gm-Message-State: AOAM533ZsnStJpv5n6hR8S2lzzqJSYBwLlkGuDkPj2nBJ3tahdZnia3k
 zz7V7ix1EaV0N79cUTqwTHPLSQ==
X-Google-Smtp-Source: ABdhPJxr15bseaxL57r/HagGfR5/ZJKMjzVAAXg6HkrFcYrupdUUDbaJQstBqtmgH31EOA3es3mTTw==
X-Received: by 2002:a05:6000:18ac:: with SMTP id
 b12mr5347983wri.219.1623849720688; 
 Wed, 16 Jun 2021 06:22:00 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j18sm2172818wrw.30.2021.06.16.06.21.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 06:21:56 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D12301FF7E;
 Wed, 16 Jun 2021 14:21:55 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: tb_flush() calls causing long Windows XP boot times
In-Reply-To: <e809eeed-c635-c48c-c6b6-9c2d5718b60d@ilande.co.uk> (Mark
 Cave-Ayland's message of "Wed, 16 Jun 2021 09:59:14 +0100")
References: <BCB8773B-FC54-4C25-9B60-92C263165D38@gmail.com>
 <CAFEAcA-YuyZ9kyivh1dL_chxrtvBF=jOf3L59JuroL2U-e+Xsg@mail.gmail.com>
 <1ee4b7cf-d445-6497-705f-510009fc74f8@ilande.co.uk>
 <874ke4iqf8.fsf@linaro.org>
 <3D29C466-BB81-4BCA-96E9-A46721B1ED59@gmail.com>
 <d9109542-dd68-3e8b-4f53-a09576e16b1f@redhat.com>
 <87sg1ogsvj.fsf@linaro.org>
 <f81315ce-6cf5-c0c4-5b48-9188e3dcd71a@ilande.co.uk>
 <878s3cjyvl.fsf@linaro.org>
 <4006E151-B420-4925-A6C9-CD036EE559F2@gmail.com>
 <9d0b277d-415f-0f4e-3f09-03445f89848f@linaro.org>
 <e809eeed-c635-c48c-c6b6-9c2d5718b60d@ilande.co.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.0.50 (gnu/linux)
Date: Wed, 16 Jun 2021 14:21:55 +0100
Message-ID: <8735tigd1o.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 incoming+qemu-project-qemu-11167699-3xhw7c0pviow7og92yv73e0tr-issue-404@incoming.gitlab.com,
 Max Filippov <jcmvbkbc@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU devel list <qemu-devel@nongnu.org>,
 Programmingkid <programmingkidx@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk> writes:

> On 16/06/2021 02:58, Richard Henderson wrote:
>
>> On 6/15/21 6:58 AM, Programmingkid wrote:
>>>> Ahh I misread - so those are the addresses of the routines and not whe=
re
>>>> it's sticking the breakpoint?
>>>>
>>>> I notice from a bit of googling that there is a boot debugger. I wonder
>>>> if /nodebug in boot.ini stops this behaviour?
>>>>
>>>>   https://docs.microsoft.com/en-us/troubleshoot/windows-server/perform=
ance/switch-options-for-boot-files
>>>> -- Alex Benn=C3=A9e
>>>
>>> Hi Alex,
>>>
>>> I tried your suggestion of using /nodebug. It did not stop the
>>> tb_flush() function from being called.
>> We are not expecting zero calls to tb_flush (it is used for other
>> things, including buffer full), but we are hoping that it reduces
>> the frequency of the calls.
>> I'm guessing you didn't immediately see the slowdown vanish, and so
>> there was no change to the frequency of the calls.
>> FWIW, if you switch to the qemu console, you can see how many
>> flushes have occurred with "info jit".
>
> Looking at the diff of b55f54bc96 which first introduced the
> regression, presumably the difference is now that everything is being
> flushed rather than a specific address space when WinXP twiddles with
> the DB7 register:
>
>
> diff --git a/exec.c b/exec.c
> index 67e520d18e..7f4074f95e 100644
> --- a/exec.c
> +++ b/exec.c
> @@ -1019,14 +1019,13 @@ void tb_invalidate_phys_addr(AddressSpace *as,
> hwaddr addr, MemTxAttrs attrs)
>
>  static void breakpoint_invalidate(CPUState *cpu, target_ulong pc)
>  {
> -    MemTxAttrs attrs;
> -    hwaddr phys =3D cpu_get_phys_page_attrs_debug(cpu, pc, &attrs);
> -    int asidx =3D cpu_asidx_from_attrs(cpu, attrs);
> -    if (phys !=3D -1) {
> -        /* Locks grabbed by tb_invalidate_phys_addr */
> -        tb_invalidate_phys_addr(cpu->cpu_ases[asidx].as,
> -                                phys | (pc & ~TARGET_PAGE_MASK), attrs);
> -    }
> +    /*
> +     * There may not be a virtual to physical translation for the pc
> +     * right now, but there may exist cached TB for this pc.
> +     * Flush the whole TB cache to force re-translation of such TBs.
> +     * This is heavyweight, but we're debugging anyway.
> +     */
> +    tb_flush(cpu);
>  }
>  #endif
>
>
> Unfortunately my x86-fu isn't really enough to understand what the
> solution should be in this case.

It's not really an x86 issue here but more of an internal accounting
issue of how we find TranslationBlocks when we need to tweak them.

For general purpose running we can query the QHT for a initial PC +
flags. This is fine for finding the next block to run but doesn't help
in this case because the breakpoint could be in any sub-address of the
block. So to be sure we just nuke all the blocks in the page that is
affected.

The problem is our route to finding the list of blocks is through the
page tables. However the problem exists when there isn't an currently
active map for a virtual to physical address (which is what happens in
the reported race condition, where the kernel may temporarily page out a
user page).

We could just iterate through all the TB's but there are a lot and that
will take some time. The other option would be somehow marking the
ultimate page entry with some sort of generation count which we could
check when doing a tb_lookup and invalidating the TB then and forcing a
new generation. I need to have a better understanding of the lifecycle
of the pages in the page cache code to see how we could approach this.

--=20
Alex Benn=C3=A9e

