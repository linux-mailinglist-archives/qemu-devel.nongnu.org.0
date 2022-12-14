Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57DB364C715
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 11:29:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5OpN-0006IB-Qd; Wed, 14 Dec 2022 05:17:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p5OpJ-0006FV-63
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 05:17:26 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p5OpG-0005CT-8A
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 05:17:24 -0500
Received: by mail-wm1-x329.google.com with SMTP id m19so10847776wms.5
 for <qemu-devel@nongnu.org>; Wed, 14 Dec 2022 02:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DqwuYxzWkdV2bI1hut1AigwkiWJhaDGk2Q0hd+2F68U=;
 b=zUfDROqIwkGgwPpwQ8aVlCvRG53Y5x794/hfy4LwypNeoL8wp5BMpJGmDeasMy3qKy
 gTqfs/Nxx5N/tgtFWilgaCyYAQwO6LfjLJmlzHqpGUiAJyv7JiBs3372GEeqqqvre+90
 kmfUIPTZip+w4UorffcTZnck9Jmz5I7tLJX0JGfryTxqUdvDb8aTvcIH0ya+F4P7dlGf
 cqHTW2SwcuAqfPqMpTWnBk2o0nULf2Ov2xAaRvLQ6xxZ6DkHLvkOWoYkxOqGyH1rmBDN
 XV+Ot3hhqOAyKkLyIwmQ5TTWxMkLcIAeZ0xIyCO4FzDdTcM5ohb7gSXQlwI3npcTzz3x
 gJtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=DqwuYxzWkdV2bI1hut1AigwkiWJhaDGk2Q0hd+2F68U=;
 b=hrvxFgz6JYeLIPCyuyr6sKjW5zeH59mbP9sPcjCzbmkdQ4wIj3i82kSI+iJjGOrAiL
 plndEHOqlKObsLxEi+0EtrB633lcPJWQKEBCJCgf5NDpa27xiKWl34SoG5sSoSXbpvkA
 0br9a4AMKYUhh9BurzgKNEDU/99ZiTawa2StAVTV5HZeY2oCHQiw3/y96G4WTz79INZg
 lsbZZG5ZHE2gB+9NaLSfonUIy4hemKlCNyaiiDaGuBPIBIe8V3HmxaQNQDEW3qBOgR9D
 KGL16qWIqhrVceyd2pK1wvtJVBBqadm5dgRrCDocEskS2+7yag1ElneBXi3qXXbB9cDb
 GPMw==
X-Gm-Message-State: ANoB5pm4h3TUJz4QLDV4fsP/L75PSSM5Y8psicq13TQSs6sclpl3ngQe
 rk3xwCUb4CwRJOmZzXKX5QAuiQ==
X-Google-Smtp-Source: AA0mqf5ibuOlCvp9KLQnlJooAmLU9l+ym8aiw7ctqq1PrK1sjdNts2RNst9ifRQZPONEeYbwqIGqlg==
X-Received: by 2002:a05:600c:35c6:b0:3c6:e61e:ae8b with SMTP id
 r6-20020a05600c35c600b003c6e61eae8bmr22440998wmq.27.1671013038691; 
 Wed, 14 Dec 2022 02:17:18 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 n30-20020a05600c501e00b003cf4d99fd2asm2079400wmr.6.2022.12.14.02.17.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Dec 2022 02:17:18 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C45F61FFB7;
 Wed, 14 Dec 2022 10:17:17 +0000 (GMT)
References: <4019c9d3.7721.1850b729a80.Coremail.wanghw364@163.com>
 <87y1rbjlk6.fsf@linaro.org>
 <4fc789e6.5fe0.1850fe10037.Coremail.wanghw364@163.com>
User-agent: mu4e 1.9.6; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: wanghw364 <wanghw364@163.com>
Cc: qemu-devel@nongnu.org
Subject: Re: QEMU function trace
Date: Wed, 14 Dec 2022 10:04:09 +0000
In-reply-to: <4fc789e6.5fe0.1850fe10037.Coremail.wanghw364@163.com>
Message-ID: <87tu1yjnma.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
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


wanghw364  <wanghw364@163.com> writes:

> Thanks. I have several questions as below, please help, thanks.
>
> 1.What do you mean by "only have debug symbols available for linux-user s=
o"? What does the linux-user so
> refer to?
>  qemu_plugin_insn_symbol() can only see symbols from linux-user so?

