Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D4C4841EC
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 13:53:22 +0100 (CET)
Received: from localhost ([::1]:55710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4jJY-0004dR-Au
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 07:53:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n4jF3-000353-MT
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 07:48:46 -0500
Received: from mail-yb1-f176.google.com ([209.85.219.176]:33491)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n4jEz-0000X7-36
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 07:48:40 -0500
Received: by mail-yb1-f176.google.com with SMTP id g80so63887451ybf.0
 for <qemu-devel@nongnu.org>; Tue, 04 Jan 2022 04:48:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=wdD1+3CU6JzAXzB1L7bmpHp+VpI3pZ2Jh7z6E5ipRO4=;
 b=xTAyvWrw6q4BMsCKmTuo2RqiR0W1HEapzjT5l8sd7hFFm8AGYBxMru5W5RuznriYck
 OOf/eKaEjdvBDDo3Qr1Ctoi8gx/3sdi9q9H5ymFJGvN8CP2v299hJ5eGcTdguLEKFxzt
 gTa1t1ITC8HSNE8UMhTc0z28UuASIUmZ7f9boEi/4vVNfjmt6dEeIn4Z9q60U5YLLiDg
 HItuF7FNdcwjOVLVz8cpeO8Kx8+PZfhpqMCh/TXSOSeB8t1uY8yS/TBvjIHKB+e04gPU
 CNwNG/nlhwPChc0TF3BEL6oA+o/zKGAczKuW67v9WsDEwQ8BSs7bYhjTWiOEuFzHzSo5
 OKmg==
X-Gm-Message-State: AOAM531caqZARaLeV4zkyax3sVuXDTh7I8dA7JelOcTdrz46k5YfbqF2
 lc5EVO5i80ybaemnWrv+NWP0T08EfYpmpjt5/i8=
X-Google-Smtp-Source: ABdhPJziJl8nXhHsqPpm7Q7x0SDsDkl+umwKIQBnjqgj1kZZdgpSOxFhvhtQjiYzqbUW2Yw57I9cq26eYOvswNwb56k=
X-Received: by 2002:a05:6902:1022:: with SMTP id
 x2mr41493549ybt.229.1641300512061; 
 Tue, 04 Jan 2022 04:48:32 -0800 (PST)
MIME-Version: 1.0
References: <20211221054105.178795-1-git@xen0n.name>
 <20211221054105.178795-30-git@xen0n.name>
 <1d837c79-e939-f540-0a31-759975b43560@loongson.cn>
 <67ac3255-30d3-783e-cf9b-db2e8e84b162@xen0n.name>
In-Reply-To: <67ac3255-30d3-783e-cf9b-db2e8e84b162@xen0n.name>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Tue, 4 Jan 2022 13:48:21 +0100
Message-ID: <CAAdtpL7-Xg1mLi6rUad0be-79cie=nCopsiPc6ZUtKkJEZpDDw@mail.gmail.com>
Subject: Re: [PATCH v11 29/31] linux-user: Implement CPU-specific signal
 handler for loongarch64 hosts
To: WANG Xuerui <i.qemu@xen0n.name>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.219.176;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-yb1-f176.google.com
X-Spam_score_int: 5
X-Spam_score: 0.5
X-Spam_bar: /
X-Spam_report: (0.5 / 5.0 requ) FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 XiaoJuan Yang <yangxiaojuan@loongson.cn>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, gaosong <gaosong@loongson.cn>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 30, 2021 at 4:50 AM WANG Xuerui <i.qemu@xen0n.name> wrote:
>
> Hi,
>
> On 12/30/21 11:11, gaosong wrote:
>
> HI,
>
> On 2021/12/21 =E4=B8=8B=E5=8D=881:41, WANG Xuerui wrote:
>
> +    case 0b001110: /* indexed, atomic, bounds-checking memory operations=
 */
> +        uint32_t sel =3D (insn >> 15) & 0b11111111111;
> +
> +        switch (sel) {
> +        case 0b00000100000: /* stx.b */
> +        case 0b00000101000: /* stx.h */
> +        case 0b00000110000: /* stx.w */
> +        case 0b00000111000: /* stx.d */
> +        case 0b00001110000: /* fstx.s */
> +        case 0b00001111000: /* fstx.d */
> +        case 0b00011101100: /* fstgt.s */
> +        case 0b00011101101: /* fstgt.d */
> +        case 0b00011101110: /* fstle.s */
> +        case 0b00011101111: /* fstle.d */
> +        case 0b00011111000: /* stgt.b */
> +        case 0b00011111001: /* stgt.h */
> +        case 0b00011111010: /* stgt.w */
> +        case 0b00011111011: /* stgt.d */
> +        case 0b00011111100: /* stle.b */
> +        case 0b00011111101: /* stle.h */
> +        case 0b00011111110: /* stle.w */
> +        case 0b00011111111: /* stle.d */
> +        case 0b00011000000 ... 0b00011100011: /* am* insns */
> +            return true;
> +        }
> +        break;
> +    }
>
> We build qemu-x86_64 on LoongArch machine, but got an error,
>
> ../linux-user/host/loongarch64/host-signal.h:57:9: error: a label can onl=
y be part of a statement and a declaration is not a statement
>          uint32_t sel =3D (insn >> 15) & 0b11111111111;
>          ^~~~~~~~
>
> I think  we should define  'sel'  before:
>
>     /* Detect store by reading the instruction at the program counter.  *=
/
>     switch ((insn >> 26) & 0b111111) {
>
> or
> case 0b001110:
>
>      {
>
>           uint32_t set =3D ...;
>
>           ...
>
>      }
>
> I can't reproduce the error on both my development machines (amd64 and lo=
ongarch64), so I wonder if the issue is related to your particular setup (i=
.e. compiler versions and such)?

I can reproduce, setup:

Project version: 6.2.50
C compiler for the host machine: cc (gcc 8.3.0 "cc (Loongnix
8.3.0-6.lnd.vec.27) 8.3.0")
C linker for the host machine: cc ld.bfd 2.31.1-system
Host machine cpu family: loongarch64
Host machine cpu: loongarch64
C++ compiler for the host machine: c++ (gcc 8.3.0 "c++ (Loongnix
8.3.0-6.lnd.vec.27) 8.3.0")
C++ linker for the host machine: c++ ld.bfd 2.31.1-system

