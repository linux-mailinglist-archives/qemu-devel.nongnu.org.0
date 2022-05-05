Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFEB051C1D1
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 16:02:02 +0200 (CEST)
Received: from localhost ([::1]:42120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmc3M-0005mO-3N
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 10:02:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nmc0k-0003LN-L4
 for qemu-devel@nongnu.org; Thu, 05 May 2022 09:59:18 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:43590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nmc0j-0000rf-1A
 for qemu-devel@nongnu.org; Thu, 05 May 2022 09:59:18 -0400
Received: by mail-ed1-x530.google.com with SMTP id b24so5304418edu.10
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 06:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Af0GSeUozWLKgLeFivapD3Q2FAelNXvT8pnWkGP8Fb4=;
 b=j0Z5TtQ0ip7XoAK/oLjO7XVmedjk5Y/7Kj0pr5gZadBQw+Th02mVn0Bsa7Ui8fQ+7V
 p36tisXgwvGd+9jsuP+gp/dj9igLCt9f4UU4ohuizqUmValGX0VXaZAuncy8/CeMnMmm
 WEwdb1hrp7Fs2xoDgrY0OHnp4I2ZWUFREG9nvb3gM9ffAKwADk1gAyN45tTfcdY1F6hb
 nAI63Q9WEkYCR4dcnublnsyYM0b7Z0CYs70lWOVfjCN9LKF0sPJKSlvsKthBfxsryDlC
 cqyuOtuUGv5arWQIcZJAs8AyPZclx34mdgl7LPvKNkixzYRV+4kZJtdfkkYew59QRcuG
 CM6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Af0GSeUozWLKgLeFivapD3Q2FAelNXvT8pnWkGP8Fb4=;
 b=k0lia7TdhkkKpRbSCOEs0JOguZZVf4ZlE1k67BebZUmU2fWbKW4dQvA/KTcuLdJPJl
 Eln7KkOX7P0E0S6GkLX8SizOZUVa+k+LbLDZCgP8soyEw3mQbOhU3sSoyTliXxwMgD9C
 7JD8nCI8X1v61D6VbrkVvsgUeUm6UDd9JFz8mqS1CmiV3wktjzcVU4LUhIjsMYiMiA0l
 dqayIr/5IT1NEOkj5kwOEB8gP35mcglU8gcn4pdKKCtpZ7XwDKvyNTZ5jYxB0KUAjLuR
 nlUhgN7siM6XzVJq3zKMNKA1a2ak9TbSTvE1d7LnZuvNra22OB4C31dmZjL/2LbYeJof
 eMsg==
X-Gm-Message-State: AOAM531Mpc+AOyvGgAQpzy9NaUn6lsEZ1EGAMue0jO40AnqsWjdkhwZN
 5kQ++t4uWIQpQH+qFTZH1dkzcj4qc4OgKw==
X-Google-Smtp-Source: ABdhPJyFj9RmNkLmQTkv5PG34gYkSBEeSjRRZN2/BBYbhr1geci2Z5qGo7ReMdLqVW3yRLaMNPZd8g==
X-Received: by 2002:a05:6402:28b1:b0:425:c39e:b773 with SMTP id
 eg49-20020a05640228b100b00425c39eb773mr29294573edb.237.1651759155086; 
 Thu, 05 May 2022 06:59:15 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 f6-20020a05640214c600b0042617ba639dsm860630edx.39.2022.05.05.06.59.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 May 2022 06:59:14 -0700 (PDT)
Message-ID: <f3045c9f-aa78-fd50-ae46-1cf27ed18bae@redhat.com>
Date: Thu, 5 May 2022 15:59:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 3/8] qmp: add filtering of statistics by target vCPU
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, mark.kanda@oracle.com, berrange@redhat.com,
 dgilbert@redhat.com
References: <20220426141619.304611-1-pbonzini@redhat.com>
 <20220426141619.304611-4-pbonzini@redhat.com> <87y1zgrt2r.fsf@pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <87y1zgrt2r.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 5/5/22 15:45, Markus Armbruster wrote:
> Paolo Bonzini <pbonzini@redhat.com> writes:
> 
>> Introduce a simple filtering of statistics, that allows to retrieve
>> statistics for a subset of the guest vCPUs.  This will be used for
>> example by the HMP monitor, in order to retrieve the statistics
>> for the currently selected CPU.
>>
>> Example:
>> { "execute": "query-stats",
>>    "arguments": {
>>      "target": "vcpu",
>>      "vcpus": [ "/machine/unattached/device[2]",
>>                 "/machine/unattached/device[4]" ] } }
> 
> What heartless people put these poor vCPUs in the orphanage?

Phil tried to fix it but the testsuites hung in weird ways.

Paolo

>>
>> Extracted from a patch by Mark Kanda.
>>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> 
> [...]
> 
>> diff --git a/qapi/stats.json b/qapi/stats.json
>> index bcc897258a..26ee69588f 100644
>> --- a/qapi/stats.json
>> +++ b/qapi/stats.json
>> @@ -65,6 +65,16 @@
>>   { 'enum': 'StatsTarget',
>>     'data': [ 'vm', 'vcpu' ] }
>>   
>> +##
>> +# @StatsVCPUFilter:
>> +#
>> +# @vcpus: list of qom paths for the desired vCPU objects.
> 
> "QOM paths", because that's how we spell it elsewhere.
> 
>> +#
>> +# Since: 7.1
>> +##
>> +{ 'struct': 'StatsVCPUFilter',
>> +  'data': { '*vcpus': [ 'str' ] } }
>> +
>>   ##
>>   # @StatsFilter:
>>   #
>> @@ -73,8 +83,10 @@
>>   #
>>   # Since: 7.1
>>   ##
>> -{ 'struct': 'StatsFilter',
>> -  'data': { 'target': 'StatsTarget' } }
>> +{ 'union': 'StatsFilter',
>> +        'base': { 'target': 'StatsTarget' },
>> +  'discriminator': 'target',
>> +  'data': { 'vcpu': 'StatsVCPUFilter' } }
>>   
>>   ##
>>   # @StatsValue:
> 
> 


