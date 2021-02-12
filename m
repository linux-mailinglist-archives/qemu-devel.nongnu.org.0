Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A411631A193
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 16:24:09 +0100 (CET)
Received: from localhost ([::1]:41840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAaIi-00084C-P0
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 10:24:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lAaEJ-000414-02
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 10:19:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lAaED-0002QO-I5
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 10:19:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613143168;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KIP46gIMuBW0wuTY/4uEWxlBBddeTfr37HNj5OKS6Tw=;
 b=I3eTIZ337NJRVnxFW3mx0bKfxHDYr00JMwhPmacpQ1Q31rg6yR1uwMiwKhZKMbc4oWhmt1
 zHPeH65r6T/XGlw1t7E13DcrfAbaO8/sreONDJ1p3gZ0d1Y27P6cYSTyHChEgzuTCE1ACN
 WU4wVJhnm6suCUMstypHYL33zr3XJwc=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-22-GppVCbogMhaGMS04AyZrtw-1; Fri, 12 Feb 2021 10:19:26 -0500
X-MC-Unique: GppVCbogMhaGMS04AyZrtw-1
Received: by mail-ej1-f71.google.com with SMTP id w16so7215870ejk.7
 for <qemu-devel@nongnu.org>; Fri, 12 Feb 2021 07:19:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=KIP46gIMuBW0wuTY/4uEWxlBBddeTfr37HNj5OKS6Tw=;
 b=inzM0GmF0rZudnUIkaaA1KZj0NOMdD17URq+3hN9M+135gGEaLfkaf/VWz38qijlY8
 kyhPO+rAj/Gk1qx1mxIc00leP6ocasqlaW46Yn+8QopnHk57EBr+ccE2QoKu/Cj/+tqh
 9gmGQO9bEGpQhMcv3zv/8A6Qpj63V+ehdxsrSnY9+QEZhpOXRV8WIhvViphf4JWAdf5F
 /PqHZMvDj6hy/rEWxbsjH4verjtWxBGrewcCJ1Pu3VQjy5nG3XKJgCNWpoErpKYKXeDr
 cx7O3ZfIMf7SDpaGBmlg99pllrPfQWq7CkWW5XHBNTFeLgxIfT1v50KZa/esI2DURBhe
 eQsg==
X-Gm-Message-State: AOAM531UvVpsceyi9AwF1yzg9H5BG+p9Bsa+UROnYwq1XvMNxDlYcnnA
 nJIov/HOXkmDk8GHWHgeY51zelYXcVN/BPHyK0Pqln8qaLcKN17N/3aqVmd+ioKb9xINlpK4S1Q
 sGUz9eJk1D3UlxAM=
X-Received: by 2002:a05:6402:2707:: with SMTP id
 y7mr3838039edd.5.1613143165502; 
 Fri, 12 Feb 2021 07:19:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwbmlo4021RDGdBcElSc19F2zB0wUh9gMd0n/rhchtFeiuXYhq6Gy8sBH7Wcc4f1Qw5JrE+DQ==
X-Received: by 2002:a05:6402:2707:: with SMTP id
 y7mr3838020edd.5.1613143165295; 
 Fri, 12 Feb 2021 07:19:25 -0800 (PST)
Received: from vitty.brq.redhat.com (g-server-2.ign.cz. [91.219.240.2])
 by smtp.gmail.com with ESMTPSA id q20sm6466357ejs.17.2021.02.12.07.19.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Feb 2021 07:19:24 -0800 (PST)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v4 16/21] i386: track explicit 'hv-*' features
 enablement/disablement
In-Reply-To: <20210212151259.3db7406f@redhat.com>
References: <20210210164033.607612-1-vkuznets@redhat.com>
 <20210210164033.607612-17-vkuznets@redhat.com>
 <20210211183555.2136b5c8@redhat.com> <87tuqhllmn.fsf@vitty.brq.redhat.com>
 <20210212151259.3db7406f@redhat.com>
Date: Fri, 12 Feb 2021 16:19:24 +0100
Message-ID: <87k0rdl3er.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>, drjones@redhat.com,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Igor Mammedov <imammedo@redhat.com> writes:

> On Fri, 12 Feb 2021 09:45:52 +0100
> Vitaly Kuznetsov <vkuznets@redhat.com> wrote:
>
>> Igor Mammedov <imammedo@redhat.com> writes:
>> 
>> > On Wed, 10 Feb 2021 17:40:28 +0100
>> > Vitaly Kuznetsov <vkuznets@redhat.com> wrote:
>> >  
>> >> Sometimes we'd like to know which features were explicitly enabled and which
>> >> were explicitly disabled on the command line. E.g. it seems logical to handle
>> >> 'hv_passthrough,hv_feature=off' as "enable everything supported by the host
>> >> except for hv_feature" but this doesn't seem to be possible with the current
>> >> 'hyperv_features' bit array. Introduce 'hv_features_on'/'hv_features_off'
>> >> add-ons and track explicit enablement/disablement there.
>> >> 
>> >> Note, it doesn't seem to be possible to fill 'hyperv_features' array during
>> >> CPU creation time when 'hv-passthrough' is specified and we're running on
>> >> an older kernel without KVM_CAP_SYS_HYPERV_CPUID support. To get the list
>> >> of the supported Hyper-V features we need to actually create KVM VCPU and
>> >> this happens much later.  
>> >
>> > seems to me that we are returning back to +-feat parsing, this time only for
>> > hyperv.
>> > I'm not sure I like it back, especially considering we are going to
>> > drop "-feat" priority for x86.
>> >
>> > now about impossible, see arm/kvm/virt, they create a 'sample' VCPU at KVM
>> > init time to probe for some CPU features in advance. You can use similar
>> > approach to prepare value for hyperv_features.
>> >  
>> 
>> KVM_CAP_SYS_HYPERV_CPUID is supported since 5.11 and eventually it'll
>> make it to all kernels we care about so I'd really like to avoid any
>> 'sample' CPUs for the time being. On/off parsing looks like a much
>> lesser evil.
> When minimum supported by QEMU kernel version gets there, you can remove
> scratch CPU in QEMU (if hyperv will remain its sole user).
>
> writing your own property parser like in this series, is possible too
> but it adds extra fields to track state and hard to follow logic.
> On top it adds a lot of churn by switching hv_ features to dynamic
> properties, which is not necessary if scratch CPU approach is used.
>
> Please try reusing scratch CPU approach, see
>   kvm_arm_get_host_cpu_features()
> for an example. You will very likely end up with simpler series,
> compared to reinventing wheel.

Even if I do that (and I serioulsy doubt it's going to be easier than
just adding two 'u64's, kvm_arm_get_host_cpu_features() alone is 200
lines long) this is not going to give us what we need to distinguish
between

'hv-passthrough,hv-evmcs'

and 

'hv-passthrough'

when 'hv-evmcs' *is* supported by the host. When guest CPU lacks VMX we
don't want to enable it unless it was requested explicitly (former but
not the later).

Moreover, instead of just adding two 'u64's we're now doing an ioctl
which can fail, be subject to limits,... Creating and destroying a CPU
is also slow. Sorry, I hardly see how this is better, maybe just from
'code purity' point of view.

-- 
Vitaly


