Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BD233F91B
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 20:25:58 +0100 (CET)
Received: from localhost ([::1]:49312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMbnp-0002UH-HF
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 15:25:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lMbmB-000156-AU; Wed, 17 Mar 2021 15:24:15 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:58320)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lMbm8-0004u4-OO; Wed, 17 Mar 2021 15:24:14 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 9D09B7462E1;
 Wed, 17 Mar 2021 20:24:07 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 2BF9D7462D6; Wed, 17 Mar 2021 20:24:07 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 2AA957462DB;
 Wed, 17 Mar 2021 20:24:07 +0100 (CET)
Date: Wed, 17 Mar 2021 20:24:07 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v10 3/7] vt82c686: Introduce abstract TYPE_VIA_ISA and
 base vt82c686b_isa on it
In-Reply-To: <67bc4257-7b46-628c-6e46-916eff4206be@amsat.org>
Message-ID: <5f1ac469-9f5a-525c-2d2-8bd5a6198cc@eik.bme.hu>
References: <cover.1615943871.git.balaton@eik.bme.hu>
 <e5b92a771d811a46faf64ff56b2c07e6796eaf71.1615943871.git.balaton@eik.bme.hu>
 <67bc4257-7b46-628c-6e46-916eff4206be@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1212553515-1616009047=:70007"
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1212553515-1616009047=:70007
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Wed, 17 Mar 2021, Philippe Mathieu-Daudé wrote:
> On 3/17/21 2:17 AM, BALATON Zoltan wrote:
>> To allow reusing ISA bridge emulation for vt8231_isa move the device
>> state of vt82c686b_isa emulation in an abstract via_isa class. This
>> change breaks migration back compatibility but this is not an issue
>> for Fuloong2E machine which is not versioned or migration supported.
>>
>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>> ---
>>  hw/isa/vt82c686.c        | 70 ++++++++++++++++++++++------------------
>>  include/hw/pci/pci_ids.h |  2 +-
>>  2 files changed, 40 insertions(+), 32 deletions(-)
>
> Now than "hw/usb: Extract VT82C686 UHCI PCI function into a new unit"
> is merged as commit 6f2bcd5fc84, this is acceptable IMHO, so:
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Still don't see what does the USB function do with this that does not have 
any reference to USB but thanks. Will you send a pull requests with the 
series?

Regards,
BALATON Zoltan
--3866299591-1212553515-1616009047=:70007--

