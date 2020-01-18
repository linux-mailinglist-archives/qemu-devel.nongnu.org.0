Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E5B141A7C
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Jan 2020 00:43:44 +0100 (CET)
Received: from localhost ([::1]:45854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1isxkl-00041X-CL
	for lists+qemu-devel@lfdr.de; Sat, 18 Jan 2020 18:43:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42328)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <balaton@eik.bme.hu>) id 1isxjw-0003Po-UU
 for qemu-devel@nongnu.org; Sat, 18 Jan 2020 18:42:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <balaton@eik.bme.hu>) id 1isxjv-0007AH-8F
 for qemu-devel@nongnu.org; Sat, 18 Jan 2020 18:42:52 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:30258)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <balaton@eik.bme.hu>) id 1isxjv-00078D-2S
 for qemu-devel@nongnu.org; Sat, 18 Jan 2020 18:42:51 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id A3FC17482CB;
 Sun, 19 Jan 2020 00:42:48 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 7EBE1745702; Sun, 19 Jan 2020 00:42:48 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 7D2E97456F8;
 Sun, 19 Jan 2020 00:42:48 +0100 (CET)
Date: Sun, 19 Jan 2020 00:42:48 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: Commit 3e7fb5811b or something in that series breaks build?
In-Reply-To: <CAFEAcA9-6eqk9nSJ+0YVSTEyYO8RRqFJwH0TAr8_tNthH1bjuQ@mail.gmail.com>
Message-ID: <alpine.BSF.2.21.99999.352.2001190027510.68247@zero.eik.bme.hu>
References: <alpine.BSF.2.21.99999.352.2001182314430.68247@zero.eik.bme.hu>
 <CAFEAcA9-6eqk9nSJ+0YVSTEyYO8RRqFJwH0TAr8_tNthH1bjuQ@mail.gmail.com>
User-Agent: Alpine 2.21.99999 (BSF 352 2019-06-22)
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1182346319-1579390968=:68247"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2001:738:2001:2001::2001
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1182346319-1579390968=:68247
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On Sat, 18 Jan 2020, Peter Maydell wrote:
> On Sat, 18 Jan 2020 at 22:41, BALATON Zoltan <balaton@eik.bme.hu> wrote=
:
>> I'm getting errors about missing headers in qapi/* and build fails on
>> current master.
>>
>> I've tried bisecting it which lead to commit 3e7fb5811b where I get:
>>
>>    CC      qapi/qapi-types-audio.o
>> cc: error: qapi/qapi-types-audio.c: No such file or directory
>> cc: fatal error: no input files
>
> I haven't looked, but could you try the usual things to check:
> * does your tree have 'stale' files deleted by a commit
>   (ie listed in 'git status' as now unknown to git) ?
> * did you try a reconfigure and build from clean?
>   (ideally this should not be required, but it might help
>   narrow down the issue)
> * could you test whether you see the issue also with an
>   out-of-tree build?

Also fails after make distclean with out-of-tree build in the same way.=20
Seems that --disable-guest-agent option breaks earlier but even without=20
that option I get error later about some rtc chip and build does not=20
finish. I've tried with just

configure --target-list=3Dppc-softmmu --disable-guest-agent

and get the above error right after it built capstone.a and starts=20
building qapi/* (without --disable-guest-agent it almost gets to the end=20
but fails later). Sometimes I also see these errors:

In file included from qapi/qapi-types-crypto.c:15:0:
qapi/qapi-types-crypto.h:176:33: error: field =E2=80=98qcow=E2=80=99 has =
incomplete type
          QCryptoBlockOptionsQCow qcow;
                                  ^
qapi/qapi-types-crypto.h:177:33: error: field =E2=80=98luks=E2=80=99 has =
incomplete type
          QCryptoBlockOptionsLUKS luks;
                                  ^
qapi/qapi-types-crypto.h:193:33: error: field =E2=80=98qcow=E2=80=99 has =
incomplete type
          QCryptoBlockOptionsQCow qcow;
                                  ^
qapi/qapi-types-crypto.h:236:30: error: field =E2=80=98luks=E2=80=99 has =
incomplete type
          QCryptoBlockInfoLUKS luks;
                               ^

Regards,
BALATON Zoltan
--3866299591-1182346319-1579390968=:68247--

