Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4CD040FE38
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 18:57:21 +0200 (CEST)
Received: from localhost ([::1]:36980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRHAu-0000RO-GM
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 12:57:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mRH5y-000482-1O
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 12:52:14 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:37833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mRH5q-00036k-Qb
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 12:52:13 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 c8-20020a7bc008000000b002e6e462e95fso10490638wmb.2
 for <qemu-devel@nongnu.org>; Fri, 17 Sep 2021 09:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=K0WAuYXzze6b1/7quqv9Gq+wEuztzV4W4oFtDHhZ1T8=;
 b=FWKp5jDnKITWHjIN5WmtjgeIQ7TEaD5SdtwmSc9Dbjdx6I+ElNPO1Wymm4hFU2bXKK
 FaSBzGSPLtA68IDpcW7NST5iI9T0TiLVNJ26pmxyZ67JpAY7ro+TY3qDOLqEXnMY7n6F
 Mbn7EdRb7cJ/0+V61xCoCmn1KSKQV3pIGxBEBWKWMQh1y3HLsAhUqL7qsxcL+soEes+o
 7MQd0a+TAv4Sfbfo4xuSwEtaClulhxvjeVK9rnPCFZ6DbJHwubLz/46jxJ5iMNFpXFop
 ymQh/u4qNX6JI//a1V5bjmIN//2VWx3X82qDYezZgDJ6B0a78gLIgrLEdv3xPU4VF+Ks
 kx4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=K0WAuYXzze6b1/7quqv9Gq+wEuztzV4W4oFtDHhZ1T8=;
 b=UFeuayktZVuasmmayllhAl9ls444FDtC2LFuywUVlLynBBWolIqbtIwhmwfpsd9PoX
 DDOOA4jLMx5SLkfTbHG62v5MFHNyZ7iFE19RKMHQUgWh78jSK7gQ038rLl6Bu6QxsptH
 3cZMwN3xUiV8ununroxXVBtB4xsRqoM7s8TmjrYvsJWBLnOaEh7L4t2v0kiEYromHPPw
 n5vvS/rsTyWyUmXun+zHPIOe1Bty9/m0Te36IVsWPZtP/ZwqiX+5xHR9XrheO52ex0Al
 RqeX8zk6w0S7UhjUGqyEjGaaX0e4ZHS6XDj38+9bK9SUP4rwivZbKKEc4pTGo+L1NMbF
 u5eA==
X-Gm-Message-State: AOAM530dMsBN5stdR30Sr+yAh18Hrwi1LZFLsya2arZhglguvyGULt+i
 M7yt4fg/lhnUr5yaEdKgvzRQtg==
X-Google-Smtp-Source: ABdhPJwc9KwSU+WnVrlmDHztKFE7Z1EMLsqTP2CgWsR/N6Ez+eZqr8utILfS34+fv5NH6+QVCpDgsg==
X-Received: by 2002:a1c:2056:: with SMTP id g83mr15969976wmg.27.1631897524798; 
 Fri, 17 Sep 2021 09:52:04 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q10sm6756432wmq.12.2021.09.17.09.52.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Sep 2021 09:52:03 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 20C651FF96;
 Fri, 17 Sep 2021 17:52:03 +0100 (BST)
References: <20210913102917.0bf933d8@ktm>
User-agent: mu4e 1.7.0; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Lukasz Majewski <l.majewski@majess.pl>
Subject: Re: Problem with init debugging under QEMU ARM
Date: Fri, 17 Sep 2021 17:49:46 +0100
In-reply-to: <20210913102917.0bf933d8@ktm>
Message-ID: <87tuijrvpo.fsf@linaro.org>
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-discuss@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Lukasz Majewski <l.majewski@majess.pl> writes:

> [[PGP Signed Part:Undecided]]
> Dear QEMU community,
>
> I'm now trying to fix bug in glibc which became apparent on qemu 6.0.0.
>
> The error is caused by glibc commit:
> bca0f5cbc9257c13322b99e55235c4f21ba0bd82
> https://sourceware.org/git/?p=3Dglibc.git;a=3Dblobdiff;f=3Dsysdeps/arm/dl=
-machine.h;h=3Deb13cb8b57496a0ec175c54a495f7e78db978fb7;hp=3Dff5e09e207f798=
6b1506b8895ae6c2aff032a380;hb=3Dbca0f5cbc9257c13322b99e55235c4f21ba0bd82;hp=
b=3D34b4624b04fc8f038b2c329ca7560197320615b4
>
> (reverting it causes the board to boot again)
>
> Other components:
> binutils_2.37
> gcc_11.2
> Yocto poky: SHA1: 1e2e9a84d6dd81d7f6dd69c0d119d0149d10ade1
>
> Qemu start line (the problem is visible on 5.2.0 and 6.0.0):
> qemu-system-arm -device
> virtio-net-device,netdev=3Dnet0,mac=3D52:54:00:12:34:02 -netdev
> tap,id=3Dnet0,ifnam e=3Dtap0,script=3Dno,downscript=3Dno -object
> rng-random,filename=3D/dev/urandom,id=3Drng0 -device
> virtio-rng-pci,rng=3Drng0 -drive
> id=3Ddisk0,file=3Dy2038-image-devel-qemuarm.ext4,if=3Dnone,format
> =3Draw -device virtio-blk-device,drive=3Ddisk0 -device qemu-xhci -device
> usb-tablet -device usb-kbd  -machine virt,highmem=3Doff -cpu cortex-a15
> -smp 4 -m 256 -serial mon:stdio -serial null -nographic -device
> VGA,edid=3Don -kernel
> zImage--5.10.62+git0+bce2813b16_machine-r0-qemuarm-20210910095636.bin
> -append 'root=3D/dev/vda rw  mem=3D256M
> ip=3D192.168.7.2::192.168.7.1:255.255.255.0 console=3DttyAMA0 console=3Dh=
vc0
> vmalloc=3D256
>
>
> It has been tested with Cortex-A9 (Vexpress A9 2 core board) and
> Cortex-A15. I've also tested the v5.1, v5.10 and v5.14 kernels. The
> error is persistent.
>
> I do add -s and -S when starting qemu-system-arm. I can use gdb to
> debug the kernel without issues. Unfortunately, I'm not able to debug
> /sbin/init after switching contex to user space.

Is GDB being confused by the switch to userspace? Have you stepped over
an eret into userspace?

> Moreover, gdbserver cannot be used as the error (and kernel OOPs) is
> caused when early code from ld-linux.so.3 (the _dl_start function) is
> executed.
>
>
> Any hints on how to debug it?

Are any of the linux gdb python scripts able to give you the paddr of a
given binary/task so you can stick a breakpoint there?

>
> Inspecting assembler is one (awkward) option (some results presented
> below). I can also inspect the VMA of the code just before starting the
> /sbin/init process.
>
> Unfortunately, when I try to break on user space code it is not very
> helpful (as -S -s are supposed to be used with kernel).
>
>
> Some info with the eligible code (_dl_start function):
> ------------------------------------------------------
>
> I think that the problem may be with having the negative value
> calculated.
>
> The relevant snipet:
>
>     116c:       bf00            nop
>     116e:       bf00            nop
>     1170:       bf00            nop
>     1172:       f8df 3508       ldr.w   r3, [pc, #1288] ; 167c
>     <_dl_start+0x520>
>
>     1176:       f8df 1508       ldr.w   r1, [pc, #1288] ; 1680
>     <_dl_start+0x524>
>
>     117a:       447b            add     r3, pc
>     117c:       4479            add     r1, pc
>     117e:       f8c3 1598       str.w   r1, [r3, #1432] ; 0x598
>     1182:       bf00            nop
>     1184:       bf00            nop
>     1186:       bf00            nop
>     1188:       bf00            nop
>     118a:       bf00            nop
>     118c:       bf00            nop
>     118e:       f8df 24f4       ldr.w   r2, [pc, #1268] ; 1684
>     <_dl_start+0x528> 1192:       f8d3 5598       ldr.w   r5, [r3,
>     #1432] ; 0x598 1196:       447a            add     r2, pc
>     1198:       442a            add     r2, r5
>     119a:       1a52            subs    r2, r2, r1
>     119c:       f8c3 25a0       str.w   r2, [r3, #1440] ; 0x5a0
>     11a0:       6813            ldr     r3, [r2, #0]
>
>
>     167c:       0002be92        .word   0x0002be92
>     1680:       ffffee80        .word   0xffffee80
>
> The r1 gets the 0xffffee80 (negative offset) value. It is then added to
> pc and used to calculate r2.
>
> For working code (aforementioned patch reverted) - there are NO such
> large values (like aforementioned 0xffffee80). The arithmetic is done
> on=20
>
>    1690:       00000020        .word   0x00000020
>    1694:       0002be7e        .word   0x0002be7e
>
> which seems to work.
>
> Maybe I'm missing some flag when I do start qemu-system-arm?
>
> Thanks in advance for help and hints.


--=20
Alex Benn=C3=A9e

