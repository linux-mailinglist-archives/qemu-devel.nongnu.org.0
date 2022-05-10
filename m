Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D2B520DEB
	for <lists+qemu-devel@lfdr.de>; Tue, 10 May 2022 08:34:20 +0200 (CEST)
Received: from localhost ([::1]:36364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noJRr-00042J-DY
	for lists+qemu-devel@lfdr.de; Tue, 10 May 2022 02:34:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1noJPA-0002uD-BN
 for qemu-devel@nongnu.org; Tue, 10 May 2022 02:31:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1noJP7-0006zO-T0
 for qemu-devel@nongnu.org; Tue, 10 May 2022 02:31:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652164288;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vKGIl6jMz8a5fI7dKYfEh51pRrdUh9/R+lg0kc3C420=;
 b=IZEOEFlOx4ek40uIW51hm1cttWTaKlFK/jvWhy+K0xQEWDUmYdQStv8ObgvRSwkr5Xbx3j
 /AQlj+xria+4jKewWZchI0wqkgjVmixV0W4kV0HiZbdCH5nac2pqEEb2DwgKV1+qGNtzAW
 PlmfXRNedYoxnsjOve4qJKQjv2p12xg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-387-z1jHDOJMPA-TYH7NoLzClQ-1; Tue, 10 May 2022 02:31:26 -0400
X-MC-Unique: z1jHDOJMPA-TYH7NoLzClQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 26-20020a05600c021a00b003940660c053so4901250wmi.2
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 23:31:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=vKGIl6jMz8a5fI7dKYfEh51pRrdUh9/R+lg0kc3C420=;
 b=hv2APxh2RLJj8AZw7qpN5x4rGgLfDDtydly6fcWqPf3Vj1F4HTmV0THOF7tPZVMwys
 HaO8O5DBVCvHP9ULvCc0mtCoIjHUb7Csw1g+OkF8Ed4M5rmbXMqwG3UFYVlQqE9L6GtT
 oxqqDLpICTPujDOMAkB6jUmfbLr8TvDtDNKvUWko5oNRVN18FulMpnFDXawKlEdQOu4H
 1rjPZ0FKyaEk0cSxOiL6gk1GTXQBr1fTEuDFA2xJp0XSnB3mW0K6oPlQBXaoPxqY1AdP
 GlLL0Y5MOpoKdBm93VRsrGNMwzKg/4RkGgnWP3GzxNJrXXnqqLcF9Pqnv8JzaWHs1h1k
 0E8A==
X-Gm-Message-State: AOAM5322p6zOMvvHD3OYid7e2MKU55Q2hyAxmMPtEE44oTLOZGdrOGeg
 NcVvbpP4GCKTTkC+WwX42k+Hxn+4LO8ed97uU9chYOjwiRbRai9MGQrlz72+a/7cDGGM5a7qGG5
 Ub3zvmzhTv0FQTxU=
X-Received: by 2002:a5d:6088:0:b0:20a:e81e:c76a with SMTP id
 w8-20020a5d6088000000b0020ae81ec76amr16805865wrt.182.1652164285723; 
 Mon, 09 May 2022 23:31:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw8yg9PqXncc6+HqVMm8JLN7dAsXfn9a3deNRScG6GbLDfpJ1uGWyvsQ5PS2v8LgJ1xkEOgqw==
X-Received: by 2002:a5d:6088:0:b0:20a:e81e:c76a with SMTP id
 w8-20020a5d6088000000b0020ae81ec76amr16805847wrt.182.1652164285431; 
 Mon, 09 May 2022 23:31:25 -0700 (PDT)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 m7-20020a05600c4f4700b003942a244f29sm1603147wmq.2.2022.05.09.23.31.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 May 2022 23:31:24 -0700 (PDT)
Message-ID: <4e03945d-fb92-494d-53a8-f22ee91501c9@redhat.com>
Date: Tue, 10 May 2022 08:31:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <7ecb5ece9d1e0a607e801d547d387bc840b250ea.1651779343.git.maciej.szmigiero@oracle.com>
 <309ab0f5-7bb0-ddb4-3736-8cf0a4cfb269@redhat.com>
 <6ed59ef8-53bc-74ba-432c-955ad72d9f23@maciej.szmigiero.name>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH][RESEND] MAINTAINERS: Add myself as a reviewer for Hyper-V
 VMBus
In-Reply-To: <6ed59ef8-53bc-74ba-432c-955ad72d9f23@maciej.szmigiero.name>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09/05/2022 19.59, Maciej S. Szmigiero wrote:
> On 6.05.2022 07:31, Thomas Huth wrote:
>> On 05/05/2022 21.36, Maciej S. Szmigiero wrote:
>>> From: "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>
>>>
>>> This way there is at least some contact point for incoming patches.
>>>
>>> We'll see whether the code still gets just a random patch a few times
>>> a year or whether it requires a permanent maintainer to take care of it.
>>>
>>> Signed-off-by: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>
>>> ---
>>>      Resending, since the previous submission at [1] wasn't picked up.
>>>      [1]: 
>>> https://lore.kernel.org/qemu-devel/b145dcf08ae606e9d29e55b2f701a3fe4f16b347.1637433881.git.maciej.szmigiero@oracle.com/ 
>>>
>>>
>>>   MAINTAINERS | 6 ++++++
>>>   1 file changed, 6 insertions(+)
>>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index 218c9459b6..907f1d4a88 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -1776,6 +1776,12 @@ F: include/hw/block/fdc.h
>>>   F: tests/qtest/fdc-test.c
>>>   T: git https://gitlab.com/jsnow/qemu.git ide
>>> +Hyper-V VMBus
>>> +S: Odd Fixes
>>> +R: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>
>>> +F: hw/hyperv/vmbus.c
>>> +F: include/hw/hyperv/vmbus*.h
>>
>> If there's no dedicated maintainer, I'd rather pick "Orphan" instead of 
>> "Odd Fixes" here?
>> Who's supposed to pick up the related patches?
> 
> I think I can do this, as long as I know who to send pull requests to
> and on what schedule.

Pull requests are sent via mail to the qemu-devel mailing list, see 
https://www.qemu.org/docs/master/devel/submitting-a-pull-request.html for 
some details. During the normal development phase, pull requests can be sent 
as necessary for new patches. Just during the freeze period (the next one 
will be announced on https://wiki.qemu.org/Planning/7.1 later), only bug 
fixes (no new feature) should be sent.

  Thomas


