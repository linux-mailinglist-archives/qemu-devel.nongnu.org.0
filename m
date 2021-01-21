Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 302652FE844
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 12:02:25 +0100 (CET)
Received: from localhost ([::1]:54730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2XjL-0004rX-W4
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 06:02:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l2XiI-0004Og-6V
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 06:01:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28049)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l2XiG-000477-6g
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 06:01:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611226874;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CJ3oAsIeBT1jVqGJRBCXvElGqROl0ZCVE/363slN73g=;
 b=YHVw6A4T5812WYKYZhRMe88gL1rdsiCIk/SgoF9LLvLWk7s26LGHHILDrO7TmVYss/I/8D
 XxhElsrYQZJ8xHejMDpIx8tWQQ8HRYzF+xLwnCmUcdZQKKgSGU6MilyaUQ2li/4QKzBDu9
 TS8GI3CW2HwS45EKDwa0GIgdBYlGgkg=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-32-2RBDG9Q4MFaPwg1tj6ZHZg-1; Thu, 21 Jan 2021 06:01:10 -0500
X-MC-Unique: 2RBDG9Q4MFaPwg1tj6ZHZg-1
Received: by mail-ed1-f71.google.com with SMTP id j11so140082edy.20
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 03:01:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CJ3oAsIeBT1jVqGJRBCXvElGqROl0ZCVE/363slN73g=;
 b=E7Glh5N/w5JyBLP+e3cAX0lPkty3JjKsMcECRzOPFmhZO3lzX05TVlixlz3EDAp5Fh
 ydkspY4B49p/J9GU4tvagnDBPfylPc8GIbMBvUIIvi/bjP+ZvrV1wOt0+SyPb23f9Rep
 etaQTCTSGtmUOLcXXxMl8CNVtYcsirWjRrRQ8Ip4K1M/Qm/jAH3vhqdKJoQa/RDA5LcT
 fSQpkEeLLkCIbcG3lBQavC/J1SORVWtX3d2x8n+I47DaUilsJ2ihXy820rd8VCmvXSBz
 UP3WSkiv+q7Gm/9e0K3k/ljrnAMQ4klz/W872t1F9yeUQYKbzN1hWpiB3dLQtQMyRLiX
 5jaw==
X-Gm-Message-State: AOAM530lTsPK2xAkrJbyuMC5JjGlfa7SVIm8Dwm2WhWbXP16Ritma6lL
 agAM46rRqgUg3kRtQG057j59agtoaERl14svI0wxKi8Uveoslriu2Wp05r2Y0n7HxsbvPURR6vM
 krM7ThG9qzEy9urw=
X-Received: by 2002:a17:906:3945:: with SMTP id
 g5mr9266905eje.514.1611226868926; 
 Thu, 21 Jan 2021 03:01:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwbogFRHHrVpnwmNqqr/oP0Z47kYYv3LCU0LLH8J8j/ADsGu7+b1JXvKr0/S/u3TQ/OY/9lhQ==
X-Received: by 2002:a17:906:3945:: with SMTP id
 g5mr9266891eje.514.1611226868767; 
 Thu, 21 Jan 2021 03:01:08 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id pg19sm2126331ejb.0.2021.01.21.03.01.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jan 2021 03:01:07 -0800 (PST)
Subject: Re: [PATCH v2 7/8] meson: Display cryto-related information altogether
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210121095616.1471869-1-philmd@redhat.com>
 <20210121095616.1471869-8-philmd@redhat.com>
 <20210121101127.GF3125227@redhat.com> <20210121101308.GA3126480@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <89a122ca-90a0-5f0d-cca6-a601c8e3b47c@redhat.com>
Date: Thu, 21 Jan 2021 12:01:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210121101308.GA3126480@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.094, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/21/21 11:13 AM, Daniel P. Berrangé wrote:
> On Thu, Jan 21, 2021 at 10:11:32AM +0000, Daniel P. Berrangé wrote:
>> On Thu, Jan 21, 2021 at 10:56:15AM +0100, Philippe Mathieu-Daudé wrote:
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>> ---
>>> Cc: Daniel P. Berrange <berrange@redhat.com>
>>> ---
>>>  meson.build | 34 +++++++++++++++++++---------------
>>>  1 file changed, 19 insertions(+), 15 deletions(-)
>>>
>>> diff --git a/meson.build b/meson.build
>>> index e372b69f163..9274775a81a 100644
>>> --- a/meson.build
>>> +++ b/meson.build
>>> @@ -2453,19 +2453,8 @@
>>>  endif
>>>  summary(summary_info, bool_yn: true, section: 'Block layer support')
>>>  
>>> +# Crypto
>>
>> Rather than a comment why not introduce grouping in the output
>> so it is visible when reading the summary.
>>
>> This can be done in meson by calling summary() multiple times
>> giving "section: 'Crypto'"  arg.
> 
> Sigh, I'm not very good at reading this morning. I see this
> is in fact done in this patch, I just couldn't see it in the
> diff :-(

No worry, I should have describe this better in the commit
description.

> ...
>>> +summary(summary_info, bool_yn: true, section: 'Crypto')
> 
> 
> Regards,
> Daniel
> 


