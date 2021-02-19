Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD7731F5AD
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 09:11:15 +0100 (CET)
Received: from localhost ([::1]:44234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD0sc-0007Nz-8q
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 03:11:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1lD0q6-0005tJ-ET
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 03:08:38 -0500
Received: from mail.weilnetz.de ([37.120.169.71]:42342
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1lD0q2-00071g-S6
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 03:08:37 -0500
Received: from edv-macbook-pro.fritz.box (p5b1511bf.dip0.t-ipconnect.de
 [91.21.17.191])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTPSA id 6E1F4DA0BCD;
 Fri, 19 Feb 2021 09:08:32 +0100 (CET)
To: P J P <ppandit@redhat.com>, Alexander Bulekov <alxndr@bu.edu>
References: <20210218140629.373646-1-ppandit@redhat.com>
 <CAFEAcA_8sUX5nbg5+DR8Z6F3t1Y3o=tgZY56dFTKLgA7XVWOcw@mail.gmail.com>
 <20210219015403.tl5upltt3d2bnmw5@mozz.bu.edu>
 <6qo84891-7or2-7p58-rr4-n2n46o5730rq@erqung.pbz>
From: Stefan Weil <sw@weilnetz.de>
Subject: Re: [PATCH] net: eepro100: validate various address values
Message-ID: <00338810-b72e-6a9c-eef0-3c0adc764695@weilnetz.de>
Date: Fri, 19 Feb 2021 09:08:31 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <6qo84891-7or2-7p58-rr4-n2n46o5730rq@erqung.pbz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=37.120.169.71; envelope-from=sw@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, Ruhr-University Bochum <bugs-syssec@rub.de>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 19.02.21 um 07:11 schrieb P J P:

>    Hello Alex, Stefan, all
>
> +-- On Thu, 18 Feb 2021, Alexander Bulekov wrote --+
> | Maybe the infinite loop mentioned in the commit message is actually a=
 DMA
> | recursion issue? I'm providing a reproducer for a DMA re-entracy issu=
e
> | below. With this patch applied, the reproducer triggers the assert(),=
 rather
> | than overflowing the stack, so maybe it is the same issue? -Alex
> |
> | cat << EOF | ./qemu-system-i386 -display none -machine accel=3Dqtest,=
 -m \
> | 512M -device i82559er,netdev=3Dnet0 -netdev user,id=3Dnet0 -nodefault=
s \
> | -qtest stdio
> | outl 0xcf8 0x80001014
> | outl 0xcfc 0xc000
> | outl 0xcf8 0x80001010
> | outl 0xcfc 0xe0020000
> | outl 0xcf8 0x80001004
> | outw 0xcfc 0x7
> | write 0x1ffffc0b 0x1 0x55
> | write 0x1ffffc0c 0x1 0xfc
> | write 0x1ffffc0d 0x1 0x46
> | write 0x1ffffc0e 0x1 0x07
> | write 0x746fc59 0x1 0x02
> | write 0x746fc5b 0x1 0x02
> | write 0x746fc5c 0x1 0xe0
> | write 0x4 0x1 0x07
> | write 0x5 0x1 0xfc
> | write 0x6 0x1 0xff
> | write 0x7 0x1 0x1f
> | outw 0xc002 0x20
> | EOF
> |
>
> * Yes, it is an infinite recursion induced stack overflow. I should've =
said
>    recursion instead of loop.
>
>    Thank you for sharing a reproducer and the stack trace.


Okay, I can confirm the infinite recursion now.

The test case triggers memory writes by the hardware which cause new=20
actions of the same hardware and so on.

I don't know how the real hardware would handle that case.

For QEMU we can extend the current code which tries to prevent endless=20
loops: the device status EEPRO100State can be extended by a recursion=20
counter to limit the number of recursions, or maybe a boolean flag could =

be used to stop any recursion of action_command(). I prefer the second=20
variant (no recursion at all) and suggest to add a diagnostic message as =

well like it is done for the endless loop case.

Stefan




