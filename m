Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 771E46755C2
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 14:26:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIrPc-0000PX-L6; Fri, 20 Jan 2023 08:26:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pIrOl-0008LG-F8
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 08:25:43 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pIrOi-0003LF-H4
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 08:25:38 -0500
Received: by mail-ed1-x533.google.com with SMTP id y11so6676515edd.6
 for <qemu-devel@nongnu.org>; Fri, 20 Jan 2023 05:25:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=0fZ8ltseGThkHhi2NNMa+/8NoEJEaquqoyQ5gLJ0q30=;
 b=L0OQ49eamwQN1FtclSHO7ZqJixkWH9TFzC+VhwKW3m2uSirvYo7CTmDLN5Rt7EdLWp
 SzwMlRRHIvLHkYa2JUcJtiDmwMYX5mLLX6jiP50nG8InD2cyHyBGeHjr31MX+oUItBHh
 xkmzOoYzcuHN9+DEseSqVKHxtW1Azxa+ozVVYgSJUhEUVPE7LjqAfsP5OPJEPS2KtN/S
 U40pLsU/7WO/yshAIC3Y5M3645c5Ce3rnfHylZ5kFlaR5/Jz3ZUZ2TpM/s20FGfB2g7+
 6CLdC4hR9A6ygLDUWt+0+hh13TA5sCmXK8/ImcTwAUK9o2ZVlmtA8ZnHcxMU9QkUn5BN
 HwMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0fZ8ltseGThkHhi2NNMa+/8NoEJEaquqoyQ5gLJ0q30=;
 b=ibXT2TpiC+iijONYP688MN4t6UnwaspTMY3s/5QK07zOFlvjpEwOQfQilobcT+OQe8
 nF58sEF71eHPrNnSxROtrtz4+Pcsc4kRy6BXcxyZlL59Sm3pS9eamHJWjUY0YozmsDKw
 XmmoD/MkE5+WJYLlTQ564z6LsnhX5yQC2nIyrVoQKHnAdOoJxSLkuuecrtyZOkDEx3VD
 12QU9B1lOJHjPtM91teQgmG5vay9gdrjc2noQjgHjzXtACVjh3vuRqd2X2MYWLN7y8Td
 SwEbNOGrHPD6arNQgwuqFjyXGPRa7Fz5MKTtDwn2cq3Ql2h2l1qHMh4Q+7MJubiNH059
 pRPA==
X-Gm-Message-State: AFqh2kr1LCzb5iHrwt8pXptZ1eP15JpCsr14oP04FcFjgCvtN8wcAxUU
 L9suPFpx+FS+wQ4qqXbK7mZwnw==
X-Google-Smtp-Source: AMrXdXthrTF7VTEHcDDVedFt+TFDHgj29TadRXTCGXyh1Xofvm7peeLtQBPcTkGIXhrMKY23HwqvnQ==
X-Received: by 2002:a05:6402:d47:b0:499:376e:6b31 with SMTP id
 ec7-20020a0564020d4700b00499376e6b31mr13809783edb.29.1674221133794; 
 Fri, 20 Jan 2023 05:25:33 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
 by smtp.gmail.com with ESMTPSA id
 g8-20020aa7d1c8000000b0049e1f167956sm6416743edp.9.2023.01.20.05.25.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jan 2023 05:25:33 -0800 (PST)
Date: Fri, 20 Jan 2023 14:25:32 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Alistair Francis <alistair23@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Frank Chang <frank.chang@sifive.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Ludovic Henry <ludovic@rivosinc.com>
Subject: Re: [PATCH v5 2/2] riscv: Allow user to set the satp mode
Message-ID: <20230120132532.n5inawnb3odhy7ik@orel>
References: <20230113103453.42776-1-alexghiti@rivosinc.com>
 <20230113103453.42776-3-alexghiti@rivosinc.com>
 <20230117163138.jze47hjeeuwu2k4j@orel>
 <CAKmqyKNFX_ovg4Bp_30o0g4Jd5XJ98i9LdFgejsDmGW4iL2+OA@mail.gmail.com>
 <20230118121916.6aqj57leen72z5tz@orel>
 <CAKmqyKNcd3JOZgPb23idrzVjxHj+HHwPz6f6xPEp2oVGJEZKpg@mail.gmail.com>
 <CAHVXubiW2OaMhe3STLLMz=wDPJeY8hvPHbuBJgL7KZyw4=pRpw@mail.gmail.com>
 <CAKmqyKNNocLxKJtBtFnZkbTdCwC=TKaHpm4Sunut49nxQyw8yA@mail.gmail.com>
 <20230120095306.yyqq36dliabni3h3@orel>
 <CAHVXubhPhNiCHRvpW11NSZx58Eqi56AVgnaDFnJvrN7wQs_5MA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHVXubhPhNiCHRvpW11NSZx58Eqi56AVgnaDFnJvrN7wQs_5MA@mail.gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=ajones@ventanamicro.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Fri, Jan 20, 2023 at 01:44:41PM +0100, Alexandre Ghiti wrote:
