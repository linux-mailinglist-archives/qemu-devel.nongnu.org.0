Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5780645027D
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 11:26:10 +0100 (CET)
Received: from localhost ([::1]:48562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmZBg-000587-VD
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 05:26:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mmZAT-0004PN-3f
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 05:24:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mmZAP-0000X0-TA
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 05:24:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636971888;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NewxShi6evDe3gLwzHTyM/1Bk2RKJSWQQQpkvTn5nYs=;
 b=Ak1wU1Y2tzE5puhDXQxFVtwrepK8yvJCj3zczxF/iPbVereq4KF0kGK6oOl6gB6H4Q3o4W
 FfTbLHzpuIL4in/8ezRrt+yB7bDOrqE61YXwBp+jkk/B09dJMzudQAn5ikqDxMfW9Td0Pr
 3vQF4b0G6rq4YYtrr15HKYlqT7MtDog=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-26-MctmlGfYM4699JZWysL0Eg-1; Mon, 15 Nov 2021 05:24:47 -0500
X-MC-Unique: MctmlGfYM4699JZWysL0Eg-1
Received: by mail-wm1-f69.google.com with SMTP id
 m18-20020a05600c3b1200b0033283ea5facso3289714wms.1
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 02:24:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NewxShi6evDe3gLwzHTyM/1Bk2RKJSWQQQpkvTn5nYs=;
 b=NP2CcRUGa2pIiq8r9Iwuv4GSLEC7gaeGYsb7DXrTYPEiCm4g3j48hA8te4X6m1ICGE
 YSCJc1+0ZpQDl+cmxzq52QQfyix5KPpOmaJOJpsworpBbyDoOtvbWKFD60f0k9qyhUaG
 F1m73rKUiA94C4sxotiK4+N/dRlXlGduMkbagVk3Sd/3hlXMR7kN/d4fERBdFZKzbETJ
 2Cu47TcPp+PfmqId1ex1QNJcpIGuJHDI6mjsXMUDOZmqfO9kKJirDRZl9q4A+jROwWiB
 waS882DaGIjJc7gf5XfkEQVdwY7Co8IrBMta+wJkP7PQGrpCDSUxtZzbVyUOjm2JGO/K
 vVqA==
X-Gm-Message-State: AOAM530KQFIIK2autN8DyQtLarV70KsKbsDxOeuz2T72X2DDl1TDU2Hv
 pAMqFCfKfxEyqBDQQWGOPfJla1WCR24etCaNxkuB/R92h6SNw+IGO4H5tQBrxORcs9zMlzNcuXk
 T1IfXxf+i0iKxCGE=
X-Received: by 2002:a5d:48cf:: with SMTP id p15mr45399441wrs.277.1636971886148; 
 Mon, 15 Nov 2021 02:24:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy3Fy7IKb9EWynmAhU91ZUDDjylKcvfZb+Xr80LKL+TU2cZBbIe32qdWpiKo6bonQos7Lsxvg==
X-Received: by 2002:a5d:48cf:: with SMTP id p15mr45399414wrs.277.1636971885959; 
 Mon, 15 Nov 2021 02:24:45 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id a1sm16333708wri.89.2021.11.15.02.24.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Nov 2021 02:24:45 -0800 (PST)
Message-ID: <87120304-dc9d-ff4b-5973-85362c89f34f@redhat.com>
Date: Mon, 15 Nov 2021 11:24:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH-for-6.2 v3 1/6] tests/unit/test-smp-parse: Restore
 MachineClass fields after modifying
To: "wangyanan (Y)" <wangyanan55@huawei.com>, qemu-devel@nongnu.org
References: <20211111100351.2153662-1-philmd@redhat.com>
 <20211111100351.2153662-2-philmd@redhat.com>
 <df6a0315-6b94-51c4-9854-96c6ba08f3db@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <df6a0315-6b94-51c4-9854-96c6ba08f3db@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -57
X-Spam_score: -5.8
X-Spam_bar: -----
X-Spam_report: (-5.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.278, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Andrew Jones <drjones@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/12/21 03:04, wangyanan (Y) wrote:
> On 2021/11/11 18:03, Philippe Mathieu-Daudé wrote:
>> There is a single MachineClass object, registered with
>> type_register_static(&smp_machine_info). Since the same
>> object is used multiple times (an MachineState object
>> is instantiated in both test_generic and test_with_dies),
>> we should restore its internal state after modifying for
>> the test purpose.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>   tests/unit/test-smp-parse.c | 6 +++++-
>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/tests/unit/test-smp-parse.c b/tests/unit/test-smp-parse.c
>> index cbe0c990494..bd11fbe91de 100644
>> --- a/tests/unit/test-smp-parse.c
>> +++ b/tests/unit/test-smp-parse.c
>> @@ -512,7 +512,7 @@ static void test_generic(void)
>>           smp_parse_test(ms, data, true);
>>       }
>>   -    /* Reset the supported min CPUs and max CPUs */
>> +    /* Force invalid min CPUs and max CPUs */
>>       mc->min_cpus = 2;
>>       mc->max_cpus = 511;
>>   @@ -523,6 +523,10 @@ static void test_generic(void)
>>           smp_parse_test(ms, data, false);
>>       }
>>   +    /* Reset the supported min CPUs and max CPUs */
>> +    mc->min_cpus = MIN_CPUS;
>> +    mc->max_cpus = MAX_CPUS;
>> +
>>       object_unref(obj);
>>   }
>>   
> Just want to have a note:
> Besides the supported min/max CPUs, mc->smp_props is dirtied
> too for test purpose in each sub-test function. But for now, it is
> not functionally necessary to also restore them at the final of each
> sub-test function. We need to do this when new specific parameters
> are tested in separate tests.

What we ought do is have an abstract TestMachineClass and have
a specific TestCaseMachineClass for each of your test cases.
This way we don't need to modify the class internal state at
runtime. I chose to not do it now because this is a more invasive
change past hard-freeze, and I just want to fix the Cirrus-CI
jobs here.

> At that time, for example, we will need
> to at least add:
> 
> /* Restore the SMP compat properties */
> mc->smp_props.dies_supported = false;
> 
> at the bottom of test_with_dies()

OK, I'll add that.

> Reviewed-by: Yanan Wang <wangyanan55@huawei.com>
> Tested-by: Yanan Wang <wangyanan55@huawei.com>
> 
> Thanks,
> Yanan
> 


