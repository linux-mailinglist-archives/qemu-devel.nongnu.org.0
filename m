Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D00E44D42E
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 10:39:29 +0100 (CET)
Received: from localhost ([::1]:51044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml6YK-0004CK-Cz
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 04:39:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ml6Wl-0002Ao-UE
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 04:37:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52961)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ml6Wj-00066p-Vu
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 04:37:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636623469;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vmgu90SmsVXHNpZK8Is++ZKKZKVewMZzDqeSGc2YAk4=;
 b=BQes9AainssL8OUdalnyWEznumcnJQyDFZhnUAwscDqpIfc/h0iVui3ma4ZgsRCHL0G0Ya
 uryXuLdQS88pPTFh/nFkRLludxXzbTe/TqGnb2JDyiC06dmaVL4UbOKlOemGoNklD57pVJ
 aGjkhG0RrgYCvkdU/7EVmtid5xsrJGM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-227-6Abu7Iv3OeGzSRC0bzkupg-1; Thu, 11 Nov 2021 04:37:48 -0500
X-MC-Unique: 6Abu7Iv3OeGzSRC0bzkupg-1
Received: by mail-wm1-f69.google.com with SMTP id
 z126-20020a1c7e84000000b003335e5dc26bso1190741wmc.8
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 01:37:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Vmgu90SmsVXHNpZK8Is++ZKKZKVewMZzDqeSGc2YAk4=;
 b=8OnvI0y1xiZ+OChprchehyydy5y4aEm5nNk+BP7dSwaMxmQ78VkJZ/hVXA6ZaPpRxY
 S6XQrm6TnGD01mh9jWB8/SKs6xWaILcZa6LfbaYLo7xIqz7lvDTrs6gTtpvA1lR4qo0W
 CgXlGamqvYnzLNak6qsus37VVwo/SO0/lOQeD8V84FF3uRtd2br1kG1zwogM2LlID2Z8
 27gngT2lswpJulkqQhURCHjPyA9GH9Uei88/AlVkYNDh2Pe86KGkbRMDVThdv80TtEnN
 +hNnySzRqPEms1Paa+F8Q890BASngSqVsfaxCRLNwhGpOxI0FXNJLC4uGtPlhLdXrCYv
 d0Nw==
X-Gm-Message-State: AOAM533S/V6FBfjawLqAUJzjWEyRuP8JtgoheSgYHzfHKwfEFkIEVuV6
 hhGwcAVrmzFB82TySr6wAmG7mYp7VF/eOsSm7EZOEFnCVGjpppD3jz6Bmr+b/7lVO9AaeidfExd
 BThLxgJ7h/TFm05Y=
X-Received: by 2002:a1c:23d2:: with SMTP id j201mr2389587wmj.76.1636623467108; 
 Thu, 11 Nov 2021 01:37:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz95fmMUc/+KC4uz0fXK5K+xJYLfHerzU/bBfh5ZPeNIspocf83GwfE/Hr4+RJMZNVcFj9p+A==
X-Received: by 2002:a1c:23d2:: with SMTP id j201mr2389553wmj.76.1636623466813; 
 Thu, 11 Nov 2021 01:37:46 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id o3sm8900785wms.10.2021.11.11.01.37.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Nov 2021 01:37:46 -0800 (PST)
Message-ID: <440cee74-13e0-ba38-070f-49f939f33319@redhat.com>
Date: Thu, 11 Nov 2021 10:37:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 2/2] tests/unit: Add an unit test for smp parsing
To: "wangyanan (Y)" <wangyanan55@huawei.com>, qemu-devel@nongnu.org
References: <20211028150913.1975305-1-philmd@redhat.com>
 <20211028150913.1975305-3-philmd@redhat.com>
 <fd32e519-f970-d039-8291-897363b20add@redhat.com>
 <14250bbd-c3fb-9afc-f08d-587326f0382c@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <14250bbd-c3fb-9afc-f08d-587326f0382c@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -74
