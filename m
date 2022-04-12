Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58BEC4FDAD1
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Apr 2022 12:51:23 +0200 (CEST)
Received: from localhost ([::1]:33018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neE7F-0002Ds-Us
	for lists+qemu-devel@lfdr.de; Tue, 12 Apr 2022 06:51:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1neE53-0000bp-2f
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 06:49:07 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:35654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1neE51-00023X-CB
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 06:49:04 -0400
Received: by mail-ed1-x533.google.com with SMTP id z12so9265133edl.2
 for <qemu-devel@nongnu.org>; Tue, 12 Apr 2022 03:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=gek/IYU7XJvZuwimBEXuAGxpXi4LMigk+0s6f1IaCp4=;
 b=FHS1xOXsYw7jl9THmCxdsdTVCyU07XwtMkC/2FBLpIt0w4aeJyIiCNlVAh/x12mZDO
 SduCyCnydx/u1TTF0NIDu7VtXM9v9XGE0APFFaXbbUjplbgb84InV/a3wo5MAL2hVVO8
 FfL0GvPKDE/GqCnxoEj1pmsARgnpDv7Kb799NDTeH2hs8yAneLHldR7ZwaS1OwZoVXId
 u9LEeGa2vDEpZt4rGbsbrO4908GTfnQesH7B+WRHO5ouhAmTU8CbFiZLdQ5sgLXYO6zj
 Wgt+j16mm1YfT8mimAaYizLhL0tYLqi/zSNpk30NYEUJ36WGxTkKzHxjlX5+nyTkXqIe
 rb2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=gek/IYU7XJvZuwimBEXuAGxpXi4LMigk+0s6f1IaCp4=;
 b=muGUMEMjIjuP45waQ848F25vcIWBnki2SyisOqLLcjxaNvmx3S9B6MAxmes+9xwRdI
 4OwLiiBg5u2HnBSJ/Kujg+ppUOI3LwbtU7LJ4cu58Ont3qop/xyflOgH7Q7OqIJaTvvw
 2JviDo2YvWXmYEOVv+e56wAqYgMnoGlO8TlFG+1+e/R8Ud1RpqLF8msdp9hhdV++IhZc
 7rB1eAFjdS42hnn9K9CsqdaQFy3IQRO0ggWYASJW+aOhnnYK4pez9ToC4BkfGXnwMjeq
 iBafKZQrsKVlkpW03s8z5ML7gqKV4EuWFAVCR4i6zstn8DRZRXxw50A/NntjqT7pFvTS
 fXiA==
X-Gm-Message-State: AOAM530Kfn9bHvJJE2NG07GcBYKjPkJX18oTdp40HnRaABPLf4JivlQA
 K2068Zf64FO5iHXphyUBhBDI8Q==
X-Google-Smtp-Source: ABdhPJw2odSDsZuoDv819bRIJPWaPIC2MPMICaYHv7PDPBVoYF0k5Jj1uYj3mpNohjBPY338qmgCXQ==
X-Received: by 2002:a05:6402:514:b0:41d:787f:b99d with SMTP id
 m20-20020a056402051400b0041d787fb99dmr11948918edv.76.1649760541561; 
 Tue, 12 Apr 2022 03:49:01 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 27-20020a17090600db00b006df6b34d9b8sm13040430eji.211.2022.04.12.03.48.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Apr 2022 03:49:00 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3AEA31FFB7;
 Tue, 12 Apr 2022 11:48:59 +0100 (BST)
References: <20220322154213.86475-1-bmeng.cn@gmail.com>
 <CAFEAcA8RdqQ5fzoZtb5SaYe41FA=oKo21veergqhMgo=eFmB6Q@mail.gmail.com>
 <CAEUhbmVXiB+mbbjhy0sT2PhQHNJgdHmehXfcE18g=E3SPffndQ@mail.gmail.com>
 <87wngj3aj2.fsf@linaro.org>
 <CAFEAcA_O8=0KZ=sjzP7GZ=ytSQm0P+zB_t=jQ2nZnw6b721Yxw@mail.gmail.com>
 <CAEUhbmWjjqihJb70x2k4+yf9dr8yh+_eMRu0MubofSbw+C9izQ@mail.gmail.com>
 <CAFEAcA_m0wUWqJQ2-n5bYZq=xPkUW+SOU2555-z=LMgzrm2W0Q@mail.gmail.com>
 <CAEUhbmV7BnHHAoY+jHAioiYo2Vz-2VJOpgcz7WRFx6+FGvaYxA@mail.gmail.com>
 <CAEUhbmXNBt1L0jqma2XwCEr5C70r=3z0mH-A_1qq=3zKee1f1Q@mail.gmail.com>
 <CAEUhbmVLkLbknHpOncFYQNU3H8_f58-Z7KcgvtEffGP=eaiPLg@mail.gmail.com>
User-agent: mu4e 1.7.12; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH 1/2] gdbstub: Set current_cpu for memory read write
Date: Tue, 12 Apr 2022 11:48:27 +0100
In-reply-to: <CAEUhbmVLkLbknHpOncFYQNU3H8_f58-Z7KcgvtEffGP=eaiPLg@mail.gmail.com>
Message-ID: <87sfqiziec.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x533.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-D?= =?utf-8?Q?aud=C3=A9?= <f4bug@amsat.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Bin Meng <bmeng.cn@gmail.com> writes:

