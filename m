Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D72356DB5
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 15:46:50 +0200 (CEST)
Received: from localhost ([::1]:51022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lU8W8-00028T-VI
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 09:46:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lU8U5-0000pK-2c; Wed, 07 Apr 2021 09:44:41 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:46973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lU8U3-0002bC-AQ; Wed, 07 Apr 2021 09:44:40 -0400
Received: by mail-ed1-x532.google.com with SMTP id h10so20907971edt.13;
 Wed, 07 Apr 2021 06:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pVjEkEd0rJdFI6frgYszT4iH3Yw4lr6Jqrs3qPUWk0c=;
 b=C90/nbPwfv+wZq4Fstcz68GolD53RBYgWxNvaO0iOWlBnuMs/X/SSs5hm60vra6nN+
 8lhd/k7jc1CeJopbpJSR81CpJ4sAFPAXjJ5p3aap6bLlEu/tAx0rwB8mwS4F/EOmHqnZ
 ks9du+D0lwhKgFF8nvzhL7ieZX1n7XkNd/cHWdzjllZEil5ic6cWZb4zLZr6ND0zB5p3
 pncjFkq+eYUV5pWmOZemKbkV85timMl9C6p00KH2NEPl8Pkn9u5e2WaqOstzoQzXqavr
 S3j3CNhYbwkGa05oyGdSy6wcx9f9pffOBj6Scwg1B+vfBT1pjSTWPa7f8tdc7T8vOum8
 RHGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pVjEkEd0rJdFI6frgYszT4iH3Yw4lr6Jqrs3qPUWk0c=;
 b=FNM2fKKtmDf5xVH+IlOKuoWupyBgsCyd/repg51jNNMXtteoG5l+OsmujKeCbNsNcG
 M8Q3oWsdzj4hN+RuHiLa65xMtlv0gRd1Ts59SlZfw91YQvEFXQVQapw1dJSytNqT3MEJ
 pauyhPZLF3k7pXbEdP6JW0L3f7X6GG5tRzFnoF/qRWmsf+0WGny0mD1+WGRxra7fLJKt
 ZQhv0QXFfNNt1ZShTfD5E5ZLzdV+gJ8IuX9+e0SwuUD3Gve9DZfSjuRD/sjrCtQz8NQi
 0F35pmYLdpqIyT1wVGaUitoHzTEDn0F9OLKZDKnrGIZgl7U4sug+UqhPGdqGWWMM4vju
 klXQ==
X-Gm-Message-State: AOAM530e4l1oD1F8KaPzaCypFfDRlOT3P0QSzIGs0QIFvDlBrT4GQQNG
 5ETqfjTREJtW6K2UpF4tXkA=
X-Google-Smtp-Source: ABdhPJwk+C13ti8G8VFs+flgXUIRbbMK4OljDDxCBy+nSwYC+fOIkobP9NHC2OkScoNN/dO9G3s1EQ==
X-Received: by 2002:aa7:d78a:: with SMTP id s10mr4455473edq.226.1617803077456; 
 Wed, 07 Apr 2021 06:44:37 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id i2sm16013413edy.72.2021.04.07.06.44.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Apr 2021 06:44:36 -0700 (PDT)
Subject: Re: [PATCH-for-6.0] hw/ppc/mac_newworld: Restrict RAM to 2 GiB
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20210406084842.2859664-1-f4bug@amsat.org>
 <97ed2955-e177-1ee5-cc68-052d7dd30b24@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b3211b93-62de-c36b-45ca-33da02a15736@amsat.org>
Date: Wed, 7 Apr 2021 15:44:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <97ed2955-e177-1ee5-cc68-052d7dd30b24@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x532.google.com
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
Cc: Greg Kurz <groug@kaod.org>, qemu-ppc@nongnu.org, 1922391@bugs.launchpad.net,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?H=c3=a5vard_Eidnes?= <he@NetBSD.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/7/21 3:11 PM, Mark Cave-Ayland wrote:
> On 06/04/2021 09:48, Philippe Mathieu-Daudé wrote:
> 
>> On Mac99 and newer machines, the Uninorth PCI host bridge maps
>> the PCI hole region at 2GiB, so the RAM area beside 2GiB is not
>> accessible by the CPU. Restrict the memory to 2GiB to avoid
>> problems such the one reported in the buglink.
>>
>> Buglink: https://bugs.launchpad.net/qemu/+bug/1922391
>> Reported-by: Håvard Eidnes <he@NetBSD.org>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>   hw/ppc/mac_newworld.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
>> index 21759628466..d88b38e9258 100644
>> --- a/hw/ppc/mac_newworld.c
>> +++ b/hw/ppc/mac_newworld.c
>> @@ -157,6 +157,10 @@ static void ppc_core99_init(MachineState *machine)
>>       }
>>         /* allocate RAM */
>> +    if (machine->ram_size > 2 * GiB) {
>> +        error_report("RAM size more than 2 GiB is not supported");
>> +        exit(1);
>> +    }
>>       memory_region_add_subregion(get_system_memory(), 0, machine->ram);
>>         /* allocate and load firmware ROM */
> 
> I think the patch is correct, however I'm fairly sure that the default
> g3beige machine also has the PCI hole located at 0x80000000 so the same
> problem exists there too.
> 
> Also are you keen to get this merged for 6.0? It doesn't seem to solve a
> security issue/release blocker and I'm sure the current behaviour has
> been like this for a long time...

No problem. I wanted to revisit this bug anyway, I realized during the
night, while this patch makes QEMU exit cleanly, it hides the bug which
is likely in TYPE_MACIO_IDE (I haven't tried Håvard's full reproducer).

Regards,

Phil.

