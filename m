Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B2D31436B
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 00:04:53 +0100 (CET)
Received: from localhost ([::1]:60638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9FaN-0002YT-VD
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 18:04:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1l9BqD-0005c8-9Y
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 14:04:57 -0500
Received: from mail.weilnetz.de ([37.120.169.71]:43364
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1l9BqA-0006Jy-F2
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 14:04:56 -0500
Received: from macbook02.fritz.box (p5b1511bf.dip0.t-ipconnect.de
 [91.21.17.191])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTPSA id 19A27DA1795;
 Mon,  8 Feb 2021 20:04:52 +0100 (CET)
To: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20210204014509.882821-1-richard.henderson@linaro.org>
 <20210204014509.882821-64-richard.henderson@linaro.org>
 <9d107cb2-ee8c-2a89-e004-9996a647a060@weilnetz.de>
 <9f552075-1783-dc8b-f338-23e12a138ffd@linaro.org>
 <CAFEAcA9TtuWaFo3cg_Qhxkg8gRqBNBkuHkSAJ-Lbxzbp23iR+w@mail.gmail.com>
 <69d3bc09-aeb8-6a40-157e-bf0dc19c0035@linaro.org>
 <CAFEAcA_=DZTRNvQsqT4dki1GTyAhL0RmhPoHG+OBw=W0yct0sg@mail.gmail.com>
 <2a61b461-c460-3b25-edd8-30e52b2eb578@redhat.com>
 <02ea197e-7ad0-0d85-78d7-c58f4aeceddc@weilnetz.de>
 <61a56eac-8afc-fa52-1681-21607b5294fd@linaro.org>
From: Stefan Weil <sw@weilnetz.de>
Subject: Re: [PATCH v2 63/93] tcg/tci: Use ffi for calls
Message-ID: <9f4e07d9-be5c-8bf4-f54a-424a844e8e7e@weilnetz.de>
Date: Mon, 8 Feb 2021 20:04:51 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <61a56eac-8afc-fa52-1681-21607b5294fd@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=37.120.169.71; envelope-from=sw@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.265,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Am 08.02.21 um 18:39 schrieb Richard Henderson:
> On 2/8/21 5:07 AM, Stefan Weil wrote:
>> Richard, this commit is also the one which breaks qemu-system-i386 on =
sparc64
>> for me:
> You'll have to give me more details than that, because qemu-system-i386=
 works
> for me on a niagara5 w/ debian sid.


I am testing on a similar Debian system (debian-ports unstable), but=20
with a Niagara3 cpu:

Linux gcc102.fsffrance.org 5.10.0-3-sparc64-smp #1 SMP Debian 5.10.12-1=20
(2021-01-30) sparc64 GNU/Linux

gcc (Debian 10.2.1-6) 10.2.1 20210110

$ cat /proc/cpuinfo
cpu=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 : UltraSparc T3 (Niagara3)
fpu=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 : UltraSparc T3 integrated FPU
pmu=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 : niagara3
prom=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 : OBP 4.34.6.c 2017/03/22 13:55=

type=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 : sun4v
ncpus probed=C2=A0=C2=A0=C2=A0 : 256
ncpus active=C2=A0=C2=A0=C2=A0 : 256
D$ parity tl1=C2=A0=C2=A0=C2=A0 : 0
I$ parity tl1=C2=A0=C2=A0=C2=A0 : 0
cpucaps=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 :=20
flush,stbar,swap,muldiv,v9,blkinit,n2,mul32,div32,v8plus,popc,vis,vis2,AS=
IBlkInit,fmaf,vis3,hpc
[...]

During "git bisect" I had to apply fixes for unaligned memory access as=20
your series starts with TCI code which does not include my patch for=20
that. The first bisect step was tested with your tci-next branch, the=20
last step was tested with my bisect-tci branch=20
(https://gitlab.com/stweil/qemu/-/commits/bisect-tci).

Stefan




