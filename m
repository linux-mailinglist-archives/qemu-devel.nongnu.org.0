Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2457A425242
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 13:49:07 +0200 (CEST)
Received: from localhost ([::1]:60530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYRta-0001ni-4S
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 07:49:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mYRsF-0000yY-Es
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 07:47:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mYRsB-0004JH-2n
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 07:47:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633607258;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=04bg+QVzSV+lSfFnTYTyOvDWtiUOtmxD3b5ZhU1VFYs=;
 b=DsmNaQFtHiQgSj2BpumX47NSOq/lKpwD+1jCAGmdS2Bi8m3uiBwroWrRD+DDcGB8EdiGlr
 KFf51aIoPN8Y43fvWCEI1eKkDfoOCbS+Crn+uuXe/poe+eU+4z10e/gjovBkKEtTM+eabr
 jUke7EAnCwaxvjwEjKt9mK96og7tu5s=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-406-Ep8g_LSZNXypXpy_9kJQWQ-1; Thu, 07 Oct 2021 07:47:33 -0400
X-MC-Unique: Ep8g_LSZNXypXpy_9kJQWQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 h11-20020adfa4cb000000b00160c791a550so4291609wrb.6
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 04:47:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=04bg+QVzSV+lSfFnTYTyOvDWtiUOtmxD3b5ZhU1VFYs=;
 b=3uNT9x5AmzV9vAqyuINIIv4AtR3HYskMX0okzy6zhQOHMflkLwF04hyiPt00X5xGAH
 lwxS0glmfumQ/ZQoT4L3ubEza8KKupLE2KwgVgPGHT1asN0dYNuoZzJzNEfjDkT5w421
 od+/17LSBV8Dg7Vvdm1BlUrX5W7n2f77ZxPf9WV7AJa5zhsucJs7NBadPgcbtvI62Kne
 dsXk0XtLD9eLl2FerQ8rLty9uNQ7TxNfwziuf5mcv7kGJzQbg5aqme7IA1qvdq/yg0zX
 5MiYlvj5VgkhfPknYu0ibHZzS82PV/CH89peoOW+LgQ7uOGW+0WmUFz58D7ih5bJ+qDx
 8ROA==
X-Gm-Message-State: AOAM530egGk1bXUTM+zovAR9hPRraU5RHA9/zxiMFgqTVDj5bsXqrW4K
 S0lnIjCG4cBRYsBmWTON6tijCsEjzyoEjlchTJeaC/ej4MhFeVPPQTxgnpbZ5aowi3P21YWto+Z
 QyrZSE3uUf/lx+y8=
X-Received: by 2002:a5d:64ab:: with SMTP id m11mr4695011wrp.343.1633607252284; 
 Thu, 07 Oct 2021 04:47:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyqKdDX3y21BIPuNZQzPPNGVJBgsef88m6fhcOdUN/z32oDtYEzcqRv19KWyiRlKoPrxc/Zpw==
X-Received: by 2002:a5d:64ab:: with SMTP id m11mr4694994wrp.343.1633607252106; 
 Thu, 07 Oct 2021 04:47:32 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id h15sm16372503wrt.0.2021.10.07.04.47.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Oct 2021 04:47:31 -0700 (PDT)
Message-ID: <933a4c4f-bd84-2caf-0f8d-bc5acc60bfac@redhat.com>
Date: Thu, 7 Oct 2021 13:47:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] qemu-iotests: flush after every test
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20211006092726.383737-1-pbonzini@redhat.com>
 <4f3fa32a-54da-1b5e-e35a-4eece062a7bf@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <4f3fa32a-54da-1b5e-e35a-4eece062a7bf@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.964, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: kwolf@redhat.com, hreitz@redhat.com, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06/10/21 17:42, Philippe Mathieu-Daudé wrote:
> On 10/6/21 11:27, Paolo Bonzini wrote:
>> This makes it possible to see what is happening, even if the output of
>> "make check-block" is not sent to a tty (for example if it is sent to
>> grep or tee).
>>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>> ---
>>   tests/qemu-iotests/testrunner.py | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/tests/qemu-iotests/testrunner.py b/tests/qemu-iotests/testrunner.py
>> index 4a6ec421ed..b76db57e4c 100644
>> --- a/tests/qemu-iotests/testrunner.py
>> +++ b/tests/qemu-iotests/testrunner.py
>> @@ -340,6 +340,7 @@ def run_tests(self, tests: List[str]) -> bool:
>>               elif res.status == 'not run':
>>                   notrun.append(name)
>>   
>> +            sys.stdout.flush()
> 
> Shouldn't we flush stderr too?

It's never used by the program.

Paolo

> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


