Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A8ED671BDF
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 13:20:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pI7Pp-0004vL-D0; Wed, 18 Jan 2023 07:19:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pI7PU-0004uZ-Sv
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 07:19:23 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pI7PS-0002Ar-U8
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 07:19:20 -0500
Received: by mail-wr1-x429.google.com with SMTP id k8so19245586wrc.9
 for <qemu-devel@nongnu.org>; Wed, 18 Jan 2023 04:19:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=j96DoX7O2E++c0J3qK2c/KLyWWVc3fSBAF9xCz+4ilc=;
 b=AJjBEYXKDb+cmfyaQBqKhzZ9Npx8f2d9FmjrQFbY5e6H+whU77J5g1jF1OJXbAlPg+
 foshO0ZvI5+gVabho3z2lqrjvZfQYyyW8dhI2KMns1E1a/Js9CAY9777owveL791gAYZ
 usLgHxAQqbHgqT5sVcGQBODu9mXkGuD+JgZSFn9cCwxlFEYQyTxY1y5NY0FFMJs3vbmc
 xIkEite/to1Jke/AXgj28qEiwC0HLIU0Ij3urjFUjBCbGJXgwXV4xdG1/e3lch+3a9kT
 5k2hFRNkIw4kc/VygBGikSkm2iATpfu7PY/yLXPQlXa9lfKqWpMkUcqut+u59uIU8DMU
 5+Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j96DoX7O2E++c0J3qK2c/KLyWWVc3fSBAF9xCz+4ilc=;
 b=BudZmgnHhwCypi7ql3C1tCALYYnORQoV4IiqVN8P8x7L8eGeYyJg8P9deP/UAjqq49
 QHT72mIH3IbXLe3QaQhmbngaR4Ul6kpU//WmaWX8Lg+xsGjV/MeY9G5f6F5E7H/GCGjD
 FFtacNSaByh20BgnYIlaYod8rz3YokY2ruOLNfd+R6qP3MZfHFt8O0+4yfjjPFpmTWS3
 uBmBd0BUZz1/yo2GCapt9dIzLbh5WdCW3GnWoOcgxvc5Bi1Nnqg3IhlaJWnC6G5ERJW9
 pmfsduq2i2E5VqYOJmd0cw2X3ia+sVMr0nLbPhLnlzuNJHJ8tYVsZA7awH+57fNwcWOg
 dl9A==
X-Gm-Message-State: AFqh2ko6qUj4sx3V9f4ENGRsugHJqn8RRMeH6wlmAvCd3ja3O0Ktk4+F
 uEv6g8LCEvYUcfvXxtnA/xMO7Q==
X-Google-Smtp-Source: AMrXdXs3WfHgqFsDxckIK1+hzsv7abYbQZaDLzqvR7M2u4gG/q3pMvpwiWBnbhG+22BypxFjbwE/pw==
X-Received: by 2002:a5d:4591:0:b0:2bc:7fdd:923e with SMTP id
 p17-20020a5d4591000000b002bc7fdd923emr6180797wrq.22.1674044357175; 
 Wed, 18 Jan 2023 04:19:17 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 z12-20020adfd0cc000000b002bdff778d87sm8344053wrh.34.2023.01.18.04.19.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jan 2023 04:19:16 -0800 (PST)
Date: Wed, 18 Jan 2023 13:19:16 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Alistair Francis <alistair23@gmail.com>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Frank Chang <frank.chang@sifive.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Ludovic Henry <ludovic@rivosinc.com>
Subject: Re: [PATCH v5 2/2] riscv: Allow user to set the satp mode
Message-ID: <20230118121916.6aqj57leen72z5tz@orel>
References: <20230113103453.42776-1-alexghiti@rivosinc.com>
 <20230113103453.42776-3-alexghiti@rivosinc.com>
 <20230117163138.jze47hjeeuwu2k4j@orel>
 <CAKmqyKNFX_ovg4Bp_30o0g4Jd5XJ98i9LdFgejsDmGW4iL2+OA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKmqyKNFX_ovg4Bp_30o0g4Jd5XJ98i9LdFgejsDmGW4iL2+OA@mail.gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=ajones@ventanamicro.com; helo=mail-wr1-x429.google.com
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

On Wed, Jan 18, 2023 at 10:28:46AM +1000, Alistair Francis wrote:
> On Wed, Jan 18, 2023 at 2:32 AM Andrew Jones <ajones@ventanamicro.com> wrote:
> >
> > On Fri, Jan 13, 2023 at 11:34:53AM +0100, Alexandre Ghiti wrote:
...
> > > +
> > > +    /* Get rid of 32-bit/64-bit incompatibility */
> > > +    for (int i = 0; i < 16; ++i) {
> > > +        if ((cpu->cfg.satp_mode.map & (1 << i)) && !valid_vm[i]) {
> >
> > If we ever define mode=1 for rv64, then 'sv32=on' will be incorrectly
> > accepted as an alias. I think we should simply not define the sv32
> > property for rv64 nor the rv64-only modes for rv32. So, down in
> > riscv_add_satp_mode_properties() we can add some
> >
> >   #if defined(TARGET_RISCV32)
> >   ...
> >   #elif defined(TARGET_RISCV64)
> >   ...
> >   #endif
> 
> Do not add any #if defined(TARGET_RISCV32) to QEMU.
> 
> We are aiming for the riscv64-softmmu to be able to emulate 32-bit
> CPUs and compile time macros are the wrong solution here. Instead you
> can get the xlen of the hart and use that.
>

Does this mean we want to be able to do the following?

  qemu-system-riscv64 -cpu rv32,sv32=on ...

If so, then can we move the object_property_add() for sv32 to
rv32_base_cpu_init() and the rest to rv64_base_cpu_init()?
Currently, that would be doing the same thing as proposed above,
since those functions are under TARGET_RISCV* defines, but I guess
the object_property_add()'s would then be in more or less the right
places for when the 32-bit emulation support work is started.

Thanks,
drew

