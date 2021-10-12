Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83813429E28
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 08:54:30 +0200 (CEST)
Received: from localhost ([::1]:45536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maBgD-00030P-IP
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 02:54:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1maBes-0001jN-KP
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 02:53:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31009)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1maBer-0004bS-1b
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 02:53:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634021584;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xpuiDMg/cC3UJbfgojje+yPWboAjYPrurjg7f2bPdBU=;
 b=OQKlK2vGAnNmaRBO3+oxbnAuKqitvb24sOD5g0c9Ilp/3i+KLHVc0eUH5Cfy1Y4jKCrPeB
 qeUHHEASIXJo4+SNdnhpTXPCkyTB9+gTuzWKD33kl/ZBvmI3DefSNzfvfJjjYdppq3SNXc
 Qnno6YfGQ6m0+IUlNdOcr1AA8S8IRug=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-181-DEpA9yrKMEmv3uGmu3wQFQ-1; Tue, 12 Oct 2021 02:53:03 -0400
X-MC-Unique: DEpA9yrKMEmv3uGmu3wQFQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 41-20020adf812c000000b00160dfbfe1a2so11314938wrm.3
 for <qemu-devel@nongnu.org>; Mon, 11 Oct 2021 23:53:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xpuiDMg/cC3UJbfgojje+yPWboAjYPrurjg7f2bPdBU=;
 b=vzWZ9MnLEOtkdJz3ny92r7tMU7QpdlZGp3A3FfAArjp6GqGnz3thRTOfOCbbYoiyU3
 +LFedhy1TmS4huPUsgpb9t30HrPTUcDIoDuK8JJc2qcpJ9g0732rVFNqZ74cIboUeLN4
 vHfwMjWK/VFmp3q1QAymtuWmZyHEbKqo+Cpj4W/kCHkLQ4b5dpgWmyn6kUNp9M+MgwGh
 B46vTwmdxmoBrXMIpRd+z4kq8L9QW745K47Zy7oa0wLx7Itjj6fnI72mq+FNnwI+Boq3
 jhe41vZ7hxYLPaneoKolmCqjnXVzhPC7VxphKjkDxrEf1M5pvLpkAFsNYTim9XZwyljC
 KIjg==
X-Gm-Message-State: AOAM531DaOgQunESVUUEdb+I2FEIflGwW5zQkgn3XNwtIdEhPBo0ZG+W
 2hBGdd5P8+B1M6aXc0CYeNnx0ULn+1wW7uIbhz2p2rGiBwW/4K9yqCS8Hee8P4bdOBcnGQwBjBQ
 0qE4dWtaVdsu7QpU=
X-Received: by 2002:a5d:648f:: with SMTP id o15mr30120277wri.3.1634021582087; 
 Mon, 11 Oct 2021 23:53:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy1Kt0MRuuVTdSS9CbyG40D28KYu741G6y8ws6pwN33W2yoTiHFGGKbFaPfFoxK1KW2P1I0Aw==
X-Received: by 2002:a5d:648f:: with SMTP id o15mr30120262wri.3.1634021581808; 
 Mon, 11 Oct 2021 23:53:01 -0700 (PDT)
Received: from thuth.remote.csb (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id g12sm1701279wme.3.2021.10.11.23.53.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Oct 2021 23:53:01 -0700 (PDT)
Subject: Re: [PATCH] s390x/ipl: check kernel command line size
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Marc Hartmayer <mhartmay@linux.ibm.com>, qemu-devel@nongnu.org
References: <20211006092631.20732-1-mhartmay@linux.ibm.com>
 <4683659f-1efe-7c1a-070e-21803f5c8100@redhat.com>
 <016d8001-24aa-b4e3-ce1a-92f275d4bec5@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <3f5dbbea-aeb7-b0a8-2eed-209c9a0a4ba6@redhat.com>
Date: Tue, 12 Oct 2021 08:53:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <016d8001-24aa-b4e3-ce1a-92f275d4bec5@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>,
 qemu-s390x <qemu-s390x@nongnu.org>, Cornelia Huck <cohuck@redhat.com>,
 Sven Schnelle <svens@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/10/2021 20.08, Philippe Mathieu-Daudé wrote:
> On 10/11/21 15:38, Thomas Huth wrote:
>> On 06/10/2021 11.26, Marc Hartmayer wrote:
>>> Check if the provided kernel command line exceeds the maximum size of
>>> the s390x
>>> Linux kernel command line size, which is 896 bytes.
>>>
>>> Reported-by: Sven Schnelle <svens@linux.ibm.com>
>>> Signed-off-by: Marc Hartmayer <mhartmay@linux.ibm.com>
>>> ---
>>>    hw/s390x/ipl.c | 12 +++++++++++-
>>>    1 file changed, 11 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/hw/s390x/ipl.c b/hw/s390x/ipl.c
>>> index 1821c6faeef3..a58ea58cc736 100644
>>> --- a/hw/s390x/ipl.c
>>> +++ b/hw/s390x/ipl.c
>>> @@ -38,6 +38,7 @@
>>>    #define KERN_IMAGE_START                0x010000UL
>>>    #define LINUX_MAGIC_ADDR                0x010008UL
>>>    #define KERN_PARM_AREA                  0x010480UL
>>> +#define KERN_PARM_AREA_SIZE             0x000380UL
>>>    #define INITRD_START                    0x800000UL
>>>    #define INITRD_PARM_START               0x010408UL
>>>    #define PARMFILE_START                  0x001000UL
>>> @@ -190,10 +191,19 @@ static void s390_ipl_realize(DeviceState *dev,
>>> Error **errp)
>>>             * loader) and it won't work. For this case we force it to
>>> 0x10000, too.
>>>             */
>>>            if (pentry == KERN_IMAGE_START || pentry == 0x800) {
>>> -            char *parm_area = rom_ptr(KERN_PARM_AREA,
>>> strlen(ipl->cmdline) + 1);
>>> +            size_t cmdline_size = strlen(ipl->cmdline) + 1;
>>> +            char *parm_area = rom_ptr(KERN_PARM_AREA, cmdline_size);
>>> +
>>>                ipl->start_addr = KERN_IMAGE_START;
>>>                /* Overwrite parameters in the kernel image, which are
>>> "rom" */
>>>                if (parm_area) {
>>> +                if (cmdline_size > KERN_PARM_AREA_SIZE) {
>>> +                    error_setg(errp,
>>> +                               "kernel command line exceeds maximum
>>> size: %lu > %lu",
>>
>> I think the first %lu should be %zd instead?
> 
> %zu ;)

All right, queued with %zu on my s390x-next branch:

  https://gitlab.com/thuth/qemu/-/commits/s390x-next/

  Thomas


