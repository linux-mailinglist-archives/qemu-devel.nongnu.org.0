Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9024250DF
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 12:18:44 +0200 (CEST)
Received: from localhost ([::1]:49572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYQU6-0008D6-RL
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 06:18:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mYQON-0005Ev-Jh
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 06:12:47 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:36748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mYQOM-0006vW-2r
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 06:12:47 -0400
Received: from [192.168.15.163] (unknown [195.68.53.70])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 5C85621C38;
 Thu,  7 Oct 2021 10:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1633601564;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s3SrEREsPkaEZOjw76QSaF64bTkPLyaUFZxQYSA5dmg=;
 b=3RG3axnL+5tKmvHmCLsImLQ3FserEzwpg3YaPkOGadCEWnPjZdW6hRVqK6ZEJyVvUtYCMx
 2JefJ3Iow7z4E1zmm2QnzLBrYCoaMjW8TNU4RRDEK6tsm3riY1/PooIuDByeRZmTAhGz7C
 mfDqytJVj4AFSCsGk5fH3vYhv8KXNsw=
Message-ID: <9b4ea846-5178-387f-cd0b-cd6e4ebcab7f@greensocs.com>
Date: Thu, 7 Oct 2021 12:12:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [PATCH] generic-loader: remove the ram_size limit when a loading
 binary file
Content-Language: en-US-large
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20211006113707.96907-1-damien.hedde@greensocs.com>
 <03e1e2d6-d974-272b-9d25-805914ec0026@redhat.com>
 <4fd0ab8a-7edb-a855-09ce-312ab2057325@greensocs.com>
 <871r4yf9eh.fsf@linaro.org> <0ae79bf2-4e97-07b6-2197-9b264d07f86c@redhat.com>
From: Damien Hedde <damien.hedde@greensocs.com>
In-Reply-To: <0ae79bf2-4e97-07b6-2197-9b264d07f86c@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.964,
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
Cc: Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 10/7/21 09:54, Philippe Mathieu-Daudé wrote:
> On 10/6/21 17:40, Alex Bennée wrote:
>>
>> Damien Hedde <damien.hedde@greensocs.com> writes:
>>
>>> On 10/6/21 13:49, Philippe Mathieu-Daudé wrote:
>>>> On 10/6/21 13:37, Damien Hedde wrote:
>>>>> Right now, we cannot load some binary file if it is bigger than the
>>>>> machine's ram size. This limitation only occurs when loading a
>>>>> binary file: we can load a corresponding elf file without this
>>>>> limitation.
>>>>>
>>>>> This is an issue for machines that have small ram or do not use the
>>>>> ram_size feature at all.
>>>>>
>>>>> Also get rid of "hw/boards.h" include, since we needed it only
>>>>> to access `current_machine`.
>>>>>
>>>>> Fixes: e481a1f63c9 ("generic-loader: Add a generic loader")
>>>>> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
>>>>> ---
>>>>>
>>>>> Hi Alistair,
>>>>>
>>>>> I found this while experimenting with a ram_size=0 machine.
>>>
>>>
>>>
>>>> Where are you loading your file?
>>>>
>>>
>>> In a rom.
>>>
>>> The loader does not check at all that we are loading to the machine's
>>> ram. It just check the size for the raw binary file format.
>>
>> It does beg the question of why you don't just construct your ROM file
>> with the image in place there? Is this just a development convenience?
> 
> generic-loader is designed from a CPU perspective, it uses the CPU AS
> to load the image.
> 
> If your image is in ROM, I'm not sure this is the correct API. I'd try
> to do this without considering any CPU in the picture. The rom_add_*()
> API might be more appropriate.
> 
> My 2 cents anyway...
> 

I was looking for a user way of loading data in a memory-mapped area so 
I cannot use rom_add_*().
I though the loader goal was to load something to any memory. But maybe 
I am mistaken.

Damien

