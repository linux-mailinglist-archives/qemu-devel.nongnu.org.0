Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F60F45426B
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 09:10:08 +0100 (CET)
Received: from localhost ([::1]:51596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnG17-0006Qa-PY
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 03:10:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mnFzs-0005f7-6i
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 03:08:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35140)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mnFzp-0007dT-FC
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 03:08:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637136524;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0csX0epTVxjv9nV96qUyfN0phV32pL9ZBOL8ag42CCc=;
 b=C2izciUEBoqC0i4SwFoYJEDn7erQdp2GR+sk5QaxJUzzN7aBlmLrQgzwpwyRXUOuWKXYld
 gM9L0nhbZ7mQuunbQVDLOMVsi7TLOeTblV8u/ThsQeEzRP42k/Cy3A5PGKWPZJXznGzQl7
 YRDkh4bUON7LIZB3FM1U2j6ImRsbYOQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-173-ooHajaVDMECZOQSlXhAT3Q-1; Wed, 17 Nov 2021 03:08:43 -0500
X-MC-Unique: ooHajaVDMECZOQSlXhAT3Q-1
Received: by mail-wm1-f71.google.com with SMTP id
 z126-20020a1c7e84000000b003335e5dc26bso696955wmc.8
 for <qemu-devel@nongnu.org>; Wed, 17 Nov 2021 00:08:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0csX0epTVxjv9nV96qUyfN0phV32pL9ZBOL8ag42CCc=;
 b=kfex8y4DTuUwHjdaURTxWrrTbUoQskX7+H7YesMlopO09a5uOA/TBaOCxBeVyAzZes
 7QfWgXbCvmRcCsBd1Tw3w636d1qAsNCdJYKuLA3MPBHAJGIobdh8N7WurB7+UVGudAGf
 BFk4MbxksIbI/sUEXSqiicgqOLJZJv0bQIfSHDe2kM4c5SZN44NGxEMoRQ4zgZsuU0/S
 qs517Zx5vvxGjouyznWisp2/ymVIQSkCj0Bp6of+zEjrN79oOvmgX6ExcFVTjGPM1Fac
 XmAoyReNYThY/JNUgpGAbbdTe5oGi6B425amXWlxtlRokAaE758OQDlnwfY5z1qiLQaL
 KR0A==
X-Gm-Message-State: AOAM530W8TtvpqExAH1rJ0c46TidXvUS5/FetouMhwm9RJhPAgKkU0Ei
 8dGneDz6KlE3+24DPPa3GQXC808DVMUsDzFhZKKGWwjC1C6J0VC7vgxNapnpSZedYDEvYw2c8ze
 WhiyQn2Bjejf/SZI=
X-Received: by 2002:a7b:c102:: with SMTP id w2mr76001558wmi.151.1637136522111; 
 Wed, 17 Nov 2021 00:08:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw9EuqrhelahssXeve/St3cORCWkavKGzKEP7c6ufuYVYsZBKqbznxMxXK5yZw3N3/M60klsQ==
X-Received: by 2002:a7b:c102:: with SMTP id w2mr76001525wmi.151.1637136521856; 
 Wed, 17 Nov 2021 00:08:41 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id l21sm10464966wrb.38.2021.11.17.00.08.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Nov 2021 00:08:41 -0800 (PST)
Message-ID: <32c42141-18e2-aa2c-8019-19aae50d4c24@redhat.com>
Date: Wed, 17 Nov 2021 09:08:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH-for-7.0 v4 08/11] tests/unit/test-smp-parse: Add
 'smp-without-dies-valid' machine type
To: "wangyanan (Y)" <wangyanan55@huawei.com>, qemu-devel@nongnu.org
References: <20211115145900.2531865-1-philmd@redhat.com>
 <20211115145900.2531865-9-philmd@redhat.com>
 <06bcb095-66f5-6c11-0cd2-fa9defce799e@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <06bcb095-66f5-6c11-0cd2-fa9defce799e@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.009, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hi Yanan,

