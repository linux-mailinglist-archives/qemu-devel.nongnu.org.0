Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F8633C3A6
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 18:11:01 +0100 (CET)
Received: from localhost ([::1]:41188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLqk8-0004HC-Ho
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 13:11:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lLqeW-0001CI-ED
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 13:05:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lLqeU-0001Ls-8d
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 13:05:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615827909;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z+5Rj3iTv88FIue3cLhSjrLzT6NVeUjRKa6RJToAapU=;
 b=V67Mw+hpFslQ5U5BYjgwVRI89nzqPVdybxAQEQ/iz3cDvst2RFQjzBXsDJ/wVBjnepeQtB
 uS0EBJtWNSYIp8EsaCSvcpWqOAAKfjorNFQ/m1qit051REdOXk/StJfVaM57Xx++vXAQBi
 y0zPYrPBjmi8KhtAqRD/fWVb0EV2esQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-387-op0-e6BeOzGItMHiBVqrkg-1; Mon, 15 Mar 2021 13:05:06 -0400
X-MC-Unique: op0-e6BeOzGItMHiBVqrkg-1
Received: by mail-wr1-f69.google.com with SMTP id v13so15377863wrs.21
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 10:05:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Z+5Rj3iTv88FIue3cLhSjrLzT6NVeUjRKa6RJToAapU=;
 b=fX3PXqp3+c8LbvTX2dNzOZYLfWMzUB9jccXZUGFwb1xSEntuecDSXT3b8Oz+28F3nd
 SfYYbUVggz4a7UkZHc7s/umIE4uil67oD+0vAPIxy4VA82jDKZpJedf713DVNfdgN/R/
 ZwRvkMIe0KruO0uCa6qoyAFsfvLIdMt6JbnZdeKz4ZAdrY5Ypn+fzfQWwPvkikC+d4nN
 T7i+O/nmST8zI8eTXnwOQi/upZbrrGC51EXlq0nabi/VN01jZgO/7VWWTyO7SSI4QlN6
 BpDWkyotvBSOuAGxPuDiayV/TXc8XjOo//EZoALPesmNLdQ9voufR2em0p4hybJFTLp6
 NmaQ==
X-Gm-Message-State: AOAM531TwPrZmxxe3kEqNZHfrzLWRPqYjDqZNHgKnjHKQGJLikGToVAm
 ybany7PAfDDRd+KWf8GpoylHVg6XYU3ifbBxmB9a7xXoGExTk8DmpO7ssfgaOCrwntoE3SSgVfM
 1WAkTaEGecTjLtsDmCeTPkfr4wyQSBHdQfie9Z11pBi1/NEw5OKyUXUZQdmiOERhc
X-Received: by 2002:adf:8562:: with SMTP id 89mr622714wrh.101.1615827904656;
 Mon, 15 Mar 2021 10:05:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJymrCcDeO9xyKMM+/mzJGsCTf3OLrYujVJvU0AmaVk6OAHMB0Py1Ff6DF/Q1aUqsS/EbOdhOA==
X-Received: by 2002:adf:8562:: with SMTP id 89mr622688wrh.101.1615827904404;
 Mon, 15 Mar 2021 10:05:04 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id f126sm244681wmf.17.2021.03.15.10.05.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Mar 2021 10:05:03 -0700 (PDT)
Subject: Re: [PULL 13/18] hw/core: implement a guest-loader to support static
 hypervisor guests
To: Christian Borntraeger <borntraeger@de.ibm.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org
References: <20210308135104.24903-1-alex.bennee@linaro.org>
 <20210308135104.24903-14-alex.bennee@linaro.org>
 <2bcd9ae8-b304-a9a1-9f14-d238a9b2f6a2@de.ibm.com>
 <e690a377-2f3e-0774-03f8-813f2631e4f0@redhat.com>
 <0edd9206-a77b-7bdf-6c9a-f3f395f58cf3@redhat.com>
 <1b9d8751-7e04-15a9-ad4f-6f8c34a6f915@de.ibm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <e8805fa7-2d3e-5801-1692-b588629060c9@redhat.com>
Date: Mon, 15 Mar 2021 18:05:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <1b9d8751-7e04-15a9-ad4f-6f8c34a6f915@de.ibm.com>
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/15/21 5:59 PM, Christian Borntraeger wrote:
> On 15.03.21 17:51, Philippe Mathieu-Daudé wrote:
> 
>> diff --git a/hw/core/Kconfig b/hw/core/Kconfig
>> index fdf03514d7d..9397503656d 100644
>> --- a/hw/core/Kconfig
>> +++ b/hw/core/Kconfig
>> @@ -11,6 +11,11 @@ config GENERIC_LOADER
>>       bool
>>       default y
>>
>> +config GUEST_LOADER
>> +    bool
>> +    default y
>> +    depends on TCG
>> +
>>   config OR_IRQ
>>       bool
>>
>> diff --git a/hw/core/meson.build b/hw/core/meson.build
>> index 9cd72edf513..59f1605bb07 100644
>> --- a/hw/core/meson.build
>> +++ b/hw/core/meson.build
>> @@ -16,6 +16,7 @@
>>   common_ss.add(files('cpu.c'))
>>   common_ss.add(when: 'CONFIG_FITLOADER', if_true: files('loader-fit.c'))
>>   common_ss.add(when: 'CONFIG_GENERIC_LOADER', if_true:
>> files('generic-loader.c'))
>> +common_ss.add(when: ['CONFIG_GUEST_LOADER', fdt], if_true:
>> files('guest-loader.c'))
>>   common_ss.add(when: 'CONFIG_OR_IRQ', if_true: files('or-irq.c'))
>>   common_ss.add(when: 'CONFIG_PLATFORM_BUS', if_true:
>> files('platform-bus.c'))
>>   common_ss.add(when: 'CONFIG_PTIMER', if_true: files('ptimer.c'))
>> @@ -37,8 +38,6 @@
>>     'clock-vmstate.c',
>>   ))
>>
>> -softmmu_ss.add(when: 'CONFIG_TCG', if_true: files('guest-loader.c'))
>> -
>>   specific_ss.add(when: 'CONFIG_SOFTMMU', if_true: files(
>>     'machine-qmp-cmds.c',
>>     'numa.c',
> 
> 
> Also
> Tested-by: Christian Borntraeger <borntraeger@de.ibm.com>

Thanks Christian!


