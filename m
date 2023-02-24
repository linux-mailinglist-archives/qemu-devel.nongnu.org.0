Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D19156A1814
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 09:38:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVTa4-0006rg-1I; Fri, 24 Feb 2023 03:37:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pVTa0-0006q2-VT
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 03:37:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pVTZz-0001BG-FI
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 03:37:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677227842;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R17HTWLlr8UdPqK101wd+KUXfWHuww0E5VCf6qbhzgE=;
 b=iwxmeAVz4VcCBujTZ+C6Pqz0BCE0yfWHPQMi9DFrjwMlhPxz8HhpG/mnmrXABoyahhrAvr
 DrmKypjAhlh53d7j8Mnabzw8vPxnEH0wL8GzOwLvBZA2QIaB/GbhM1JjapcmyIP77WEXGS
 c1vY1eWapJ5oh0Apx9danQ073/iBozY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-402-1JlsQPJwMkqdA0ekDYou6A-1; Fri, 24 Feb 2023 03:37:20 -0500
X-MC-Unique: 1JlsQPJwMkqdA0ekDYou6A-1
Received: by mail-wr1-f72.google.com with SMTP id
 v18-20020adfedd2000000b002c3f0a93825so3071700wro.15
 for <qemu-devel@nongnu.org>; Fri, 24 Feb 2023 00:37:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=R17HTWLlr8UdPqK101wd+KUXfWHuww0E5VCf6qbhzgE=;
 b=gTUz8dDfHTeTkx5UxuLvw1R2zp9TW8gMNC/4XbkPUggGZOXuLA7VeJZdnziE0IETuK
 KGRbnLoY773LASlUA8iROGQbvIYkcc2Ip6qY6uldG05S5dCVcVlHMAECeYZDGmeIQw8v
 tLeZDBCjIaVCU2Eb/6fXHwBRbCRepNRNzcWnMSXmutkixpBxRjvlrTQ38UXydMHSLtyu
 sJL6PYd9MWJJtzc0PXK1cPGWjLs8W33CzPxUwMKgGFjepJtcHe9BD2UFpeuhirqZP8CF
 /iT7QPz780CcmjHCQrNUbvqOlkzQ855lIQVwB7pxKVaWWxxEhAlr+XnwSvr+xgctWu6O
 uXig==
X-Gm-Message-State: AO0yUKUlxTxG10HuxOlZ0KKsDaXS7fowdxqwKkpDIAc5I5W7NaGkn3AW
 KzzV0BwvEQiZM029NhQR2y6b2zxvVIsorZBK65svaTXg5tDmnXoGNRk5yER5jPLRZD+wuqoklSu
 S/n9+R7/nLGrwDQU=
X-Received: by 2002:a5d:6808:0:b0:2c5:53e1:7417 with SMTP id
 w8-20020a5d6808000000b002c553e17417mr13227765wru.23.1677227839691; 
 Fri, 24 Feb 2023 00:37:19 -0800 (PST)
X-Google-Smtp-Source: AK7set8m0qx2WT7FzQMS0kIqNtsHqULitIBYB/Z0qcFYqCm5KZt2h6fQ2GNZ3aIe5yZDBvCstT8qxQ==
X-Received: by 2002:a5d:6808:0:b0:2c5:53e1:7417 with SMTP id
 w8-20020a5d6808000000b002c553e17417mr13227748wru.23.1677227839410; 
 Fri, 24 Feb 2023 00:37:19 -0800 (PST)
Received: from [192.168.8.100] (tmo-115-119.customers.d1-online.com.
 [80.187.115.119]) by smtp.gmail.com with ESMTPSA id
 q2-20020adff502000000b002c573a6216fsm10700349wro.37.2023.02.24.00.37.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Feb 2023 00:37:18 -0800 (PST)
Message-ID: <f7673953-c84c-eac9-8a91-a1d8fe9be96c@redhat.com>
Date: Fri, 24 Feb 2023 09:37:16 +0100
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
 <42d15527-8b0e-9f0d-4c0d-24ca50b13bb6@redhat.com>
 <Y/hzVUB8Zwt99Q/K@sunil-laptop>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <Y/hzVUB8Zwt99Q/K@sunil-laptop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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

On 24/02/2023 09.20, Sunil V L wrote:
> On Fri, Feb 24, 2023 at 08:59:41AM +0100, Thomas Huth wrote:
>> On 24/02/2023 08.56, Sunil V L wrote:
>>> On Fri, Feb 24, 2023 at 08:34:41AM +0100, Thomas Huth wrote:
>>>> Similar to "-no-hpet", the "-no-acpi" switch is a legacy command
>>>> line option that should be replaced with the "acpi" machine parameter
>>>> nowadays.
>>>>
>>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>>> ---
>>>>    docs/about/deprecated.rst | 6 ++++++
>>>>    softmmu/vl.c              | 1 +
>>>>    2 files changed, 7 insertions(+)
>>>>
>>>> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
>>>> index ee95bcb1a6..15084f7bea 100644
>>>> --- a/docs/about/deprecated.rst
>>>> +++ b/docs/about/deprecated.rst
>>>> @@ -99,6 +99,12 @@ form is preferred.
>>>>    The HPET setting has been turned into a machine property.
>>>>    Use ``-machine hpet=off`` instead.
>>>> +``-no-acpi`` (since 8.0)
>>>> +''''''''''''''''''''''''
>>>> +
>>>> +The ``-no-acpi`` setting has been turned into a machine property.
>>>> +Use ``-machine acpi=off`` instead.
>>>> +
>>>>    ``-accel hax`` (since 8.0)
>>>>    ''''''''''''''''''''''''''
>>>> diff --git a/softmmu/vl.c b/softmmu/vl.c
>>>> index 459588aa7d..07d5215325 100644
>>>> --- a/softmmu/vl.c
>>>> +++ b/softmmu/vl.c
>>>> @@ -3271,6 +3271,7 @@ void qemu_init(int argc, char **argv)
>>>>                    vnc_parse(optarg);
>>>>                    break;
>>>>                case QEMU_OPTION_no_acpi:
>>>> +                warn_report("-no-hpet is deprecated, use '-machine acpi=off' instead");
>>>
>>> "no-acpi" is deprecated?
>>
>> That's at least my plan. The patch is under discussion, but at least in my
>> opinion, this option should go away in the long run, yes.
>>
> Sorry for not being clear. It is mentioned as -no-hpet is deprecated. It
> should be -no-acpi.

D'oh, stupid copy-n-paste bug! Thanks, I'll send a v2 :-)

  Thomas


