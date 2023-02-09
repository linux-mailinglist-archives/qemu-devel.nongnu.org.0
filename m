Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 272FD68FFFB
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 06:45:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPzii-0006iI-Kc; Thu, 09 Feb 2023 00:43:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pPzig-0006i1-KO
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 00:43:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pPzif-0001EF-2M
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 00:43:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675921419;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mAxoDo+A5A4wGi1XLyaxmoVdErZ8MxnE6/kc6pNhyUM=;
 b=PVYFMxL508F4mMamZ0UAQbZVKzgKhCkZmreXOn9ZgVvM/5TFt8o/r+VJxsXevzeH7RrTUK
 +TzqI1LNiy/IbWpSMFUCAfAsc+ltqjkeovhJWdBM7tXmEFJhZSIiX4N2LYqd0XSUMQnKNI
 wEwJxmeg42TDw1+dLNc55sc8SwzOACk=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-553-ADcaFwdyPjylMZCMHhlcGA-1; Thu, 09 Feb 2023 00:43:38 -0500
X-MC-Unique: ADcaFwdyPjylMZCMHhlcGA-1
Received: by mail-qv1-f72.google.com with SMTP id
 x20-20020ad44594000000b0056c25bbe602so660605qvu.10
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 21:43:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mAxoDo+A5A4wGi1XLyaxmoVdErZ8MxnE6/kc6pNhyUM=;
 b=5FbX+DUdH9z05RU7sWLAEP+GtJbGfPxFb97KZ3gyWi9UA98cvCjon+Ej62VRxfTT+R
 CtazhwtBDi8z8Z3llq7xtexW3UVHVhh6RRkQ14ks51yMOoVoZHMh5IZjl4CfNc95dBHN
 rcVGfqTpjPGsRefDMspFoM18OaYaV3785NMIWN05cqRCTTaaUFd7aPM2L/WTwiMn3JEE
 bJ8DE54arE7YO5JF6CZahkdSPcPdpiv1sHzWkIAaZPs3ZhHbJQNYZYo1O66zRtP/rlSG
 pt3dKpTKk9KRX7VB1Q32TVIfYzOAZkme0nNP9kVpUcc2BMlJt8autbCXdG9TWtEMVL2x
 RX5g==
X-Gm-Message-State: AO0yUKWS9Xbpc5wd4P/wMlQQWrAq4uodt3hfF9E7HENcoLOBWGzhO1ED
 U/+hFxBoYLnPeknELDQknYQnlxjqcsr1qBa7PgIxLPkPSbKZFKokkOy4+f5LfJWf3n1sSmghi76
 /qtjF9hAFOXNtN4c=
X-Received: by 2002:a05:622a:47:b0:3ba:289d:3890 with SMTP id
 y7-20020a05622a004700b003ba289d3890mr18442267qtw.53.1675921417721; 
 Wed, 08 Feb 2023 21:43:37 -0800 (PST)
X-Google-Smtp-Source: AK7set9gvXxb/hoqmluaEgzGj/rF8vBHswsaiCdo6yeAddG3Mn4Na1gXbvAS+UkmlAfAi+zE4OgqFQ==
X-Received: by 2002:a05:622a:47:b0:3ba:289d:3890 with SMTP id
 y7-20020a05622a004700b003ba289d3890mr18442254qtw.53.1675921417521; 
 Wed, 08 Feb 2023 21:43:37 -0800 (PST)
Received: from [192.168.8.105] (tmo-099-228.customers.d1-online.com.
 [80.187.99.228]) by smtp.gmail.com with ESMTPSA id
 x62-20020a37ae41000000b0072771acaf09sm642121qke.126.2023.02.08.21.43.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Feb 2023 21:43:36 -0800 (PST)
Message-ID: <5f6a831e-016b-ce13-3e55-722944161c4d@redhat.com>
Date: Thu, 9 Feb 2023 06:43:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 00/10] Kconfig vs. default devices
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20230208192654.8854-1-farosas@suse.de>
 <f859ba36-c39a-4f86-741d-7920d28c9aaf@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <f859ba36-c39a-4f86-741d-7920d28c9aaf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.146, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 08/02/2023 20.43, Philippe Mathieu-Daudé wrote:
> On 8/2/23 20:26, Fabiano Rosas wrote:
> 
>> We currently have a situation where disabling a Kconfig might result
>> in a runtime error when QEMU selects the corresponding device as a
>> default value for an option. But first a disambiguation:
>>
>> Kconfig default::
>>    a device "Foo" for which there's "config FOO default y" or "config X
>>    imply FOO" in Kconfig.
>>
>> QEMU hardcoded default::
>>    a fallback; a device "Foo" that is chosen in case no corresponding
>>    option is given in the command line.
>>
>> The issue I'm trying to solve is that there is no link between the two
>> "defaults" above, which means that when the user at build time
>> de-selects a Kconfig default, either via configs/devices/*/*.mak or
>> --without-default-devices, the subsequent invocation at runtime might
>> continue to try to create the missing device due to QEMU defaults.
> 
> This will keep bitrotting if we don't cover such configs in our CI.
> 
> Why do you want to get this fixed BTW? I'm not sure there is a big
> interest (as in "almost no users").
> 
> I tried to do that few years ago [*] and Thomas said:
> 
> "in our CI, we should test what users really need,
>   and not each and every distantly possible combination."

You're mis-quoting me here. That comment was made when we were talking about 
very arbitrary configs that likely nobody is going to use.
Fabiano's series here is about the --without-default-devices configure 
option which everybody could add to their set of "configure" options easily.

  Thomas


