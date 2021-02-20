Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B615C320778
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Feb 2021 23:02:09 +0100 (CET)
Received: from localhost ([::1]:58372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDaKG-0002s5-B2
	for lists+qemu-devel@lfdr.de; Sat, 20 Feb 2021 17:02:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lDaIo-0002MT-NI
 for qemu-devel@nongnu.org; Sat, 20 Feb 2021 17:00:38 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:22892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lDaIl-0001Kk-On
 for qemu-devel@nongnu.org; Sat, 20 Feb 2021 17:00:38 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id E46337462BD;
 Sat, 20 Feb 2021 23:00:26 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id B64BC74581E; Sat, 20 Feb 2021 23:00:26 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id B55717456E3;
 Sat, 20 Feb 2021 23:00:26 +0100 (CET)
Date: Sat, 20 Feb 2021 23:00:26 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v2 09/13] vt82c686: Fix superio_cfg_{read,write}()
 functions
In-Reply-To: <c2d5607d-29b1-a702-1268-dfbe59b1f687@amsat.org>
Message-ID: <498cdf92-f0f6-9ad6-9da6-63c5bd93b8@eik.bme.hu>
References: <cover.1610223396.git.balaton@eik.bme.hu>
 <15b2968fd300a12d06b42368d084f6f80d3c3be5.1610223397.git.balaton@eik.bme.hu>
 <c2d5607d-29b1-a702-1268-dfbe59b1f687@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-571240357-1613858426=:95909"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
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
Cc: Huacai Chen <chenhuacai@kernel.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-571240357-1613858426=:95909
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Sat, 20 Feb 2021, Philippe Mathieu-Daudé wrote:
> On 1/9/21 9:16 PM, BALATON Zoltan wrote:
>> These functions are memory region callbacks so we have to check
>> against relative address not the mapped address. Also reduce
>> indentation by returning early and log unimplemented accesses.
>> Additionally we remove separate index value from SuperIOConfig and
>> store the index at reg 0 which is reserved and returns 0 on read. This
>> simplifies object state.
>
> Again... Why are you putting so many changes in the same patch?

I thought these changes were simple enough to include in one patch so I 
don't get a series with 25 one line patches when I already have 13 
patches. Also I've split these up after having it working and it was hard 
to separate changes after the fact even if I went through doing it again 
from scratch to create the separate patches.

> I split it in 5 distinct patches trivial to review. I probably
> shouldn't spend that amount of maintainer time with your series,
> but this time I did it, my bad.

You don't have to do that, you can just tell me in review how you want 
these split up and then I can change it accordingly. Thanks a lot for 
doing it though, I can't see how this patch could be split up more than 
intno 2-3 patches so doing it was probably faster than explaining it in 
this case.

Regards,
BALATON Zoltan

>>
>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>> ---
>>  hw/isa/vt82c686.c | 63 ++++++++++++++++++++++++++---------------------
>>  1 file changed, 35 insertions(+), 28 deletions(-)
>
>
--3866299591-571240357-1613858426=:95909--

