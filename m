Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F24903DE344
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 01:52:01 +0200 (CEST)
Received: from localhost ([::1]:38730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAhiz-0003ve-1B
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 19:52:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mAhf7-0007eh-3n; Mon, 02 Aug 2021 19:48:01 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:43681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mAhf5-0001Lt-GK; Mon, 02 Aug 2021 19:48:00 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 m20-20020a05600c4f54b029024e75a15716so983129wmq.2; 
 Mon, 02 Aug 2021 16:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LxrUf+V5rdS/E7RYx8c2BUNMNxZd6ZFF9nzrK1ohtvk=;
 b=AFP+udFXpk8p2ceKfzTOZowfoZDkQzxAOVauEQFNeHw/gnYuZaegQrRC1ivdng52tP
 u9w6p1GOUKaBkc5eLfMUOwAlqX16fajOQG77Yn3Qd3DYmJbsaiS6anTL7i+iYPqPamFD
 jBcPG4mtmfwh7ODzFaPg2wKd9w+iZeQjx3VV/vJ1ceYNrnANHHnlxF8Bi31xkP1ID2Dy
 QK7OTSIeMz219Cz32xxLQ+FyQM9KIzeamD8/OaMkAZNuTorfkNqrKBBKnVXBxCmGUeaV
 YLSlboivTYliL1hIx9oj8DuMiWOFzZkbHQ107JBY5EmB9v457zogTDOhKPc3Ix9h/eQo
 gsCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LxrUf+V5rdS/E7RYx8c2BUNMNxZd6ZFF9nzrK1ohtvk=;
 b=qm3mvUpw6o+UNXYBWkzf6HLmuHlkJjgwmua9eMJQe2hf2KQTusHvbiRcjRTZiZ8gdQ
 SFyA09kK2G5JlaJUTS+4GlDpuczWqB7qYg24hvk6UnZYoYKK9QNUi8Qfpcz2fTwkRHoR
 wzuzuMuprKD2EHC2LVlgA+v+m77TaJLPsaa5ADIDyzSqivN37G8SQB0E5+afGk/4jza3
 IywPbnUh+xH4JJy961TfUsBBA04Thop25GZkzAnrCKVLeQM8ec+GHSxJx785bWDGUp9Y
 iKMPZbQ7jxHVDVmQecDfCpiBCmxIJMjyvZgrewiZyhahwoq4m77lOE1BFUrIXNN2l/Mx
 4cDQ==
X-Gm-Message-State: AOAM532FDcb9vyGCF95K7qauOZ8y7HmFFvLfXr9EXmTSQaNKW4Qruiqz
 xSf4c2MHYO/8vcykVOGuh0mLeQu5h9MlXw==
X-Google-Smtp-Source: ABdhPJwOpWDD32/Bhjn8FHDLXOkl60mQPCv6ZU6+qOmzgNjcJJUIPedmKBCLbM/2rDbBk3LaOmT1lg==
X-Received: by 2002:a05:600c:3b08:: with SMTP id
 m8mr1264884wms.84.1627948075632; 
 Mon, 02 Aug 2021 16:47:55 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id 18sm5196691wmo.2.2021.08.02.16.47.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Aug 2021 16:47:54 -0700 (PDT)
Subject: Re: [PATCH-for-6.1 2/3] hw/sd/sdcard: Fix assertion accessing
 out-of-range addresses with CMD30
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210728181728.2012952-1-f4bug@amsat.org>
 <20210728181728.2012952-3-f4bug@amsat.org>
 <CAFEAcA8VSh-juGHeSa2N=d1izyexND24Er1B5YvX_4cR8kcUoQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <113b97d5-4aaa-2e8b-18d8-6168587fc4e2@amsat.org>
Date: Tue, 3 Aug 2021 01:47:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8VSh-juGHeSa2N=d1izyexND24Er1B5YvX_4cR8kcUoQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: Qemu-block <qemu-block@nongnu.org>, Bin Meng <bin.meng@windriver.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-stable <qemu-stable@nongnu.org>,
 Alexander Bulekov <alxndr@bu.edu>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/2/21 2:03 PM, Peter Maydell wrote:
> On Wed, 28 Jul 2021 at 19:19, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> OSS-Fuzz found sending illegal addresses when querying the write
>> protection bits triggers the assertion added in commit 84816fb63e5
>> ("hw/sd/sdcard: Assert if accessing an illegal group"):
>>
>>   qemu-fuzz-i386-target-generic-fuzz-sdhci-v3: ../hw/sd/sd.c:824: uint32_t sd_wpbits(SDState *, uint64_t):
>>   Assertion `wpnum < sd->wpgrps_size' failed.
>>   #3 0x7f62a8b22c91 in __assert_fail
>>   #4 0x5569adcec405 in sd_wpbits hw/sd/sd.c:824:9
>>   #5 0x5569adce5f6d in sd_normal_command hw/sd/sd.c:1389:38
>>   #6 0x5569adce3870 in sd_do_command hw/sd/sd.c:1737:17
>>   #7 0x5569adcf1566 in sdbus_do_command hw/sd/core.c:100:16
>>   #8 0x5569adcfc192 in sdhci_send_command hw/sd/sdhci.c:337:12
>>   #9 0x5569adcfa3a3 in sdhci_write hw/sd/sdhci.c:1186:9
>>   #10 0x5569adfb3447 in memory_region_write_accessor softmmu/memory.c:492:5
>>
>> It is legal for the CMD30 to query for out-of-range addresses.
>> Such invalid addresses are simply ignored in the response (write
>> protection bits set to 0).
>>
>> Note, we had an off-by-one in the wpgrps_size check since commit
>> a1bb27b1e98. Since we have a total of 'wpgrps_size' bits, the latest
>> valid group bit is 'wpgrps_size - 1'.
> 
> The commit message says "wpgrps_size - 1" is valid...
> 
>> @@ -820,8 +820,8 @@ static uint32_t sd_wpbits(SDState *sd, uint64_t addr)
>>
>>      wpnum = sd_addr_to_wpnum(addr);
>>
>> -    for (i = 0; i < 32; i++, wpnum++, addr += WPGROUP_SIZE) {
>> -        assert(wpnum < sd->wpgrps_size);
>> +    for (i = 0; i < 32 && wpnum < sd->wpgrps_size - 1;
> 
> ...but the code change makes the loop terminate when
> wpnum == wpgrps_size - 1, so we don't execute the loop
> body for wpgrps_size -1.
> 
> Which is correct ?

The problem is in sd_reset(), this code is hard for me to follow
(and I plan to refactor it during next dev cycle):

        blk_get_geometry(sd->blk, &sect);
    size = sect << 9;
    sect = sd_addr_to_wpnum(size) + 1;
    sd->wpgrps_size = sect;
    sd->wp_groups = bitmap_new(sd->wpgrps_size);

CID.WP_GRP_SIZE is defined as:

  The size of a write protected group. The content of this register
  is a 7-bit binary coded value, defining the number of erase sectors
  (see SECTOR_SIZE). The actual size is computed by increasing this
  number by one. A value of zero means one erase sector, 127 means
  128 erase sectors.

I think there is a confusion, wpgrps_size holds the real number of erase
sectors (used by the model, not returned in the CID.WP_GRP_SIZE
register). CID.WP_GRP_SIZE should be (wpgrps_size - 1).

Currently we iterate 1 sector number outside of the flash area.
To avoid that I used 'wpnum < sd->wpgrps_size - 1' instead of
'wpnum <= sd->wpgrps_size - 1'.

But with the fix you suggested responding to the cover, we don't hit
this case anymore. So I'll take it and clean the rest later.

Thanks,

Phil.

> 
>> +                i++, wpnum++, addr += WPGROUP_SIZE) {
> 
> thanks
> -- PMM
> 

