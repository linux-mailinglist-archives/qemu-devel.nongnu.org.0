Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC0A62F1F3
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 10:56:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovy4Z-0008Rx-Ce; Fri, 18 Nov 2022 04:54:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ovy4T-0008JM-Mb
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 04:54:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ovy4R-0002xF-Nf
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 04:54:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668765242;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dtm+8my2jGPlJK1/kSSl3kwafpY1xwwtsKG2BP16XS8=;
 b=AmNgphL8BC5vyMmkkIegx1UKQbwclZa/frO/G+1Y804IKBf333Zz2ex6vlL01Qm+pzw4A7
 4YyaS7g+4mdsJUB2J0UBTk6DNFAGpOSErjDANw17iciyh8v6TNdEb9mLeBRVqHRo0GGZZm
 R3lmvPuIxBUdVKdD3XaiYh9y6d0fcik=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-475-YvB0pr8TPvCbTS3UHpuOmA-1; Fri, 18 Nov 2022 04:54:01 -0500
X-MC-Unique: YvB0pr8TPvCbTS3UHpuOmA-1
Received: by mail-wm1-f70.google.com with SMTP id
 h9-20020a1c2109000000b003cfd37aec58so2035123wmh.1
 for <qemu-devel@nongnu.org>; Fri, 18 Nov 2022 01:54:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dtm+8my2jGPlJK1/kSSl3kwafpY1xwwtsKG2BP16XS8=;
 b=QmdsWTEM0I6XNg2d6+UDy8+OYCwWw5Oaih3iY9x7njMSs1C6I7VPTIWoa/KRRivSW4
 NkUcdHjdp0UwnzhBqqcRjAqHaUbdp1fn+CbI4RUHH1HznQS0jQ7nt7K4TM6QWeP2rsXP
 Ljk96fHJVPNDtFzvPASDUHzIm4FHWmLenyxN+/Zr/Q0kYrKC8YaaUoxhdZWcOVgCDe5v
 nNNSm7d1kqgg6B7IfxAoimgoNRfHiq/vEBnTsCNwQXbtcTg1AQEMd7wDMi+fvP1M2vQU
 hjAEsPjfulMvNx4iVTC6IYQ0gecsswkg0qqjSpiMox6Cnwpn/+HvzMbwiqeYHYbk7GYD
 f3Pw==
X-Gm-Message-State: ANoB5pk4ARj3lYfb1SMZ+ovVmSIV5znG4x1xWWslhY5sNnQxzOJozNRZ
 HzzgJiQSkkNTC8vijjmIa1H7/9800y29oE8vxwEJ32clynS0R61IOOxvUQlFZUcXGRS5KFakcsL
 9xPkkDIQASWssPCU=
X-Received: by 2002:a5d:5603:0:b0:241:c2ce:86a4 with SMTP id
 l3-20020a5d5603000000b00241c2ce86a4mr1034181wrv.360.1668765239827; 
 Fri, 18 Nov 2022 01:53:59 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4CwupHdnR/pHqqNaA2l87qUfn+TqJvESctm0GbP23XKj8AcSW12K0XSsI9ZnCLpicpV142zw==
X-Received: by 2002:a5d:5603:0:b0:241:c2ce:86a4 with SMTP id
 l3-20020a5d5603000000b00241c2ce86a4mr1034164wrv.360.1668765239548; 
 Fri, 18 Nov 2022 01:53:59 -0800 (PST)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 f10-20020a5d4dca000000b002416ecb8c33sm3116748wru.105.2022.11.18.01.53.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Nov 2022 01:53:59 -0800 (PST)
Message-ID: <f7a0ee85-5121-6390-1d0c-f406fcb00232@redhat.com>
Date: Fri, 18 Nov 2022 10:53:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v3 2/3] KVM: keep track of running ioctls
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, kvm@vger.kernel.org
References: <20221111154758.1372674-1-eesposit@redhat.com>
 <20221111154758.1372674-3-eesposit@redhat.com>
 <8a7521c2-2335-4070-8555-954aa2a71422@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <8a7521c2-2335-4070-8555-954aa2a71422@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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



Am 17/11/2022 um 20:27 schrieb David Hildenbrand:
> On 11.11.22 16:47, Emanuele Giuseppe Esposito wrote:
>> Using the new accel-blocker API, mark where ioctls are being called
>> in KVM. Next, we will implement the critical section that will take
>> care of performing memslots modifications atomically, therefore
>> preventing any new ioctl from running and allowing the running ones
>> to finish.
>>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
> 
> You might want to drop that and instead mention something like "This
> patch is based on a protoype patch by David Hildenbrand".
> 
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>> ---
>>   accel/kvm/kvm-all.c | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
>> index f99b0becd8..ff660fd469 100644
>> --- a/accel/kvm/kvm-all.c
>> +++ b/accel/kvm/kvm-all.c
>> @@ -2310,6 +2310,7 @@ static int kvm_init(MachineState *ms)
>>       assert(TARGET_PAGE_SIZE <= qemu_real_host_page_size());
>>         s->sigmask_len = 8;
>> +    accel_blocker_init();
>>     #ifdef KVM_CAP_SET_GUEST_DEBUG
>>       QTAILQ_INIT(&s->kvm_sw_breakpoints);
>> @@ -3014,7 +3015,9 @@ int kvm_vm_ioctl(KVMState *s, int type, ...)
>>       va_end(ap);
>>         trace_kvm_vm_ioctl(type, arg);
>> +    accel_ioctl_begin();
>>       ret = ioctl(s->vmfd, type, arg);
>> +    accel_ioctl_end();
>>       if (ret == -1) {
>>           ret = -errno;
>>       }
>> @@ -3032,7 +3035,9 @@ int kvm_vcpu_ioctl(CPUState *cpu, int type, ...)
>>       va_end(ap);
>>         trace_kvm_vcpu_ioctl(cpu->cpu_index, type, arg);
>> +    accel_cpu_ioctl_begin(cpu);
>>       ret = ioctl(cpu->kvm_fd, type, arg);
>> +    accel_cpu_ioctl_end(cpu);
>>       if (ret == -1) {
>>           ret = -errno;
>>       }
>> @@ -3050,7 +3055,9 @@ int kvm_device_ioctl(int fd, int type, ...)
>>       va_end(ap);
>>         trace_kvm_device_ioctl(fd, type, arg);
>> +    accel_ioctl_begin();
>>       ret = ioctl(fd, type, arg);
>> +    accel_ioctl_end();
>>       if (ret == -1) {
>>           ret = -errno;
>>       }
> 
> I recall that I had some additional patches that tried to catch some of
> more calls:
> 
> https://lore.kernel.org/qemu-devel/20200312161217.3590-2-david@redhat.com/
> 
> https://lore.kernel.org/qemu-devel/20200312161217.3590-3-david@redhat.com/
> 
> Do they still apply? Is there more?
> 

Apologies, what do you mean with "do they still apply"?
Looks fine to me

Emanuele


