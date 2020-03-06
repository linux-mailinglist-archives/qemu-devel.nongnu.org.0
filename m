Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 251D717B52F
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Mar 2020 05:02:18 +0100 (CET)
Received: from localhost ([::1]:59222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jA4Bk-0000S3-D8
	for lists+qemu-devel@lfdr.de; Thu, 05 Mar 2020 23:02:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50300)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jingqi.liu@intel.com>) id 1jA4As-0008TU-5x
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 23:01:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jingqi.liu@intel.com>) id 1jA4Aq-0003EC-DX
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 23:01:21 -0500
Received: from mga09.intel.com ([134.134.136.24]:51533)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jingqi.liu@intel.com>)
 id 1jA4Aq-00036T-47
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 23:01:20 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Mar 2020 20:01:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,518,1574150400"; d="scan'208";a="259435907"
Received: from jingqili-mobl.ccr.corp.intel.com (HELO [10.254.209.228])
 ([10.254.209.228])
 by orsmga002.jf.intel.com with ESMTP; 05 Mar 2020 20:01:14 -0800
Subject: Re: [PATCH] util: fix to get configuration macros in util/mmap-alloc.c
To: Peter Maydell <peter.maydell@linaro.org>, =?UTF-8?Q?J=c3=a1n_Tomko?=
 <jtomko@redhat.com>
References: <20200305154142.63070-1-jingqi.liu@intel.com>
 <20200305161047.GB3627464@lpt>
 <CAFEAcA-OQncMrU_-DJJ9g5rEcrJvbhTOjOVs0YqO3NS_Y413OQ@mail.gmail.com>
From: "Liu, Jingqi" <jingqi.liu@intel.com>
Message-ID: <4579553b-df03-2465-d529-7e39f3f8f600@intel.com>
Date: Fri, 6 Mar 2020 12:01:13 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-OQncMrU_-DJJ9g5rEcrJvbhTOjOVs0YqO3NS_Y413OQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.24
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/6/2020 12:40 AM, Peter Maydell wrote:
> On Thu, 5 Mar 2020 at 16:11, Ján Tomko <jtomko@redhat.com> wrote:
>> On a Thursday in 2020, Jingqi Liu wrote:
>>> The CONFIG_LINUX symbol is always not defined in this file.
>>> This fixes that "config-host.h" header file is not included
>>> for getting macros.
>>>
>>> Signed-off-by: Jingqi Liu <jingqi.liu@intel.com>
>>> ---
>>> util/mmap-alloc.c | 2 ++
>>> 1 file changed, 2 insertions(+)
>>>
>>> diff --git a/util/mmap-alloc.c b/util/mmap-alloc.c
>>> index 27dcccd8ec..24c0e380f3 100644
>>> --- a/util/mmap-alloc.c
>>> +++ b/util/mmap-alloc.c
>>> @@ -10,6 +10,8 @@
>>>   * later.  See the COPYING file in the top-level directory.
>>>   */
>>>
>>> +#include "config-host.h"
>>> +
>> According to CODING_STYLE.rst, qemu/osdep.h is the header file
>> that should be included first, before all the other includes.
>>
>> So the minimal fix would be moving qemu/osdep.h up here.
> Yes, osdep must always be first.
>
>>> #ifdef CONFIG_LINUX
>>> #include <linux/mman.h>
>>> #else  /* !CONFIG_LINUX */
> Do we really need this? osdep.h will pull in sys/mman.h
> for you, which should define the MAP_* constants.
>
> Also, you have no fallbmack for "I'm on Linux but the
> system headers don't define MAP_SHARED_VALIDATE or
> MAP_SYNC". Wouldn't it be better to just have
> #ifndef MAP_SYNC
> #define MAP_SYNC 0
> #endif
>
> etc ?

Thanks for your review.

The system headers bits/mman.h (which is included by sys/mman.h)

don't define MAP_SYNC and MAP_SHARED_VALIDATE on linux.

They're defined in linux-headers/asm-generic/mman-common.h ( which is 
included by linux/mman.h).

Another MAP_* macros are defined in both header files.

As you mentioned, if don't include linux/mman.h, just defines as following:

#ifndef MAP_SYNC
#define MAP_SYNC 0
#endif

The MAP_SYNC is always 0 since MAP_SYNC isn't defined in system header.

Thanks,

Jingqi

>
> thanks
> -- PMM