X-Spam_score: -7.5
X-Spam_bar: -------
X-Spam_report: (-7.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.999, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Andrew Jones <drjones@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/11/21 10:31, wangyanan (Y) wrote:
> 
> On 2021/11/11 17:14, Philippe Mathieu-Daudé wrote:
>> On 10/28/21 17:09, Philippe Mathieu-Daudé wrote:
>>> From: Yanan Wang <wangyanan55@huawei.com>
>>>
>>> Now that we have a generic parser smp_parse(), let's add an unit
>>> test for the code. All possible valid/invalid SMP configurations
>>> that the user can specify are covered.
>>>
>>> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
>>> Reviewed-by: Andrew Jones <drjones@redhat.com>
>>> Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>> Message-Id: <20211026034659.22040-3-wangyanan55@huawei.com>
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>> ---
>>>   tests/unit/test-smp-parse.c | 594 ++++++++++++++++++++++++++++++++++++
>>>   MAINTAINERS                 |   1 +
>>>   tests/unit/meson.build      |   1 +
>>>   3 files changed, 596 insertions(+)
>>>   create mode 100644 tests/unit/test-smp-parse.c
>>> +static struct SMPTestData data_generic_valid[] = {
>>> +    {
>>> +        /* config: no configuration provided
>>> +         * expect: cpus=1,sockets=1,cores=1,threads=1,maxcpus=1 */
>> [1]
>>
>>> +        .config = SMP_CONFIG_GENERIC(F, 0, F, 0, F, 0, F, 0, F, 0),
>>> +        .expect_prefer_sockets = CPU_TOPOLOGY_GENERIC(1, 1, 1, 1, 1),
>>> +        .expect_prefer_cores   = CPU_TOPOLOGY_GENERIC(1, 1, 1, 1, 1),
>>> +    }, {
>>> +static void test_generic(void)
>>> +{
>>> +    Object *obj = object_new(TYPE_MACHINE);
>>> +    MachineState *ms = MACHINE(obj);
>>> +    MachineClass *mc = MACHINE_GET_CLASS(obj);
>> Watch out, while you create a machine instance in each
>> test, there is only one machine class registered (see
>> type_register_static(&smp_machine_info) below in [2]),
>> ...
> Yes, I noticed this. So on the top of each sub-test function, the
> properties
> of the single machine class is re-initialized by
> smp_machine_class_init(mc).
> See [*] below.
>>> +    SMPTestData *data = &(SMPTestData){0};
>>> +    int i;
>>> +
>>> +    smp_machine_class_init(mc);
> [*]
>>> +
>>> +    for (i = 0; i < ARRAY_SIZE(data_generic_valid); i++) {
>>> +        *data = data_generic_valid[i];
>>> +        unsupported_params_init(mc, data);
>>> +
>>> +        smp_parse_test(ms, data, true);
>>> +
>>> +        /* Unsupported parameters can be provided with their values
>>> as 1 */
>>> +        data->config.has_dies = true;
>>> +        data->config.dies = 1;
>>> +        smp_parse_test(ms, data, true);
>>> +    }
>>> +
>>> +    /* Reset the supported min CPUs and max CPUs */
>>> +    mc->min_cpus = 2;
>>> +    mc->max_cpus = 511;
>> ... and here you are modifying the single machine class state, ...
>>
>>> +
>>> +    for (i = 0; i < ARRAY_SIZE(data_generic_invalid); i++) {
>>> +        *data = data_generic_invalid[i];
>>> +        unsupported_params_init(mc, data);
>>> +
>>> +        smp_parse_test(ms, data, false);
>>> +    }
>>> +
>>> +    object_unref(obj);
>>> +}
>>> +
>>> +static void test_with_dies(void)
>>> +{
>>> +    Object *obj = object_new(TYPE_MACHINE);
>>> +    MachineState *ms = MACHINE(obj);
>>> +    MachineClass *mc = MACHINE_GET_CLASS(obj);
>> ... so here the machine class state is inconsistent, ...
>>
>>> +    SMPTestData *data = &(SMPTestData){0};
>>> +    unsigned int num_dies = 2;
>>> +    int i;
>>> +
>>> +    smp_machine_class_init(mc);
> And here [*].
>>> +    mc->smp_props.dies_supported = true;
>>> +
>>> +    for (i = 0; i < ARRAY_SIZE(data_generic_valid); i++) {
>>> +        *data = data_generic_valid[i];
>>> +        unsupported_params_init(mc, data);
>>> +
>>> +        /* when dies parameter is omitted, it will be set as 1 */
>>> +        data->expect_prefer_sockets.dies = 1;
>>> +        data->expect_prefer_cores.dies = 1;
>>> +
>>> +        smp_parse_test(ms, data, true);
>> ... in particular the first test [1] is tested with mc->min_cpus = 2.
>>
>> I wonder why you are not getting:
>>
>> Output error report: Invalid SMP CPUs 1. The min CPUs supported by
>> machine '(null)' is 2
>>
>> for [1].
> So as I have explained above, we won't get an output error report like
> this here. :)

I see. IMHO this is bad practice example, so I'll send a cleanup patch.


