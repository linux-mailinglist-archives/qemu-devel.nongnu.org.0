Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B6530FDA3
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 21:04:58 +0100 (CET)
Received: from localhost ([::1]:55618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7ks5-0003Tn-OS
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 15:04:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1l7kpS-000281-FI
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 15:02:14 -0500
Received: from mail.weilnetz.de ([37.120.169.71]:36248
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1l7kpQ-0007Gw-0t
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 15:02:14 -0500
Received: from macbook02.fritz.box (p5b1511bf.dip0.t-ipconnect.de
 [91.21.17.191])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTPSA id C6B82DA0730;
 Thu,  4 Feb 2021 21:02:08 +0100 (CET)
To: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20210204014509.882821-1-richard.henderson@linaro.org>
 <CAFEAcA8yiVXSLwP4kzsE4MSfhVKTn9H3VtnXgXRmnHZmxUrfhw@mail.gmail.com>
From: Stefan Weil <sw@weilnetz.de>
Subject: Re: [PATCH v2 00/93] TCI fixes and cleanups
Message-ID: <6923a507-4d10-49c5-c9b6-b275bcb520dd@weilnetz.de>
Date: Thu, 4 Feb 2021 21:02:08 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8yiVXSLwP4kzsE4MSfhVKTn9H3VtnXgXRmnHZmxUrfhw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=37.120.169.71; envelope-from=sw@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.182,
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

Am 04.02.21 um 10:58 schrieb Peter Maydell:
> On Thu, 4 Feb 2021 at 01:49, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>> Almost 7 years ago I detailed 5 major problems in tci[1], of
>> which three still remain:
>>
>>    * Unaligned accesses to the bytecode stream, which means
>>      that we immediately SIGBUS on any host requiring alignment.
>>    * Non-portable calls to helper functions.
>>    * Full of useless ifdefs and TODOs.
>>
>> To my mind, this means the code is unmaintained, despite what it
>> says in MAINTAINERS.  Thus tci *should* be simply removed.
>> However, every time removal is suggested, someone comes out of the
>> woodwork and says we should keep it, because it's useful for $FOO.
> Not listed, but also a problem:
>   * it's a configure-time choice, not a runtime choice


That's the feature which I also desire most. Technically it was not=20
possible to have native and interpreted TCG in the same code some years=20
ago when I tried to implement this, but that might have changed as TCG=20
has evolved a lot. Having TCI as a runtime choice would not only require =

less CI builds but also allow new use cases for TCG testing.

I also agree with most of Richard's list of problems and appreciate the=20
efforts to fix them.

I disagree on the #ifdefs which can help to understand TCG better in my=20
opinion, so for me they have a useful side effect of being also=20
documentation.

Most of the problems which you named above were already mentioned in the =

README for TCI from 2011.

Nevertheless I had the impression that TCI was "good enough" for those=20
who used it, and it was sufficient to fix a newly used TCG opcode which=20
triggered a TODO assertion from time to time. Obviously I underestimated =

Richard's desire to have a 100 % working TCI. I am sorry for that.

Technically the patch series looks reasonable. I like especially the=20
disassembler. Is there a Git repository which makes pulling all changes=20
easier? It would also help if the patches which were already reviewed=20
were already merged in qemu master.

Regarding misaligned bytecode access, there exist two solutions. We=20
could either use code which handles that correctly (I had sent a patch=20
using memcpy two years ago and recently sent a V2 which uses the QEMU=20
standard functions for that). Or we can align the data like it is done=20
in Richard's patches. For me it is not obvious which one is better.=20
While a single access is faster for aligned data, this might be=20
different for sequential access on misaligned data which might profit=20
from better caching of smaller bytecode.

Kind regards,

Stefan




