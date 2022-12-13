Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA5764BB67
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 18:53:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p59Rc-00034G-RK; Tue, 13 Dec 2022 12:51:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1p59Ra-00031l-3t; Tue, 13 Dec 2022 12:51:54 -0500
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1p59RY-0005FL-AO; Tue, 13 Dec 2022 12:51:53 -0500
Received: by mail-lf1-x12f.google.com with SMTP id b13so6176427lfo.3;
 Tue, 13 Dec 2022 09:51:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=0BgCpePggMW2WVNlbV/j9LvdWr/066FWR5ULli4KAPc=;
 b=g4TSwZ0verJnU4VWtKy2T54iJvYAqBFJaJwMkgvYUFTs3viSnfB+SmpQUPVdDARc9J
 pU4eOh9nDDIfKP/dtbZDUj5dWTebwnVoxf4MXnZ+Tb/1riYhBI5fagpGp+minKFiF816
 KFiFZEKqMq8RQA3j9n/ei+NiKT1R+U7D8neC2wxuILuUFf6kj5vWH+ylzBQwLlNZk9FY
 fkCrm0AmeuOejtPEE7B4YzxocERsg1p0xdRmqfW8+O9sCevz8kxID1jJuCBt+3XGktba
 xp6OqP6JAFRYRDyFJmywpfm8pV0rP6O8vNN4tL/MhDfWj+vMBBJ7bImKPTFZkxPKSL6r
 emvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0BgCpePggMW2WVNlbV/j9LvdWr/066FWR5ULli4KAPc=;
 b=hkfm5FydVKyXQZLmpWv+X43B1gWC4XemTXn5KNz0HBD8lmADTkyWrUmQa52YpCFKjI
 qacLA7R0NqgwXvXrnxWd7J6kPsKpsBVlRX7Fu0ERPCW1mgJBeZBktVwWbgVSQCIylnve
 vxMM0rHgC2BVUn2JozsVQTu2M8/lbmhR1er/2Hx2C2d8F8aGP4eqhMWp677oGr04dTJZ
 dtCEF390yIxCwJwF6opK0APcnRWyL3+1M/BbabMdT6G4WPrpBAOb/nq92TYw1pLcCleR
 v5kHQlRUXRJ8Y7ZdMhnXVZ8g0gfUyGJpfB5PmkQ6wHBj1cIpCEV7VyjYf5ezredo38pl
 hAzA==
X-Gm-Message-State: ANoB5pm+ENJpzjOc93LC+QYXDmQtBO1QG+tzEy1sddxxIsijzhN9ljnG
 bvrOVcFER7/TWdMNaBssCbk=
X-Google-Smtp-Source: AA0mqf57TYwY1df78bdXkf+iFoftX/j9RD77bojJgYAfmUDm2Z31SJuDyCsRIw7twywlt5jUM0/xxQ==
X-Received: by 2002:a05:6512:401d:b0:4b6:edac:7168 with SMTP id
 br29-20020a056512401d00b004b6edac7168mr2780953lfb.39.1670953907974; 
 Tue, 13 Dec 2022 09:51:47 -0800 (PST)
Received: from gmail.com (81-232-4-135-no39.tbcn.telia.com. [81.232.4.135])
 by smtp.gmail.com with ESMTPSA id
 m8-20020ac24ac8000000b004b257fef958sm457139lfp.94.2022.12.13.09.51.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Dec 2022 09:51:47 -0800 (PST)
Date: Tue, 13 Dec 2022 18:51:46 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 David Gibson <david@gibson.dropbear.id.au>,
 Jason Wang <jasowang@redhat.com>, Greg Kurz <groug@kaod.org>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org
Subject: Re: [RFC PATCH-for-8.0 1/3] hw/ppc: Replace tswap32() by const_le32()
Message-ID: <Y5i7ss/8IyqEV0/1@toto>
References: <20221213125218.39868-1-philmd@linaro.org>
 <20221213125218.39868-2-philmd@linaro.org>
 <8d47b826-2011-3203-c682-aa32a76b8dc2@linaro.org>
 <d73fe725-565e-7fcb-e7d3-846189459545@linaro.org>
 <a1f4b5a6-0a8a-5a04-8ab6-f3f08b9d36aa@linaro.org>
 <CAFEAcA_F3Z+UPW-wHs8xedYX3TiV8CRQAom0DhefKLFH_Ejgog@mail.gmail.com>
 <b46e4c40-257f-8a89-85b8-8c2806f395be@linaro.org>
 <10186d7a-2df0-2fcf-8eef-8e34bcc2d8cc@kaod.org>
 <CAFEAcA8WF6GXaPt6+=KbaLSP5w+r1dps6fcc21+Um3VFAPDp5A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFEAcA8WF6GXaPt6+=KbaLSP5w+r1dps6fcc21+Um3VFAPDp5A@mail.gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::12f;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lf1-x12f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Tue, Dec 13, 2022 at 05:23:06PM +0000, Peter Maydell wrote:
> On Tue, 13 Dec 2022 at 16:53, Cédric Le Goater <clg@kaod.org> wrote:
> >
> > On 12/13/22 17:27, Richard Henderson wrote:
> > > On 12/13/22 10:21, Peter Maydell wrote:
> > >> It does seem odd, though. We have a value in host endianness
> > >> (the EPAPR_MAGIC constant, which is host-endian by virtue of
> > >> being a C constant). But we're storing it to env->gpr[], which
> > >> is to say the CPUPPCState general purpose register array. Isn't
> > >> that array *also* kept in host endianness order?
> > >
> > > Yes indeed.
> > >
> > >> If so, then the right thing here is "don't swap at all",
> > >
> > > So it would seem...
> > >
> > >> i.e. just "env->gpr[6] = EPAPR_MAGIC;". But that would imply
> > >> that the current code is setting the wrong value for the GPR
> > >> on little-endian hosts, which seems a bit unlikely...
> > >
> > > ... unless this board has only been tested on matching hosts.
> >
> > But these are register default values. Endianness doesn't apply
> > there. Doesn't it ?
> 
> Any time you have a value that's more than 1 byte wide,
> endianness applies in some sense :-) We choose for our
> emulated CPUs typically to keep register values in struct
> fields and variables in the C code in host endianness. This
> is the "obvious" choice given that you want to be able to
> do things like do a simple host add to emulate a guest CPU
> add, but in theory you could store the values the other
> way around if you wanted (then "store register into RAM"
> would be trivial, and "add 1 to register" would require
> extra effort; currently it's the other way round.)
> 
> Anyway, I think that in the virtex_ml507 and sam460ex code
> the use of tswap32() should be removed. In hw/ppc/e500.c
> we get this right:
>     env->gpr[6] = EPAPR_MAGIC;
> 
> We have a Linux kernel boot test in the avocado tests for
> virtex_ml507 -- we really do set up this magic value wrongly
> afaict, but it seems like the kernel doesn't check it (the
> test passes regardless of whether we swap the value or not).
> 
> I think what has happened here is that this bit of code is
> setting up CPU registers for an EPAPR style boot, but the
> test kernel at least doesn't expect that. It boots via the
> code in arch/powerpc/kernel/head_44x.S. That file claims
> in a comment that it expects
>  *   r3 - Board info structure pointer (DRAM, frequency, MAC address, etc.)
>  *   r4 - Starting address of the init RAM disk
>  *   r5 - Ending address of the init RAM disk
>  *   r6 - Start of kernel command line string (e.g. "mem=128")
>  *   r7 - End of kernel command line string
> 
> but actually it only cares that r3 == device-tree-blob.
> 
> Documentation/powerpc/booting.rst says the expectation
> (for a non-OpenFirmware boot) is:
>                 r3 : physical pointer to the device-tree block
>                 (defined in chapter II) in RAM
> 
>                 r4 : physical pointer to the kernel itself. This is
>                 used by the assembly code to properly disable the MMU
>                 in case you are entering the kernel with MMU enabled
>                 and a non-1:1 mapping.
> 
>                 r5 : NULL (as to differentiate with method a)
> 
> which isn't the same as what the kernel code actually cares about
> or what the kernel's comment says it cares about...
> 
> So my guess about what's happening here is that the intention
> was that these boards should be able to boot both kernels built
> to be entered directly in the way booting.rst says, and also
> kernels and other guest programs built to assume boot by
> EPAPR firmware, but this bug means that we're only currently
> supporting the first of these two categories. The reason nobody's
> noticed before is presumably that in practice nobody's trying to
> boot the "built to boot from EPAPR firmware" type binary on
> these two boards.
> 
> TLDR: we should drop the "tswap32()" entirely from both files.
>

Sounds reasonable to me!

Best regards,
Edgar
 

