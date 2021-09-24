Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F34B417076
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 12:52:47 +0200 (CEST)
Received: from localhost ([::1]:57546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTiov-0003Ea-NX
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 06:52:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mTing-000221-MZ
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 06:51:28 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:41633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mTind-0000y9-KX
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 06:51:27 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 4C4D3748F56;
 Fri, 24 Sep 2021 12:51:22 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 2320A746398; Fri, 24 Sep 2021 12:51:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 20F18746353;
 Fri, 24 Sep 2021 12:51:22 +0200 (CEST)
Date: Fri, 24 Sep 2021 12:51:22 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v5 04/20] nubus: use bitmap to manage available slots
In-Reply-To: <86d88a87-c54b-55c5-5722-310e86e7222e@amsat.org>
Message-ID: <7fcdc441-894b-8fe3-3542-70ecdae0ee8@eik.bme.hu>
References: <20210923091308.13832-1-mark.cave-ayland@ilande.co.uk>
 <20210923091308.13832-5-mark.cave-ayland@ilande.co.uk>
 <f39eb222-28aa-416f-61a2-ab74f52fda8f@eik.bme.hu>
 <81bd27ad-8251-4e0b-f4c6-cb03c326b2cc@ilande.co.uk>
 <86d88a87-c54b-55c5-5722-310e86e7222e@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-288400195-1632480682=:16439"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-288400195-1632480682=:16439
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Fri, 24 Sep 2021, Philippe Mathieu-Daudé wrote:
> On 9/24/21 09:16, Mark Cave-Ayland wrote:
>> On 23/09/2021 15:16, BALATON Zoltan wrote:
>> 
>>> On Thu, 23 Sep 2021, Mark Cave-Ayland wrote:
>>>> Convert nubus_device_realize() to use a bitmap to manage available slots 
>>>> to allow
>>>> for future Nubus devices to be plugged into arbitrary slots from the 
>>>> command line
>>>> using a new qdev "slot" parameter for nubus devices.
>>>> 
>>>> Update mac_nubus_bridge_init() to only allow slots 0x9 to 0xe on a 
>>>> Macintosh
>>>> machines as documented in "Desigining Cards and Drivers for the Macintosh 
>>>> Family".
>>> 
>>> Small typo: "a Macintosh machnies", either a or s is not needed.
>> 
>> Thanks - I've updated this for v6.
>> 
>>>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>>>> ---
>>>> hw/nubus/mac-nubus-bridge.c         |  4 ++++
>>>> hw/nubus/nubus-bus.c                |  5 +++--
>>>> hw/nubus/nubus-device.c             | 32 +++++++++++++++++++++++------
>>>> include/hw/nubus/mac-nubus-bridge.h |  4 ++++
>>>> include/hw/nubus/nubus.h            | 13 ++++++------
>>>> 5 files changed, 43 insertions(+), 15 deletions(-)
>
>>>> struct NubusDevice {
>>>>     DeviceState qdev;
>>>> 
>>>> -    int slot;
>>>> +    int32_t slot;
>>> 
>>> Why uint32_t? Considering its max value even uint8_t would be enough 
>>> although maybe invalid value would be 255 instead of -1 then. As this was 
>>> added in previous patch you could avoid churn here by introducing it with 
>>> the right type in that patch already. (But feel free to ignore it if you 
>>> have no time for more changes, the current version works so if you don't 
>>> do another version for other reasons this probably don't worth the effort 
>>> alone.)
>> 
>> I think it makes sense to keep this signed since -1 is used for other bus 
>> implementations to indicate that an explicit slot hasn't been assigned. 
>> Potentially the slot number could be represented by an 8-bit value, however 
>> it seems there is no DEFINE_PROP_INT8 or DEFINE_PROP_INT16. Fortunately the 
>> slot number is restricted by the available slots bitmask anyhow, so this 
>> shouldn't be an issue.
>
> I wondered the same and noticed there is no DEFINE_PROP_INT8, so didn't
> want to bother Mark furthermore :) Adding & using DEFINE_PROP_INT8 seems
> a good idea, but to be fair with the repository we'd need to audit the
> other places where DEFINE_PROP_INT32 isn't justified and update. Extra
> work for not much gain, so I'm find with this patch. Can be improved on
> top.

That's why I said UINT8 for prop and treat -1 as 0xff but I agree this is 
not a big deal so I've also said I'm OK with the current version. If it 
would be more effort than Mark is willing to put in this now I can 
understand that and not pushing it. It's not something that's wrong or 
worth holding the series back for just a possible minor improvement to 
avoid some code churn.

Regards,
BALATON Zoltan
--3866299591-288400195-1632480682=:16439--

