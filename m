Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6FF33332E
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 03:34:56 +0100 (CET)
Received: from localhost ([::1]:45678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJogY-0006T5-M1
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 21:34:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lJofU-0005Yf-6a
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 21:33:48 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:50555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lJofM-0006MT-3T
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 21:33:45 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 2210D7456E3;
 Wed, 10 Mar 2021 03:33:31 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id F09FC7456B8; Wed, 10 Mar 2021 03:33:30 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id EE8167456B7;
 Wed, 10 Mar 2021 03:33:30 +0100 (CET)
Date: Wed, 10 Mar 2021 03:33:30 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH 3/3] hw/usb: Extract VT82C686 UHCI PCI function into a
 new unit
In-Reply-To: <fd9c7195-1396-f622-4867-6dec8527dfd3@amsat.org>
Message-ID: <a846dfb-ebf7-c84d-dbbd-119c357cdf64@eik.bme.hu>
References: <20210309190802.830969-1-f4bug@amsat.org>
 <20210309190802.830969-4-f4bug@amsat.org>
 <4ffa2641-2b53-467-337d-38926c02b4b@eik.bme.hu>
 <fd9c7195-1396-f622-4867-6dec8527dfd3@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-235930628-1615343610=:20835"
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
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-235930628-1615343610=:20835
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Wed, 10 Mar 2021, Philippe Mathieu-Daudé wrote:
> On 3/9/21 9:13 PM, BALATON Zoltan wrote:
>> On Tue, 9 Mar 2021, Philippe Mathieu-Daudé wrote:
>>> Extract the VT82C686 PCI UHCI function into a new unit so
>>> it is only build when the VT82C686 south bridge is selected.
>>
>> I'm not sure it's worth separating just this one device from the other
>> similar usb devices when the others that are also part of south bridge
>> chips are left there. Maybe you could just set user_creatable = false so
>> it can only be created as part of the chips that contain it or just
>> don't bother and leave it as it is which is the least likely to break
>> anything that may rely on it as removing it from the device list may
>> need to go through deprecation.
>>
>> But I don't really mind, so if others like this approach I don't want to
>> block the patch. I think it's unlikely anybody would use this device
>> other than part of fuloong2e or pegasos2 so probably it's unlikely to
>> break anything if it suddenly goes away from a new build.
>
> OK. As I sent this series to help you with your Pegasos2 board, do you
> mind sending a patch then?
>
> I suppose you mean using "#include CONFIG_DEVICES" and checking for the
> CONFIG_VT82C686 symbol to register the QOM type?

I don't see how this should help with the pegasos2 series as that's 
already working without this change. I really just meant I don't see this 
would improve much when you leave the piix and ich ones there that are the 
same for other south bridges so this patch makes one of these configurable 
but not the others, that makes them different when they are now similar. 
Additionally it may break something as it changes the availability of this 
device (although that's very unlikely to cause problems in practice). So 
I'd just leave this alone for now and not change it at all until all of 
these are cleaned up in a uniform way at some later point if that's deemed 
useful or desirable. Maybe I'm missing the point though.

But while pegasos2 does not need this change it should also not break it 
so I don't really mind.

Regards,
BALATON Zoltan
--3866299591-235930628-1615343610=:20835--

