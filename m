Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE689640884
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Dec 2022 15:33:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p175U-00082z-Dm; Fri, 02 Dec 2022 09:32:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1p175O-00082K-2x
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 09:32:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1p175M-0003vM-HK
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 09:32:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669991535;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=koItVlGu+1a/7vo9JIQM0stiBr7/5n7yzQpCFYzOrVs=;
 b=M+PRr0ldcU/EOBJxXQngFBEVprzC6kZxAFhc5efU81lAEgjb+r/BD3YrfmGyrlQZKOCoRS
 KL/5MXVYRPjOLg9jLz+yzHSXVVzoKtaWe8AFte0q4ETyNECEdj9uNgOcj89jg5UO1UNftZ
 XmmUHI8rTr00PxZANkYrQa3Ots7/FkY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-13-prSDJtq-MrODn2NcLhiZJQ-1; Fri, 02 Dec 2022 09:32:13 -0500
X-MC-Unique: prSDJtq-MrODn2NcLhiZJQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 h10-20020adfaa8a000000b0024208cf285eso1137263wrc.22
 for <qemu-devel@nongnu.org>; Fri, 02 Dec 2022 06:32:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=koItVlGu+1a/7vo9JIQM0stiBr7/5n7yzQpCFYzOrVs=;
 b=V/BJg31I/nU3ffCLHn/EedyakMrY5eT5C5/U26k4+BfVKuOUX5Jf1tNmALnWBLYe6b
 IRf5Wkd/XX31kHIsIgedN9Lgarq94auUNnkDi25KYNVKpxzOGKZidtAj0Om7arbOAhPj
 hgEGEG9F4M0msUQAPIN0h5jCeVtE3jV2rtTR112lRPWqPmACe24LR4pFhuhpPFE/Fsr7
 ZFfxVpIjGoRpETCv2/D8reO718fyu1bnooDRfTV0el0qVdaW99xsmI1LAwD96NqIsOPl
 KrusPJ9aMLfmHwf05aYfMjjxnyOCZbR9bnp0FMKzSERkFoluwzlHL8bL/QSAPR8ZUOPG
 CpeA==
X-Gm-Message-State: ANoB5pluuYbPV4QnDsHEr6dQB+ZILsDvBh2M6QSMfZ4CaYzR/+bByV+3
 eoikBl4eo8YfXqjgrlhd4eOfeZnBXufUYL+5I2IEQFKqukqODihcUSh8DWOhYqvLUemIMqj6Aid
 t+UK9WgfrjpSFXRE=
X-Received: by 2002:a5d:42c3:0:b0:242:32d7:85f6 with SMTP id
 t3-20020a5d42c3000000b0024232d785f6mr6165963wrr.645.1669991531982; 
 Fri, 02 Dec 2022 06:32:11 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5XdZB7BSSc6lg2fXLp8fzZOhjZSrFh3hrAlxoU7gYMrUbcfzV8a/07FDJrMVpugQI92fK1Cw==
X-Received: by 2002:a5d:42c3:0:b0:242:32d7:85f6 with SMTP id
 t3-20020a5d42c3000000b0024232d785f6mr6165941wrr.645.1669991531751; 
 Fri, 02 Dec 2022 06:32:11 -0800 (PST)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 r10-20020a05600c458a00b003cfd4a50d5asm14245431wmo.34.2022.12.02.06.32.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Dec 2022 06:32:11 -0800 (PST)
Message-ID: <047d6a47-8c7b-0936-95ab-478afb61c21f@redhat.com>
Date: Fri, 2 Dec 2022 15:32:10 +0100
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
 <22042ca5-9786-ca2b-3e3d-6443a744c5a9@redhat.com>
 <0022a85f16c1f1dc14decdc71f58af492b45b50d.camel@linux.intel.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <0022a85f16c1f1dc14decdc71f58af492b45b50d.camel@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.258, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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



Am 02/12/2022 um 14:32 schrieb Robert Hoo:
> On Fri, 2022-12-02 at 13:03 +0100, Emanuele Giuseppe Esposito wrote:
> ...
>>>> @@ -3032,7 +3035,9 @@ int kvm_vcpu_ioctl(CPUState *cpu, int type,
>>>> ...)
>>>>      va_end(ap);
>>>>  
>>>>      trace_kvm_vcpu_ioctl(cpu->cpu_index, type, arg);
>>>> +    accel_cpu_ioctl_begin(cpu);
>>>
>>> Does this mean that kvm_region_commit() can inhibit any other vcpus
>>> doing any ioctls?
>>
>> Yes, because we must prevent any vcpu from reading memslots while we
>> are
>> updating them.
>>
> But do most other vm/vcpu ioctls contend with memslot operations?
> 

I think this is the simplest way. I agree not all ioctls contend with
memslot operations, but there are also not so many memslot operations
too. Instead of going one by one in all possible ioctls, covering all of
them is the simplest way and it covers also the case of a new ioctl
reading memslots that could be added in the future (alternatively we
would be always updating the list of ioctls to block).