> On Sat, Apr 2, 2022 at 7:20 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>>
>> On Tue, Mar 29, 2022 at 12:43 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>> >
>> > On Mon, Mar 28, 2022 at 5:10 PM Peter Maydell <peter.maydell@linaro.or=
g> wrote:
>> > >
>> > > On Mon, 28 Mar 2022 at 03:10, Bin Meng <bmeng.cn@gmail.com> wrote:
>> > > > IMHO it's too bad to just ignore this bug forever.
>> > > >
>> > > > This is a valid use case. It's not about whether we intentionally =
want
>> > > > to inspect the GIC register value from gdb. The case is that when
>> > > > single stepping the source codes it triggers the core dump for no
>> > > > reason if the instructions involved contain load/store to any of t=
he
>> > > > GIC registers.
>> > >
>> > > Huh? Single-stepping the instruction should execute it inside
>> > > QEMU, which will do the load in the usual way. That should not
>> > > be going via gdbstub reads and writes.
>> >
>> > Yes, single-stepping the instruction is executed in the vCPU context,
>> > but a gdb client sends additional commands, more than just telling
>> > QEMU to execute a single instruction.
>> >
>> > For example, the following is the sequence a gdb client sent when doin=
g a "si":
>> >
>> > gdbstub_io_command Received: Z0,100000,4
>> > gdbstub_io_reply Sent: OK
>> > gdbstub_io_got_ack Got ACK
>> > gdbstub_io_command Received: m18c430,4
>> > gdbstub_io_reply Sent: ff430091
>> > gdbstub_io_got_ack Got ACK
>> > gdbstub_io_command Received: vCont;s:p1.1;c:p1.-1
>> > gdbstub_op_stepping Stepping CPU 0
>> > gdbstub_op_continue_cpu Continuing CPU 1
>> > gdbstub_op_continue_cpu Continuing CPU 2
>> > gdbstub_op_continue_cpu Continuing CPU 3
>> > gdbstub_hit_break RUN_STATE_DEBUG
>> > gdbstub_io_reply Sent: T05thread:p01.01;
>> > gdbstub_io_got_ack Got ACK
>> > gdbstub_io_command Received: g
>> > gdbstub_io_reply Sent:
>> > 3848ed0000000000f08fa6100000000003000000000000000000000000000000000000=
000000000000000000000000000000000000000000000000000000000000000000000000000=
000000000000000000000000000000000000000000000000000000000000000000000000000=
000000000000000000000000000000000000000000000000000000000000000000000000000=
000000000000000000000000000000100000000000000000000000000000000000000000000=
000000000000000000000000000000000000000000000000000000000000000000000000000=
00000000000000000000000000000000000000001f90000000030a5ec000000000034c41800=
00000000c9030000
>> > gdbstub_io_got_ack Got ACK
>> > gdbstub_io_command Received: m18c434,4
>> > gdbstub_io_reply Sent: 00e004d1
>> > gdbstub_io_got_ack Got ACK
>> > gdbstub_io_command Received: m18c430,4
>> > gdbstub_io_reply Sent: ff430091
>> > gdbstub_io_got_ack Got ACK
>> > gdbstub_io_command Received: m18c434,4
>> > gdbstub_io_reply Sent: 00e004d1
>> > gdbstub_io_got_ack Got ACK
>> > gdbstub_io_command Received: m18c400,40
>> > gdbstub_io_reply Sent:
>> > ff4300d1e00300f980370058000040f900a00191000040f900b00091000040f900e004=
911e7800f9fe0340f91e0000f9ff43009100e004d174390094bb390094
>> > gdbstub_io_got_ack Got ACK
>> > gdbstub_io_command Received: mf9010000,4
>> >
>> > Here "mf9010000,4" triggers the bug where 0xf9010000 is the GIC regist=
er.
>> >
>> > This is not something QEMU can ignore or control. The logic is inside
>> > the gdb client.
>> >
>>
>> Ping for this series?
>>
>
> Ping?

Can you have a look at:

  Subject: [RFC PATCH] gdb/gic: expose cpu_index via MxTxAttrs
  Date: Tue, 12 Apr 2022 11:45:19 +0100
  Message-Id: <20220412104519.201655-1-alex.bennee@linaro.org>

and let me know what you think?=20

--=20
Alex Benn=C3=A9e

