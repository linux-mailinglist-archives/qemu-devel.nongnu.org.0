Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B8562E53C
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 20:28:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovkXa-0007p5-KE; Thu, 17 Nov 2022 14:27:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1ovkXY-0007oe-RG
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 14:27:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1ovkXW-00043d-Rv
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 14:27:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668713229;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CCGejm4H6jUhB5nUPWvzJPFgNnOlz+t2gtXDuwkn3kM=;
 b=NMo4gO4cO+W0Hb5Yoww+6mXtvkJ4c7Mv5qAUqtS0ktMmfF7tad3WnGnMLSvp3KPlaiJN4r
 tpcR9J9P9ftZg9oa2WeZvScxfKch9txX49E2V6nRIGn0kMNxVO8XuTz22Iq9GMikqFwvHr
 i8NmrFcEkGYEgP9jOzxfYy9uz2Hh1Ag=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-536-FkeSOV3nN6SNdgov-uYmnQ-1; Thu, 17 Nov 2022 14:27:07 -0500
X-MC-Unique: FkeSOV3nN6SNdgov-uYmnQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 h26-20020adfaa9a000000b002364ad63bbcso1001954wrc.10
 for <qemu-devel@nongnu.org>; Thu, 17 Nov 2022 11:27:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CCGejm4H6jUhB5nUPWvzJPFgNnOlz+t2gtXDuwkn3kM=;
 b=PAsFhTzhmMwtgs0HsgP0EgIXHkPSidza+aCLWcft7AAzhzYQKNq5zUAvVSNKsCi/mA
 yCoORdBXUXpZrUYrsle4LcER4co/s5+5wz5FS3xKQm9OE4c8lavoD/zERKV89cSyo+Yt
 ZD6l5l5NZ+lDDEjZNUbWdZR7s/onwDtivUlBguDg/tQ/V8H/+eiQwdrdt5luXK9Be0HI
 kyw00HdCCx0tL36bE4Txy+1nQq/ITQsQrqj25lsKtK0Vu5hpSsXElW8w/2z1jflGhZk4
 5wo/0nU4TXmx0+rydd/mRlSdm0wILcYggfICEAQBS+mV2kcLm7Ne0ZYw07uueUw4B/Ei
 r1aQ==
X-Gm-Message-State: ANoB5pnEtbVO9FLYRTemeYjg2EjqwfH1z7PEDdpwvn8PeeQ49oPDsBnb
 JS4H0yfd4ozIoAaHXqk8HKPk3xw5wYDiILEHzEpiD5u+LBHzZDmgginc5KziZuhnvnO5cZkCvMq
 7j1z2N1662F4NqAM=
X-Received: by 2002:a05:600c:21d2:b0:3cf:b2b1:3c7 with SMTP id
 x18-20020a05600c21d200b003cfb2b103c7mr6212966wmj.176.1668713225734; 
 Thu, 17 Nov 2022 11:27:05 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4z7fgvECPb0vsHQ4kEvE/oJxvyNe046/uFz9ieGX7DY4/GbnzIbO4zVAekqsR7mu0Qcrigqw==
X-Received: by 2002:a05:600c:21d2:b0:3cf:b2b1:3c7 with SMTP id
 x18-20020a05600c21d200b003cfb2b103c7mr6212950wmj.176.1668713225318; 
 Thu, 17 Nov 2022 11:27:05 -0800 (PST)
Received: from ?IPV6:2003:cb:c707:5200:39a9:b834:27c1:4ede?
 (p200300cbc707520039a9b83427c14ede.dip0.t-ipconnect.de.
 [2003:cb:c707:5200:39a9:b834:27c1:4ede])
 by smtp.gmail.com with ESMTPSA id
 k17-20020a5d6291000000b0022e66749437sm1693816wru.93.2022.11.17.11.27.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Nov 2022 11:27:04 -0800 (PST)
Message-ID: <8a7521c2-2335-4070-8555-954aa2a71422@redhat.com>
Date: Thu, 17 Nov 2022 20:27:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v3 2/3] KVM: keep track of running ioctls
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, kvm@vger.kernel.org
References: <20221111154758.1372674-1-eesposit@redhat.com>
 <20221111154758.1372674-3-eesposit@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20221111154758.1372674-3-eesposit@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
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

On 11.11.22 16:47, Emanuele Giuseppe Esposito wrote:
> Using the new accel-blocker API, mark where ioctls are being called
> in KVM. Next, we will implement the critical section that will take
> care of performing memslots modifications atomically, therefore
> preventing any new ioctl from running and allowing the running ones
> to finish.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>

You might want to drop that and instead mention something like "This 
patch is based on a protoype patch by David Hildenbrand".

> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   accel/kvm/kvm-all.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index f99b0becd8..ff660fd469 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -2310,6 +2310,7 @@ static int kvm_init(MachineState *ms)
>       assert(TARGET_PAGE_SIZE <= qemu_real_host_page_size());
>   
>       s->sigmask_len = 8;
> +    accel_blocker_init();
>   
>   #ifdef KVM_CAP_SET_GUEST_DEBUG
>       QTAILQ_INIT(&s->kvm_sw_breakpoints);
> @@ -3014,7 +3015,9 @@ int kvm_vm_ioctl(KVMState *s, int type, ...)
>       va_end(ap);
>   
>       trace_kvm_vm_ioctl(type, arg);
> +    accel_ioctl_begin();
>       ret = ioctl(s->vmfd, type, arg);
> +    accel_ioctl_end();
>       if (ret == -1) {
>           ret = -errno;
>       }
> @@ -3032,7 +3035,9 @@ int kvm_vcpu_ioctl(CPUState *cpu, int type, ...)
>       va_end(ap);
>   
>       trace_kvm_vcpu_ioctl(cpu->cpu_index, type, arg);
> +    accel_cpu_ioctl_begin(cpu);
>       ret = ioctl(cpu->kvm_fd, type, arg);
> +    accel_cpu_ioctl_end(cpu);
>       if (ret == -1) {
>           ret = -errno;
>       }
> @@ -3050,7 +3055,9 @@ int kvm_device_ioctl(int fd, int type, ...)
>       va_end(ap);
>   
>       trace_kvm_device_ioctl(fd, type, arg);
> +    accel_ioctl_begin();
>       ret = ioctl(fd, type, arg);
> +    accel_ioctl_end();
>       if (ret == -1) {
>           ret = -errno;
>       }

I recall that I had some additional patches that tried to catch some of 
more calls:

https://lore.kernel.org/qemu-devel/20200312161217.3590-2-david@redhat.com/

https://lore.kernel.org/qemu-devel/20200312161217.3590-3-david@redhat.com/

Do they still apply? Is there more?

-- 
Thanks,

David / dhildenb


