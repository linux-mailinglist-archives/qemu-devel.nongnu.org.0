Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA3125F761
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Sep 2020 12:09:44 +0200 (CEST)
Received: from localhost ([::1]:44286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFE5n-0004iQ-Lm
	for lists+qemu-devel@lfdr.de; Mon, 07 Sep 2020 06:09:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kFE4z-0004FJ-Qn
 for qemu-devel@nongnu.org; Mon, 07 Sep 2020 06:08:53 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:52293
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kFE4x-0000Lh-Oh
 for qemu-devel@nongnu.org; Mon, 07 Sep 2020 06:08:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599473330;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=XqIAoRir/kWRjS5K8VogweAdk2AodnR6n5TiO30mfr4=;
 b=DiXH8N0fhG5qeb17bW96WqDEBP327ftwADuPee3am1Abyy9+LQ77nDuQnAxGXzOaW8HHO0
 Y4amYKRn3BOqzN4D9iIwjY4ci9AbOK2u+N/3ZgWM9KwCba3z5egp/8xkNDR/72V4lt1G/F
 4ciz4KH3k4EYicXhluHPwCRxSZ1uRbM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-195-IlSKInrIMVKdXHvMQg2rTQ-1; Mon, 07 Sep 2020 06:08:46 -0400
X-MC-Unique: IlSKInrIMVKdXHvMQg2rTQ-1
Received: by mail-wm1-f70.google.com with SMTP id 23so2680010wmk.8
 for <qemu-devel@nongnu.org>; Mon, 07 Sep 2020 03:08:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=XqIAoRir/kWRjS5K8VogweAdk2AodnR6n5TiO30mfr4=;
 b=kOv10GTsxVanjAzTB7vqASHo6nLj1t3Bg8x69diHAykCHtuRzj0yohx8iJ6ue08tNj
 9GMbWMs1UBDc8LHY+dRyWvb1sxI172lJVjtEPlfXyVJ9Wgi0HJMpuEsESCj88fANFu2O
 OreVrS/f4frcshR88NOJfkOBbS+S9GS6manRsdF3723xUCn08s2kfbEgDtln1Jq6WBCr
 W5TddLIh2fOQEyq4Xoc8KXX1IFLKRlDHcvWnq/tF+2Ke9KzmU/CEHOQJXolE9NVRwgHP
 u72VYoOs8SDq0FGZ7exFnkGwf87CMPUeDRIuvACWS5Zn4zEqy3+h7guqxQ7nSEHNtU35
 fTsQ==
X-Gm-Message-State: AOAM530Sc3FGCDAeGqBrmlJeDXhuoQDr1cQymAttZSGf7dgbmBBBJCsM
 4N1lJ1E//Qvqnhq2HJnEzfaQk2I1paS/XB45cxTTQ6hSk3MZlAjYoBxAQbkf6PcPzheLVcmggvS
 ss+CNhzfxZj+J+hE=
X-Received: by 2002:a1c:964b:: with SMTP id y72mr20251195wmd.69.1599473325748; 
 Mon, 07 Sep 2020 03:08:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxKY4y6hXdNbe943zEvTJXKIP3wnC8AuUZksNaF1qPLeEoGP9TFiMSumK2E6pxJ1mdiutCSKQ==
X-Received: by 2002:a1c:964b:: with SMTP id y72mr20251172wmd.69.1599473325556; 
 Mon, 07 Sep 2020 03:08:45 -0700 (PDT)
Received: from [192.168.1.36] (65.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.65])
 by smtp.gmail.com with ESMTPSA id s124sm26474864wme.29.2020.09.07.03.08.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Sep 2020 03:08:45 -0700 (PDT)
