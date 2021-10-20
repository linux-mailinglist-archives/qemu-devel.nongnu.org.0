Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF0743522D
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 19:58:56 +0200 (CEST)
Received: from localhost ([::1]:46662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdFrb-0007g6-LC
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 13:58:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mdFoo-0004hL-Af
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 13:56:03 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:36630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mdFoi-0002YZ-UE
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 13:55:59 -0400
Received: by mail-wr1-x434.google.com with SMTP id o20so48680834wro.3
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 10:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=nYlLIxLVAwvrMkL94mMHC71avnaZBOf6hmJXChBd6jo=;
 b=AwlVRvhWecs+9yh4YfUjYkJQ7ZkmiMUWJxzHzZBTpogQaQOXpf8iSQJnMCLnGAWx+v
 +/b/M2AfewHh59PRTkdqFEIlPHQK7VKOe1HhkU1g7+m3XPG2iTtBQbGLGNnw77cIS8if
 Hk/Tcysf4TWRtQvnBID3E0rabt2wYQGjI29ZmexXuGbEzBDZURiG7qBowgF9py3Utcga
 Z2TLLRL3Mp+XlEGU5rw/UeAm+yodWTNFkqtofSaB6WmpKa5gycBl4sg2OWMO4HfF8Xkh
 SMe6TUXZUFSmsVR8DeneYHf17dHbt0gwdqIGtI+oW5PqMjDsPVyR/dY7/5dVusUu7Z+h
 P0Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=nYlLIxLVAwvrMkL94mMHC71avnaZBOf6hmJXChBd6jo=;
 b=cN0hKRfo0Qy9lTqCtgjAXYyw4Ran7oOMUPpQEyNvyPnXyK1pHYwk5CAvko+tBUy8us
 c7yEy1FaIpl8KnStAZSAllvCzvky/S8zksVWdDA4Kl3tuV5VOk7E0sdszJnii7I9Bodv
 2qIMNmCZMPD8aO/WNugKExQP0atw3Wb6r01uI3rOUokQxhCcTl3Jw0IlkbR9yPp4hES2
 1RTIPljaYqffVZWnKLh4iSkfPm/6IGaCP07CySbKvkapN0bCDm1Y2XFUV1tS+EqwHk/5
 goMtgX+WL2ssOu8My6OeTMma30vZR9CAfzUw4iJHjPRWS2tx+DRXqqlK1eNOkqdoZKPV
 cGTw==
X-Gm-Message-State: AOAM530skjBPQ6Om/j5M34RGkRwuBB7MF7dBKoQIo5KtKSjwYbnIqtVh
 5vwxULS3gpuMDY4A61o4spvkIg==
X-Google-Smtp-Source: ABdhPJx+NYnOiToVUkmln9ZCI1buMvfWvAqf0s4t2fO864+H/FjEez6+SWmD1QtUizJaa3Kf9PEK4A==
X-Received: by 2002:a5d:6904:: with SMTP id t4mr914020wru.242.1634752554999;
 Wed, 20 Oct 2021 10:55:54 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u2sm2540162wrr.35.2021.10.20.10.55.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 10:55:54 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 480451FF96;
 Wed, 20 Oct 2021 18:55:53 +0100 (BST)
References: <YUOssEF1lND+Rhsr@strawberry.localdomain>
 <87fsu3tppe.fsf@linaro.org> <YUpAXEYX0D27BnEA@strawberry.localdomain>
 <YUuQeSFsmM6YiBCp@strawberry.localdomain>
 <YXBN4UZvY5ESdz6v@strawberry.localdomain>
User-agent: mu4e 1.7.0; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Aaron Lindsay <aaron@os.amperecomputing.com>
Subject: Re: plugins: Missing Store Exclusive Memory Accesses
Date: Wed, 20 Oct 2021 18:54:20 +0100
In-reply-to: <YXBN4UZvY5ESdz6v@strawberry.localdomain>
Message-ID: <87cznzvavq.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
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
Cc: cota@braap.org, richard.henderson@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Aaron Lindsay <aaron@os.amperecomputing.com> writes:

> On Sep 22 16:22, Aaron Lindsay wrote:
>> On Sep 21 16:28, Aaron Lindsay wrote:
>> > On Sep 17 12:05, Alex Benn=C3=A9e wrote:
>> > > Aaron Lindsay <aaron@os.amperecomputing.com> writes:
>> > > > I recently noticed that the plugin interface does not appear to be
>> > > > emitting callbacks to functions registered via
>> > > > `qemu_plugin_register_vcpu_mem_cb` for AArch64 store exclusives. T=
his
>> > > > would include instructions like `stxp  w16, x2, x3, [x4]` (encodin=
g:
>> > > > 0xc8300c82). Seeing as how I'm only running with a single CPU, I d=
on't
>> > > > see how this could be due to losing exclusivity after the preceding
>> > > > `ldxp`.
>> > >=20
>> > > The exclusive handling is a bit special due to the need to emulate i=
t's
>> > > behaviour using cmpxchg primitives.
>> > >=20
>> > > >
>> > > > In looking at QEMU's source, I *think* this is because the
>> > > > `gen_store_exclusive` function in translate-a64.c is not making th=
e same
>> > > > calls to `plugin_gen_mem_callbacks` & company that are being made =
by
>> > > > "normal" stores handled by functions like `tcg_gen_qemu_st_i64` (at
>> > > > least in my case; I do see some code paths under `gen_store_exclus=
ive`
>> > > > call down into `tcg_gen_qemu_st_i64` eventually, but it appears no=
t all
>> > > > of them do?).
>> > >=20
>> > > The key TCG operation is the cmpxchg which does the effective store.=
 For
>> > > -smp 1 we should use normal ld and st tcg ops. For > 1 it eventually
>> > > falls to tcg_gen_atomic_cmpxchg_XX which is a helper. That eventually
>> > > ends up at:
>> > >=20
>> > >   atomic_trace_rmw_post
>> > >=20
>> > > which should be where things are hooked.
>> >=20
>> > When I open this up in gdb, I see that I'm getting the following call
>> > graph for the `stxp` instruction in question (for -smp 1):
>> >=20
>> > gen_store_exclusive -> gen_helper_paired_cmpxchg64_le
>> >=20
>> > In other words, I'm taking the `s->be_data =3D=3D MO_LE` else/if claus=
e.
>> >=20
>> > I do not see where the helper behind that (defined in helper-a64.c as
>> > `uint64_t HELPER(paired_cmpxchg64_le)...`) is calling in to generate
>> > plugin callbacks in this case. Am I missing something?
>>=20
>> Richard, Alex,
>>=20
>> The more I look at this, the more it feels like the following
>> AArch64-specific helpers may have been overlooked when adding
>> tracing/plugin hooks:
>> 	gen_helper_paired_cmpxchg64_le
>> 	gen_helper_paired_cmpxchg64_be
>>=20
>> But... I'm still not sure I fully understand how everything I'm digging
>> into interacts; I am happy to keep investigating and work towards a fix,
>> but think I need a nudge in the right direction.
>
> Ping?
>
> I'm happy to spend some more time digging into this issue, and would
> love to be pointed in the right direction if someone is able!

These all end up in:

      ABI_TYPE ATOMIC_NAME(cmpxchg)(CPUArchState *env, target_ulong addr,
                                    ABI_TYPE cmpv, ABI_TYPE newv,
                                    MemOpIdx oi, uintptr_t retaddr)

Have you got a test case you are using so I can try and replicate the
failure you are seeing? So far by inspection everything looks OK to me.

>
> Thanks!
>
> -Aaron


--=20
Alex Benn=C3=A9e

