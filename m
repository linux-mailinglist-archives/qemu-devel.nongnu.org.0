Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 961B86A1C48
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 13:37:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVXJN-00027e-60; Fri, 24 Feb 2023 07:36:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pVXJG-000272-0i; Fri, 24 Feb 2023 07:36:22 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pVXJD-0007IL-IF; Fri, 24 Feb 2023 07:36:21 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id E44FF74635C;
 Fri, 24 Feb 2023 13:36:14 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id A25BC746346; Fri, 24 Feb 2023 13:36:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id A0A4B745720;
 Fri, 24 Feb 2023 13:36:14 +0100 (CET)
Date: Fri, 24 Feb 2023 13:36:14 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Peter Maydell <peter.maydell@linaro.org>
cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, 
 Gerd Hoffmann <kraxel@redhat.com>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>, 
 Sebastian Bauer <mail@sebastianbauer.info>
Subject: Re: [PATCH] hw/display/sm501: Add alternatives to pixman routines
In-Reply-To: <CAFEAcA9w68d9ChqMq6zwfiJwMjkbHXbDefCk4Dm7Z8aya-7CPg@mail.gmail.com>
Message-ID: <a6f8c603-a231-40ea-0898-f97800a33517@eik.bme.hu>
References: <20230224001852.4B813746324@zero.eik.bme.hu>
 <CAFEAcA9w68d9ChqMq6zwfiJwMjkbHXbDefCk4Dm7Z8aya-7CPg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, 24 Feb 2023, Peter Maydell wrote:
> On Fri, 24 Feb 2023 at 00:18, BALATON Zoltan <balaton@eik.bme.hu> wrote:
>>
>> Pixman can sometimes return false so add fallbacks for such cases and
>> also add a property to disable pixman and always use the fallbacks
>> which can be useful on platforms where pixman is broken or for testing
>> different drawing methods.
>>
>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>> ---
>> Also ping for the other sm501 patch I've sent a week ago:
>> https://patchew.org/QEMU/20230216144043.D632874634B@zero.eik.bme.hu/
>> These two patches are needed to fix graphics issues with AmigaOS so
>> I'd like them to be merged for 8.0
>>
>> @@ -2010,6 +2035,7 @@ static void sm501_realize_sysbus(DeviceState *dev, Error **errp)
>>  static Property sm501_sysbus_properties[] = {
>>      DEFINE_PROP_UINT32("vram-size", SM501SysBusState, vram_size, 0),
>>      DEFINE_PROP_UINT32("base", SM501SysBusState, base, 0),
>> +    DEFINE_PROP_BOOL("x-pixman", SM501SysBusState, state.use_pixman, true),
>>      DEFINE_PROP_END_OF_LIST(),
>>  };
>>
>> @@ -2093,6 +2119,7 @@ static void sm501_realize_pci(PCIDevice *dev, Error **errp)
>>
>>  static Property sm501_pci_properties[] = {
>>      DEFINE_PROP_UINT32("vram-size", SM501PCIState, vram_size, 64 * MiB),
>> +    DEFINE_PROP_BOOL("x-pixman", SM501PCIState, state.use_pixman, true),
>>      DEFINE_PROP_END_OF_LIST(),
>>  };
>
> I don't think this should be a user-facing property on a single
> graphics device. Either pixman works, or it doesn't (in which
> case we might need to do configure time checks and have a
> fallback), but we shouldn't make the user have to set an
> undocumented property on the device to get it to work.

This is mostly for testing now, that's why I've also called it with an x- 
prefix and not intended as a final solution or something that users would 
need to use. I'd decide later if we want to keep pixman or replace it with 
something else (as the problems we found with recently makes me think it 
might not be such a good idea after all) but for now I need a way to 
control it and do testing with or without pixman to get some data to help 
to decide what to do with it. This patch should handle tha cases where 
pixman returns false (like missing implementation on macOS aarch64) so no 
need to set this option normally. It's only when I want to easily test if 
a problem is pixman related, so I can easily set it to fallback or ask 
users who report a problem to try that. If you think this should be 
clarified in the commit message can you please suggest a consise sentence 
to describe this in a way that makes sense in English?

Regards,
BALATON Zoltan

