Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 813C668DC91
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 16:09:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPPaL-0002gZ-DX; Tue, 07 Feb 2023 10:08:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pPPaI-0002d3-Ua
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 10:08:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pPPaH-0007Ss-9T
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 10:08:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675782516;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KI3RgQdPtYw8GUWyMez8C5CNhpplO8CmMk/Ip3SnJv8=;
 b=GRODJLTI8ky/LZMP55fwsIZm+QM7R4P+sYHOGB8J4EdSpYu8e+smR+kEZysWNxOb6wEIVj
 zD4vpI3nyQLd3MsNQ1QNtI4DjJ1Os/6wbB9b2+tw678TnNBe4pX/koJFa+BCJp8iKquG6E
 NmDSaP4GMF6PXDeKyfOXDelq8oKa8lo=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-493-DV6Nkh8cPkKHTWRj7Y4rsg-1; Tue, 07 Feb 2023 10:08:34 -0500
X-MC-Unique: DV6Nkh8cPkKHTWRj7Y4rsg-1
Received: by mail-qv1-f69.google.com with SMTP id
 jh2-20020a0562141fc200b004c74bbb0affso7862040qvb.21
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 07:08:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KI3RgQdPtYw8GUWyMez8C5CNhpplO8CmMk/Ip3SnJv8=;
 b=qrrbNq72HVVS+MMwYXQDk+sRWDdktlrkwPXq9MxFcisAuHc48UuhIbRCOUvPd0Iga8
 OJDFRtSOn0Rj8uDhDWiWMMIQ8kJvjXAx84tE9MN8NuPxPCgBwS99/juR/XL3Lm6Np7Af
 3g+GRcQ3ZL3RX1S3a309d20GjNGrvnl6d0RHxeJof5NmI/muV5WUVXY/adot7WA+ieYe
 KsB3Pw7CM8ZHdhQuLIBjcmGgggfAlVaSaJpghmCXwDX5A1Y/8NPdrqSFWV3uKlzjI+ku
 OnNzfG6tHqEegPd6N/5ylk3aCD2MIOR6pGy/iayoINDwO77WrKL/ty5Qxipt4s1GZ5o6
 gQQg==
X-Gm-Message-State: AO0yUKVLEnZoTIdnLTHBlLKa7amo9R28irBQwBLWweHVzAetuWTz7gqU
 LryO/osjWBxXzFw37+J/DXxMT0iS1z4V09GVav+iMzIUq8E2dsVneKrZl3eT41Xt8wdIuQQ4Zum
 HjlFvEPRjT4RhMXk=
X-Received: by 2002:a05:622a:2c7:b0:3b8:6c4d:488a with SMTP id
 a7-20020a05622a02c700b003b86c4d488amr6457372qtx.37.1675782514405; 
 Tue, 07 Feb 2023 07:08:34 -0800 (PST)
X-Google-Smtp-Source: AK7set/Y4pVpX+B3xPI4SKSATAD4woC9RI86y1CpZw+JiIUaqRTg6V0WemI42E752ahsybpqtWC9BQ==
X-Received: by 2002:a05:622a:2c7:b0:3b8:6c4d:488a with SMTP id
 a7-20020a05622a02c700b003b86c4d488amr6457282qtx.37.1675782513576; 
 Tue, 07 Feb 2023 07:08:33 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-120.web.vodafone.de.
 [109.43.176.120]) by smtp.gmail.com with ESMTPSA id
 w15-20020a05620a444f00b007296805f607sm9843364qkp.17.2023.02.07.07.08.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 07:08:32 -0800 (PST)
Message-ID: <0c85ac6c-0787-ba6f-3e19-5dbbc1619fac@redhat.com>
Date: Tue, 7 Feb 2023 16:08:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] Hexagon (meson.build): define min bison version
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Matheus Tavares Bernardino <quic_mathbern@quicinc.com>, qemu-devel@nongnu.org
Cc: anjo@rev.ng, tsimpson@quicinc.com, bcain@quicinc.com,
 quic_acaggian@quicinc.com, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <a6763f9f7b89ea310ab86f9a2b311a05254a1acd.1675779233.git.quic_mathbern@quicinc.com>
 <53dd2acc-0eb7-5e49-e803-2625f0841880@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <53dd2acc-0eb7-5e49-e803-2625f0841880@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 07/02/2023 15.54, Philippe Mathieu-Daudé wrote:
> Cc'ing Paolo/Daniel/Thomas
> 
> On 7/2/23 15:52, Matheus Tavares Bernardino wrote:
>> Hexagon's idef-parser machinery uses some bison features that are not
>> available at older versions. The most preeminent example (as it can
>> be used as a sentinel) is "%define parse.error verbose". This was
>> introduced in version 3.0 of the tool, which is able to compile
>> qemu-hexagon just fine. However, compilation fails with the previous
>> minor bison release, v2.7. So let's assert the minimum version at
>> meson.build to give a more comprehensive error message for those trying
>> to compile QEMU.
>>
>> [1]: 
>> https://www.gnu.org/software/bison/manual/html_node/_0025define-Summary.html#index-_0025define-parse_002eerror 
>>
>>
>> Signed-off-by: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
>> ---
>>   target/hexagon/meson.build | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/target/hexagon/meson.build b/target/hexagon/meson.build
>> index c9d31d095c..42b03c81e6 100644
>> --- a/target/hexagon/meson.build
>> +++ b/target/hexagon/meson.build
>> @@ -183,7 +183,7 @@ if idef_parser_enabled and 'hexagon-linux-user' in 
>> target_dirs
>>       )
>>       bison = generator(
>> -        find_program('bison'),
>> +        find_program('bison', version: '>=3.0'),
>>           output: ['@BASENAME@.tab.c', '@BASENAME@.tab.h'],
>>           arguments: ['@INPUT@', '--defines=@OUTPUT1@', '--output=@OUTPUT0@']
>>       )

Looks reasonable, thus:

Reviewed-by: Thomas Huth <thuth@redhat.com>

Out of curiosity: Where did you encounter this problem? After having a quick 
look at https://repology.org/project/bison/versions it seems to me that all 
our supported OS distros should already ship bison 3.0 or newer...

  Thomas


