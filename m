Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A3F6A829D
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 13:49:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXiCl-00017n-F4; Thu, 02 Mar 2023 07:38:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pXiC6-0000q8-BC; Thu, 02 Mar 2023 07:38:06 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pXiC3-0005Gs-Ao; Thu, 02 Mar 2023 07:37:57 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 58448746346;
 Thu,  2 Mar 2023 13:37:51 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 23F36746324; Thu,  2 Mar 2023 13:37:51 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 2206A7462DB;
 Thu,  2 Mar 2023 13:37:51 +0100 (CET)
Date: Thu, 2 Mar 2023 13:37:51 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, 
 Gerd Hoffmann <kraxel@redhat.com>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>, 
 Bernhard Beschow <shentey@gmail.com>, 
 Peter Maydell <peter.maydell@linaro.org>, ReneEngel80@emailn.de
Subject: Re: [PATCH v5 2/7] Revert "hw/isa/vt82c686: Remove intermediate IRQ
 forwarder"
In-Reply-To: <7ae0ae69-817e-7100-beed-ed610b3135cb@linaro.org>
Message-ID: <f85e3122-3a30-1a32-a6b0-8414663e39f9@eik.bme.hu>
References: <cover.1677628524.git.balaton@eik.bme.hu>
 <cdfb3c5a42e505450f6803124f27856434c5b298.1677628524.git.balaton@eik.bme.hu>
 <709f5780-97e5-0cee-d776-4558cf39e000@eik.bme.hu>
 <7ae0ae69-817e-7100-beed-ed610b3135cb@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-2134330101-1677760671=:51004"
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

--3866299591-2134330101-1677760671=:51004
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Thu, 2 Mar 2023, Philippe Mathieu-Daudé wrote:
> On 1/3/23 01:33, BALATON Zoltan wrote:
>> On Wed, 1 Mar 2023, BALATON Zoltan wrote:
>>> This partially reverts commit bb98e0f59cde846666d9fddc60ae74ef7ddfca17
>>> keeping the rename of a state field but reverting other cahanges which
>>> break interrupts on pegasos2.
>> 
>> I've found this with just booting the MorphOS iso which now hangs without 
>> this revert when trying to read from the ide device.
>
> Can you add an Avocado test booting the MorphOS iso?

I think you had a patch for that before, so you remember where to find it? 
I can't test that though as I don't have avocado and it does not come with 
my distro. So maybe if you can revive your patch and test it that might 
work better.

Regards,
BALATON Zoltan

>> I think I've mentioned that I've also tried this way first but then ended 
>> up adding this because it was needed in a review of the patch earlier but I 
>> can't find that message now. For now it seems the easiest is to revert this 
>> and think about it later.
>> 
>> Regards,
>> BALATON Zoltan
>> 
>>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>>> ---
>>> hw/isa/vt82c686.c | 10 +++++++++-
>>> 1 file changed, 9 insertions(+), 1 deletion(-)
>
>
--3866299591-2134330101-1677760671=:51004--

