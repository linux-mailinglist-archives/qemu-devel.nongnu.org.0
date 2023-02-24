Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B076A179F
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 09:00:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVSzg-0000O3-5m; Fri, 24 Feb 2023 02:59:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pVSzd-0000Nc-Lk
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 02:59:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pVSzc-00008F-5l
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 02:59:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677225587;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X02Dwzd1F7AKZb/D16KMExx5J69uahpF3R8GvLneBC8=;
 b=IY0gWBdbWRRZ4f8zq/yeYPEumbRNFBog0Yyr6OYPV+r5Q9ihYqLZkkggLJTKjI3sLZZN5n
 QxIrU+mXpQLZBJNgQ37ncvHvpBZPV2LP/qFUc7lftz15q/TH6V7bgEn2PtAFZzBJ9Ah7vy
 dLp4xK+P/9VjQN41VqfW6tIRnRU3UxM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-81-kLrWEf74NKWYd707Wk8Trw-1; Fri, 24 Feb 2023 02:59:46 -0500
X-MC-Unique: kLrWEf74NKWYd707Wk8Trw-1
Received: by mail-wr1-f70.google.com with SMTP id
 d14-20020adfa34e000000b002bfc062eaa8so2957212wrb.20
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 23:59:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=X02Dwzd1F7AKZb/D16KMExx5J69uahpF3R8GvLneBC8=;
 b=L2KxKbD+DIAVfDPLHS4WuR7EpMqqlgz45694zPcJVro/Vt871rHa3/Pa5QxArUn6Tw
 mDzD8FkCg4C0XhYqd+294uZylNLLKlvP3ZRe4f0t6ByXTKr7zGP0EujhySVCOU1mgaz9
 WZu7WpplRZ4ic1m65FbWDXICX7TrPkciBY6jFa0CrIdQHjKANIIk/5qNnZsrJrkdFR1/
 FyDBZu/iFeo3vB14mSEauMle5q7Jz+HGsOPOSlx3+JaoeLZWB9yZHOGRKLXgN3mbtu7f
 sEZ6tK3fLt7m45WWppv9dNvmgtO9eeLM7GiQwFzoPxmpyXPiSBIsUrJsg1BrfXimnB7G
 NbUA==
X-Gm-Message-State: AO0yUKWlL7u7bIFqBWKNYbJHMYPxI2x4pIVbEf5epsavbOd/2viTeK8w
 JWnPay/GEVapUxQyw6KckoP/rv0fCtZn0Xcgo7kTj+4X+bVISW+s2h1XEUAqBm3F/rcabDj939H
 2piRxzHh05Ya5SyA=
X-Received: by 2002:a05:600c:4b30:b0:3df:fbc7:5b10 with SMTP id
 i48-20020a05600c4b3000b003dffbc75b10mr5446157wmp.0.1677225585013; 
 Thu, 23 Feb 2023 23:59:45 -0800 (PST)
X-Google-Smtp-Source: AK7set+9vraVUkPyOziPRRpYk9Xd5oeeZD122qeEo9tDutLKhiWxMmV5ZYvfNqayZNssy4/FZx+7gw==
X-Received: by 2002:a05:600c:4b30:b0:3df:fbc7:5b10 with SMTP id
 i48-20020a05600c4b3000b003dffbc75b10mr5446147wmp.0.1677225584696; 
 Thu, 23 Feb 2023 23:59:44 -0800 (PST)
Received: from [192.168.8.100] (tmo-115-119.customers.d1-online.com.
 [80.187.115.119]) by smtp.gmail.com with ESMTPSA id
 l4-20020a05600c1d0400b003db0ad636d1sm2082487wms.28.2023.02.23.23.59.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 23:59:44 -0800 (PST)
Message-ID: <42d15527-8b0e-9f0d-4c0d-24ca50b13bb6@redhat.com>
Date: Fri, 24 Feb 2023 08:59:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] Deprecate the "-no-acpi" command line switch
Content-Language: en-US
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 libvir-list@redhat.com, Shannon Zhao <shannon.zhaosl@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Jean-Philippe Brucker
 <jean-philippe@linaro.org>, Dongjiu Geng <gengdongjiu1@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
References: <20230224073441.1105921-1-thuth@redhat.com>
 <Y/htv0jY8CjMJ2Rw@sunil-laptop>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <Y/htv0jY8CjMJ2Rw@sunil-laptop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 24/02/2023 08.56, Sunil V L wrote:
> On Fri, Feb 24, 2023 at 08:34:41AM +0100, Thomas Huth wrote:
>> Similar to "-no-hpet", the "-no-acpi" switch is a legacy command
>> line option that should be replaced with the "acpi" machine parameter
>> nowadays.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   docs/about/deprecated.rst | 6 ++++++
>>   softmmu/vl.c              | 1 +
>>   2 files changed, 7 insertions(+)
>>
>> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
>> index ee95bcb1a6..15084f7bea 100644
>> --- a/docs/about/deprecated.rst
>> +++ b/docs/about/deprecated.rst
>> @@ -99,6 +99,12 @@ form is preferred.
>>   The HPET setting has been turned into a machine property.
>>   Use ``-machine hpet=off`` instead.
>>   
>> +``-no-acpi`` (since 8.0)
>> +''''''''''''''''''''''''
>> +
>> +The ``-no-acpi`` setting has been turned into a machine property.
>> +Use ``-machine acpi=off`` instead.
>> +
>>   ``-accel hax`` (since 8.0)
>>   ''''''''''''''''''''''''''
>>   
>> diff --git a/softmmu/vl.c b/softmmu/vl.c
>> index 459588aa7d..07d5215325 100644
>> --- a/softmmu/vl.c
>> +++ b/softmmu/vl.c
>> @@ -3271,6 +3271,7 @@ void qemu_init(int argc, char **argv)
>>                   vnc_parse(optarg);
>>                   break;
>>               case QEMU_OPTION_no_acpi:
>> +                warn_report("-no-hpet is deprecated, use '-machine acpi=off' instead");
> 
> "no-acpi" is deprecated?

That's at least my plan. The patch is under discussion, but at least in my 
opinion, this option should go away in the long run, yes.

> Is my understanding correct that there is no need to update qemu-options.hx ?

If nobody objects to my patch here, it indeed does not make too much sense 
to enable -no-acpi on risc-v or other platforms now, yes.

  Thomas


