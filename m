Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 991AA6D5FB2
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 13:56:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjfGB-0000ud-Us; Tue, 04 Apr 2023 07:55:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pjfGA-0000uV-9R
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 07:55:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pjfG8-00023c-FP
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 07:55:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680609331;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Tt2WANpe5IyEa3OncTWpfJl2r8Peu33tvJJC9j9mcoY=;
 b=Cu/5LHbc3KRa4uYYOVnsLd2CirbMj/s7lOCDbyyGhhTH0gbUuAkt9CGQaSWrJQoHl9Af9y
 rMYrUQdpVUreem3pZxIYwAQ8nvZ3bQveK6++aVYGdfOFx6E4BAk7GGBRtJRmPV8CkuQRty
 s3Sso+osuMTdQytpJggKmnUBMIS4Vf0=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-613-cdyLVKLPP6GeDbh6D-yNnQ-1; Tue, 04 Apr 2023 07:55:30 -0400
X-MC-Unique: cdyLVKLPP6GeDbh6D-yNnQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 c1-20020a0564021f8100b004acbe232c03so45003162edc.9
 for <qemu-devel@nongnu.org>; Tue, 04 Apr 2023 04:55:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680609329; x=1683201329;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Tt2WANpe5IyEa3OncTWpfJl2r8Peu33tvJJC9j9mcoY=;
 b=ZMEyBeXZUlNFRSeKCUR70SZSvoYs2VjCNjyCZ9jdEan/eRh6eOVALarUvBx69ShRnh
 Qv9wRy1nhGt2fjZUKCDsjFWmrLDlo1azBVqaC9J247ANNZuNh4oOKcQzFzFlSUDruof6
 JCGjqsmDIIZ7r9mTKCEQnb5SWdmKgAp2Hp9hCnTlq57xf5HlXe2w19swXb4wITgGhklx
 4X7W0vf/jZP+L9OrkP0LhEgqsZy9/QEqfVOdeEw2kkuiDosL6/9FvvH2qy19jLHX1h34
 SqVLaHWTPanYiDWsKBbmtbaXECpcoxomNTmv8s9Xs6kiE+DgXOWQGimm8rsht4I4+TTa
 u5Ug==
X-Gm-Message-State: AAQBX9dgcTBxPqngnxMmIaMSn0yjuLUSKcrQLTTSPQ9kZfixq7ik8Z8p
 /nrTCevU8Gxigj5iS5O24Vg54kkVjjBnDYBaVt729tXECmGBMLjMl9dsIavqu2nf8bpJMsb7ES5
 M6koxHWRNyBss3JM=
X-Received: by 2002:a17:906:3494:b0:930:fded:5bf2 with SMTP id
 g20-20020a170906349400b00930fded5bf2mr1967728ejb.52.1680609328958; 
 Tue, 04 Apr 2023 04:55:28 -0700 (PDT)
X-Google-Smtp-Source: AKy350aFgIbuzltQgHr+Yw0XSBPJC3SmY5HiTB1hnQrwCZzXREbrcNDbcYnB0t5mu1vzlZoC+tCyJw==
X-Received: by 2002:a17:906:3494:b0:930:fded:5bf2 with SMTP id
 g20-20020a170906349400b00930fded5bf2mr1967717ejb.52.1680609328684; 
 Tue, 04 Apr 2023 04:55:28 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 h3-20020a1709067cc300b0094776b4ef04sm6008287ejp.10.2023.04.04.04.55.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Apr 2023 04:55:27 -0700 (PDT)
Message-ID: <817fc488-6058-69b3-280b-611f9a77bcf0@redhat.com>
Date: Tue, 4 Apr 2023 13:55:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 0/6] Adding the Android Emulator hypervisor driver
 accelerator
Content-Language: en-US
To: Haitao Shan <hshan@google.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>
Cc: qemu-devel@nongnu.org
References: <CAGD3tSzW1QoAsn+uGjoAkBegLt1iZ=9YWDFcvqbcHMr0S_5kVw@mail.gmail.com>
 <ZAHNEtV0N+9JyZTk@redhat.com>
 <CAGD3tSzZAa+zRv0xEetB-WW+zmnGNJUAzLj0CyGCek9YYDNq9g@mail.gmail.com>
 <ZAIqclU7BbH2vog7@redhat.com>
 <CAGD3tSw_OdDV3gZo7mxeKP0da-NrdikRGySKtFC9rhn4Dn_G1g@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAGD3tSw_OdDV3gZo7mxeKP0da-NrdikRGySKtFC9rhn4Dn_G1g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.925, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 3/3/23 18:39, Haitao Shan wrote:
>> No, we're always open to new proposals. It merely means that it
>> might be harder to justify why the new hypervisor is a net benefit
>> for QEMU, when there is a competing solution supported by the OS
>> vendor.
>
> Thanks for the clarification. It is great that the door is not shut completely.

Hi,

sorry for not answering before.

I think in general QEMU should be open to merging work from the Android 
Emulator.  If AEHD is useful to the Android emulator, I would consider 
it interesting for QEMU as well.

However, I would rather have it as an extension to KVM if possible 
rather than a completely new emulator.  One possibility is to introduce 
a new file that encapsulates all KVM ioctls, with a struct that 
encapsulates the Unix file descriptor/Windows HANDLE.  For example

int kvm_ioctl_get_supported_cpuid(KVMState *s, struct kvm_cpuid *cpuid,
                                   int max)
{
     cpuid->nent = max;
#ifdef CONFIG_POSIX
     return ioctl(s, KVM_GET_SUPPORTED_VCPUID, cpuid);
#else
     size_t size = sizeof(*cpuid) + max * sizeof(*cpuid->entries);
     return aehd_ioctl(s, AEHD_GET_SUPPORTED_CPUID, cpuid, size, cpuid, 
size);
#endif
}

int kvm_ioctl_create_vcpu(KVMState *s, int vcpu_id, CPUState *out)
{
#ifdef CONFIG_POSIX
     out.kvm_fd = kvm_vm_ioctl(KVM_CREATE_VCPU, vcpu_id);
     return out.kvm_fd;
#else
     return aehd_vm_ioctl(s, AEHD_CREATE_VCPU, &vcpu_id, sizeof(vcpu_id),
                          &out.kvm_fd, sizeof(out.kvm_fd));
#endif
}

etc.

These are just general examples, the actual level of abstraction is up 
to you.

Paolo


