Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B49A568DD24
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 16:36:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPQ0F-000113-7n; Tue, 07 Feb 2023 10:35:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1pPQ05-0000ud-AI
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 10:35:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1pPQ03-0004nn-1X
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 10:35:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675784111;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oVZEq3XaEPB8JjgV4QcYiyPBtrXnBeZO2zzNCczpvTY=;
 b=RCIV/kx4WkW79hpMgb9beCohs6ZC++8vdBWem8b9g2fPMzscymT0Bj5I0ZXIGPxsJUmaBq
 bCK+cK2D68p+nHpTKAFmkjBjGE4BEKBkiy1Prfnatw9BsLAApq5RTtRB3VDe1gElSdkCbm
 VIArso7CrhnLEMsykDO/ZV2uiSAAaWE=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-3-kOkG_00FOt6jFga1Q3qnXg-1; Tue, 07 Feb 2023 10:35:09 -0500
X-MC-Unique: kOkG_00FOt6jFga1Q3qnXg-1
Received: by mail-qt1-f198.google.com with SMTP id
 c14-20020ac87d8e000000b003ba2d72f98aso2830465qtd.10
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 07:35:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oVZEq3XaEPB8JjgV4QcYiyPBtrXnBeZO2zzNCczpvTY=;
 b=RIEkitIgGlckpxd5jLmM82ur3/dk843CHfezePeTdm3XJD14SQxFV7t0q1598IRD8F
 DBLCyTgF0X0h+V8IDILNaER1tCYugClORWDg3W4rysR7Ed65DmyWEFTriV8hJA+kq9mi
 MLrewWvxjDEvSSNKXTiDc4Qnymm5OT221fWZZ1EfVZNtFkiKTbYi8uM7FeZJWrW0M/O5
 e0lHIzLSuwelM7vzJ9z0SJxoxezPEUKnxVcjoahmDcmziCXD58jDT0ALHHVTHrDU2M25
 X64iR9Fy7RN2XuZXXI/s7MweWtmX0Iu/jnQGAFYjqoivfqfqt79KfLkeNRx45XqFA46V
 wupQ==
X-Gm-Message-State: AO0yUKU7A39zvuJeBPm61mgo21k0hRkYffrsli2AQ0FesTjbR07rM6n4
 fGQdwCWpinNu8uMb1O55lBjA2A5EtM1WYajSObThj6mKNLpVlYntYzLGh4vdIwgeAGmX6Q41/iT
 EjS9jwUAAdDxZe1U=
X-Received: by 2002:a05:622a:164e:b0:3b9:b6e8:8670 with SMTP id
 y14-20020a05622a164e00b003b9b6e88670mr6741562qtj.51.1675784108577; 
 Tue, 07 Feb 2023 07:35:08 -0800 (PST)
X-Google-Smtp-Source: AK7set8q+i3kHOcVqF9guHCtou59zI/CZrwAjQYrG7mOMT6gNgETxQNAFLvtfRCywG9PAQjtVgJ9UQ==
X-Received: by 2002:a05:622a:164e:b0:3b9:b6e8:8670 with SMTP id
 y14-20020a05622a164e00b003b9b6e88670mr6741534qtj.51.1675784108357; 
 Tue, 07 Feb 2023 07:35:08 -0800 (PST)
Received: from [192.168.100.30] ([82.142.8.70])
 by smtp.gmail.com with ESMTPSA id
 c77-20020ae9ed50000000b00720ae160601sm9634058qkg.22.2023.02.07.07.35.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 07:35:07 -0800 (PST)
Message-ID: <79b5fb1f-f377-0fb1-0abf-8454e1f2cd91@redhat.com>
Date: Tue, 7 Feb 2023 16:35:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 04/12] tests/qtest: Skip virtio-serial-console tests if
 device not present
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 qemu-devel@nongnu.org
Cc: Amit Shah <amit@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Emanuele Giuseppe Esposito <e.emanuelegiuseppe@gmail.com>
References: <20230206150416.4604-1-farosas@suse.de>
 <20230206150416.4604-5-farosas@suse.de>
 <3b2e6eb7-2f0a-7663-b454-bce49d92f36f@redhat.com>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <3b2e6eb7-2f0a-7663-b454-bce49d92f36f@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 2/7/23 14:25, Thomas Huth wrote:
> On 06/02/2023 16.04, Fabiano Rosas wrote:
>> The virtconsole device might not be present in the QEMU build that is
>> being tested. Skip the test if that's the case.
>>
>> Signed-off-by: Fabiano Rosas <farosas@suse.de>
>> ---
>>   tests/qtest/virtio-serial-test.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/tests/qtest/virtio-serial-test.c b/tests/qtest/virtio-serial-test.c
>> index 2541034822..f4e05e8fdd 100644
>> --- a/tests/qtest/virtio-serial-test.c
>> +++ b/tests/qtest/virtio-serial-test.c
>> @@ -28,6 +28,10 @@ static void register_virtio_serial_test(void)
>>   {
>>       QOSGraphTestOptions opts = { };
>> +    if (!qtest_has_device("virtconsole")) {
>> +        return;
>> +    }
>> +
>>       opts.edge.before_cmd_line = "-device virtconsole,bus=vser0.0";
>>       qos_add_test("console-nop", "virtio-serial", virtio_serial_nop, &opts);
> 
> virtio-serial-test.c is a qos test - and this should detect automatically already whether 
> a device is available and pluggable or not, I think.
> 
> There must be something else wrong here ... Laurent, Paolo, any ideas?

I think the checking of the device should be added where the device is added to the qos 
tree, in libqos/virtio-serial.c

If you don't add the device then the test is not started.

If I remember correctly, there was no autodetection of the devices, all are added statically.

Thanks,
Laurent


