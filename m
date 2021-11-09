Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4722644A804
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 08:59:19 +0100 (CET)
Received: from localhost ([::1]:35478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkM2I-0006KQ-F3
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 02:59:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>)
 id 1mkM1D-0005f8-Qv; Tue, 09 Nov 2021 02:58:11 -0500
Received: from mail.weilnetz.de ([37.120.169.71]:55876
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>)
 id 1mkM1B-0001XZ-Cg; Tue, 09 Nov 2021 02:58:11 -0500
Received: from macbook02.fritz.box (p57b42bf1.dip0.t-ipconnect.de
 [87.180.43.241])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTPSA id E734CDA0D1E;
 Tue,  9 Nov 2021 08:58:05 +0100 (CET)
To: Alistair Francis <alistair23@gmail.com>
References: <20211108200756.1302697-1-sw@weilnetz.de>
 <CAKmqyKPSHycrLo5=Eh5NeZVVE8aMkQXCVGxmQrKYEs50k6HLqQ@mail.gmail.com>
From: Stefan Weil <sw@weilnetz.de>
Subject: Re: [PATCH] device_tree: Fix compiler error
Message-ID: <0f54b659-b8d2-6124-8e96-b7fe75f89fa5@weilnetz.de>
Date: Tue, 9 Nov 2021 08:58:04 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAKmqyKPSHycrLo5=Eh5NeZVVE8aMkQXCVGxmQrKYEs50k6HLqQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=37.120.169.71; envelope-from=sw@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.364,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 08.11.21 um 23:43 schrieb Alistair Francis:

> On Tue, Nov 9, 2021 at 6:08 AM Stefan Weil <sw@weilnetz.de> wrote:
>> A build with gcc (Debian 10.2.1-6) 10.2.1 20210110 fails:
>>
>> ../../../softmmu/device_tree.c: In function =E2=80=98qemu_fdt_add_path=
=E2=80=99:
>> ../../../softmmu/device_tree.c:560:18: error: =E2=80=98retval=E2=80=99=
 may be used uninitialized in this function [-Werror=3Dmaybe-uninitialize=
d]
>>    560 |     int namelen, retval;
>>        |                  ^~~~~~
>>
>> This is not a real error, but the compiler can be satisfied with a sma=
ll change.
> Why don't we just initalise retval?
>
> Alistair


retval is already set in the do ... while loop and was also set in the=20
former while loop.

If we set it in the declaration (int retval =3D 0), a clever compiler=20
might complain that we assign a value which is never used.

And changing from the while loop to the do ... while loop also avoids=20
one compare statement, so depending on the compiler optimizations could=20
make the code a little bit faster.

Stefan