Subject: Re: [PATCH v1 6/8] tests/meson.build: fp tests don't need CONFIG_TCG
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20200903112107.27367-1-alex.bennee@linaro.org>
 <20200903112107.27367-7-alex.bennee@linaro.org>
 <CABgObfZ_Xdd-pnRjpWO=8NjEznZhz84DTq95OzCdjL_rxnw=XQ@mail.gmail.com>
 <87a6y2rlwq.fsf@linaro.org> <6c8531d2-a695-e964-bacf-a4322d4c9f40@redhat.com>
 <877dt5syh2.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Autocrypt: addr=philmd@redhat.com; keydata=
 mQINBDXML8YBEADXCtUkDBKQvNsQA7sDpw6YLE/1tKHwm24A1au9Hfy/OFmkpzo+MD+dYc+7
 bvnqWAeGweq2SDq8zbzFZ1gJBd6+e5v1a/UrTxvwBk51yEkadrpRbi+r2bDpTJwXc/uEtYAB
 GvsTZMtiQVA4kRID1KCdgLa3zztPLCj5H1VZhqZsiGvXa/nMIlhvacRXdbgllPPJ72cLUkXf
 z1Zu4AkEKpccZaJspmLWGSzGu6UTZ7UfVeR2Hcc2KI9oZB1qthmZ1+PZyGZ/Dy+z+zklC0xl
 XIpQPmnfy9+/1hj1LzJ+pe3HzEodtlVA+rdttSvA6nmHKIt8Ul6b/h1DFTmUT1lN1WbAGxmg
 CH1O26cz5nTrzdjoqC/b8PpZiT0kO5MKKgiu5S4PRIxW2+RA4H9nq7nztNZ1Y39bDpzwE5Sp
 bDHzd5owmLxMLZAINtCtQuRbSOcMjZlg4zohA9TQP9krGIk+qTR+H4CV22sWldSkVtsoTaA2
 qNeSJhfHQY0TyQvFbqRsSNIe2gTDzzEQ8itsmdHHE/yzhcCVvlUzXhAT6pIN0OT+cdsTTfif
 MIcDboys92auTuJ7U+4jWF1+WUaJ8gDL69ThAsu7mGDBbm80P3vvUZ4fQM14NkxOnuGRrJxO
 qjWNJ2ZUxgyHAh5TCxMLKWZoL5hpnvx3dF3Ti9HW2dsUUWICSQARAQABtDJQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoUGhpbCkgPHBoaWxtZEByZWRoYXQuY29tPokCVQQTAQgAPwIbDwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4AWIQSJweePYB7obIZ0lcuio/1u3q3A3gUCXsfWwAUJ
 KtymWgAKCRCio/1u3q3A3ircD/9Vjh3aFNJ3uF3hddeoFg1H038wZr/xi8/rX27M1Vj2j9VH
 0B8Olp4KUQw/hyO6kUxqkoojmzRpmzvlpZ0cUiZJo2bQIWnvScyHxFCv33kHe+YEIqoJlaQc
 JfKYlbCoubz+02E2A6bFD9+BvCY0LBbEj5POwyKGiDMjHKCGuzSuDRbCn0Mz4kCa7nFMF5Jv
 piC+JemRdiBd6102ThqgIsyGEBXuf1sy0QIVyXgaqr9O2b/0VoXpQId7yY7OJuYYxs7kQoXI
 6WzSMpmuXGkmfxOgbc/L6YbzB0JOriX0iRClxu4dEUg8Bs2pNnr6huY2Ft+qb41RzCJvvMyu
 gS32LfN0bTZ6Qm2A8ayMtUQgnwZDSO23OKgQWZVglGliY3ezHZ6lVwC24Vjkmq/2yBSLakZE
 6DZUjZzCW1nvtRK05ebyK6tofRsx8xB8pL/kcBb9nCuh70aLR+5cmE41X4O+MVJbwfP5s/RW
 9BFSL3qgXuXso/3XuWTQjJJGgKhB6xXjMmb1J4q/h5IuVV4juv1Fem9sfmyrh+Wi5V1IzKI7
 RPJ3KVb937eBgSENk53P0gUorwzUcO+ASEo3Z1cBKkJSPigDbeEjVfXQMzNt0oDRzpQqH2vp
 apo2jHnidWt8BsckuWZpxcZ9+/9obQ55DyVQHGiTN39hkETy3Emdnz1JVHTU0Q==
Message-ID: <87857d11-51d8-16b1-516b-4670765fe531@redhat.com>
Date: Mon, 7 Sep 2020 12:08:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <877dt5syh2.fsf@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/07 02:54:37
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.099,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.69, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: fam@euphon.net, berrange@redhat.com, stefanb@linux.vnet.ibm.com,
 richard.henderson@linaro.org, qemu-devel <qemu-devel@nongnu.org>,
 "Emilio G. Cota" <cota@braap.org>, stefanha@redhat.com,
 marcandre.lureau@redhat.com, Paolo Bonzini <pbonzini@redhat.com>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/7/20 11:55 AM, Alex Bennée wrote:
> 
> Philippe Mathieu-Daudé <philmd@redhat.com> writes:
> 
>> On 9/7/20 11:11 AM, Alex Bennée wrote:
>>>
>>> Paolo Bonzini <pbonzini@redhat.com> writes:
>>>
>>>> Il gio 3 set 2020, 13:21 Alex Bennée <alex.bennee@linaro.org> ha scritto:
>>>>
>>>>> As the tests build only softfloat.c no actual TCG machinary is neede
>>>>> to test them (as is evidenced by GCC check-softfloat). Might as well
>>>>> fix the wording on Travis while at it.
>>>>>
>>>>
>>>> The reason is that softfloat is not built at all into QEMU if !CONFIG_TCG.
>>>> We similarly skip block layer tests if !CONFIG_SOFTMMU &&
>>>> !CONFIG_TOOLS.
>>>
>>> It's not built anyway if you don't call the test. Are you saying a
>>> --disable-system and --disable-user build is invalid for running unit
>>> tests? That is what check-softfloat is doing as it doesn't involve
>>> softfloat built into any qemu binary.
>>
>> FYI my tools build dir is configured as:
>>
>> '--enable-trace-backends=log' '--disable-docs' '--enable-debug'
>> '--disable-system' '--disable-user' '--enable-tools'
>>
>> and it still works after the Meson conversion.
> 
> But check-softfloat doesn't work with that right?

Sorry I can't say, I don't test it :/


