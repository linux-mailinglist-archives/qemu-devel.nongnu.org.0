Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B01BF674FE7
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 09:55:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pInAF-00027K-8A; Fri, 20 Jan 2023 03:54:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pInAB-00026d-8e
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 03:54:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pInA9-0002eu-NG
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 03:54:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674204857;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YNpAFosBegGjBSBh9Iz/d+r8uxivNRdyOMyPGi6CV6M=;
 b=Inx8X/yAa6g/HvdDBrft8nZH/r7fF8Z1We9vMz8HSwZvcoIczaaVfJYll7rhLheFQWhifU
 2BPSADyGI2KDoYoi1fDtceCgUdJZ1V+3AH+8MadDVZyhHkKSZrww3PzTFV6qUQkHYjZWEy
 yGRKJSXtUxEIFg5XccrM+nkpRCPzCfg=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-344-SV0h6p7HO-WAGyv9I1sKuA-1; Fri, 20 Jan 2023 03:54:07 -0500
X-MC-Unique: SV0h6p7HO-WAGyv9I1sKuA-1
Received: by mail-ej1-f71.google.com with SMTP id
 nc27-20020a1709071c1b00b0086dae705676so3368278ejc.12
 for <qemu-devel@nongnu.org>; Fri, 20 Jan 2023 00:54:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YNpAFosBegGjBSBh9Iz/d+r8uxivNRdyOMyPGi6CV6M=;
 b=cUwfwoRolhepK5rRVzrwr3BV+j64BGPpfqgIUrHcb5pWO9COpt/3T7ZqHZTNrS3fp/
 nIVj/F+fg45I1hR/8tkWldtIzxOUnSy19d7ovzaaNQHqgnPWAHeV2fcCMYiXCVFr8b0B
 BbFAO7qnzQeKv+eNBKEuLU2+4dElHY4VeLEnHrGcSq2eCT1w5tARKbPfLdu9kDBNjWOW
 LFng9/a/BA5NApeG+mPJX+Xqr3T68K9yhQ9f6wsM5xMi+vlhL41dP5GdgbWWr8raVl5Z
 sKyiniDOXuiP1o18H6/Ix4vYn3WkVLDiQ1e0ZvAwDYQEjCrOPLf1QlDAsQoB0ugsYQbF
 Fp7w==
X-Gm-Message-State: AFqh2krjfivRIcxqtZoCOsy74cfBYLrwC552gM548hp7eRjUXuXsHrYB
 58qgYPGTR+/0LLsbE6PaUQvPpnR9NnOBtKIWgo4sZg689GQId0t56/+kN2emSwd/lmGcZCL+thq
 NKfhJFKI1itqRgAw=
X-Received: by 2002:aa7:c917:0:b0:483:5e56:7bc5 with SMTP id
 b23-20020aa7c917000000b004835e567bc5mr13629461edt.40.1674204846169; 
 Fri, 20 Jan 2023 00:54:06 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsU1p3X2qz/KKDextMwO/0oPSQWzXkiLmbPvAf4FXXH6Vpa6jvTsktLlA5vAhUHKAZsOOmlDg==
X-Received: by 2002:aa7:c917:0:b0:483:5e56:7bc5 with SMTP id
 b23-20020aa7c917000000b004835e567bc5mr13629444edt.40.1674204845899; 
 Fri, 20 Jan 2023 00:54:05 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.googlemail.com with ESMTPSA id
 e6-20020a170906314600b00781be3e7badsm17615047eje.53.2023.01.20.00.54.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Jan 2023 00:54:05 -0800 (PST)
Message-ID: <4c924730-b77e-146d-55e6-c29588adc61c@redhat.com>
Date: Fri, 20 Jan 2023 09:54:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 0/2] read kvmclock from guest memory if !correct_tsc_shift
Content-Language: en-US
To: Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org
References: <20230120011116.134437211@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230120011116.134437211@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.094, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 1/20/23 02:11, Marcelo Tosatti wrote:
> Before kernel commit 78db6a5037965429c04d708281f35a6e5562d31b,
> kvm_guest_time_update() would use vcpu->virtual_tsc_khz to calculate
> tsc_shift value in the vcpus pvclock structure written to guest memory.

To clarify, the problem is that kvm_guest_time_update() uses the guest
TSC frequency *that userspace desired* instead of the *actual* TSC 
frequency.  Because, within the 250 ppm tolerance, TSC scaling is not 
enabled, the guest kvmclock is incorrect; KVM_GET_CLOCK instead returns 
the correct value, and the bug occurs when migrating from a host that is 
publishing a buggy kvmclock to the guest.

> For those kernels, if vcpu->virtual_tsc_khz != tsc_khz (which can be the
> case when guest state is restored via migration, or if tsc-khz option is
> passed to QEMU), and TSC scaling is not enabled (which happens if the
> difference between the frequency requested via KVM_SET_TSC_KHZ and the
> host TSC KHZ is smaller than 250ppm), then there can be a difference
> between what KVM_GET_CLOCK would return and what the guest reads as
> kvmclock value.

In practice, to trigger the bug you need to do two migrations from a 
six-year-old kernel; I just can't see too many people stumbling upon 
this in the wild, and I don't think it makes sense to hobble _all_ 
migrations from a kernel that is less than six years old for such an 
edge case.  New versions of QEMU do not even support running with such 
old kernels (it will for example complain about no support for certain 
KVM PV features).

It is not a huge request for the user to know if they are in the 
problematic case.  It is easiest to use a custom QEMU on the 
destination, and always compute the kvmclock value from memory if the 
page is valid.

Once you do a migration to the custom QEMU + a fixed kernel, the bug is 
gone for good and there is no need to introduce new user API for that.

Paolo

> The effect is that the guest sees a jump in kvmclock value
> (either forwards or backwards) in such case.
> 
> To fix incoming migration from pre-78db6a5037965 hosts,
> read kvmclock value from guest memory.
> 
> Unless the KVM_CLOCK_CORRECT_TSC_SHIFT bit indicates
> that the value retrieved by KVM_GET_CLOCK on the source
> is safe to be used.
> 
> 
> 


