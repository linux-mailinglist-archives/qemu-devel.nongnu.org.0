Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F26602A0D
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 13:24:18 +0200 (CEST)
Received: from localhost ([::1]:44696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okkhi-0005GZ-Hk
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 07:24:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1okkXn-0007Yz-29; Tue, 18 Oct 2022 07:13:59 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:16648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1okkXj-0004fD-Iw; Tue, 18 Oct 2022 07:13:58 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id E9A7D74633E;
 Tue, 18 Oct 2022 13:13:47 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id AA309746324; Tue, 18 Oct 2022 13:13:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id A793B746335;
 Tue, 18 Oct 2022 13:13:47 +0200 (CEST)
Date: Tue, 18 Oct 2022 13:13:47 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Bin Meng <bmeng.cn@gmail.com>
cc: Bernhard Beschow <shentey@gmail.com>, Bin Meng <bin.meng@windriver.com>, 
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, 
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>, 
 qemu-arm@nongnu.org, Alistair Francis <alistair@alistair23.me>, 
 Jan Kiszka <jan.kiszka@web.de>, Magnus Damm <magnus.damm@gmail.com>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org, 
 Aurelien Jarno <aurelien@aurel32.net>, qemu-ppc@nongnu.org, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, 
 Antony Pavlov <antonynpavlov@gmail.com>, Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH v3 7/9] hw/ppc/e500: Implement pflash handling
In-Reply-To: <CAEUhbmWb_H_hTToGzb1ioZtZJxNgwPsjTaiUfBBnNF+1g+5PBg@mail.gmail.com>
Message-ID: <15bd851-fe9b-6a91-fadf-7f67ad484c78@eik.bme.hu>
References: <20221016122737.93755-1-shentey@gmail.com>
 <20221016122737.93755-8-shentey@gmail.com>
 <2d634687-bdf7-a59b-76e1-60de81142a4a@eik.bme.hu>
 <2C1D5CD8-9EBA-47A4-8AE9-6464BAB6CC68@gmail.com>
 <CAEUhbmWb_H_hTToGzb1ioZtZJxNgwPsjTaiUfBBnNF+1g+5PBg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1652907209-1666091627=:39324"
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1652907209-1666091627=:39324
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Tue, 18 Oct 2022, Bin Meng wrote:
> On Tue, Oct 18, 2022 at 3:46 PM Bernhard Beschow <shentey@gmail.com> wrote:
>>
>> Am 16. Oktober 2022 14:15:09 UTC schrieb BALATON Zoltan <balaton@eik.bme.hu>:
>>> On Sun, 16 Oct 2022, Bernhard Beschow wrote:
>>>> Allows e500 boards to have their root file system reside on flash using
>>>> only builtin devices located in the eLBC memory region.
>>>>
>>>> Note that the flash memory area is only created when a -pflash argument is
>>>> given, and that the size is determined by the given file. The idea is to
>>>> put users into control.
>>>>
>>>> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
>>>> ---
>>>> docs/system/ppc/ppce500.rst | 16 ++++++++++
>>>> hw/ppc/Kconfig              |  1 +
>>>> hw/ppc/e500.c               | 62 +++++++++++++++++++++++++++++++++++++
>>>> 3 files changed, 79 insertions(+)
>>>>
>>>> diff --git a/docs/system/ppc/ppce500.rst b/docs/system/ppc/ppce500.rst
>>>> index ba6bcb7314..99d2c680d6 100644
>>>> --- a/docs/system/ppc/ppce500.rst
>>>> +++ b/docs/system/ppc/ppce500.rst
>>>> @@ -165,3 +165,19 @@ if “-device eTSEC” is given to QEMU:
>>>> .. code-block:: bash
>>>>
>>>>   -netdev tap,ifname=tap0,script=no,downscript=no,id=net0 -device eTSEC,netdev=net0
>>>> +
>>>> +Root file system on flash drive
>>>> +-------------------------------
>>>> +
>>>> +Rather than using a root file system on ram disk, it is possible to have it on
>>>> +CFI flash. Given an ext2 image whose size must be a power of two, it can be used
>>>> +as follows:
>>>> +
>>>> +.. code-block:: bash
>>>> +
>>>> +  $ qemu-system-ppc{64|32} -M ppce500 -cpu e500mc -smp 4 -m 2G \
>>>
>>> We have qemu-system-ppc and qemu-system-ppc64 not qemu-system-ppc32 so maybe qemu-system-ppc[64] even though that looks odd so maybe just qemu-system-ppc and then people should know that ppc64 includes ppc config as well.
>>
>> True. This naming is used elsewhere in this document, so we kept it consistent. I think that users will get it either way.
>>
>> @Bin: Any thoughts?
>>
>
> How about a separate patch to remove the {64 | 32} suffix, and just
> use qemu-system-ppc64 consistently since the *ppc64 executable can run
> 32-bit ppc codes too?

In case it's already there then yes it's unrelated to this series so just 
disregard my comment or add a separate patch to fix it if you can. I did 
not check the rest of the doc just noticed this in this patch.

Regards,
BALATON Zoltan
--3866299591-1652907209-1666091627=:39324--

