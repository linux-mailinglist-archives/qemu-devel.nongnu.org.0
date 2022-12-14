Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E369264CDB2
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 17:08:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5UHc-0007K9-7q; Wed, 14 Dec 2022 11:07:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p5UHA-0007AD-Cw
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 11:06:34 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p5UH8-0003tz-9g
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 11:06:31 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 k22-20020a05600c1c9600b003d1ee3a6289so11115236wms.2
 for <qemu-devel@nongnu.org>; Wed, 14 Dec 2022 08:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H/0IHoDhfOcrROKjx3sMXPXh3ISZ9Ew0S3B2aCvOhYQ=;
 b=WzI46sMbTz+Zrv3vBl/IvDTsM496jBlozF5bpUOWWauvBh4VBIZLdl9Guxgozt3nwQ
 LFzsjswBILK1ViOlm93HxgJGzmBGm70PPyoFJNa7T+w9ZSd5HJSiAZo+M7D6swI3/dGJ
 2lED/bgaP+2vD8Jsni8sagkVs0y07uoXVzfEAEw3YGuscN6Vqy/raFBc9IyXv7NDU6j6
 75nl2igWWJIyTojBz1/4RgguUFKKhhLiCp2ywKIoCEJaxAo7Tk7d7kZ/r7inXmQ0nupT
 5mDuSZY6d/hf3Z2q0kR0f/cuFccLZ1pEa0Qea+bhyaRnhSJMVh9O9eHcUvTHGbqEpf82
 j2EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=H/0IHoDhfOcrROKjx3sMXPXh3ISZ9Ew0S3B2aCvOhYQ=;
 b=ULiJKMq5iQWWmW4PNGORZ2XLS9EJWOrjX/tLEl/0YVStgiyKp0derbv/dzH7BfsUf/
 DS23s1scvQLfqrNzxsAWoO0YxolEwQQrFBNz7FEpHefdKi30rMBCTouxmtkysObwZNN5
 Ion5Ie4LA3epXTlsSD9LEhV6CbYCLb3eZ3lpnIMMfuXOX4ZwpNc7A+T8vbyPoqmUj497
 vsK5tPcXjWk+SYW2hTzCao8ejulvNg+YOLvUMguZeGlIBLh8ia0CnztgabY5Z/ZpdOlk
 VU70O0wnB/Dky/i+rMMN231zdlw3Jp8RIMnDYCBgZvf4n77RA4fi9qJc6FvI6jagsHBH
 MQOA==
X-Gm-Message-State: ANoB5pnsi8s6PMAysCVr9yf1CrFb9r7hyPEG+tBCNH/iOm4TDNB2ipxJ
 +9LT4GDRg2G4mLqkWHkagSyX3A==
X-Google-Smtp-Source: AA0mqf69x/kK+1mZKUUwsWCiv48pdAym5cyB93gMR4T7nrnDgFKMyIYoHfCERnpGC0Uo1UPEvB0OxA==
X-Received: by 2002:a05:600c:3b0a:b0:3d1:caf1:3f58 with SMTP id
 m10-20020a05600c3b0a00b003d1caf13f58mr19400638wms.32.1671033987003; 
 Wed, 14 Dec 2022 08:06:27 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 e17-20020adffd11000000b002422816aa25sm3726632wrr.108.2022.12.14.08.06.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Dec 2022 08:06:26 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 331E41FFB7;
 Wed, 14 Dec 2022 16:06:26 +0000 (GMT)
References: <4019c9d3.7721.1850b729a80.Coremail.wanghw364@163.com>
 <87y1rbjlk6.fsf@linaro.org>
 <4fc789e6.5fe0.1850fe10037.Coremail.wanghw364@163.com>
 <87tu1yjnma.fsf@linaro.org> <87pmcmjlhw.fsf@linaro.org>
 <3471fec3-f9cc-9e97-07d2-4ab163786c71@suse.de>
User-agent: mu4e 1.9.6; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Claudio Fontana <cfontana@suse.de>
Cc: wanghw364 <wanghw364@163.com>, qemu-devel@nongnu.org
Subject: Re: QEMU function trace
Date: Wed, 14 Dec 2022 16:03:38 +0000
In-reply-to: <3471fec3-f9cc-9e97-07d2-4ab163786c71@suse.de>
Message-ID: <87cz8mj7gd.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
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


Claudio Fontana <cfontana@suse.de> writes:

> On 12/14/22 12:00, Alex Benn=C3=A9e wrote:
>>=20
>> Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:
>>=20
>>> wanghw364  <wanghw364@163.com> writes:
>>>
>>>> Thanks. I have several questions as below, please help, thanks.
>>>>
>>>> 1.What do you mean by "only have debug symbols available for
>>>> linux-user so"? What does the linux-user so
>>>> refer to?
>>>>  qemu_plugin_insn_symbol() can only see symbols from linux-user so?
>>>
>>> The linux-user ELF loader will read the debug symbols (if they exist)
>>> and populate the syminfos structures that lookup_symbol uses. It's
>>> partially obscured by the ELF loaders heavy use of macros but see:
>>>
>>>   static void glue(load_symbols, SZ)(struct elfhdr *ehdr, int fd, int m=
ust_swab,
>>>                                      int clear_lsb, symbol_fn_t sym_cb)
>>>
>>> in elf_ops.h
>>>
>>>> 2.The purpose of teaching the linux kernel loader to understand and re=
locate symbols from an ELF kernel
>>>> image,
>>>> or extract then and feed them directly to the plugin, is to solve
>>>> the issue that qemu_plugin_insn_symbol()
>>>> can't see kernel symbol?
>>>
>>> Yes. This is slightly complicated by the fact that the kernel loaders d=
on't
>>> expect to load pure ELF files but something that is wrapped up as a
>>> Linux loader. For example:
>>>
>>>   =E2=9E=9C  file vmlinux
>>>   vmlinux: ELF 64-bit LSB pie executable, ARM aarch64, version 1
>>> (SYSV), statically linked,
>>> BuildID[sha1]=3D21166458a10404e6157abf0da4a0921144c72675, with
>>> debug_info, not stripped
>>>   =F0=9F=95=9910:07:42 alex@zen:linux.git/builds/arm64.initramfs with
>>> arm64/aarch64-linux-gnu- on =EE=82=A0 linux-6.0.y [$!?]
>>>   =E2=9E=9C  file arch/arm64/boot/Image
>>>   arch/arm64/boot/Image: Linux kernel ARM64 boot executable Image, litt=
le-endian, 4K pages
>>>
>>> The second file is what is actually passed to -kernel in a typical boot.
>>>
>>> The logic in arm_setup_direct_kernel_boot() implies you can load ELFs
>>> directly and boot them but for some reason the Linux kernel doesn't work
>>> if you try this way.
>>=20
>> Replying to myself - this is because the vmlinux image is based of
>> kernel virtual address. So the import thing the loader does is create
>> the initial vaddr mappings and relocate the kernel to that location
>> before running it. See the function primary_entry in head.S in the
>> kernel.
>>=20
>> So perhaps for system emulation it would be useful to have a -symbols
>> option to load symbols from another file.
>>=20
>
> Hi Alex,
>
> it doesn't need to be a tcg plugin-only feature right, it's possible
> to use qemu to debug the guest also when using KVM..

No it doesn't have to be although the only real users is the -d in_asm
trace which I suspect doesn't get used as much for system emulation
given the size of the traces.

For normal debugging over the gdbstub its usually left up to the gdb
process itself to handle the resolution of symbols, e.g.:

  gdb vmlinux -ex "target remote localhost:1234"

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

