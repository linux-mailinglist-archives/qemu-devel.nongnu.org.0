Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E26492802
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 15:07:48 +0100 (CET)
Received: from localhost ([::1]:40366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9p9G-0003zo-JX
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 09:07:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1n9oCX-0003Bk-GM
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 08:07:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1n9oCV-00007g-Vo
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 08:07:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642511221;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=riYyBLsWgoNWjrKGMnty/PxlIohkH+LtcPxY9VFpep0=;
 b=EIz6FNjettognpRjRXPhgwUFBZNHE5crAoZWDABJoYgL8X1MOrNRvDhW7qUTc+6mgkh5jl
 5pyg3Xfw5eK2maeZ7mFfIiv4wRxAyUhsDHDPBr15ZjKngGPygNlBpVyWAI6QkBndHRfnj0
 NDcMe5X0wEtHuO9sdY1ybY39rJS32Eg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-81-zb3zF8e2M0SPLfmgEse13g-1; Tue, 18 Jan 2022 08:06:58 -0500
X-MC-Unique: zb3zF8e2M0SPLfmgEse13g-1
Received: by mail-wm1-f72.google.com with SMTP id
 o3-20020a05600c4fc300b0034aee9534bdso5960601wmq.2
 for <qemu-devel@nongnu.org>; Tue, 18 Jan 2022 05:06:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=riYyBLsWgoNWjrKGMnty/PxlIohkH+LtcPxY9VFpep0=;
 b=39nTvPlIu8+qELn8hb9bc0zCVaJsZPfJ7q9NK6S//DhS6KohXcpTkQr04HDwcyMpan
 a2Y38HeBtNnSS705f2qu9+pKza977pu6Yy7S1fupR2A2Cbc9T7Poqknv1jkZ9VRxAacH
 67aTqqOH3r9xnMHSqSFGRb1UwO/uNCCtn1Niav44ZNSHjpoOKsD1LwAx9DMivpD8wTON
 4LNh5oeumxUtTnu6psn6ihT1Yb8/mTE2OpZDWyajc/U0NLRnDmRyeY4CTn+ya59I7LfL
 e9FyLL+FzSHLEPDR8FCKmdS6zP+r341eRXGN+zFfg1cgvC8qYSMAGCH2pROlHaNbmFYx
 vB8w==
X-Gm-Message-State: AOAM533NJkAQiMBa8Yh8F2Y0DK3ORreTrMyBa1I/+LokNDsPD+Y0ewsV
 hp9XspGmtVcrwYfjiicIPfkQmx8XQsomzMRRIPMszJ2qQAQ4u+EjK7kBDVZXrQdss+dXeXMxqPX
 JMi0y8fcgyCObKtg=
X-Received: by 2002:a5d:610f:: with SMTP id v15mr1497291wrt.139.1642511217149; 
 Tue, 18 Jan 2022 05:06:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw+aYJifx6+IBHdm6XleqqY92pw1e44pGkcyQeWUYmEZhAbSw5fnQfufsM00Ndvb+6UNYAh9w==
X-Received: by 2002:a5d:610f:: with SMTP id v15mr1497268wrt.139.1642511216936; 
 Tue, 18 Jan 2022 05:06:56 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id e10sm20041964wrq.40.2022.01.18.05.06.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jan 2022 05:06:56 -0800 (PST)
Message-ID: <0ad4f708-f338-0742-dc69-af08e908cff5@redhat.com>
Date: Tue, 18 Jan 2022 14:06:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [RFC PATCH 3/7] x86: Grant AMX permission for guest
From: Paolo Bonzini <pbonzini@redhat.com>
To: Yang Zhong <yang.zhong@intel.com>, qemu-devel@nongnu.org
References: <20220107093134.136441-1-yang.zhong@intel.com>
 <20220107093134.136441-4-yang.zhong@intel.com>
 <29573e51-aa21-dbf3-b626-facf72e5b9c6@redhat.com>
In-Reply-To: <29573e51-aa21-dbf3-b626-facf72e5b9c6@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: seanjc@google.com, kevin.tian@intel.com, jing2.liu@linux.intel.com,
 wei.w.wang@intel.com, guang.zeng@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Sorry, hit send on the wrong window.  This is the only patch that will 
require a bit more work.

On 1/18/22 13:52, Paolo Bonzini wrote:
>> @@ -124,6 +150,8 @@ void x86_cpus_init(X86MachineState *x86ms, int 
>> default_cpu_version)
>>       MachineState *ms = MACHINE(x86ms);
>>       MachineClass *mc = MACHINE_GET_CLASS(x86ms);
>> +    /* Request AMX pemission for guest */
>> +    x86_xsave_req_perm();
>>       x86_cpu_set_default_version(default_cpu_version);
> 
> This should be done before creating a CPU with support for state 
> component 18.  It happens in kvm_init_vcpu, with the following call stack:
> 
>      kvm_init_vcpu
>      kvm_vcpu_thread_fn
>      kvm_start_vcpu_thread
>      qemu_init_vcpu
>      x86_cpu_realizefn
> 
> The issue however is that this has to be done before 
> KVM_GET_SUPPORTED_CPUID and KVM_CHECK_EXTENSION(KVM_CAP_XSAVE2).
> 
> For the former, you can assume that anything returned by 
> ARCH_GET_XCOMP_GUEST_PERM will be returned by KVM_GET_SUPPORTED_CPUID in 
> CPUID[0xD].EDX:EAX, so you can:
> 
> - add it to kvm_arch_get_supported_cpuid

... together with the other special cases (otherwise 
x86_cpu_get_supported_feature_word complains that XTILEDATA is not 
available)

- change kvm_cpu_xsave_init to use host_cpuid instead of 
kvm_arch_get_supported_cpuid.

- call ARCH_REQ_XCOMP_GUEST_PERM from x86_cpu_enable_xsave_components, 
with a conditional like

     if (kvm_enabled()) {
         kvm_request_xsave_components(cpu, mask);
     }

KVM_CHECK_EXTENSION(KVM_CAP_XSAVE2) is actually not a problem; the ioctl 
is only called from kvm_arch_init_vcpu and therefore after 
x86_cpu_enable_xsave_components.

Thanks,

Paolo


