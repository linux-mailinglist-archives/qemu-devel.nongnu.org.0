Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB18049D2FC
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 21:03:32 +0100 (CET)
Received: from localhost ([::1]:58254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCoVv-0007mN-Ei
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 15:03:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nCoTX-0006Dy-L9; Wed, 26 Jan 2022 15:01:03 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:57223)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nCoTR-0003hT-Iu; Wed, 26 Jan 2022 15:01:02 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id EC7B374634B;
 Wed, 26 Jan 2022 21:00:50 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id CD0EB7456FE; Wed, 26 Jan 2022 21:00:50 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id CBA5F7456E3;
 Wed, 26 Jan 2022 21:00:50 +0100 (CET)
Date: Wed, 26 Jan 2022 21:00:50 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?C=E9dric_Le_Goater?= <clg@kaod.org>
Subject: Re: [PATCH 0/8] target/ppc: powerpc_excp improvements [74xx] (5/n)
In-Reply-To: <f4f8fb10-faaf-4371-6ccb-baf10705da88@kaod.org>
Message-ID: <bbd6b4a9-498e-5767-9877-bfb2a525349c@eik.bme.hu>
References: <20220126164200.1048677-1-farosas@linux.ibm.com>
 <d98af016-0a9-49d0-74b4-c59f26a4af6@eik.bme.hu>
 <f4f8fb10-faaf-4371-6ccb-baf10705da88@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-664921783-1643227250=:22086"
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 david@gibson.dropbear.id.au, Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-664921783-1643227250=:22086
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Wed, 26 Jan 2022, Cédric Le Goater wrote:
> On 1/26/22 18:55, BALATON Zoltan wrote:
>> On Wed, 26 Jan 2022, Fabiano Rosas wrote:
>>> This handles the exception code for the 74xx family, i.e. 7400, 7410,
>>> 7440, 7445, 7450, 7455, 7457.
>>> 
>>> This is another family that is quite well known, so it should be
>>> straight-forward as well.
>> 
>> I guess this is what may break VOF on pegasos2. Was Philippe's test case 
>> for this machine ever merged? (Although that may use the firmware ROM that 
>> was preferred as it tests more of the machine and may predate VOF so not 
>> sure it also tests with VOF.) The way to test it is this:
>> 
>> Get morphos demo ISO from https://www.morphos-team.net/morphos-3.15.iso
>> Extract boot.img from the root directory of the CD
>> Run QEMU as shown at http://zero.eik.bme.hu/~balaton/qemu/amiga/#morphos
>
> I could never make it work :/

Philippe's test or the MorphOS iso? If the MorphOS boot, what problem do 
you get? I don't have or use avocado so can't comment on the former.

>> (For debugging maybe enabling vof traces would give more info but it was a 
>> while so I don't remember the details any more.)
>> 
>>> Based on legoater/ppc-7.0
>> 
>> I could test when it's merged or when it applies on master but I don't 
>> usually test on branches. Did you verify it still works with pegasos2 or 
>> could you please make sure it won't break that use case?
>
> I have a large set of images, here, that I use for non regression tests :
>
>  https://github.com/legoater/qemu-ppc-boot
>
> If we could add a pegasos, that would be nice.

I'm not sure how could I help with that. Once you can boot from command 
line it should be easy to add to the script as well.

Regards,
BALATON Zoltan
--3866299591-664921783-1643227250=:22086--

