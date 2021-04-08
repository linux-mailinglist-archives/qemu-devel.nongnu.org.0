Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D36358033
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 12:05:01 +0200 (CEST)
Received: from localhost ([::1]:39802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lURX2-0001Y8-9D
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 06:05:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lURVM-0000gb-Np; Thu, 08 Apr 2021 06:03:16 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:35604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lURVK-00022C-TF; Thu, 08 Apr 2021 06:03:16 -0400
Received: by mail-ed1-x536.google.com with SMTP id x4so1690453edd.2;
 Thu, 08 Apr 2021 03:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MaV1shj6dulcJD9GKaTSpKN2ejMx8BpghaOG/stPIsA=;
 b=Ji/TOJGQX4qgRAQmMETPGe3lbdgrNzNVkEtrv+6L3fFYA++lOnnFQ9VK/Eh4LjxcQQ
 W5CoI/JJiAKc99H7zrKyhcTf6ZfOf02YdicVqZACK8DYRM8vtezE11EtDkNnWRQffk7U
 ViOOw9uh5sCu/mhvxjd6tAw++7ogqIgP5jNYSjEaRIPvupZ+VjW2XXrnOQwVyHWmNgXM
 SW38Inoxnd5tZHi3BS3FP0t3abAmDFNMpK+QPCseBHPZwt1uI2i8bcyj3tsNGMPRIGAa
 U723VcnwaqipP5/q3VIrGFW4je+1LfpCg1vSoeUvOTVchQMg80a3cuboAXZ6MSoPr5lE
 eLBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MaV1shj6dulcJD9GKaTSpKN2ejMx8BpghaOG/stPIsA=;
 b=IX2UVNKRoJwMPhOzzmt5qVdtS1af/BvsfCZ1C7sl5dKQrcA86hK3RVp8w4cvYy17rc
 xVQPQu/5ATCED/+oqxP+XTa2xxyLSYmHO7RODrNa1UyqFiar+JIVanfc0rLwtPUjcenH
 iAOGH2haT9KfOJyb5SvnFcsH7SRM6wjxjHiCJ9eB+FjhUkwdMwCcQEneSQ2ZBnmfMo8B
 BQNwhHkYwp2PlAuUiKGe/tMLcIz7A0XbfJertRCl5Aqn3iZk+d3q5GqitxOIht3JjUAx
 IIgzuQ8H/bvwSTTw4rXUkqZHh6EHPSe1Ksvfn58nrQuned6Y+PQ9cMcEiIzASjg+f6KD
 AyqQ==
X-Gm-Message-State: AOAM533CPLQL+9DgLd+vfXJfMEvNi+jEbEwzSale6apZutmhjWIGN3xp
 fF5OB0Y+PXVIfTeSF+7rfHg=
X-Google-Smtp-Source: ABdhPJyfzJ1ws2XIK8aiEfmXjqjpNdwoOpzFW6P/aXXW2ESe14UlmzdHVxtKwrTeXtiPBIBSGf7JJg==
X-Received: by 2002:a05:6402:2070:: with SMTP id
 bd16mr10066016edb.133.1617876193172; 
 Thu, 08 Apr 2021 03:03:13 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id g20sm17025117edb.7.2021.04.08.03.03.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Apr 2021 03:03:12 -0700 (PDT)
Subject: Re: [PATCH-for-6.0?] hw/block/fdc: Fix 'fallback' property on sysbus
 floppy disk controllers
To: Markus Armbruster <armbru@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>
References: <20210407133742.1680424-1-f4bug@amsat.org>
 <87ft01ce0o.fsf@dusky.pond.sub.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <6aaad65e-c4a1-5565-97f6-9c47b13c68cc@amsat.org>
Date: Thu, 8 Apr 2021 12:03:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87ft01ce0o.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/8/21 11:38 AM, Markus Armbruster wrote:
> Philippe Mathieu-Daudé <f4bug@amsat.org> writes:
> 
>> Setting the 'fallback' property corrupts the QOM instance state
>> (FDCtrlSysBus) because it accesses an incorrect offset (it uses
>> the offset of the FDCtrlISABus state).
>>
>> Fixes: a73275dd6fc ("fdc: Add fallback option")
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  hw/block/fdc.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/block/fdc.c b/hw/block/fdc.c
>> index 82afda7f3a7..a825c2acbae 100644
>> --- a/hw/block/fdc.c
>> +++ b/hw/block/fdc.c
>> @@ -2893,7 +2893,7 @@ static Property sysbus_fdc_properties[] = {
>>      DEFINE_PROP_SIGNED("fdtypeB", FDCtrlSysBus, state.qdev_for_drives[1].type,
>>                          FLOPPY_DRIVE_TYPE_AUTO, qdev_prop_fdc_drive_type,
>>                          FloppyDriveType),
>> -    DEFINE_PROP_SIGNED("fallback", FDCtrlISABus, state.fallback,
>> +    DEFINE_PROP_SIGNED("fallback", FDCtrlSysBus, state.fallback,
>>                          FLOPPY_DRIVE_TYPE_144, qdev_prop_fdc_drive_type,
>>                          FloppyDriveType),
>>      DEFINE_PROP_END_OF_LIST(),
>> @@ -2918,7 +2918,7 @@ static Property sun4m_fdc_properties[] = {
>>      DEFINE_PROP_SIGNED("fdtype", FDCtrlSysBus, state.qdev_for_drives[0].type,
>>                          FLOPPY_DRIVE_TYPE_AUTO, qdev_prop_fdc_drive_type,
>>                          FloppyDriveType),
>> -    DEFINE_PROP_SIGNED("fallback", FDCtrlISABus, state.fallback,
>> +    DEFINE_PROP_SIGNED("fallback", FDCtrlSysBus, state.fallback,
>>                          FLOPPY_DRIVE_TYPE_144, qdev_prop_fdc_drive_type,
>>                          FloppyDriveType),
>>      DEFINE_PROP_END_OF_LIST(),
> 
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
> 
> On whether to pick this into 6.0...
> 
> The patch has no effect unless someone or something uses "fallback" with
> a non-ISA FDC.  There it fixes a bug.  The bug's exact impact is
> unknown.  I figure I could find out, but it doesn't seem to be worth the
> bother.

non-ISA FDC is only used on MIPS/SPARC.

> Commit a73275dd6fc:
> 
>     Currently, QEMU chooses a drive type automatically based on the inserted
>     media. If there is no disk inserted, it chooses a 1.44MB drive type.
>     
>     Change this behavior to be configurable, but leave it defaulted to 1.44.
>     
>     This is not earnestly intended to be used by a user or a management
>     library, but rather exists so that pre-2.6 board types can configure it
>     to be a legacy value.
> 
> We do so only for "isa-fdc", in hw/core/machine.c.
> 
> I don't understand why we don't for the other devices, but that's
> outside this patch's scope.
> 
> Downstreams could do it, but it wouldn't work.  They need this commit to
> make it work.
> 
> Users (human or management application) should not use it, but of course
> they might anyway.  This commit makes such (unadvisable) usage safe.
> 
> The reward is low, but so is the risk.  If I was the maintainer, I'd be
> tempted to take it up to rc3.

Thanks for the impact analysis.

The fix seems harmless to me, but I'm fine having it fixed in 6.1
(this is an old bug, so not critical to have it fixed for 6.0).

Phil.

