Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1823348B1
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 21:13:26 +0100 (CET)
Received: from localhost ([::1]:34926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK5Cv-0008EY-89
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 15:13:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lK5BL-0007Ii-0q
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 15:11:47 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:46724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lK5BI-0007RB-Ke
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 15:11:46 -0500
Received: by mail-ej1-x62b.google.com with SMTP id r17so41254612ejy.13
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 12:11:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ImtclYJEbUKWmXZfjR2Pm8fPPyFeWxVIlAt9faPuf0g=;
 b=tcMRSv0Zvr4lyLS5wk63fw8abxP5Nm+XYO+0i/A8q9ypAFsmmA5mngnm3gYWYu15L+
 xGnsWQjkPdYCShwYAZ7YePMWLvwyW8XtUC9hJ2yFV5wtEFkNRwVwVB46ECFtV3sOMVJS
 4neTENgkH1BxUn4PRjeQsEK1n95nXL8vH8uxVTnvTtzcW+jsauB3kLMo2qo194lQo6gB
 7ulAdCpkQZ+9bqmpA0QiVzZUBENiAfzJu6e2crBCjI3QS3/cmU8sSPF6/q8Prl8pQjE+
 Jsh2kHazVScWRahq4vHAMIv0d01WMMAK8DRhjPK31EF1QK3973hqJOiW6lWp0+Id7okX
 3rWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ImtclYJEbUKWmXZfjR2Pm8fPPyFeWxVIlAt9faPuf0g=;
 b=JzlgLWUNZnXfcef0p1UkH7TDy000Vw67gsv8ow9PyiGiZtzb3zF2Ob8mah6jowaI3i
 DJX8h+hwAwwQ9RBeqh1ulixRlNneAAe2pK4rSwkXBQ8hwQqjdjhxwrEcntXcXWDxDNvd
 OQl8ORn6k19qf8J9Q/DkxrP2XLx9DVP32f+mzQcvxOAyUjcIn5LW778EwBzQplStMKjS
 LRbBjqIYxx2Cw4ZdDBO+sb0wkFwyT/AJjwRhqgqQLQCICDuoQapZTQGS2V+CdxPer+mA
 UPwD0E9D2uMGPrVtUUftk9THaZ7ilzD/PMVzYzPdfNENF1jMx5YBEMiipgPFhRS38nG5
 d+hw==
X-Gm-Message-State: AOAM533umNlKJFTAXYdBdIuBwdFEI4u/iwt4c1WqiaCbMp9OEtwau9us
 QFE8mMSRv13E2EAN6kVo5lE=
X-Google-Smtp-Source: ABdhPJwAKzjfoS+l1CVUDL6vSqgW+isJ27dDuI5+xpN30jWl2HdfUeGmQojW+lAzrU3gh6cWkft8GQ==
X-Received: by 2002:a17:906:a443:: with SMTP id
 cb3mr163828ejb.542.1615407102812; 
 Wed, 10 Mar 2021 12:11:42 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id m14sm139451edd.63.2021.03.10.12.11.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Mar 2021 12:11:42 -0800 (PST)
Subject: Re: [PATCH 1/2] hw/mips/jazz: Use generic I/O bus via get_system_io()
To: Peter Xu <peterx@redhat.com>
References: <f776956e-dd3b-98f8-4b99-0cd234d227c0@amsat.org>
 <20210310191255.1229848-1-f4bug@amsat.org> <20210310194924.GF6530@xz-x1>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <5e53b99f-548c-8da9-f6fd-9c764642350b@amsat.org>
Date: Wed, 10 Mar 2021 21:11:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210310194924.GF6530@xz-x1>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Alexander Bulekov <alxndr@bu.edu>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/10/21 8:49 PM, Peter Xu wrote:
> On Wed, Mar 10, 2021 at 08:12:54PM +0100, Philippe Mathieu-Daudé wrote:
>> No need to create a local ISA I/O MemoryRegion, use get_system_io().
>>
>> This partly reverts commit 5c63bcf7501527b844f61624957bdba254d75bfc.
> 
> I think it's not a clean revert of that, see below.
> 
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  hw/mips/jazz.c | 6 ++----
>>  1 file changed, 2 insertions(+), 4 deletions(-)
>>
>> diff --git a/hw/mips/jazz.c b/hw/mips/jazz.c
>> index 1a0888a0fd5..9ac9361b7eb 100644
>> --- a/hw/mips/jazz.c
>> +++ b/hw/mips/jazz.c
>> @@ -158,7 +158,6 @@ static void mips_jazz_init(MachineState *machine,
>>      rc4030_dma *dmas;
>>      IOMMUMemoryRegion *rc4030_dma_mr;
>>      MemoryRegion *isa_mem = g_new(MemoryRegion, 1);
>> -    MemoryRegion *isa_io = g_new(MemoryRegion, 1);
>>      MemoryRegion *rtc = g_new(MemoryRegion, 1);
>>      MemoryRegion *i8042 = g_new(MemoryRegion, 1);
>>      MemoryRegion *dma_dummy = g_new(MemoryRegion, 1);
>> @@ -259,11 +258,10 @@ static void mips_jazz_init(MachineState *machine,
>>      memory_region_add_subregion(address_space, 0x8000d000, dma_dummy);
>>  
>>      /* ISA bus: IO space at 0x90000000, mem space at 0x91000000 */
>> -    memory_region_init(isa_io, NULL, "isa-io", 0x00010000);
>>      memory_region_init(isa_mem, NULL, "isa-mem", 0x01000000);
>> -    memory_region_add_subregion(address_space, 0x90000000, isa_io);
>> +    memory_region_add_subregion(address_space, 0x90000000, get_system_io());
> 
> The old code has an alias created just for adding subregion into address_space:
> 
> -    /* ISA IO space at 0x90000000 */
> -    memory_region_init_alias(isa, NULL, "isa_mmio",
> -                             get_system_io(), 0, 0x01000000);
> -    memory_region_add_subregion(address_space, 0x90000000, isa);
> -    isa_mem_base = 0x11000000;
> 
> While you didn't revert that part.  Maybe that's the issue?

Hmm I'll have a look. This is not the series I'm working on, which
is much bigger and not ready for posting yet. I simply looked for
something similar (a bus mapped into sysbus) and remembered the
ISA bus from Jazz machines. I'll see if I can find a better PoC.

Thanks for having a look at this patch,

Phil.

