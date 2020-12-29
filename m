Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C45B2E6FFD
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Dec 2020 12:36:53 +0100 (CET)
Received: from localhost ([::1]:49486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kuDJ6-0003hb-8Y
	for lists+qemu-devel@lfdr.de; Tue, 29 Dec 2020 06:36:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kuDI5-0003Dz-Ar
 for qemu-devel@nongnu.org; Tue, 29 Dec 2020 06:35:49 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:53249)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kuDI2-0001JR-Gh
 for qemu-devel@nongnu.org; Tue, 29 Dec 2020 06:35:48 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 7AB7C746552;
 Tue, 29 Dec 2020 12:35:43 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 4533A74645F; Tue, 29 Dec 2020 12:35:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 4330374645B;
 Tue, 29 Dec 2020 12:35:43 +0100 (CET)
Date: Tue, 29 Dec 2020 12:35:43 +0100 (CET)
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v2 2/2] via-ide: Fix fuloong2e support
In-Reply-To: <7bd3e7e0-73be-5602-90d7-6fc67968b163@amsat.org>
Message-ID: <2851515-6d1b-11f0-d6ac-f2dd37b17f5c@eik.bme.hu>
References: <cover.1609107222.git.balaton@eik.bme.hu>
 <8e58807dd2ba46866e7f152244e4541e6425177d.1609107222.git.balaton@eik.bme.hu>
 <a7b14637-4a3e-1635-a0c2-da9ee48022a8@ilande.co.uk>
 <ab55636b-9ba7-6e38-8d62-31ef1a11c455@eik.bme.hu>
 <7bd3e7e0-73be-5602-90d7-6fc67968b163@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1811939737-1609241743=:96981"
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
Cc: Huacai Chen <chenhuacai@kernel.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Willian Rampazzo <wrampazz@redhat.com>, John Snow <jsnow@redhat.com>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: BALATON Zoltan <balaton@eik.bme.hu>
From: BALATON Zoltan via <qemu-devel@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1811939737-1609241743=:96981
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Tue, 29 Dec 2020, Philippe Mathieu-Daudé wrote:
>> I think this casued problems before because if it's not set to 0x8a
>> (legacy) at start then guests may assume it's already switched to native
>> mode by firmware and won't program the BARs and it will not work. This
>> way, even if it looks odd all guests I've tested work so I don't want to
>> touch this, because I don't want to test all guests again.
>
> If you can describe on the list how you do your testing (mostly
> command line used, where image/demo can be downloaded), we might help
> writing an integration test to automate the testing. Don't worry if
> it involves using close-source binaries, we'll try to figure out a
> way.

It's documented here:

https://osdn.net/projects/qmiga/wiki/SubprojectPegasos2#h2-Current.20status.20and.20outstanding.20issues

but pegasos2 is not in QEMU master yet, I'm just trying to clean it up and 
submit it so testing likely comes after I have a set of patches to send to 
add pegasos2. The version in qmiga repo is not the latest but one that 
works in itself, my current vt82c686c work is to upstream the vt8231 part. 
After that the rest should be simple: add mv64361 model and pegasos2 board 
code. The only problem I see with those is if it's OK to have board 
needing ROM image or if Mark torpedoes it for some reason :-). For the ROM 
I have plans to use vof (virtual open firmware emulation within QEMU, 
unmerged on qemu-ppc list currently for a while) but I couldn't get to 
that yet. Maybe Linux can be used via -kernel but I think it also needs 
Open Firmware client interface on pegasos2 so it won't work without some 
kind of firmware. (All this is also documented on above page if you scroll 
up.)

(By the way I've created the qmiga.osdn.net project with the intent to 
share work with interested people on these but so far nobody seemed to be 
interested enough to join and help. There were about 2 or 3 people 
interested in ati-vga but got scared away when saw how much work is needed 
yet. Contributions are still welcome otherwise it will take another few 
years to finish.)

Regards,
BALATON Zoltan
--3866299591-1811939737-1609241743=:96981--

