Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 616D7306DEF
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 07:54:14 +0100 (CET)
Received: from localhost ([::1]:52986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l51C1-0000LL-Fh
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 01:54:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1l519w-0007Ys-UW
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 01:52:04 -0500
Received: from mail.weilnetz.de ([37.120.169.71]:56602
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1l519u-00089R-GF
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 01:52:04 -0500
Received: from edv-macbook-pro.fritz.box (p5b1511bf.dip0.t-ipconnect.de
 [91.21.17.191])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTPSA id 384DEDA072E;
 Thu, 28 Jan 2021 07:52:00 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210125144530.2837481-1-philmd@redhat.com>
 <20210125144530.2837481-5-philmd@redhat.com>
 <20210125164746.GE3538803@redhat.com>
 <992cbe66-dfae-7950-0d92-516b2f0c9717@redhat.com>
 <9f22d4b0-34ca-6798-3661-36057609c152@weilnetz.de>
 <30cc0c14-fbec-bb21-2b6b-8e295029bc1f@linaro.org>
 <8f1f2dc6-5ad2-7d48-c2f9-9afa1e4d4065@weilnetz.de>
 <81c810b4-1bd3-631d-4b5b-7e54a27a5b4c@linaro.org>
 <cd9265f7-4887-63bb-e36e-ace708d062c1@weilnetz.de>
 <875z3jy3tt.fsf@linaro.org>
 <89209f1b-29ad-e5df-6d45-b2480db4775e@weilnetz.de>
 <bbe4adfe-5bed-c37f-78c6-b120cb192aae@linaro.org>
 <a8aaa601-dcb4-ed87-d7ba-f6362942b596@weilnetz.de>
 <87wnvyw3eh.fsf@linaro.org>
 <d265dadc-45e8-3813-4e2d-cde007c389ac@weilnetz.de>
 <87tur2vyif.fsf@linaro.org>
Subject: qemu user mode fails to run programs with large VM / built with
 address sanitizer (was: Re: [PATCH v4 4/4] meson: Warn when TCI is selected
 but TCG backend is available)
Message-ID: <7615aa95-79b1-45d3-f998-6ba3f2f33f35@weilnetz.de>
Date: Thu, 28 Jan 2021 07:51:59 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <87tur2vyif.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=37.120.169.71; envelope-from=sw@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 27.01.21 um 22:47 schrieb Alex Benn=C3=A9e:

> Stefan Weil<sw@weilnetz.de>  writes:
>> I recently tried running tesseract with qemu-x86_64 because I had
>> expected that it might trigger some unimplemented TCG opcodes.
> qemu-x86-64 is a poor choice as a relatively under maintained front-end=

> doesn't emulate a particularly new CPU or take advantage of the new TCG=

> features. ARM64 is pretty good because the default cpu for linux-user i=
s
> CPU max which a) enables all ISA features we have and b) exposes them
> fairly easily to guest detection routines which probe feature registers=
=2E
>
>> Instead
>> it showed a general problem for native TCG: qemu-x86_64 allocates too
>> much memory for tesseract and gets killed by the Linux kernel OOM
>> handler.
> Do you have a command line? That sounds like something that should be
> fixed.


The problem occurred with a locally built tesseract, but I now found=20
that it is more general.

Any program which was compiled with address sanitizer uses huge virtual=20
memory (TB) right at the start. QEMU user mode tries to allocate that=20
memory until it is killed by the Linux kernel OOM handler.

A simple hello program compiled with "gcc -fsanitize=3Daddress hello.c" i=
s=20
sufficient to show the problem. Just run it with "qemu-x86_64 a.out".

I did not test but expect the same problem for other architectures, too, =

unless their VM is more limited.

Regards,

Stefan



