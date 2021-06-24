Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 542133B35E4
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 20:39:00 +0200 (CEST)
Received: from localhost ([::1]:35412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwUFf-0000qX-Dh
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 14:38:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lwUDr-0008Ml-88
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 14:37:07 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:11730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lwUDo-0003rN-7Y
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 14:37:06 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id EB32D74570B;
 Thu, 24 Jun 2021 20:37:01 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id B8FA57456E3; Thu, 24 Jun 2021 20:37:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id B72387456B4;
 Thu, 24 Jun 2021 20:37:01 +0200 (CEST)
Date: Thu, 24 Jun 2021 20:37:01 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PULL 30/43] vt82c686: Fix SMBus IO base and configuration
 registers
In-Reply-To: <0c52a343-ed4c-92fa-fac0-0f32f37b0df2@amsat.org>
Message-ID: <a28abcbd-204d-2c2c-7314-bdd98fff04f@eik.bme.hu>
References: <20210221143432.2468220-1-f4bug@amsat.org>
 <20210221143432.2468220-31-f4bug@amsat.org>
 <0c52a343-ed4c-92fa-fac0-0f32f37b0df2@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1658082471-1624559821=:63692"
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paul Burton <paulburton@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1658082471-1624559821=:63692
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Thu, 24 Jun 2021, Philippe Mathieu-Daudé wrote:
> Hi Zoltan,
>
> On 2/21/21 3:34 PM, Philippe Mathieu-Daudé wrote:
>> From: BALATON Zoltan <balaton@eik.bme.hu>
>>
>> The base address of the SMBus io ports and its enabled status is set
>> by registers in the PCI config space but this was not correctly
>> emulated. Instead the SMBus registers were mapped on realize to the
>> base address set by a property to the address expected by fuloong2e
>> firmware.
>>
>> Fix the base and config register handling to more closely model
>> hardware which allows to remove the property and allows the guest to
>> control this mapping. Do all this in reset instead of realize so it's
>> correctly updated on reset.
>
> This commit broken running PMON on Fuloong2E:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg752605.html

By the way, I'm not sure I'm reading this test right but looks like the 
one which claims to test ati-vga has -vga std command line option that 
probably turns off ati-vga so maybe it does not really test it and the one 
which has no -vga option so could test ati-vga is not declaring it. Not 
sure it's a problem just something I've noticed.

Regards,
BALATON Zoltan
--3866299591-1658082471-1624559821=:63692--

