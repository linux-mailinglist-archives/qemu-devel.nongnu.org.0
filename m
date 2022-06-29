Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5B555FA2C
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 10:15:30 +0200 (CEST)
Received: from localhost ([::1]:58504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6SrA-0000Hf-Rg
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 04:15:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1o6Sos-0007rx-Re
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 04:13:06 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:46848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1o6Soq-00065M-Qn
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 04:13:06 -0400
Received: by mail-ej1-x62e.google.com with SMTP id q6so30868263eji.13
 for <qemu-devel@nongnu.org>; Wed, 29 Jun 2022 01:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=PIGbqvRKGSnAd7dUjgLKR8+0fKI979WXL11KEVouBS8=;
 b=Mst7JHfvhMp7T9HYxlRri+KnTpedoD8p5dv5FzFplRIR5dPwAEDmjeATvc9uzLPlS4
 Z/VpTWrcHm/eS2dKfDsrBWma7Ka6kRi4oeobJUiWKYu81I8WwsmCwHJMGXwwmSyPtWhc
 07l+UZtgnMfZkymgEue3iN8MEi423BFDGx2CZxnbzIB5xLIfRoqdnhM2weNbu8nfow+J
 MLFqPp4dmVlKUhYO/4oGm466EHk4cuFhrw9MylYIkaxe0z0WVOqXO8awzwPgD8Mkc6BN
 hqWs/91URLBTtiudfH7e9bZZSUCxz86ex3ZaADs2re8HM8joD+wJNze2uYvUJD/Rji6O
 3lxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=PIGbqvRKGSnAd7dUjgLKR8+0fKI979WXL11KEVouBS8=;
 b=SPHYXVu3PF2Dc7WRkfkeeHAIpfWIUGzAFErbHtXFQ8YQF8DvCZPOTtnyT0EZ82LqyY
 bv0m5bBQL8/emU4IE3sI/BuvJRhmaw4x4XE38RO6zJrzZ3mzFL4BkBRPlqov8idW1qro
 3Y2cGcdmFzpEGwq74g109PgfgOW3MgeAF+7iEoOOiEnWGn48lxZ4qNyU071yPRqjFTUQ
 JyC2Praf0rZ2OsAw7IY14e282CTx9L8rccyIDSetAKPfAD0rODGCxceSwuUOZjPwiemg
 LTrMvMc1S8/FpVuhM6Chu8MM19eVKtWL2IxWp/6oZYXhQqoQolmHsXBOEGcIV4Kj3kiH
 qlcQ==
X-Gm-Message-State: AJIora8FtCd7hwfxuIIzPcZC/b3PvujIbsjp/B8UIP50v7TMLpDl74ki
 PuiGtwWvefXL45jLt/t1LdtI5w==
X-Google-Smtp-Source: AGRyM1tPnKTVVZy8C+dwTO0lqvLAH9ElVYJH9bs+Cd32mWZRKrNlBRkmBntb9jaIQOz8Su5fLqXKCw==
X-Received: by 2002:a17:906:284c:b0:727:3773:1a53 with SMTP id
 s12-20020a170906284c00b0072737731a53mr1986597ejc.765.1656490383244; 
 Wed, 29 Jun 2022 01:13:03 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 f20-20020a17090660d400b00711edab7622sm7411953ejk.40.2022.06.29.01.13.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jun 2022 01:13:01 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1EFC51FFB7;
 Wed, 29 Jun 2022 09:13:01 +0100 (BST)
References: <20220426150616.3937571-24-Liam.Howlett@oracle.com>
 <20220428201947.GA1912192@roeck-us.net>
 <20220429003841.cx7uenepca22qbdl@revolver>
 <20220428181621.636487e753422ad0faf09bd6@linux-foundation.org>
 <20220502001358.s2azy37zcc27vgdb@revolver>
 <20220501172412.50268e7b217d0963293e7314@linux-foundation.org>
 <Ym+v4lfU5IyxkGc4@osiris> <20220502133050.kuy2kjkzv6msokeb@revolver>
 <YnAn3FI9aVCi/xKd@osiris> <YnGHJ7oroqF+v1u+@osiris>
 <20220503215520.qpaukvjq55o7qwu3@revolver>
 <60a3bc3f-5cd6-79ac-a7a8-4ecc3d7fd3db@linux.ibm.com>
 <15f5f8d6-dc92-d491-d455-dd6b22b34bc3@redhat.com>
 <yt9d5ykkhrvv.fsf_-_@linux.ibm.com>
User-agent: mu4e 1.7.27; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Sven Schnelle <svens@linux.ibm.com>
Cc: David Hildenbrand <david@redhat.com>, Janosch Frank
 <frankja@linux.ibm.com>, Liam Howlett <liam.howlett@oracle.com>, Heiko
 Carstens <hca@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, Guenter Roeck
 <linux@roeck-us.net>, "maple-tree@lists.infradead.org"
 <maple-tree@lists.infradead.org>, "linux-mm@kvack.org"
 <linux-mm@kvack.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Yu Zhao <yuzhao@google.com>, Juergen Gross
 <jgross@suse.com>, Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Andreas Krebbel <krebbel@linux.ibm.com>, Ilya
 Leoshkevich <iii@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, qemu-s390x@nongnu.org
Subject: Re: qemu-system-s390x hang in tcg (was: Re: [PATCH v8 23/70]
 mm/mmap: change do_brk_flags() to expand existing VMA and add
 do_brk_munmap())
Date: Wed, 29 Jun 2022 09:10:57 +0100
In-reply-to: <yt9d5ykkhrvv.fsf_-_@linux.ibm.com>
Message-ID: <87pmirj3aq.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Sven Schnelle <svens@linux.ibm.com> writes:

> Hi,
>
> David Hildenbrand <david@redhat.com> writes:
>
>> On 04.05.22 09:37, Janosch Frank wrote:
>>> I had a short look yesterday and the boot usually hangs in the raid6=20
>>> code. Disabling vector instructions didn't make a difference but a few=
=20
>>> interruptions via GDB solve the problem for some reason.
>>>=20
>>> CCing David and Thomas for TCG
>>>=20
>>
>> I somehow recall that KASAN was always disabled under TCG, I might be
>> wrong (I thought we'd get a message early during boot that the HW
>> doesn't support KASAN).
>>
>> I recall that raid code is a heavy user of vector instructions.
>>
>> How can I reproduce? Compile upstream (or -next?) with kasan support and
>> run it under TCG?
>
> I spent some time looking into this. It's usually hanging in
> s390vx8_gen_syndrome(). My first thought was that it is a problem with
> the VX instructions, but turned out that it hangs even if i remove all
> the code from s390vx8_gen_syndrome().
>
> Tracing the execution of TB's, i see that the generated code is always
> jumping between a few TB's, but never exiting the TB's to check for
> interrupts (i.e. return to cpu_tb_exec(). I only see calls to
> helper_lookup_tb_ptr to lookup the tb pointer for the next TB.
>
> The raid6 code is waiting for some time to expire by reading jiffies,
> but interrupts are never processed and therefore jiffies doesn't change.
> So the raid6 code hangs forever.
>
> As a test, i made a quick change to test:
>
> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
> index c997c2e8e0..35819fd5a7 100644
> --- a/accel/tcg/cpu-exec.c
> +++ b/accel/tcg/cpu-exec.c
> @@ -319,7 +319,8 @@ const void *HELPER(lookup_tb_ptr)(CPUArchState *env)
>      cpu_get_tb_cpu_state(env, &pc, &cs_base, &flags);
>
>      cflags =3D curr_cflags(cpu);
> -    if (check_for_breakpoints(cpu, pc, &cflags)) {
> +    if (check_for_breakpoints(cpu, pc, &cflags) ||
> +        unlikely(qatomic_read(&cpu->interrupt_request))) {
>          cpu_loop_exit(cpu);
>      }
>
> And that makes the problem go away. But i'm not familiar with the TCG
> internals, so i can't say whether the generated code is incorrect or
> something else is wrong. I have tcg log files of a failing + working run
> if someone wants to take a look. They are rather large so i would have to
> upload them somewhere.

Whatever is setting cpu->interrupt_request should be calling
cpu_exit(cpu) which sets the exit flag which is checked at the start of
every TB execution (see gen_tb_start).

--=20
Alex Benn=C3=A9e

