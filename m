Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 372C64EB69D
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 01:19:13 +0200 (CEST)
Received: from localhost ([::1]:55930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZL7H-0000ZR-Ri
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 19:19:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1nZL4O-0007zL-9j
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 19:16:12 -0400
Received: from [2607:f8b0:4864:20::b30] (port=41558
 helo=mail-yb1-xb30.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1nZL4K-000721-Fb
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 19:16:11 -0400
Received: by mail-yb1-xb30.google.com with SMTP id y38so31518202ybi.8
 for <qemu-devel@nongnu.org>; Tue, 29 Mar 2022 16:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Cauc0hw5zsAld+IpJNTxYMMgn/F601L45/U4PbrutOc=;
 b=XlKB3x0RLWFxXVN9+U8OO3PwsTbDc6A4XfhuiQHs+T7082+gwZAm1WeMg+d8sztcp7
 NBMdpmisI5m9Z7BKy1lYKMkg+4kC7J6yPivcMHgNSdAhQ5VrZI/d0Z9nMZeGDFfK9V0Z
 yhftS4zyPim2xp9ftxpYQu8a0GrdfjKtrQzpY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Cauc0hw5zsAld+IpJNTxYMMgn/F601L45/U4PbrutOc=;
 b=b9POMLEC8uZyQH1kNo74ccexdYmDSnEPSK8vGhrJzgqsZsTC7jBhl2WiB3RQ3fpQB1
 PUMoBn5C4ZfjgdKoHPT+PHUsPvJFdqzgeg/onIgimq7UKtmNbCsw0MBY/hWSI/NT9rvr
 q1W75xy6OiT39ZdWuIeOuX3JLHRTFOKb92tWzVogxAuvj8rYyycD0EIM0UhRS77qBzGq
 z/uvWtQlMokcFfRyP5MVaSjmt1K2jL7wXnusTo1MCXhrDMOxuuteBrpLq4HDJdKTuOsu
 9i88g2LRIpklzCk6omV475rmrITRB1FoaLZE5k0B2B9C+KDYv9DBoloLd93xji8sk2of
 g66w==
X-Gm-Message-State: AOAM531/gFsrYIvH0bU2HYxy7f7E8q0sGCCPiXIDbii4644RmBm1mBUr
 /89P0FSexj99O/EkKecKDmKOd5/ZxugaxpGIs0cs
X-Google-Smtp-Source: ABdhPJz7vEQyRwxNPub+6quOdtx3rEAiy5LvN0J2trchuAol/Lf2/wTpt5M3uLDbnih1u6y6WKTNsfEiW6UZbHssrYM=
X-Received: by 2002:a5b:803:0:b0:633:749f:9acd with SMTP id
 x3-20020a5b0803000000b00633749f9acdmr30547784ybp.236.1648595766458; Tue, 29
 Mar 2022 16:16:06 -0700 (PDT)
MIME-Version: 1.0
References: <7f383fc2.81a2.17f93c0dad7.Coremail.phantom@zju.edu.cn>
In-Reply-To: <7f383fc2.81a2.17f93c0dad7.Coremail.phantom@zju.edu.cn>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 29 Mar 2022 16:15:55 -0700
Message-ID: <CAOnJCUJck5o_-cayf-=mccenoZH048+2zhGDGOoWKiVMUFWWmQ@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Exit current TB after an sfence.vma
To: phantom@zju.edu.cn
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b30
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=atishp@atishpatra.org; helo=mail-yb1-xb30.google.com
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
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, idan.horowitz@gmail.com,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 16, 2022 at 10:23 AM <phantom@zju.edu.cn> wrote:
>
> Here is a test case for this patch. I used to submit this bug on https://bugs.launchpad.net/qemu/+bug/1906516
>
> sfence.vma will flush the tlb, so after this instruction, the translation block should be end.
> The following code will only work in single step mode:
> ```
> relocate:
>  li a0, OFFSET
>
>  la t0, 1f
>  add t0, t0, a0
>  csrw stvec, t0
>
>  la t0, early_pgtbl
>  srl t0, t0, PAGE_SHIFT
>  li t1, SATP_SV39
>  or t0, t1, t0
>
>  csrw satp, t0
> 1:
>  sfence.vma
>  la t0, trap_s
>  csrw stvec, t0
>  ret
> ```
>
> In this code, I want to relocate pc to virtual address with the OFFSET prefix.
> Before writing to satp, pc run at physic address, stvec has been set to label 1
> with a virtual prefix and virtual address has been mapping in early_pgtbl,
> after writing satp, qemu will throw a page fault, and pc will set to virtual
> address of label 1.
>
> The problem is that, in this situation, the translation block will not end after
> sfence.vma, and stvec will be set to trap_s,
>
> ```
> ----------------
> IN:
> Priv: 1; Virt: 0
> 0x00000000800000dc: 00a080b3 add ra,ra,a0
> 0x00000000800000e0: 00007297 auipc t0,28672 # 0x800070e0
> 0x00000000800000e4: f2028293 addi t0,t0,-224
> 0x00000000800000e8: 00c2d293 srli t0,t0,12
> 0x00000000800000ec: fff0031b addiw t1,zero,-1
> 0x00000000800000f0: 03f31313 slli t1,t1,63
> 0x00000000800000f4: 005362b3 or t0,t1,t0
> 0x00000000800000f8: 18029073 csrrw zero,satp,t0
>
> ----------------
> IN:
> Priv: 1; Virt: 0
> 0x00000000800000fc: 12000073 sfence.vma zero,zero
> 0x0000000080000100: 00000297 auipc t0,0 # 0x80000100
> 0x0000000080000104: 1c828293 addi t0,t0,456
> 0x0000000080000108: 10529073 csrrw zero,stvec,t0
>
> riscv_raise_exception: 12
> riscv_raise_exception: 12
> riscv_raise_exception: 12
> riscv_raise_exception: 12
> ...
> ```
>
> So, the program will crash. And the program will only work in single step mode:
> ```
> ----------------
> IN:
> Priv: 1; Virt: 0
> 0x00000000800000f8: 18029073 csrrw zero,satp,t0
>
> ----------------
> IN:
> Priv: 1; Virt: 0
> 0x00000000800000fc: 12000073 sfence.vma zero,zero
>
> riscv_raise_exception: 12
> ----------------
> IN:
> Priv: 1; Virt: 0
> 0xffffffff800000fc: 12000073 sfence.vma zero,zero
>
> ----------------
> IN:
> Priv: 1; Virt: 0
> 0xffffffff80000100: 00000297 auipc t0,0 # 0xffffffff80000100
>
> ```
> The pc will set to label 1, instead of trap_s.

+qemu-dev and Alistair

This is in for-next on Alistair's tree and fails to boot the kernel
with the following error (found -d in_asm mode).
Reverting the patch solves the issue.

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

-- 
Regards,
Atish

