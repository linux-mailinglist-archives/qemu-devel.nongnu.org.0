Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A06365D06C
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 11:12:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pD0jb-0000jq-UX; Wed, 04 Jan 2023 05:11:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pD0jZ-0000jD-Tc
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 05:10:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pD0jY-0003Fa-EO
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 05:10:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672827055;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EDbqq7nmz3g/IaJpvjH8/5KoOXpwXRrKFTQN/GcTCI4=;
 b=NEVrSFTL0Y0rmJAB8dz9OJpwFQz45u8MqrPXkibXO+/bv2+NT4plnmMylI/P41Vnowjaz0
 1M9Mco8A5CWKKHtke5Khd8fMZIqgZYiMxd3jg0yI82m8Xak81iAtQsSs/0ySiDxnZbiK8z
 U9kzu+esCijFoADMv9x16Iulqq/x4ak=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-609-AIgr_zipOS-x5gGnrhIfMw-1; Wed, 04 Jan 2023 05:10:52 -0500
X-MC-Unique: AIgr_zipOS-x5gGnrhIfMw-1
Received: by mail-wm1-f70.google.com with SMTP id
 i7-20020a05600c354700b003d62131fe46so21548217wmq.5
 for <qemu-devel@nongnu.org>; Wed, 04 Jan 2023 02:10:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EDbqq7nmz3g/IaJpvjH8/5KoOXpwXRrKFTQN/GcTCI4=;
 b=dLB87LEQqMYqcw3pmoxa8rr4UdIAkW8jzRxcV8GUoFT/d6++ZoJo4qFT40unaUyDH4
 VXOgj9ZDkGJnoNU9R57dSuLkuTtDkGwgJk+LsOjhkJ5UUTmW+suopfGE7PxSsaGGaxp3
 04AuRW+eQK+6t9WPUbaVm1r3ocLsZL5UzV7CnKLtchX/ZVmTTF6Hl7Agof5aV6pYe28k
 SZ63pxMZGylwHsp2qN7xVb1Q6S57Vl9AQuPoiMosxbf45elU6v2FOMjYiucHbGID/1ex
 gIyG4WsmmM20/Vlv5QuCS/2hagRkQRF1Lt/+bJfDZUpvRloQ+KZX5DlwSdOE6RK/HNgE
 kuew==
X-Gm-Message-State: AFqh2krBAW39hToP51NrOEgRYwlaC9LnuLmG/eAv98vckrj0wY9AKRfY
 XfOe2m/K3dw0eBcO5HGL1RqbsaDvOlQm9pBDbVKjDPRtSa9eaGuHhrtjHvQOxyThBOUIrediBSb
 t83VzBPJJhV7W5Co=
X-Received: by 2002:a7b:c7d6:0:b0:3d1:ee3a:62ae with SMTP id
 z22-20020a7bc7d6000000b003d1ee3a62aemr36366575wmk.8.1672827051289; 
 Wed, 04 Jan 2023 02:10:51 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuwMuol8rlDRpeQ+k3fP88Hpi4YifuDU7o3D9m0NQ2i8UZDtPDKFz91TgTRxUmIqBYN63V5iQ==
X-Received: by 2002:a7b:c7d6:0:b0:3d1:ee3a:62ae with SMTP id
 z22-20020a7bc7d6000000b003d1ee3a62aemr36366557wmk.8.1672827051054; 
 Wed, 04 Jan 2023 02:10:51 -0800 (PST)
Received: from [192.168.0.5] (ip-109-43-176-239.web.vodafone.de.
 [109.43.176.239]) by smtp.gmail.com with ESMTPSA id
 i2-20020a05600c354200b003d35acb0fd7sm54190077wmq.34.2023.01.04.02.10.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jan 2023 02:10:49 -0800 (PST)
Message-ID: <2aa66095-7de5-38a8-94ed-3c67098fe24d@redhat.com>
Date: Wed, 4 Jan 2023 11:10:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 1/1] qemu-iotests/stream-under-throttle: do not shutdown
 QEMU
Content-Language: en-US
To: Christian Borntraeger <borntraeger@linux.ibm.com>,
 qemu-devel <qemu-devel@nongnu.org>, hreitz@redhat.com
Cc: qemu-s390x <qemu-s390x@nongnu.org>, Cornelia Huck <cohuck@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, kwolf@redhat.com, qemu-block@nongnu.org
References: <20221207131452.8455-1-borntraeger@linux.ibm.com>
 <3701fed1-b57a-185b-d848-65605cb09ddb@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <3701fed1-b57a-185b-d848-65605cb09ddb@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.103, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 12/12/2022 11.13, Christian Borntraeger wrote:
> 
> 
> Am 07.12.22 um 14:14 schrieb Christian Borntraeger:
>> Without a kernel or boot disk a QEMU on s390 will exit (usually with a
>> disabled wait state). This breaks the stream-under-throttle test case.
>> Do not exit qemu if on s390.
>>
>> Signed-off-by: Christian Borntraeger <borntraeger@linux.ibm.com>
>> ---
>>   tests/qemu-iotests/tests/stream-under-throttle | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/tests/qemu-iotests/tests/stream-under-throttle 
>> b/tests/qemu-iotests/tests/stream-under-throttle
>> index 8d2d9e16840d..c24dfbcaa2f2 100755
>> --- a/tests/qemu-iotests/tests/stream-under-throttle
>> +++ b/tests/qemu-iotests/tests/stream-under-throttle
>> @@ -88,6 +88,8 @@ class TestStreamWithThrottle(iotests.QMPTestCase):
>>                              'x-iops-total=10000,x-bps-total=104857600')
>>           self.vm.add_blockdev(self.vm.qmp_to_opts(blockdev))
>>           
>> self.vm.add_device('virtio-blk,iothread=iothr0,drive=throttled-node')
>> +        if iotests.qemu_default_machine == 's390-ccw-virtio':
>> +            self.vm.add_args('-no-shutdown')
>>           self.vm.launch()
>>       def tearDown(self) -> None:
> 
> 
> ping. I guess, this will come after the release?

Since it is related to s390x, I can take it through my s390x branch.

  Thomas


