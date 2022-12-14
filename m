Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7088564C7A8
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 12:04:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5PXf-0003dm-Aj; Wed, 14 Dec 2022 06:03:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p5PXc-0003db-He
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 06:03:12 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p5PXa-0005m8-PC
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 06:03:12 -0500
Received: by mail-wr1-x42d.google.com with SMTP id h16so9920152wrz.12
 for <qemu-devel@nongnu.org>; Wed, 14 Dec 2022 03:03:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GRLJX7mWdrLu996KMPIstZJ7KqeRhZxkXdWtrYR3AiI=;
 b=qcPHKc2+Q1PU4YIWcX/iu602n6+y5q8bLGF6CwSh+ELchxApzJglZIZa+uK7LKFVnf
 QvVIo8eXJ1ILaiiAU3cmlXzsUT/u/jqp/l2RpOlKMm8Nh3kBIwmNfgjKyzwH1i+Qq2dF
 1oBuSepv7/lVV4m4A2KL0qKm77xfAWy8URy9LU4VZTCCXWlQHTcCpV6GUfZgRScvdVsb
 dkrNPl4ppUVLFHMQSPKkNO0N8vfRklzLFt3FIYSMwlCBJTlNGSLw/blQQRK1R1i8uina
 EQF851Iv2P642P0WaRWAdtDy5CRyQOtC4sbJDkxT3qSNZPKvFM1NlZOC/vjt1qWZ3DcH
 Z4sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=GRLJX7mWdrLu996KMPIstZJ7KqeRhZxkXdWtrYR3AiI=;
 b=ce0yvIIVbxejf00axCN9RRrD9+0lmoOK4sFPiSLCuQbwnxg054i7+AmaMQDr+eCg/P
 w4kSVU6Zsk73oLeI49sNKeV9ZLfShuini9ATa0HTOwUOCTsgSGBZIttq36fA5GOQR5GC
 7wczG2LqjjFj+oaBBOJYmNvw7g4R0t+Z0Y5utNRHKP3C58sQXBEKXkoxoPiOXcPDMTaz
 P5T81SLxn5porPWTGlghNF8U+FS+Uw6/0NwBnFygc2o4tQbLKZcJbTVGbzCOJOcLKtij
 7+LQgIHVBEZy+mgpFa0lHRhmGgSqeiuyNP68zY31/lFRTMeQ6BHZ1/zCZl3dl2xnA0fK
 URgw==
X-Gm-Message-State: ANoB5pktJd7chwNaTkUN4s5i0yH6hLNgEaZBBgot4y2cXD/CwTsOr1IM
 +o3c6nrJ0xZYBUxySsiqMHMq/A==
X-Google-Smtp-Source: AA0mqf7W+k3sjWrwrTT1yGPZmAJ8vcuyg3xMdMibd7wn2Qwb9pEv5dU6LjUV1onrlpCNKo4Q3rrLDw==
X-Received: by 2002:adf:f604:0:b0:241:fb7d:2f15 with SMTP id
 t4-20020adff604000000b00241fb7d2f15mr13979299wrp.29.1671015788790; 
 Wed, 14 Dec 2022 03:03:08 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 bo28-20020a056000069c00b002362f6fcaf5sm2568229wrb.48.2022.12.14.03.03.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Dec 2022 03:03:08 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C5B4A1FFB7;
 Wed, 14 Dec 2022 11:03:07 +0000 (GMT)
References: <4019c9d3.7721.1850b729a80.Coremail.wanghw364@163.com>
 <87y1rbjlk6.fsf@linaro.org>
 <4fc789e6.5fe0.1850fe10037.Coremail.wanghw364@163.com>
 <87tu1yjnma.fsf@linaro.org>
User-agent: mu4e 1.9.6; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: wanghw364 <wanghw364@163.com>
Cc: qemu-devel@nongnu.org
Subject: Re: QEMU function trace
Date: Wed, 14 Dec 2022 11:00:13 +0000
In-reply-to: <87tu1yjnma.fsf@linaro.org>
Message-ID: <87pmcmjlhw.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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


Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> wanghw364  <wanghw364@163.com> writes:
>
>> Thanks. I have several questions as below, please help, thanks.
>>
>> 1.What do you mean by "only have debug symbols available for linux-user =
so"? What does the linux-user so
>> refer to?
>>  qemu_plugin_insn_symbol() can only see symbols from linux-user so?
>
> The linux-user ELF loader will read the debug symbols (if they exist)
> and populate the syminfos structures that lookup_symbol uses. It's
> partially obscured by the ELF loaders heavy use of macros but see:
>
>   static void glue(load_symbols, SZ)(struct elfhdr *ehdr, int fd, int mus=
t_swab,
>                                      int clear_lsb, symbol_fn_t sym_cb)
>
> in elf_ops.h
>
>> 2.The purpose of teaching the linux kernel loader to understand and relo=
cate symbols from an ELF kernel
>> image,
>> or extract then and feed them directly to the plugin, is to solve
>> the issue that qemu_plugin_insn_symbol()
>> can't see kernel symbol?
>
> Yes. This is slightly complicated by the fact that the kernel loaders don=
't
> expect to load pure ELF files but something that is wrapped up as a
> Linux loader. For example:
>
>   =E2=9E=9C  file vmlinux
>   vmlinux: ELF 64-bit LSB pie executable, ARM aarch64, version 1
> (SYSV), statically linked,
> BuildID[sha1]=3D21166458a10404e6157abf0da4a0921144c72675, with
> debug_info, not stripped
>   =F0=9F=95=9910:07:42 alex@zen:linux.git/builds/arm64.initramfs with
> arm64/aarch64-linux-gnu- on =EE=82=A0 linux-6.0.y [$!?]
>   =E2=9E=9C  file arch/arm64/boot/Image
>   arch/arm64/boot/Image: Linux kernel ARM64 boot executable Image, little=
-endian, 4K pages
>
> The second file is what is actually passed to -kernel in a typical boot.
>
> The logic in arm_setup_direct_kernel_boot() implies you can load ELFs
> directly and boot them but for some reason the Linux kernel doesn't work
> if you try this way.

Replying to myself - this is because the vmlinux image is based of
kernel virtual address. So the import thing the loader does is create
the initial vaddr mappings and relocate the kernel to that location
before running it. See the function primary_entry in head.S in the
kernel.

So perhaps for system emulation it would be useful to have a -symbols
option to load symbols from another file.

--=20
Alex Benn=C3=A9e

