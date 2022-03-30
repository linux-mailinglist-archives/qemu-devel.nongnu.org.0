Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 807A24EBBE1
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 09:38:33 +0200 (CEST)
Received: from localhost ([::1]:48478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZSuS-0003TW-Kt
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 03:38:28 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1nZSqR-00024z-J6
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 03:34:20 -0400
Received: from [2607:f8b0:4864:20::936] (port=39458
 helo=mail-ua1-x936.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1nZSqP-0001vF-EN
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 03:34:19 -0400
Received: by mail-ua1-x936.google.com with SMTP id i26so8647730uap.6
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 00:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ufZ+uGPRNXgB9PMYotuMvHl9myXwL5Z7Qq8wOikmCuE=;
 b=PBzjr7hD57vL998A5fHcHcuXdCvGpQsdKJzsve3wniLuK+fvrQAXpRLQpC3ibiMHjz
 cB3DRRBKAf8WZ6U48oMxWl9N6P2yUjt7rkq17VSU+ix4bd3xnLLLzfmkn0wuhR2q97ab
 ekfAVYNYSIm89+W9KNle+Ty8S/ew7rxoLb6P0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ufZ+uGPRNXgB9PMYotuMvHl9myXwL5Z7Qq8wOikmCuE=;
 b=VjClaAqZNoQjEoSPq/JzQxHGEJl8a1hdaFxZxOlvo+U4MD4ZtccAahwjMrzHAyoU8a
 cG3xzt32RKINikZFKedKqOfwSVbB3JTMYz5wZfcQcz9K4X8J9hRfbmqG3d+RiETmEEX1
 tI5G2BSfhplRUlDLS/TSf4dBLsgeKKVCFnm2L9jDA8zA+PkDnwieXWBa2R5V710IDRkl
 qN+ywK9CEanaan3dhMdThzj/NJO5MTfvTnejIqJ1nTmvVmhgkhIWAdqddSmb784rpoWF
 XfeaXinjnHguXty5BWoh4yzdRfXcCivHUkzmDerPkwYw9p3c+3NjtYAsMBaGS8kpQHNU
 QLHA==
X-Gm-Message-State: AOAM531gh3Ax5r+10+C1R1t6xi+grXhZyrVTxxEqr/eRHkA4NJQINUIQ
 wPhIRIrOpVADRVIJaMNomZ6M0POI6Ymsh+6gubicKsKIGw5D
X-Google-Smtp-Source: ABdhPJy9ijbtsxCBYrqSbZs5EU4zdqmP4jqdMY9HHF4HDiSswNSHIoSjEOuqcYUYYEvuoeh41sRT94U94vL9v8Tbm94=
X-Received: by 2002:a81:5c2:0:b0:2e5:e4eb:c3e7 with SMTP id
 185-20020a8105c2000000b002e5e4ebc3e7mr34994066ywf.62.1648625319379; Wed, 30
 Mar 2022 00:28:39 -0700 (PDT)
MIME-Version: 1.0
References: <7f383fc2.81a2.17f93c0dad7.Coremail.phantom@zju.edu.cn>
 <CAOnJCUJck5o_-cayf-=mccenoZH048+2zhGDGOoWKiVMUFWWmQ@mail.gmail.com>
 <CA+4MfE+hFQhRYEgEXy-u10=MBhnmA5f7MdRFjW7Xc0dLPSiLXw@mail.gmail.com>
In-Reply-To: <CA+4MfE+hFQhRYEgEXy-u10=MBhnmA5f7MdRFjW7Xc0dLPSiLXw@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Wed, 30 Mar 2022 00:28:28 -0700
Message-ID: <CAOnJCU+ZMnLoi2GNDdKz24KJbHpEBQT1=Qo5LbSE1xz=WvwbrA@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Exit current TB after an sfence.vma
To: Idan Horowitz <idan.horowitz@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::936
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::936;
 envelope-from=atishp@atishpatra.org; helo=mail-ua1-x936.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Alistair Francis <Alistair.Francis@wdc.com>, phantom@zju.edu.cn,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 29, 2022 at 11:15 PM Idan Horowitz <idan.horowitz@gmail.com> wrote:
>
> On Wed, 30 Mar 2022 at 02:16, Atish Patra <atishp@atishpatra.org> wrote:
> >
> > This is in for-next on Alistair's tree and fails to boot the kernel
> > with the following error (found -d in_asm mode).
> > Reverting the patch solves the issue.
> >
> > ----------------
> > IN:
> > Priv: 1; Virt: 0
> > 0x0000000080201040:  18051073          csrrw           zero,satp,a0
> >
> > ----------------
> > IN:
> > Priv: 1; Virt: 0
> > 0x0000000080201044:  Address 0x80201044 is out of bounds.
> >
> > 0x0000000080201049:  Address 0x80201049 is out of bounds.
> >
> > 0x000000008020104e:  Address 0x8020104e is out of bounds.
> >
> > Disassembler disagrees with translator over instruction decoding
> > Please report this to qemu-devel@nongnu.org
> >
> > ----------------
> > IN:
> > Priv: 1; Virt: 0
> > 0x0000000080201050:  Address 0x80201050 is out of bounds.
> >
> > 0x0000000080201055:  Address 0x80201055 is out of bounds.
> >
> > 0x000000008020105a:  Address 0x8020105a is out of bounds.
> >
> > Disassembler disagrees with translator over instruction decoding
> > Please report this to qemu-devel@nongnu.org
> >
> > ----------------
> > IN:
> > Priv: 1; Virt: 0
> > 0x000000008020105c:  Address 0x8020105c is out of bounds.
> >
> > Disassembler disagrees with translator over instruction decoding
> > Please report this to qemu-devel@nongnu.org
> >
> > --
> > Regards,
> > Atish
>
> Do you have more specific information about which kernel image doesn't boot?

I tested on v5.17 built from defconfig for rv64.

> The errors you're seeing simply mean that these addresses are not
> translated by the new address translation context set by the write to
> the satp.
> To be honest I don't immediately see how this could be caused by the
> patch, as it modifies the behaviour of the sfence.vma instruction, and
> there are none in your trace.
>

There was a sfence.vma. I just did not share the detailed trace before.

Here is the kernel code executing sfence.vma
https://elixir.bootlin.com/linux/v5.17/source/arch/riscv/kernel/head.S#L122

Here is the detailed trace that should provide more information.
------------------------------------------------------------------------------------------------------------------------------
----------------
IN:
Priv: 1; Virt: 0
0x0000000080a04664:  70e2              ld              ra,56(sp)
0x0000000080a04666:  7442              ld              s0,48(sp)
0x0000000080a04668:  74a2              ld              s1,40(sp)
0x0000000080a0466a:  7902              ld              s2,32(sp)
0x0000000080a0466c:  69e2              ld              s3,24(sp)
0x0000000080a0466e:  6a42              ld              s4,16(sp)
0x0000000080a04670:  6aa2              ld              s5,8(sp)
0x0000000080a04672:  6121              addi            sp,sp,64
0x0000000080a04674:  8082              ret

----------------
IN:
Priv: 1; Virt: 0
0x0000000080201132:  00a05517          auipc           a0,10506240
# 0x80c06132
0x0000000080201136:  ece50513          addi            a0,a0,-306
0x000000008020113a:  ec7ff0ef          jal             ra,-314
# 0x80201000

----------------
IN:
Priv: 1; Virt: 0
0x0000000080201000:  00d95597          auipc           a1,14241792
# 0x80f96000
0x0000000080201004:  38858593          addi            a1,a1,904
0x0000000080201008:  658c              ld              a1,8(a1)
0x000000008020100a:  fffff617          auipc           a2,-4096
# 0x8020000a
0x000000008020100e:  ff660613          addi            a2,a2,-10
0x0000000080201012:  8d91              sub             a1,a1,a2
0x0000000080201014:  90ae              add             ra,ra,a1
0x0000000080201016:  00000617          auipc           a2,0
# 0x80201016
0x000000008020101a:  02e60613          addi            a2,a2,46
0x000000008020101e:  962e              add             a2,a2,a1
0x0000000080201020:  10561073          csrrw           zero,stvec,a2

----------------
IN:
Priv: 1; Virt: 0
0x0000000080201024:  00c55613          srli            a2,a0,12
0x0000000080201028:  83018593          addi            a1,gp,-2000
0x000000008020102c:  618c              ld              a1,0(a1)
0x000000008020102e:  8e4d              or              a2,a2,a1
0x0000000080201030:  010f7517          auipc           a0,17788928
# 0x812f8030
0x0000000080201034:  fd050513          addi            a0,a0,-48
0x0000000080201038:  8131              srli            a0,a0,12
0x000000008020103a:  8d4d              or              a0,a0,a1
0x000000008020103c:  12000073          sfence.vma      zero,zero

----------------
IN:
Priv: 1; Virt: 0
0x0000000080201040:  18051073          csrrw           zero,satp,a0

----------------
IN:
Priv: 1; Virt: 0
0x0000000080201044:  Address 0x80201044 is out of bounds.

0x0000000080201049:  Address 0x80201049 is out of bounds.

0x000000008020104e:  Address 0x8020104e is out of bounds.

Disassembler disagrees with translator over instruction decoding
Please report this to qemu-devel@nongnu.org

----------------
IN:
Priv: 1; Virt: 0
0x0000000080201050:  Address 0x80201050 is out of bounds.

0x0000000080201055:  Address 0x80201055 is out of bounds.

0x000000008020105a:  Address 0x8020105a is out of bounds.

Disassembler disagrees with translator over instruction decoding
Please report this to qemu-devel@nongnu.org

----------------
IN:
Priv: 1; Virt: 0
0x000000008020105c:  Address 0x8020105c is out of bounds.

Disassembler disagrees with translator over instruction decoding
Please report this to qemu-devel@nongnu.org
------------------------------------------------------------------------------------------------------------------------------



> Idan Horowitz



-- 
Regards,
Atish

