Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A4F2E31EB
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Dec 2020 17:53:00 +0100 (CET)
Received: from localhost ([::1]:42558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktZHv-0000zt-P0
	for lists+qemu-devel@lfdr.de; Sun, 27 Dec 2020 11:52:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ktZCD-00065H-2a
 for qemu-devel@nongnu.org; Sun, 27 Dec 2020 11:47:05 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:26176)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ktZCB-0005Or-HK
 for qemu-devel@nongnu.org; Sun, 27 Dec 2020 11:47:04 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id A47117470DB;
 Sun, 27 Dec 2020 17:47:01 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 217C274646C; Sun, 27 Dec 2020 17:47:01 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 204F874645F;
 Sun, 27 Dec 2020 17:47:01 +0100 (CET)
Date: Sun, 27 Dec 2020 17:47:01 +0100 (CET)
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH 06/12] audio/via-ac97: Simplify code and set user_creatable
 to false
In-Reply-To: <59478f83-35ab-6610-5233-dd300fc8cb27@amsat.org>
Message-ID: <4a618736-44bb-ccf3-b5bd-e443ab5502b@eik.bme.hu>
References: <cover.1609031406.git.balaton@eik.bme.hu>
 <717bd2ed67a42476fdb4c6132d7c351eb9f54282.1609031406.git.balaton@eik.bme.hu>
 <59478f83-35ab-6610-5233-dd300fc8cb27@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-437266030-1609087621=:84491"
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
Cc: Huacai Chen <chenhuacai@kernel.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: BALATON Zoltan <balaton@eik.bme.hu>
From: BALATON Zoltan via <qemu-devel@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-437266030-1609087621=:84491
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Sun, 27 Dec 2020, Philippe Mathieu-Daudé wrote:
> Hi Zoltan,
>
> On 12/27/20 2:10 AM, BALATON Zoltan via wrote:
>> Remove some unneded, empty code and set user_creatable to false
>> (besides being not implemented yet, so does nothing anyway) it's also
>> normally part of VIA south bridge chips so no need to confuse users
>> showing them these devices.
>
> After contributing during more than 8 years you should know we try
> to avoid to do multiples changes in the same patch ;)

Yes, in my understanding patches should be split if

- it makes bisecting easier or
- makes reviewing easier

Which of the above appies in this case? I think these are changes that 
should neither brake anything (as this device doesn't don't do anyting 
yet) and adding user_creatable false is a one line change that's easy to 
review even with the other changes. If you insist I can split this into 
two but I didn't think that would be any better and the series was long 
enough already.

Regards,
BALATON Zoltan

>>
>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>> ---
>>  hw/audio/via-ac97.c | 51 +++++++++++++++++----------------------------
>>  1 file changed, 19 insertions(+), 32 deletions(-)
>
>
--3866299591-437266030-1609087621=:84491--

