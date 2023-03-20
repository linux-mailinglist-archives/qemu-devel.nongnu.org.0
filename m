Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 497DC6C1D9A
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 18:19:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peJAF-00087e-7E; Mon, 20 Mar 2023 13:19:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1peJAC-00083R-FQ
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 13:19:16 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1peJAA-0001VM-9R
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 13:19:16 -0400
Received: by mail-wr1-x436.google.com with SMTP id l27so2804739wrb.2
 for <qemu-devel@nongnu.org>; Mon, 20 Mar 2023 10:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679332752;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5pdSG9K05hdNcmvUVunBXTqsSJjjv4gBaBK9NgV6wIQ=;
 b=Ydy0D3SZsKDg0fjGpp3ZHQbv+5CN17xiWvKvcRiZqOVPvdKO8jFmcNyqAYfyhlcNtn
 0STk2h83JgemWAaa5Wh4goEhJwRTaI1yqpCvzRJuji1CAFys9enOC5/IF89OaHiUUWUd
 4MRNssHFT9YN+jw/u97WJhFh5GgGaIEhCqTs6ow/3Lz9LRlzDCsyck4ogehjkJy6vmpU
 zPOrjQAZC3GjXgl93N7YdTkB9+1IADzNmSOhJ3NMIy31rT0N1YS95ynOtkVZfXE4INDV
 S7wfQ/nZp82iL3r+UBVlpyg3ODbHFSCGQ8deMOe5mCUeKnkfOVs29Icrli3kz4OpRKCg
 HxQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679332752;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=5pdSG9K05hdNcmvUVunBXTqsSJjjv4gBaBK9NgV6wIQ=;
 b=Dufzfhj4w2xZCUee0VT74YIPabG69itGjGr4n5G9q2jMdBxIRhD9sAJShNbJiKzki8
 /V1qBkfDFEzo0nLBc50D1LbzBjvnYlBSPggSFCzfBJznEC0TJhGV+X8ZZ44XNsujIBZZ
 WAYL9y+X0K6kpz4lwPmBaq34ZITtBQuXSVAh2gPDzhOVu9W9Xpxcut3Jw9+a7fixqbxT
 7dx2gBC2GQb0iJAXuQ5iiQ2Fr0KtPvjK7m3HdnFf4h+hfSgIiAvBGOIjK9EYB86LiM5J
 X4qZDPNBZA3yCd+95/2g6CSKqnncs69tnebISyh0+5FkzdTUDjrE/fLGtSnxGxc9H/y6
 owhA==
X-Gm-Message-State: AO0yUKVilI7+WcLj+ZP/6iDoDhewpv246Bpn+eZIaQQV7pT8A+/VEeHQ
 eTQ8s6a1hrxnczTQIbLenlegDg==
X-Google-Smtp-Source: AK7set8ZW0u2LMFJleTwfKvJ1P1tCL+vpdxynlQCOK1zOEoDsK4K5sBJ773PfUacV3DldjC7JqM7Gg==
X-Received: by 2002:adf:f852:0:b0:2d2:39d3:ce73 with SMTP id
 d18-20020adff852000000b002d239d3ce73mr74137wrq.32.1679332752562; 
 Mon, 20 Mar 2023 10:19:12 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 g18-20020adffc92000000b002cdbb26bb48sm9393666wrr.33.2023.03.20.10.19.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Mar 2023 10:19:12 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E9A4F1FFB7;
 Mon, 20 Mar 2023 17:19:11 +0000 (GMT)
References: <20230320101035.2214196-1-alex.bennee@linaro.org>
 <20230320101035.2214196-4-alex.bennee@linaro.org>
 <a8ffdade-2519-9139-65a9-d1d5f8477b13@linaro.org>
User-agent: mu4e 1.9.22; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: Alessandro Di Federico <ale@rev.ng>, qemu-devel@nongnu.org, Richard
 Henderson <richard.henderson@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>
Subject: Re: [PATCH 03/10] accel/tcg: move i386 halt handling to sysemu_ops
Date: Mon, 20 Mar 2023 17:18:02 +0000
In-reply-to: <a8ffdade-2519-9139-65a9-d1d5f8477b13@linaro.org>
Message-ID: <87ilev733k.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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


Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> On 20/3/23 11:10, Alex Benn=C3=A9e wrote:
>> We don't want to be polluting the core run loop code with target
>> specific handling, punt it to sysemu_ops where it belongs.
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>   include/hw/core/sysemu-cpu-ops.h |  5 +++++
>>   target/i386/cpu-internal.h       |  1 +
>>   accel/tcg/cpu-exec.c             | 14 +++-----------
>>   target/i386/cpu-sysemu.c         | 12 ++++++++++++
>>   target/i386/cpu.c                |  1 +
>>   5 files changed, 22 insertions(+), 11 deletions(-)
>
>
>> diff --git a/target/i386/cpu-sysemu.c b/target/i386/cpu-sysemu.c
>> index 28115edf44..e545bf7590 100644
>> --- a/target/i386/cpu-sysemu.c
>> +++ b/target/i386/cpu-sysemu.c
>> @@ -18,6 +18,7 @@
>>    */
>>     #include "qemu/osdep.h"
>> +#include "qemu/main-loop.h"
>>   #include "cpu.h"
>>   #include "sysemu/xen.h"
>>   #include "sysemu/whpx.h"
>
> Missing "hw/i386/apic.h" which declares apic_poll_irq() ...

I really need to get to the bottom of why some build hosts get away
without the include. Some additional path through the include maze
driven by config-host.h?
>
>
>> @@ -310,6 +311,17 @@ void x86_cpu_apic_realize(X86CPU *cpu, Error **errp)
>>        }
>>   }
>>   +void x86_cpu_handle_halt(CPUState *cpu)
>> +{
>> +    if (cpu->interrupt_request & CPU_INTERRUPT_POLL) {
>> +        X86CPU *x86_cpu =3D X86_CPU(cpu);
>> +        qemu_mutex_lock_iothread();
>> +        apic_poll_irq(x86_cpu->apic_state);
>
> ... used here.
>
>> +        cpu_reset_interrupt(cpu, CPU_INTERRUPT_POLL);
>> +        qemu_mutex_unlock_iothread();
>> +    }
>> +}
>
> Otherwise,
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

