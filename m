Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE2269D6FC
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 00:27:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUFXh-0003Wr-1j; Mon, 20 Feb 2023 18:25:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pUFXc-0003W1-7I
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 18:25:52 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pUFXZ-0008Vu-Of
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 18:25:51 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 3EBB87470B0;
 Tue, 21 Feb 2023 00:25:46 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 002407470AF; Tue, 21 Feb 2023 00:25:45 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id F269F7470AB;
 Tue, 21 Feb 2023 00:25:45 +0100 (CET)
Date: Tue, 21 Feb 2023 00:25:45 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: "Michael S. Tsirkin" <mst@redhat.com>
cc: Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>, 
 qemu-devel@nongnu.org
Subject: Re: [PATCH] hw/acpi: Set memory regions to native endian as a work
 around
In-Reply-To: <20230220172659-mutt-send-email-mst@kernel.org>
Message-ID: <f4e755b6-051e-103f-b8bc-2765d277633f@eik.bme.hu>
References: <20211108130934.59B48748F52@zero.eik.bme.hu>
 <b0787bca-8321-059e-d360-1e0a0af31228@redhat.com>
 <a7992420-e2e3-7859-b2de-f9aa88c94945@redhat.com>
 <d03380e9-b6a2-5998-cc72-6443cfdc46b5@eik.bme.hu>
 <d9fcba9d-c2c6-5be3-ce5f-baf5a116bbc4@eik.bme.hu>
 <20220119041842-mutt-send-email-mst@kernel.org>
 <20220222094021-mutt-send-email-mst@kernel.org>
 <f9f183c4-b0b8-22c6-57f9-1b6b20e8e5a5@eik.bme.hu>
 <20230220172659-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1273359049-1676935545=:50038"
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1273359049-1676935545=:50038
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 8BIT

On Mon, 20 Feb 2023, Michael S. Tsirkin wrote:
> On Mon, Feb 20, 2023 at 07:24:59PM +0100, BALATON Zoltan wrote:
>> On Tue, 22 Feb 2022, Michael S. Tsirkin wrote:
>>> On Wed, Jan 19, 2022 at 04:19:14AM -0500, Michael S. Tsirkin wrote:
>>>> On Sat, Nov 13, 2021 at 07:47:20PM +0100, BALATON Zoltan wrote:
>>>>> On Mon, 8 Nov 2021, BALATON Zoltan wrote:
>>>>>> On Mon, 8 Nov 2021, Paolo Bonzini wrote:
>>>>>>> On 11/8/21 15:30, Paolo Bonzini wrote:
>>>>>>>> On 11/8/21 14:05, BALATON Zoltan wrote:
>>>>>>>>> When using ACPI on big endian machine (such as ppc/pegasos2 which has
>>>>>>>>> a VT8231 south bridge with ACPI) writes to ACPI registers come out
>>>>>>>>> byte swapped. This may be caused by a bug in memory subsystem but
>>>>>>>>> until that is fixed setting the ACPI memory regions to native endian
>>>>>>>>> makes it usable for big endian machines. This fixes ACPI shutdown with
>>>>>>>>> pegasos2 when using the board firmware for now.
>>>>>>>>> This could be reverted when the memory layer is fixed.
>>>>>>>>
>>>>>>>> What is the path to the swapped writes?  Even just a backtrace
>>>>>>>> might be enough to understand what's going on, and especially
>>>>>>>> where the bug is.
>>>>>>>
>>>>>>> Ok, Michael pointed me at https://lore.kernel.org/all/20211011080528-mutt-send-email-mst@kernel.org/.
>>>>>
>>>>> Ping? I haven't seen an alternative fix yet. If you don't have time now this
>>>>> could be postponed to next version with the native endian work around for
>>>>> now.
>>>>>
>>>>> Regards,
>>>>> BALATON Zoltan
>>>>
>>>> Paolo, ping?
>>>
>>> ping
>>
>> Can this be fixed please or my proposed workaround taken until it will be?
>> Original patch I've sent is here:
>> http://patchew.org/QEMU/20211108130934.59B48748F52@zero.eik.bme.hu/
>>
>> I hope to make pegasos2 more usable in next release so maybe more people
>> will want to use it soon.
>>
>> Regards,
>> BALATON Zoltan
>
> Any chance of fixing it in memory core? No one else seems to care.
>
>
> I think fundamentally you need to check for the condition
> Size < mr->ops->impl.min_access_size in memory_region_dispatch_write
> and then make a read, combine the result with
> the value and make a write.

I neither know that part nor feel confident enough breaking such low level 
stuff so I think setting the affected regions NATIVE_ENDIAN for now until 
somebody takes care of this is safer and not likely to break anyting (or 
if it does, much less widely and I'm more likely to be able to fix that 
than your proposed changes). So I'd rather let you do that but I'd like 
this fixed one way or another at last.

Regards,
BALATON Zoltan
--3866299591-1273359049-1676935545=:50038--

