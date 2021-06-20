Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 745333ADF23
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Jun 2021 16:57:45 +0200 (CEST)
Received: from localhost ([::1]:44742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luytM-00044H-2C
	for lists+qemu-devel@lfdr.de; Sun, 20 Jun 2021 10:57:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1luyse-0003P1-90
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 10:57:00 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:37507)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1luysc-0004nT-6V
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 10:57:00 -0400
Received: from [192.168.100.1] ([82.142.1.74]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1Mdvyi-1lKGTx0Qo2-00b5Wc; Sun, 20 Jun 2021 16:56:55 +0200
To: Kenta Iwasaki <kenta@lithdew.net>
References: <20210516091536.1042693-1-kenta@lithdew.net>
 <aee50099-14a8-1c6b-6142-a4363f75812d@vivier.eu>
 <CAO4V76-aCeNq8OpTptSxywj+pV22EHNF-osWtR3onWMvGSSX+Q@mail.gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH] linux-user/syscall: zero-init msghdr in
 do_sendrecvmsg_locked
Message-ID: <03b2fce0-ad6a-bdb9-0171-f4562b640b70@vivier.eu>
Date: Sun, 20 Jun 2021 16:56:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAO4V76-aCeNq8OpTptSxywj+pV22EHNF-osWtR3onWMvGSSX+Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:wcbPIrbPf71fDcPIo7eljGf1N6dm+v4baChDpLqLvguTRbHVZyP
 n1A6PguUEIu74pfCT5fhO6ukqPr+aGUF+c+WdoD89COOrXrMrHkQFuvXzfdpuV5omSUrPS6
 TrXlTbFg3yoSET99CUxuXvZyT4WlSkUikhQc5aE0LU+HzXI3j9YVlY3Cd+JFcnRFnWhFOU4
 ETTJgfgLONnWvyKSc30Vw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:o11U/l12rdc=:3l1b0+8fzLEg7rXZT/Cn3u
 QCTbg3QEZR+0xTkYkMYFVvr0FTyNq4Hu+0SxUyTfvegLz4G+KqA3Z2iRyugVLjjzk7D9Nlo6s
 Rl/2XZeEFRJxiz85IrfqblusDhmeT8HVhrqzMz86cyud0JQo8j2lWddSDyUQhiQlSxaGonmUl
 0eLkj3Bsq73yijFRT9L6qsnK6BiHbRqJhm7RfoiPfZl3yUIo06k6x6wRF/x5MUI93UgcrArbt
 lGDTASyKjXI2joZSvIzicJGYaLtizMjY1z8KpPfk/7WxqjfyPsjlqFrPJe+eq19kvX22oQwSG
 2NIxwyGi4UtfsQmfNzi7aWX9xtJCIQtzrF9dlSeciv8hEm5k3Em8k5TYzNaT7FsbsvTZmtcSV
 Q3DiGx33YV9v9VNE1BwFtAU1qr29APEo6C9vYFWs3Qm3j/lhKWrAtZMc8S1rMtov7CsagP98N
 Tdzy18NIeS05IF1Fv3D7XFvjisq31bjV/rHz/vG0VAIadOD1h3AJC2LSSt7fkRKChpVI5ulNp
 nrGj4jNAMf+UCrNKsr7OfI=
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 16/05/2021 à 14:57, Kenta Iwasaki a écrit :
> Sure,
> 
> The bytes of `msghdr` need to be cleared because the `msghdr` struct layout specified in QEMU
> appears to generalize between the definitions of `msghdr` across different libc's and kernels. To
> appropriately generalize `msghdr` across libc's and kernels would either:
> 
> 1. require specializing code in do_sendrecvmsg_locked() for each individual libc and kernel version, or
> 2. zeroing out all bytes of `msghdr`, b/c certain libc or kernel versions may misinterpret the
> undefined padding bytes that come from misalignment in the struct as actual syscall params.
> 
> The patch I provided would be going for route #2, given that it's a simpler fix for the underlying
> problem for the short term.
> 
> What I believe is the background behind why the struct layout has been a problem is because, since
> the beginning, the Linux kernel has always specified the layout of `msghdr` differently from POSIX.
> Given that this implies incompatibility between kernels on how `msghdr` is specified, different libc
> projects such as musl and glibc provide different workarounds by laying out `msghdr` differently
> amongst one another.
> 
> A few projects running tests/applications through QEMU have been bitten by this, and a solution that
> one of the projects discovered was that patching QEMU to zero-initialize the bytes msghdr the same
> way my patch does allow for compatibility between different `msghdr` layouts across glibc, musl, and
> the Linux kernel: https://github.com/void-linux/void-packages/issues/23557#issuecomment-718392360
> <https://github.com/void-linux/void-packages/issues/23557#issuecomment-718392360>
> 
> For some additional useful context, here's a link pointing changes musl libc made to laying out
> `msghdr` b/c of Linux incorrectly laying out `msghdr` against the POSIX standard:
> http://git.musl-libc.org/cgit/musl/commit/?id=7168790763cdeb794df52be6e3b39fbb021c5a64
> <http://git.musl-libc.org/cgit/musl/commit/?id=7168790763cdeb794df52be6e3b39fbb021c5a64>
> 
> Also, here is a link to the `msghdr` struct layout in musl libc's bleeding edge branch as of
> now: https://git.musl-libc.org/cgit/musl/tree/include/sys/socket.h#n22
> <https://git.musl-libc.org/cgit/musl/tree/include/sys/socket.h#n22>
> 
> As for my rationale for sending in this patch, it is because I'm currently implementing
> cross-platform networking in the standard library for the Zig programming language, and have run
> into this exact same problem with EMSGSIZE being returned by sendmsg() when tests are run through
> QEMU on x86_64-linux-musl.
> 
> My discussions with the Zig community about it alongside debug logs regarding the exact parameters
> being fed to the sendmsg() syscall can be found
> here: https://github.com/ziglang/zig/pull/8750#issuecomment-841641576
> <https://github.com/ziglang/zig/pull/8750#issuecomment-841641576>
> 
> Hope this gives enough context about the problem and patch, but please do let me know if there is
> any more information that I could provide which would help.

Thank you for the explanation and sorry for the delay.

As we use directly the kernel syscall rather than the libc wrapper we should not use here the msghdr
definition from the libc but the one from the kernel.

The one we receive is also the one from the kernel as we trap the kernel syscall not the libc call.

So the code should be libc-agnostic...

The reference implementation in our case is 'struct user_msghdr' from the kernel, and we need to
duplicate it in QEMU to be able to use it.

Thanks,
LAurent


