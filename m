Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 410CF69E08A
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 13:39:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pURv7-0000jJ-W6; Tue, 21 Feb 2023 07:38:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pURv2-0000ey-Iw
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 07:38:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pURuz-0005UF-GQ
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 07:38:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676983128;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g+4GXtytLXfXsJmvrS7ippxe9VXl8CUoznL0EHAWFg8=;
 b=J149bQCMuCP9YOh/HMt19M5Hj6YpRNlXiFmx+MWiMM4GkcHbFdmD+aTPm/qQGyntTrpyaO
 J/tgP+iVg/X5r8Y1r7WjhwJtBbbP3x5y/D2qn5/TD223x5KRZHP7swrOlUgOxvu+Ow3kEe
 EbqlWMC4VDdNIjeGKjDyyt8XgRv+jL8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-633-fERdnsv-NCOnQR6O1H5RYw-1; Tue, 21 Feb 2023 07:38:46 -0500
X-MC-Unique: fERdnsv-NCOnQR6O1H5RYw-1
Received: by mail-wm1-f71.google.com with SMTP id
 f14-20020a7bcc0e000000b003dd41ad974bso1771571wmh.3
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 04:38:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=g+4GXtytLXfXsJmvrS7ippxe9VXl8CUoznL0EHAWFg8=;
 b=xwVKkmEQs8TZkWmt0PEe/3BV1YpsBJv5kZeBQs1JgOBZFfTh2tvQVIzI7oik9/qOhi
 UwvQDQSxqrjNQlNSte+JR24AApij9exOrqbCcQL/Kh8J7vbBpPi5Vi8waj9Bpv/zB035
 5m3hnikznoiv121GkpF2fHHSEkzOCmZENc3F+fR/BiERyzUhHObu/EsbstxYG8L83IIO
 90w0PrdHxYGAu+MGFT7X1iXW4JDwI0ORpWEKheHpKNVrKxPuDUFPsPOFw6YQT99c9Jpt
 6nOXH/NUrNfnbha50rW3KPaEFnRoqy4qLLioboz3RaTrYFDw9w/KSsK//gm241H9KE+X
 5XJw==
X-Gm-Message-State: AO0yUKWHbqVdXU15a9K4hdvcvX5e5Gq4fqLx0GU3uaDPN3zEy0PPVrP8
 41LOUDwd82V85QqVTZMhts++W6OFMrHq+ezA8Ko/ICpXzGLZQ0lqppWfWtI+GRcEnZsAokixBy4
 ttBy67r2tAexJSSE=
X-Received: by 2002:a05:600c:1c28:b0:3e8:490b:e28b with SMTP id
 j40-20020a05600c1c2800b003e8490be28bmr377817wms.25.1676983125819; 
 Tue, 21 Feb 2023 04:38:45 -0800 (PST)
X-Google-Smtp-Source: AK7set91vDsUpAgMAVTyGMwVMkWCVBNeBIj4YhghOHfNL570Nb/M8c+aXC+GV/JQkmI5n5h7bu8G2w==
X-Received: by 2002:a05:600c:1c28:b0:3e8:490b:e28b with SMTP id
 j40-20020a05600c1c2800b003e8490be28bmr377799wms.25.1676983125540; 
 Tue, 21 Feb 2023 04:38:45 -0800 (PST)
Received: from [10.33.192.205] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 c128-20020a1c3586000000b003e21558ee9dsm4231165wma.2.2023.02.21.04.38.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Feb 2023 04:38:44 -0800 (PST)
Message-ID: <41688e33-004a-4fe6-03b2-febef8084e35@redhat.com>
Date: Tue, 21 Feb 2023 13:38:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] Updated the FSF address to <https://www.gnu.org/licenses/>
Content-Language: en-US
To: Stefan Weil <sw@weilnetz.de>,
 Khadija Kamran <kkamran.bese16seecs@seecs.edu.pk>, qemu-devel@nongnu.org
Cc: ysato@users.sourceforge.jp, alex.bennee@linaro.org, pbonzini@redhat.com,
 fam@euphon.net, peter.maydell@linaro.org, philmd@linaro.org,
 kwolf@redhat.com, hreitz@redhat.com, armbru@redhat.com
References: <576ee9203fdac99d7251a98faa66b9ce1e7febc5.1675941486.git.kkamran.bese16seecs@seecs.edu.pk>
 <1dad8e84-25e1-0514-3e9a-c84eabf8a3e7@weilnetz.de>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <1dad8e84-25e1-0514-3e9a-c84eabf8a3e7@weilnetz.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.095, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 20/02/2023 09.33, Stefan Weil wrote:
> Am 20.02.23 um 08:01 schrieb Khadija Kamran:
>> From: Khadija Kamran <kkamran.bese16seecs@seecs.edu.pk>
>>
>> The Free Software Foundation moved to a new address and some sources in 
>> QEMU referred to their old location.
>> The address should be updated and replaced to a pointer to 
>> <https://www.gnu.org/licenses/>
> 
> ... replaced by a pointer ... ?

I'll take this patch through my git tree and fix it there.

  Thanks,
   Thomas


>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/379
>>
>> Signed-off-by: Khadija Kamran <kkamran.bese16seecs@seecs.edu.pk>
>> ---
>>   contrib/gitdm/filetypes.txt     | 3 +--
>>   hw/scsi/viosrp.h                | 3 +--
>>   hw/sh4/sh7750_regs.h            | 3 +--
>>   include/hw/arm/raspi_platform.h | 3 +--
>>   include/qemu/uri.h              | 3 +--
>>   tests/qemu-iotests/022          | 4 +---
>>   tests/unit/rcutorture.c         | 3 +--
>>   tests/unit/test-rcu-list.c      | 3 +--
>>   util/uri.c                      | 3 +--
>>   9 files changed, 9 insertions(+), 19 deletions(-)
>>
> 
> Reviewed-by: Stefan Weil <sw@weilnetz.de>
> 


