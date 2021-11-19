Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 655E9456DEF
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 12:03:22 +0100 (CET)
Received: from localhost ([::1]:46066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo1ft-0001tr-9D
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 06:03:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mo1en-0000z1-8e
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 06:02:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mo1eh-0003MM-TN
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 06:02:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637319726;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rj/1CqR4qJ/fafB6UhewPg7pui603W3pbBM1COFFvJU=;
 b=bM3I/Xjv+vSfAc46cVKentsuwXQ7H+ZHDF/bjq5eyVdbr//BHnVeBZ10d3a3bSrCpg8UH1
 pXDZjXncVWlQNDGupuf9hLCjPGvsEx9Wz8vBfLM05Tv8xrobxHPo0q3lcbA+c2scf9moRh
 uhA6uJpz24tH+KnXdWi37PLOrP095bM=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-103-xAqul0OxP4G-xYgBu73SOw-1; Fri, 19 Nov 2021 06:02:05 -0500
X-MC-Unique: xAqul0OxP4G-xYgBu73SOw-1
Received: by mail-ed1-f72.google.com with SMTP id
 w18-20020a056402071200b003e61cbafdb4so8086702edx.4
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 03:02:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rj/1CqR4qJ/fafB6UhewPg7pui603W3pbBM1COFFvJU=;
 b=Rgm7aPJv7T2LBK+GLDvnQri3prT2oTMz2kygASJnsOSvp1gRMFx+7+cn+VcjBHIYwI
 JhPMql2ZhAgh9CjAs+ki7gkZ/K1XkCX591pLa+blvQznnkbnDXU6ygOoqfoXtennMfZf
 TUvtB6ituHUedfsaYFw5PbqCxB3LL4vWkNRX38Y2p692P59LfV6kbVl5zsPnjAtjgXe+
 GEihldglvpWCAH9QTicos3TH7IxJOXG+WtvOH8dIq6mmMy7OOFo9GkUdkW9e98BUe0GV
 qdRDCPhLJ3sxw5PfrCh10Hwnzr3s+nsb6O7yuqJG22JyM8N/VZ0iMf3HVHkE36uSg7Ma
 Rsaw==
X-Gm-Message-State: AOAM5312A2ZDRj52mLZcKDKyvUokyL0DwYZfj0wabTXZwqxgaoDj+Zld
 QGUJ9+hQR8vwybYN8/ioIX8Hgs4yIHFhiD+ZvTzCKhxNt8NUkVLENEEO9Qpi8I+24dSyZpPa+w3
 gQebnJ2k1IlV8Mr0=
X-Received: by 2002:a17:906:eda3:: with SMTP id
 sa3mr6637550ejb.51.1637319724579; 
 Fri, 19 Nov 2021 03:02:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwu0pGsMXbCRfnIhca9ETKutmauHel+izB+GA76wt5CNDolHpVmYMXvS8+TjvJyjv4plt3Smw==
X-Received: by 2002:a17:906:eda3:: with SMTP id
 sa3mr6637495ejb.51.1637319724179; 
 Fri, 19 Nov 2021 03:02:04 -0800 (PST)
Received: from [192.168.8.100] (tmo-097-143.customers.d1-online.com.
 [80.187.97.143])
 by smtp.gmail.com with ESMTPSA id k16sm1251653edq.77.2021.11.19.03.02.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Nov 2021 03:02:03 -0800 (PST)
Message-ID: <4a4c5223-905f-9974-3e54-e4ccd133c359@redhat.com>
Date: Fri, 19 Nov 2021 12:02:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH for-6.2] hw/misc/sifive_u_otp: Use IF_PFLASH for the OTP
 device instead of IF_NONE
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
References: <20211119102549.217755-1-thuth@redhat.com>
 <f2de8ec7-3157-0f87-cfc8-70633e0f8658@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <f2de8ec7-3157-0f87-cfc8-70633e0f8658@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.727, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/11/2021 11.40, Philippe Mathieu-Daudé wrote:
> On 11/19/21 11:25, Thomas Huth wrote:
>> Configuring a drive with "if=none" is meant for creation of a backend
>> only, it should not get automatically assigned to a device frontend.
>> Use "if=pflash" for the One-Time-Programmable device instead (like
>> it is e.g. also done for the efuse device in hw/arm/xlnx-zcu102.c).
>>
>> Since the old way of configuring the device has already been published
>> with the previous QEMU versions, we cannot remove this immediately, but
>> have to deprecate it and support it for at least two more releases.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   docs/about/deprecated.rst | 6 ++++++
>>   hw/misc/sifive_u_otp.c    | 9 ++++++++-
>>   2 files changed, 14 insertions(+), 1 deletion(-)
> 
>> diff --git a/hw/misc/sifive_u_otp.c b/hw/misc/sifive_u_otp.c
>> index 18aa0bd55d..cf6098ff2c 100644
>> --- a/hw/misc/sifive_u_otp.c
>> +++ b/hw/misc/sifive_u_otp.c
>> @@ -209,7 +209,14 @@ static void sifive_u_otp_realize(DeviceState *dev, Error **errp)
>>                             TYPE_SIFIVE_U_OTP, SIFIVE_U_OTP_REG_SIZE);
>>       sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->mmio);
>>   
>> -    dinfo = drive_get_next(IF_NONE);
>> +    dinfo = drive_get_next(IF_PFLASH);
>> +    if (!dinfo) {
>> +        dinfo = drive_get_next(IF_NONE);
> 
> Isn't it a bug to call drive_get_next() from DeviceRealize()?
> 
> Shouldn't drive_get_next() be restricted to the MachineClass?

Yes, that would certainly be better - but considering that we are already 
past RC1 of the 6.2 release, I'd rather prefer to keep this patch rather as 
small as possible and do such refactorings during the next development cycle 
instead.

  Thomas


