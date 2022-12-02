Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 868CA640658
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Dec 2022 13:05:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p14lo-0002ko-QP; Fri, 02 Dec 2022 07:03:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1p14ll-0002ii-AM
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 07:03:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1p14lj-0003x7-BR
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 07:03:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669982629;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HtPg/dh9QYEl6yrHory3nv8jqkuqPr74m3e1GaYIopY=;
 b=PlEGqTXpI+TSxSQVI6KSv6d8XNNHn89cfAdZQsUaXNwHA/r3IvGSwc+zQYVOPl1BUf3w4N
 k4uRdpuxCjUIwFBG89TDJFdK15bD5NAB9bpaC29L1Qsp56OjW596Fvb3IFj1CAFw18z9PQ
 uzslamjEYdse+pkrkJqMvLrMgOP4fX8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-99-iOkeerHmMJelidTe2OGRMg-1; Fri, 02 Dec 2022 07:03:48 -0500
X-MC-Unique: iOkeerHmMJelidTe2OGRMg-1
Received: by mail-wr1-f72.google.com with SMTP id
 v14-20020adf8b4e000000b0024174021277so1023078wra.13
 for <qemu-devel@nongnu.org>; Fri, 02 Dec 2022 04:03:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HtPg/dh9QYEl6yrHory3nv8jqkuqPr74m3e1GaYIopY=;
 b=qO3o9zzX5xrPEamvd1QtANFW5c+oI6e69q8YUV32S1BoKCQl5sYKo91ICLKw0jiiqt
 vftdW6Xzn6aiyf0W3/mILkT3uc0R2T/1bQLs1NpF4eWhh/qsCgNnlKKVK9a4aLMGKbQW
 KTZGpAT0eAajSh1sJvdNCTG8PKxnqDhCz6JA5KHVs1hpRjzeT7o4vuGWH0/QjCzbJOAR
 pNZwI/eSAgUT3/juh9Joivd1P48+dqCgDYhDN2MlwPWgNlyDI7Gfctji8bJCdMUNdkXL
 sqNvyBWBHTryHYxt3mJJpqfal3xk4tyw7cU9J0XSTOjqixBKrD/zqLrBNMKFTCY9z56E
 0fxQ==
X-Gm-Message-State: ANoB5pnWltmjUBsczFbyzYgUR9ElieLQf8FpvLb2s5ctFvgAGJFSj5SC
 rDvP05eyxGyqwg4NT0+g5gWaNf7X1D5fLzQOk+21LUPSwb8M8S+xfCOJuhwICcj7Od7H1RR9GNN
 P1urlfCY2HGxcDu0=
X-Received: by 2002:a05:6000:548:b0:242:3f7e:1bdf with SMTP id
 b8-20020a056000054800b002423f7e1bdfmr3381084wrf.636.1669982627414; 
 Fri, 02 Dec 2022 04:03:47 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7WiVrKEU6X5GazgfxbefEHiHL0FPwlQXsLYYQuh6SIJswQ3+bWWzThEdBs4FVLKhFAGRYfew==
X-Received: by 2002:a05:6000:548:b0:242:3f7e:1bdf with SMTP id
 b8-20020a056000054800b002423f7e1bdfmr3381063wrf.636.1669982627174; 
 Fri, 02 Dec 2022 04:03:47 -0800 (PST)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 v128-20020a1cac86000000b003cfa80443a0sm8321048wme.35.2022.12.02.04.03.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Dec 2022 04:03:46 -0800 (PST)
Message-ID: <22042ca5-9786-ca2b-3e3d-6443a744c5a9@redhat.com>
Date: Fri, 2 Dec 2022 13:03:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v3 2/3] KVM: keep track of running ioctls
Content-Language: en-US
To: Robert Hoo <robert.hu@linux.intel.com>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, kvm@vger.kernel.org,
 David Hildenbrand <david@redhat.com>
References: <20221111154758.1372674-1-eesposit@redhat.com>
 <20221111154758.1372674-3-eesposit@redhat.com>
 <c7971c8ad3b4683e2b3036dd7524af1cb42e50e1.camel@linux.intel.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <c7971c8ad3b4683e2b3036dd7524af1cb42e50e1.camel@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.257, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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



Am 02/12/2022 um 07:54 schrieb Robert Hoo:
> On Fri, 2022-11-11 at 10:47 -0500, Emanuele Giuseppe Esposito wrote:
>> Using the new accel-blocker API, mark where ioctls are being called
>> in KVM. Next, we will implement the critical section that will take
>> care of performing memslots modifications atomically, therefore
>> preventing any new ioctl from running and allowing the running ones
>> to finish.
>>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>> ---
>>  accel/kvm/kvm-all.c | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
>> index f99b0becd8..ff660fd469 100644
>> --- a/accel/kvm/kvm-all.c
>> +++ b/accel/kvm/kvm-all.c
>> @@ -2310,6 +2310,7 @@ static int kvm_init(MachineState *ms)
>>      assert(TARGET_PAGE_SIZE <= qemu_real_host_page_size());
>>  
>>      s->sigmask_len = 8;
>> +    accel_blocker_init();
>>  
>>  #ifdef KVM_CAP_SET_GUEST_DEBUG
>>      QTAILQ_INIT(&s->kvm_sw_breakpoints);
>> @@ -3014,7 +3015,9 @@ int kvm_vm_ioctl(KVMState *s, int type, ...)
>>      va_end(ap);
>>  
>>      trace_kvm_vm_ioctl(type, arg);
>> +    accel_ioctl_begin();
>>      ret = ioctl(s->vmfd, type, arg);
>> +    accel_ioctl_end();
>>      if (ret == -1) {
>>          ret = -errno;
>>      }
>> @@ -3032,7 +3035,9 @@ int kvm_vcpu_ioctl(CPUState *cpu, int type,
>> ...)
>>      va_end(ap);
>>  
>>      trace_kvm_vcpu_ioctl(cpu->cpu_index, type, arg);
>> +    accel_cpu_ioctl_begin(cpu);
> 
> Does this mean that kvm_region_commit() can inhibit any other vcpus
> doing any ioctls?

Yes, because we must prevent any vcpu from reading memslots while we are
updating them.

> 
>>      ret = ioctl(cpu->kvm_fd, type, arg);
>> +    accel_cpu_ioctl_end(cpu);
>>      if (ret == -1) {
>>          ret = -errno;
>>      }
>> @@ -3050,7 +3055,9 @@ int kvm_device_ioctl(int fd, int type, ...)
>>      va_end(ap);
>>  
>>      trace_kvm_device_ioctl(fd, type, arg);
>> +    accel_ioctl_begin();
>>      ret = ioctl(fd, type, arg);
>> +    accel_ioctl_end();
>>      if (ret == -1) {
>>          ret = -errno;
>>      }
> 