On 11/17/21 08:37, wangyanan (Y) wrote:
> On 2021/11/15 22:58, Philippe Mathieu-Daudé wrote:
>> Keep the common TYPE_MACHINE class initialization in
>> machine_base_class_init(), make it abstract, and move
>> the non-common code to a new class: "smp-without-dies-valid".
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>   tests/unit/test-smp-parse.c | 19 +++++++++++++++----
>>   1 file changed, 15 insertions(+), 4 deletions(-)
>>
>> diff --git a/tests/unit/test-smp-parse.c b/tests/unit/test-smp-parse.c
>> index dfe7f1313b0..90a249fe8c8 100644
>> --- a/tests/unit/test-smp-parse.c
>> +++ b/tests/unit/test-smp-parse.c
>> @@ -478,13 +478,19 @@ static void machine_base_class_init(ObjectClass
>> *oc, void *data)
>>   {
>>       MachineClass *mc = MACHINE_CLASS(oc);
>>   +    mc->smp_props.prefer_sockets = true;
>> +
>> +    mc->name = g_strdup(SMP_MACHINE_NAME);
>> +}
>> +
>> +static void machine_without_dies_valid_class_init(ObjectClass *oc,
>> void *data)
>> +{
>> +    MachineClass *mc = MACHINE_CLASS(oc);
>> +
>>       mc->min_cpus = MIN_CPUS;
>>       mc->max_cpus = MAX_CPUS;
>>   -    mc->smp_props.prefer_sockets = true;
>>       mc->smp_props.dies_supported = false;
>> -
>> -    mc->name = g_strdup(SMP_MACHINE_NAME);
>>   }
>>     static void machine_without_dies_invalid_class_init(ObjectClass
>> *oc, void *data)
>> @@ -606,9 +612,14 @@ static const TypeInfo smp_machine_types[] = {
>>       {
>>           .name           = TYPE_MACHINE,
>>           .parent         = TYPE_OBJECT,
>> +        .abstract       = true,
>>           .class_init     = machine_base_class_init,
>>           .class_size     = sizeof(MachineClass),
>>           .instance_size  = sizeof(MachineState),
>> +    }, {
>> +        .name           = MACHINE_TYPE_NAME("smp-without-dies-valid"),
>> +        .parent         = TYPE_MACHINE,
>> +        .class_init     = machine_without_dies_valid_class_init,
>>       }, {
>>           .name           =
>> MACHINE_TYPE_NAME("smp-without-dies-invalid"),
>>           .parent         = TYPE_MACHINE,
>> @@ -629,7 +640,7 @@ int main(int argc, char *argv[])
>>       g_test_init(&argc, &argv, NULL);
>>         g_test_add_data_func("/test-smp-parse/generic/valid",
>> -                         TYPE_MACHINE,
>> +                         MACHINE_TYPE_NAME("smp-without-dies-valid"),
>>                            test_generic_valid);
>>       g_test_add_data_func("/test-smp-parse/generic/invalid",
>>                            MACHINE_TYPE_NAME("smp-without-dies-invalid"),
> After patch #7 and #8, we will have sub-tests as below. It looks nice,
> but it will
> probably be better to tweak "smp-without-dies-valid" to
> "smp-generic-valid",
> and "smp-without-dies-invalid" to "smp-generic-invalid", which will be more
> consistent with the corresponding sub-test name.
> 
> It's Ok now as we only have dies currently besides generic
> sockets/cores/threads,
> but "smp-without-dies-xxx" will become a bit confusing when new topology
> members are introduced and tested here.

OK I modified it and will respin once v6.2 is released.

Also test_with_dies() should be split in 2 tests: valid/invalid;
then smp_parse_test() should split tests further regarding the
socket preference. But I'll let that to you, I wanted to 1/ fix
our Windows CI and 2/ show you how to structure the tests.

Regards,

Phil.


