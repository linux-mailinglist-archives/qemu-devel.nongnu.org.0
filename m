Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D364874EB
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 10:49:22 +0100 (CET)
Received: from localhost ([::1]:55920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5ls8-0002uW-2e
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 04:49:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1n5lqe-000259-9P
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 04:47:48 -0500
Received: from [2001:738:2001:2001::2001] (port=11336 helo=zero.eik.bme.hu)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1n5lqb-00039U-HX
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 04:47:47 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 1F86B7475FA;
 Fri,  7 Jan 2022 10:47:41 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id EE2F8746353; Fri,  7 Jan 2022 10:47:40 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id EC74F7462D3;
 Fri,  7 Jan 2022 10:47:40 +0100 (CET)
Date: Fri, 7 Jan 2022 10:47:40 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH] q800: fix segfault with invalid MacROM
In-Reply-To: <58171f63-7599-edd2-020e-69586ae0d7c8@vivier.eu>
Message-ID: <11f45045-52fe-ae2a-a986-a19c1cce6247@eik.bme.hu>
References: <20220106122247.771454-1-laurent@vivier.eu>
 <11cea729-2dc1-6985-0c17-8dca37618002@ilande.co.uk>
 <58171f63-7599-edd2-020e-69586ae0d7c8@vivier.eu>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1668982576-1641548860=:25377"
X-Spam-Probability: 9%
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:738:2001:2001::2001
 (failed)
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1668982576-1641548860=:25377
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Fri, 7 Jan 2022, Laurent Vivier wrote:
> Le 07/01/2022 à 09:15, Mark Cave-Ayland a écrit :
>> On 06/01/2022 12:22, Laurent Vivier wrote:
>> 
>>> "qemu-system-m68k -M q800 -bios /dev/null" crahses with a segfault
>>> in q800_init().
>>> This happens because the code doesn't check that rom_ptr() returned
>>> a non-NULL pointer .
>>> 
>>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/756
>>> Reported-by: Peter Maydell <peter.maydell@linaro.org>
>>> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
>>> ---
>>>   hw/m68k/q800.c | 8 +++++++-
>>>   1 file changed, 7 insertions(+), 1 deletion(-)
>>> 
>>> diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
>>> index e4c7c9b88ad0..6261716c8f7e 100644
>>> --- a/hw/m68k/q800.c
>>> +++ b/hw/m68k/q800.c
>>> @@ -672,10 +672,16 @@ static void q800_init(MachineState *machine)
>>>           /* Remove qtest_enabled() check once firmware files are in the 
>>> tree */
>>>           if (!qtest_enabled()) {
>>> -            if (bios_size < 0 || bios_size > MACROM_SIZE) {
>>> +            if (bios_size == -1) {
>>>                   error_report("could not load MacROM '%s'", bios_name);
>>>                   exit(1);
>>>               }
>>> +            if (bios_size != MACROM_SIZE) {
>>> +                error_report("Invalid size for MacROM '%s': %d bytes,"
>>> +                             " expected %d bytes", bios_name, bios_size,
>>> +                             MACROM_SIZE);
>>> +                exit(1);
>>> +            }
>>>               ptr = rom_ptr(MACROM_ADDR, MACROM_SIZE);
>>>               stl_phys(cs->as, 0, ldl_p(ptr));    /* reset initial SP */
>> 
>> The patch does fix the issue, but it seems a little odd that you can't use 
>> -bios path/to/m68k-binary to boot with an arbitrary sized binary which 
>> could be useful for reproducers such as 
>> https://gitlab.com/qemu-project/qemu/-/issues/360.
>> 
>> How easy would it be to add the extra rom_ptr() NULL check instead?
>> 
>
> I was thinking that a smaller binary can be padded to 1 MB for use because on 
> a real hardware the size of the ROM cannot be arbitrary.
>
> But it seems reasonable to check only for the NULL pointer rather than the 
> size, I'm going to send a v2.

Instead of adding !rom_ptr as well, isn't it enough to change to
bios_size <= 0 
in the existing check?

Regards,
BALATON Zoltan
--3866299591-1668982576-1641548860=:25377--