The linux-user ELF loader will read the debug symbols (if they exist)
and populate the syminfos structures that lookup_symbol uses. It's
partially obscured by the ELF loaders heavy use of macros but see:

  static void glue(load_symbols, SZ)(struct elfhdr *ehdr, int fd, int must_=
swab,
                                     int clear_lsb, symbol_fn_t sym_cb)

in elf_ops.h

> 2.The purpose of teaching the linux kernel loader to understand and reloc=
ate symbols from an ELF kernel
> image,
> or extract then and feed them directly to the plugin, is to solve the iss=
ue that qemu_plugin_insn_symbol()
> can't see kernel symbol?

Yes. This is slightly complicated by the fact that the kernel loaders don't
expect to load pure ELF files but something that is wrapped up as a
Linux loader. For example:

  =E2=9E=9C  file vmlinux
  vmlinux: ELF 64-bit LSB pie executable, ARM aarch64, version 1 (SYSV), st=
atically linked, BuildID[sha1]=3D21166458a10404e6157abf0da4a0921144c72675, =
with debug_info, not stripped
  =F0=9F=95=9910:07:42 alex@zen:linux.git/builds/arm64.initramfs with arm64=
/aarch64-linux-gnu- on =EE=82=A0 linux-6.0.y [$!?]=20
  =E2=9E=9C  file arch/arm64/boot/Image
  arch/arm64/boot/Image: Linux kernel ARM64 boot executable Image, little-e=
ndian, 4K pages

The second file is what is actually passed to -kernel in a typical boot.

The logic in arm_setup_direct_kernel_boot() implies you can load ELFs
directly and boot them but for some reason the Linux kernel doesn't work
if you try this way.

> 3.How to make the kernel loader understand and relocate symbols in QEMU? =
How to feed the symbol table
> directly to the plugin?
> As I can see, cache plugin has used qemu_plugin_insn_symbol() and there i=
s function name info in the output
> result,=20
> but it seems there is no symbol table feeding in the command, shown in
> https://gitlab.com/qemu-project/qemu/-/blob/master/docs/devel/tcg-plugins=
.rst .=20
> $ qemu-x86_64 -plugin ./contrib/plugins/libcache.so -d plugin -D cache.lo=
g .
> /tests/tcg/x86_64-linux-user/float_convs
>
> So I was wondering how the symbol table was fed into the plugin? What is =
the usage of para .
> /tests/tcg/x86_64-linux-user/float_convs?

It came directly from the debug symbols embedded in the ELF binary.

> 4.If we make kernel symbol visible to qemu_plugin_insn_symbol(), the only=
 thing we need to do is to make the
> core model identify which instruction
> is the start of one function and record the function trace by looking up =
symbol table once the function-level
> start instruction was executed?
>
> Actually I have the kernel symbol table file named 'System.map' under the=
 kernel directory, I was wondering
> how to feed it to the plugin.

You could certainly write a System.map parser in your plugin and get the
addresses from that instead. It would probably be faster than working
out what to fix in the kernel load path.

>
> Thanks.
>
> At 2022-12-13 23:44:29, "Alex Benn=C3=A9e" <alex.bennee@linaro.org> wrote:
>>
>>wanghw364 <wanghw364@163.com> writes:
>>
>>> Hi all,
>>>
>>> Does qemu-system-riscv64 have any plugin or tools that can support targ=
et program function trace feature?
>>>
>>> It seems there is no such feature under
>>> link:https://gitlab.com/qemu-project/qemu/-/blob/master/docs/devel/tcg-=
plugins.rst=20
>>>
>>> For example, we can use libexeclog.so plugin to trace target program in=
struction trace.
>>>
>>> In my case, when I boot linux kernel with qemu, it hangs in the halfway=
, but I don't know the hang position in
>>> the code,=20
>>>
>>> so I want to trace the kernel function calling trace so that I can
>>> find out when and where execution diverges.
>>
>>Not currently but it wouldn't be super hard to write such a thing.
>>However currently we only have debug symbols available for linux-user so
>>that is all the helper qemu_plugin_insn_symbol() will see.
>>
>>You need to teach the linux kernel loader to understand and relocate
>>symbols from an ELF kernel image. Alternatively you could extract then
>>and feed them directly to the plugin. It would then be fairly trivial to
>>stick an execution callback at every function entrance.
>>
>>I suspect KASLR messes things up though.
>>
>>>
>>> Thanks.=20
>>
>>
>>--=20
>>Alex Benn=C3=A9e


--=20
Alex Benn=C3=A9e

