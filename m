Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94FC4417C6D
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 22:40:00 +0200 (CEST)
Received: from localhost ([::1]:56818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTrzA-0006iW-HK
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 16:39:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1mTrqE-0004rG-5y
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 16:30:42 -0400
Received: from mx2.freebsd.org ([96.47.72.81]:43041)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1mTrqC-0006kQ-0m
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 16:30:41 -0400
Received: from mx1.freebsd.org (mx1.freebsd.org [IPv6:2610:1c1:1:606c::19:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits))
 (Client CN "mx1.freebsd.org", Issuer "R3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id 95C20960B3
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 20:30:31 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from smtp.freebsd.org (smtp.freebsd.org [96.47.72.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org", Issuer "R3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4HGNvW3FFfz3rKW
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 20:30:31 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (verified OK))
 (Authenticated sender: kevans)
 by smtp.freebsd.org (Postfix) with ESMTPSA id 4BB771AC2
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 20:30:31 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: by mail-qk1-f181.google.com with SMTP id q125so14876729qkd.12
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 13:30:31 -0700 (PDT)
X-Gm-Message-State: AOAM531l0ev5gTkuoJzIjlalSGcTAV9kZMCJBz10pFZsRJ603UOcdEXF
 0rIZD+aEc+fF53pASm+bcBNWMLvXC07olbHdzwA=
X-Google-Smtp-Source: ABdhPJwCO2FqbC+I+TAg12J4QjEjy5DrkBm1xZlgGtB/MR62eNi7m12rky7+mphV2xvcl+XFYYDmYYyFB6BO1jMg6fY=
X-Received: by 2002:a37:b945:: with SMTP id j66mr12764643qkf.258.1632515430755; 
 Fri, 24 Sep 2021 13:30:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210922061438.27645-1-imp@bsdimp.com>
 <20210922061438.27645-15-imp@bsdimp.com>
 <1f21d9a3-fe08-22e7-45f9-27dae0c1c6ba@linaro.org>
 <CANCZdfpNFhFQk0inNhtb6Ft4vdKtar3jBBjpL6_KfTpf9yj4dA@mail.gmail.com>
In-Reply-To: <CANCZdfpNFhFQk0inNhtb6Ft4vdKtar3jBBjpL6_KfTpf9yj4dA@mail.gmail.com>
From: Kyle Evans <kevans@freebsd.org>
Date: Fri, 24 Sep 2021 15:30:18 -0500
X-Gmail-Original-Message-ID: <CACNAnaF4dPDy6xuXeT1RhzhJ-R2Ep8Mc=8Xy7ADT1pB_EJarSg@mail.gmail.com>
Message-ID: <CACNAnaF4dPDy6xuXeT1RhzhJ-R2Ep8Mc=8Xy7ADT1pB_EJarSg@mail.gmail.com>
Subject: Re: [PATCH 14/14] bsd-user/signal: Create a dummy signal queueing
 function
To: Warner Losh <imp@bsdimp.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=96.47.72.81; envelope-from=kevans@freebsd.org;
 helo=mx2.freebsd.org
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 24, 2021 at 3:11 PM Warner Losh <imp@bsdimp.com> wrote:
>
>
>
> On Fri, Sep 24, 2021 at 6:00 AM Richard Henderson <richard.henderson@linaro.org> wrote:
>>
>> On 9/21/21 11:14 PM, Warner Losh wrote:
>> > Create dummy signal queueing function so we can start to integrate other
>> > architectures (at the cost of signals remaining broken) to tame the
>> > dependency graph a bit and to bring in signals in a more controlled
>> > fashion.
>> >
>> > Signed-off-by: Warner Losh <imp@bsdimp.com>
>> > ---
>> >   bsd-user/qemu.h   | 1 +
>> >   bsd-user/signal.c | 8 ++++++++
>> >   2 files changed, 9 insertions(+)
>> >
>> > diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
>> > index 5a2fd87e44..85d1f8fd2a 100644
>> > --- a/bsd-user/qemu.h
>> > +++ b/bsd-user/qemu.h
>> > @@ -209,6 +209,7 @@ void process_pending_signals(CPUArchState *cpu_env);
>> >   void signal_init(void);
>> >   long do_sigreturn(CPUArchState *env);
>> >   long do_rt_sigreturn(CPUArchState *env);
>> > +int queue_signal(CPUArchState *env, int sig, target_siginfo_t *info);
>> >   abi_long do_sigaltstack(abi_ulong uss_addr, abi_ulong uoss_addr, abi_ulong sp);
>> >
>> >   /* mmap.c */
>> > diff --git a/bsd-user/signal.c b/bsd-user/signal.c
>> > index ad6d935569..4e7f618944 100644
>> > --- a/bsd-user/signal.c
>> > +++ b/bsd-user/signal.c
>> > @@ -19,6 +19,14 @@
>> >   #include "qemu/osdep.h"
>> >
>> >   #include "qemu.h"
>> > +/*
>>
>> Whacky whitespace.
>
>
> fixed.
>
>>
>> > + * Queue a signal so that it will be send to the virtual CPU as soon as
>> > + * possible.
>> > + */
>> > +int queue_signal(CPUArchState *env, int sig, target_siginfo_t *info)
>> > +{
>> > +    return 1;
>> > +}
>>
>> Both here and in linux-user, there are no error conditions.  We should change the return
>> to void.
>
>
> I'll prep a patch to follow up for both linux and bsd user.
>
>>
>> Also, consider folding in the signal-common.h cleanup soon.
>> But don't let either hold you up too much with rebasing.
>
>
> It's on my list. This 'dummy' routine is just to get things linking to
> help simplify the rather tangled dependency tree to get things
> in, still have them compile and still have at least simple hello
> world continue to work. Behind these reviews are three streams
> of patches for 3 more architectures: arm, aarch64 and riscv64.
>
> I'll create a patch for both linux-user and fix in bsd-user as part of the
> signal.c upstreaming I'm working on.
>
> It brings to mind something else... There's times it might be easier
> to refactor between bsd-user and linux-user rather than upstream
> something that's largely copied from linux-user. Is there a good
> way to do that and talk about the design before I sink a ton of time
> into something that's the wrong direction?
>

I had a proposal on this list a long while back to refactor some stuff
into a top-level qemu-user that could be shared between the two,
starting with safe_syscall (which syscall can be substantially
shared), but it hadn't received any traction at that time.

Thanks,

Kyle Evans

