Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68825476BF6
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 09:32:16 +0100 (CET)
Received: from localhost ([::1]:60680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxmBS-00032z-PA
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 03:32:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxm9k-0001ZZ-LH
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 03:30:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxm9i-0006Om-O6
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 03:30:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639643425;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=htMFU+jubT7RLzNRH/wFJYrF443qrfLnjL8A/WeutZ4=;
 b=ggH32urrqoQiEuCu7loh7HSl+lKQg3YA3zVYo806kSLYJ0wzHRe+2vXBLa3B4jW8s0Nob9
 aIOvFxzrWf39zDWZQkQk2fU2T7FPqJsWIYw1aQttq5yi3rZCwIYCU28dtV4pwJwwb26XTw
 4qMoBuq8ZpeKEZaBVmY5vqm+AQsSkaY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-638-FKgOF-1jN3-d9kp6ta3_hA-1; Thu, 16 Dec 2021 03:30:24 -0500
X-MC-Unique: FKgOF-1jN3-d9kp6ta3_hA-1
Received: by mail-wr1-f69.google.com with SMTP id
 f13-20020adfe90d000000b001a15c110077so1888026wrm.8
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 00:30:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=htMFU+jubT7RLzNRH/wFJYrF443qrfLnjL8A/WeutZ4=;
 b=VHa8C8WorTxt2xKpgdzEJ6/Xazx/4+Hv9hu1q/o19jgDdyVbNTy7Hovet6cYGrks3u
 mLDH9M3c7Y9G+nsLHe7+aI5MvaaDGuXYqU5viSUj4/gvoR3lFVRkHAOb5OyqmByXZFvT
 MlArTO0wHtOGxCjJfTnYOkq0KjXekxgD0ynVLmli/ChMe4oOHPZ0UNc4VJrm6MXInt+l
 5Hk8CbU29tO9MfBtjwg0kDFXfP5AQPPId3ycHkGDGjqLZt4zcuz1SkM6tZO9IpRlsXS2
 iPRGpjN9G0EIkBJpwiwyU+f1TofxVDRy243SY0cSXki+0RGcic9MudaFDOKOdDlq1RCo
 kx+g==
X-Gm-Message-State: AOAM533N/FYFk93vcrPNXZ9PFNajm7U8UkmQHf5jov5Dw2HSlZzhHia5
 vQt8EzOHwQcRu2q5R49+PSybe9Gpfw9l7e/Vr9qSdgl0XbEy9SNJv1igK85nze4raEOATwcgQDz
 hAUiaSKTUs8+yytU=
X-Received: by 2002:a05:600c:3ac3:: with SMTP id
 d3mr3824597wms.174.1639643423205; 
 Thu, 16 Dec 2021 00:30:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwaJO8r9zrrWB2VV81BwC7IkKoAE3RxaImFB/hvfDjgQx5UnST7MRWU5lGVx6VSl9BGockdsA==
X-Received: by 2002:a05:600c:3ac3:: with SMTP id
 d3mr3824577wms.174.1639643422975; 
 Thu, 16 Dec 2021 00:30:22 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id q14sm1344605wro.58.2021.12.16.00.30.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Dec 2021 00:30:22 -0800 (PST)
Message-ID: <9aa80cb5-80ed-7543-5780-10df6b33e412@redhat.com>
Date: Thu, 16 Dec 2021 09:30:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v5 4/8] tests/unit/test-smp-parse: Add
 'smp-generic-invalid' machine type
To: "wangyanan (Y)" <wangyanan55@huawei.com>, qemu-devel@nongnu.org
References: <20211215164856.381990-1-philmd@redhat.com>
 <20211215164856.381990-5-philmd@redhat.com>
 <4ee77a69-b737-46ec-8151-6a8fbb06fb96@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <4ee77a69-b737-46ec-8151-6a8fbb06fb96@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.034, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/16/21 04:20, wangyanan (Y) wrote:
> Hi Philippe,
> 
> On 2021/12/16 0:48, Philippe Mathieu-Daudé wrote:
>> Avoid modifying the MachineClass internals by adding the
>> 'smp-generic-invalid' machine, which inherits from TYPE_MACHINE.
>>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>   tests/unit/test-smp-parse.c | 25 ++++++++++++++++---------
>>   1 file changed, 16 insertions(+), 9 deletions(-)

>>   @@ -606,6 +609,10 @@ static const TypeInfo smp_machine_types[] = {
>>           .class_init     = machine_base_class_init,
>>           .class_size     = sizeof(MachineClass),
>>           .instance_size  = sizeof(MachineState),
>> +    }, {
>> +        .name           = MACHINE_TYPE_NAME("smp-generic-invalid"),
>> +        .parent         = TYPE_MACHINE,
>> +        .class_init     = machine_without_dies_invalid_class_init,
> Maybe it's better to rename "machine_without_dies_invalid_class_init" to
> "machine_generic_invalid_class_init" to be consistent with the .name field.

Indeed I missed that... Thanks.



