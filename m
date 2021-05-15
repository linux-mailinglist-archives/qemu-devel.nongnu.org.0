Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 614CC381965
	for <lists+qemu-devel@lfdr.de>; Sat, 15 May 2021 16:36:50 +0200 (CEST)
Received: from localhost ([::1]:51124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhvPN-000144-CT
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 10:36:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lhvO8-00006H-GF
 for qemu-devel@nongnu.org; Sat, 15 May 2021 10:35:32 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:50705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lhvO6-0000aV-ET
 for qemu-devel@nongnu.org; Sat, 15 May 2021 10:35:32 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id CB77374570E;
 Sat, 15 May 2021 16:35:28 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id A8421745709; Sat, 15 May 2021 16:35:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id A69B77456E3;
 Sat, 15 May 2021 16:35:28 +0200 (CEST)
Date: Sat, 15 May 2021 16:35:28 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v3 00/11] PS/2 controller related fixes
In-Reply-To: <c136dc92-dd3a-4421-b0b7-86c4eadfc942@amsat.org>
Message-ID: <bc88eea0-b857-e732-444c-7690cb6cba9a@eik.bme.hu>
References: <d00ea6b1-43c7-78a2-8c0a-35e19efb5e46@t-online.de>
 <c136dc92-dd3a-4421-b0b7-86c4eadfc942@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-675773645-1621089328=:75694"
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?ISO-8859-15?Q?Volker_R=FCmelin?= <vr_qemu@t-online.de>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-675773645-1621089328=:75694
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Sat, 15 May 2021, Philippe Mathieu-Daudé wrote:
> On 5/15/21 1:31 PM, Volker Rümelin wrote:
>> This patch series fixes two different PS/2 mouse stream corruptions
>> and adds a feature that allows some old misbehaving DOS programs to
>> have a working keyboard. With the last few patches, the PS/2 con-
>> troller behaves more like a real controller.
>>
>> v2:
>> Introduce the function kbd_pending() in a preliminary patch to ease
>> the review of patch "pckbd: correctly disable PS/2 communication",
>> as Phillipe suggested.
>>
>> v3:
>> Patch "pckbd: correctly disable PS/2 communication" exposed a bug
>> in SeaBIOS. The updated patch keeps the relevant code. Until
>> SeaBIOS is fixed, the PS/2 controller command KBD_CCMD_KBD_DISABLE
>> must disable the keyboard interrupt.
>>
>> In patch "pckbd: PS/2 keyboard throttle" in function
>> kbd_throttle_timeout() an unnecessary if statement was removed.
>> The KBD_STAT_OBF flag is never set when kbd_throttle_timeout()
>> gets called.
>>
>> Volker Rümelin (11):
>>   ps2: fix mouse stream corruption
>>   ps2: don't raise an interrupt if queue is full
>>   ps2: don't deassert irq twice if queue is empty
>>   pckbd: split out interrupt line changing code
>>   pckbd: don't update OBF flags if KBD_STAT_OBF is set
>>   pckbd: PS/2 keyboard throttle
>>   pckbd: add state variable for interrupt source
>>   pckbd: add controller response queue
>>   pckbd: add function kbd_pending()
>>   pckbd: correctly disable PS/2 communication
>>   pckbd: remove duplicated keyboard and mouse defines
>
> Zoltan, you might want to test this series with your Pegasos2
> machine. It makes the keyboard detected correctly.
>
> There is still a problem with the mouse interaction with the
> host. Pressing Ctrl+Alt+G to ungrab the mouse, my host mouse
> is still responding to guest events... (unrelated to this series).
>
> Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> (PPC Pegasos2 so far)

I don't get the errors you reported. Keyboard and mouse seems to work OK 
for me with SDL on Linux and never got errors detecting it so far. What 
config are you using?

Regards,
BALATON Zoltan
--3866299591-675773645-1621089328=:75694--