> On Fri, Jan 20, 2023 at 10:53 AM Andrew Jones <ajones@ventanamicro.com> wrote:
> >
> > On Fri, Jan 20, 2023 at 09:46:05AM +1000, Alistair Francis wrote:
> > > On Thu, Jan 19, 2023 at 11:00 PM Alexandre Ghiti <alexghiti@rivosinc.com> wrote:
> > > >
> > > > Hi Alistair, Andrew,
> > > >
> > > > On Thu, Jan 19, 2023 at 1:25 AM Alistair Francis <alistair23@gmail.com> wrote:
> > > > >
> > > > > On Wed, Jan 18, 2023 at 10:19 PM Andrew Jones <ajones@ventanamicro.com> wrote:
> > > > > >
> > > > > > On Wed, Jan 18, 2023 at 10:28:46AM +1000, Alistair Francis wrote:
> > > > > > > On Wed, Jan 18, 2023 at 2:32 AM Andrew Jones <ajones@ventanamicro.com> wrote:
> > > > > > > >
> > > > > > > > On Fri, Jan 13, 2023 at 11:34:53AM +0100, Alexandre Ghiti wrote:
> > > > > > ...
> > > > > > > > > +
> > > > > > > > > +    /* Get rid of 32-bit/64-bit incompatibility */
> > > > > > > > > +    for (int i = 0; i < 16; ++i) {
> > > > > > > > > +        if ((cpu->cfg.satp_mode.map & (1 << i)) && !valid_vm[i]) {
> > > > > > > >
> > > > > > > > If we ever define mode=1 for rv64, then 'sv32=on' will be incorrectly
> > > > > > > > accepted as an alias. I think we should simply not define the sv32
> > > > > > > > property for rv64 nor the rv64-only modes for rv32. So, down in
> > > > > > > > riscv_add_satp_mode_properties() we can add some
> > > > > > > >
> > > > > > > >   #if defined(TARGET_RISCV32)
> > > > > > > >   ...
> > > > > > > >   #elif defined(TARGET_RISCV64)
> > > > > > > >   ...
> > > > > > > >   #endif
> > > > > > >
> > > > > > > Do not add any #if defined(TARGET_RISCV32) to QEMU.
> > > > > > >
> > > > > > > We are aiming for the riscv64-softmmu to be able to emulate 32-bit
> > > > > > > CPUs and compile time macros are the wrong solution here. Instead you
> > > > > > > can get the xlen of the hart and use that.
> > > > > > >
> > > > > >
> > > > > > Does this mean we want to be able to do the following?
> > > > > >
> > > > > >   qemu-system-riscv64 -cpu rv32,sv32=on ...
> > > > >
> > > > > That's the plan
> > > > >
> > > > > >
> > > > > > If so, then can we move the object_property_add() for sv32 to
> > > > > > rv32_base_cpu_init() and the rest to rv64_base_cpu_init()?
> > >
> > > Wait! Sorry I didn't read this carefully enough. No, that is not what
> > > we want to do. That then won't support the vendor CPUs.
> > >
> > > We just want to add the properties to all CPUs. Then if an invalid
> > > option is set we should return an error.
> 
> Maybe I just don't get this part...

Indeed, I like not adding the property at all over adding it and then
complaining when it's used. Your solution below looks good to me and
would be my preference as well.

Thanks,
drew

> 
> > >
> > > Note that the 64-bit only configs can be hidden behind a #if
> > > defined(TARGET_RISCV64).
> >
> > OK, so we want the original suggestion of putting an
> > 'if defined(TARGET_RISCV64)' in riscv_add_satp_mode_properties(),
> > which is called from register_cpu_props(), for the 64-bit only
> > configs, but to support emulation we can't put sv32 under an
> > 'if defined(TARGET_RISCV32)'. Instead, we need to check the xlen
> > supported by the cpu type. That makes sense to me, and I think
> > it'd be easiest to do in cpu_riscv_set_satp() with something like
> >
> >   if (!strncmp(name, "rv32", 4) &&
> >       RISCV_CPU(obj)->env.misa_mxl != MXL_RV32) {
> >      ... fail with error message ...
> >   }
> >
> 
> ...but what about simply using the runtime check when we add the
> properties? Like this:
> 
> static void riscv_add_satp_mode_properties(Object *obj)
> {
>     RISCVCPU *cpu = RISCV_CPU(obj);
> 
>     if (cpu->env.misa_mxl == MXL_RV32) {
>         object_property_add(obj, "sv32", "bool", cpu_riscv_get_satp,
>                             cpu_riscv_set_satp, NULL,
> &cpu->cfg.satp_mode);
>     } else {
>         object_property_add(obj, "sv39", "bool", cpu_riscv_get_satp,
>                             cpu_riscv_set_satp, NULL,
> &cpu->cfg.satp_mode);
>         object_property_add(obj, "sv48", "bool", cpu_riscv_get_satp,
>                             cpu_riscv_set_satp, NULL,
> &cpu->cfg.satp_mode);
>         object_property_add(obj, "sv57", "bool", cpu_riscv_get_satp,
>                             cpu_riscv_set_satp, NULL,
> &cpu->cfg.satp_mode);
>         object_property_add(obj, "sv64", "bool", cpu_riscv_get_satp,
>                             cpu_riscv_set_satp, NULL,
> &cpu->cfg.satp_mode);
>     }
> }
> 
> > Thanks,
> > drew

