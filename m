Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D234836D76F
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 14:34:42 +0200 (CEST)
Received: from localhost ([::1]:40222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbjOr-0001fI-RB
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 08:34:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lbjL9-00085p-4O
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 08:30:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33100)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lbjL6-0006Md-3K
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 08:30:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619613045;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RFMaNcfD4i64hD5CgpUAkqBhzh7lLu8n56NmIY9pkEY=;
 b=DcZDDc3sPqMz6EwrLtNjxYtQuCg8okDXdmgJ3VUmrmXuioO8kI+ggA/DBkwBITFhwjFIS9
 wyrqvkGBc4jE6HDBQRmzlQpgLqMQw2anjE+Bt+P+QzBFuLI1vWAanpqavQglz+mK1+PYHy
 Gbn6Eu48D+41Ef+U6A8tSG8lHXxSSe4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-511-_zj7daqsOzuc32xnZ4HynQ-1; Wed, 28 Apr 2021 08:30:43 -0400
X-MC-Unique: _zj7daqsOzuc32xnZ4HynQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 x10-20020adfc18a0000b029010d83c83f2aso19034wre.8
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 05:30:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RFMaNcfD4i64hD5CgpUAkqBhzh7lLu8n56NmIY9pkEY=;
 b=qDlwvKZGZLkdQPXheA49bZKIcW9kvHcloH4NLsbKBeIO1SrxcBHW2xAGZe38CYq0Ag
 hwibExYMV/ldmYZ4YRNtFlJ53QY3hMdDdcMW5bmF40aAbLBAEu9oSJJpsZum7x9GSYLM
 5rQJB//InjzHMAJdB+aZsM5hBLLyjvKzuYT64X/iDAgT6Be1n4F3og2oyy8efj+X9N/M
 9HulQ5ucgj+jP5aBbN8Y9VAdcgOLV6zczWfoaKy9KLMZ8N0G8+u1NQmsoWYQAWk4+8W0
 Z3n1AVEpl6OWnr7T2eKVndrItjx7uEWLZ8DWORITte3RRhO/ZXAXvyCI8zHGUPGAzfqB
 i+2g==
X-Gm-Message-State: AOAM530IdTMZTLdyqzphdOfU4h6czMBUMdfXD1PaQSSg4txEmpOet1lA
 8izmSNh+Sf+hUzniLCZ9cXy8x0iLUJ2ahB//5O0Et0jwusGpOQlIXi6IeWH2Lj+Hy0E0enLh9av
 EkoovBvuIJ/mkFcU=
X-Received: by 2002:adf:e8c4:: with SMTP id k4mr36420888wrn.262.1619613042629; 
 Wed, 28 Apr 2021 05:30:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwuJr4sniF/9+LYzfvNBZOHkxWFsyq5W0svt58qXweS/vnsUkGGk5yfyzk2WJOQkISmBibVEw==
X-Received: by 2002:adf:e8c4:: with SMTP id k4mr36420850wrn.262.1619613042389; 
 Wed, 28 Apr 2021 05:30:42 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id d13sm6317429wrx.29.2021.04.28.05.30.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Apr 2021 05:30:41 -0700 (PDT)
Subject: Re: [PATCH 4/4] hw/block/fdc: Extract SysBus floppy controllers to
 fdc-sysbus.c
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20210415102321.3987935-1-philmd@redhat.com>
 <20210415102321.3987935-5-philmd@redhat.com>
 <0812a48a-36c6-8152-e8f1-f97c755b9f55@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <3053142c-7588-92ea-00a2-96847c08c0e9@redhat.com>
Date: Wed, 28 Apr 2021 14:30:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <0812a48a-36c6-8152-e8f1-f97c755b9f55@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Max Reitz <mreitz@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Miroslav Rezanina <mrezanin@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/27/21 7:34 PM, John Snow wrote:
> On 4/15/21 6:23 AM, Philippe Mathieu-Daudé wrote:
>> Some machines use floppy controllers via the SysBus interface,
>> and don't need to pull in all the SysBus code.
>> Extract the SysBus specific code to a new unit: fdc-sysbus.c,
>> and add a new Kconfig symbol: "FDC_SYSBUS".
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> 
> LGTM, but again you'll want someone to review the Kconfig changes. It
> looks reasonable to me at a glance, but I just don't know what I don't
> know there.
> 
> I'm trusting you somewhat that you've audited the proper dependencies
> for each subsystem and that these have been accurately described via
> Kconfig -- my knowledge of non-x86 platforms is a bit meager, so I am
> relying on CI to tell me if this breaks anything I care about.

The way I test these Kconfig changes is configuring with
--without-default-devices, and build/test for each machine doing:

$ echo $MACHINE=y > default-configs/devices/$arch-softmmu.mak

(I overwrite because currently we don't support having a base
config different than the default-configs one).

For example for the SPARCbook machine:

$ echo CONFIG_SUN4M=y > default-configs/devices/sparc-softmmu.mak
$ ninja qemu-system-sparc
$ qemu-system-sparc -M SPARCbook -S

Or for the Jazz machine:

$ echo CONFIG_JAZZ=y > default-configs/devices/mips64el-softmmu.mak
$ echo CONFIG_SEMIHOSTING=y >> default-configs/devices/mips64el-softmmu.mak
$ ninja qemu-system-mips64el
$ ./qemu-system-mips64el -M pica61 -S

(The CONFIG_SEMIHOSTING is a particular kludge pending another series)

But unfortunately there are predating bugs breaking this testing.

I'll add this information in the respin's cover.

> Would love to get an ACK from Mark Cave-Ayland and Hervé Poussineau if
> possible, but if they're not available to take a quick peek, we'll try
> to get this in closer to the beginning of the dev window to maximize
> problem-finding time.

The sun4m maintainer is Artyom.

> Reviewed-by: John Snow <jsnow@redhat.com>

Thanks!

> 
>> ---
>>   hw/block/fdc-sysbus.c | 252 ++++++++++++++++++++++++++++++++++++++++++
>>   hw/block/fdc.c        | 220 ------------------------------------
>>   MAINTAINERS           |   1 +
>>   hw/block/Kconfig      |   4 +
>>   hw/block/meson.build  |   1 +
>>   hw/block/trace-events |   2 +
>>   hw/mips/Kconfig       |   2 +-
>>   hw/sparc/Kconfig      |   2 +-
>>   8 files changed, 262 insertions(+), 222 deletions(-)
>>   create mode 100644 hw/block/fdc-sysbus.c


