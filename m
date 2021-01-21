Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 631082FF11A
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 17:55:14 +0100 (CET)
Received: from localhost ([::1]:43304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2dEn-0002sX-GE
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 11:55:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1l2dBE-0001uI-56
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 11:51:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1l2dB7-0003zU-E5
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 11:51:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611247882;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=82OJUlmZYywMAZgrgNuMbGhtrzeWACyHWF0x0qx48i8=;
 b=XBfMELGvtegv3zD19tmeanKRm4ykTub++JCLp1EEKA0Q6GnKhcVdtwslEV9yOwwJHOMnyf
 /SEdJVci2ZRBBRKwy3NucAoFq11q+nXh+ybYMJh/OZxt73+faZ79y4Lf3TgXX0eRlt37cz
 dUBaCupiyPD/9kqXZi/v8j6/lEnPbMo=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-232-5OVulYj4PnGORWRev2I5Zw-1; Thu, 21 Jan 2021 11:51:21 -0500
X-MC-Unique: 5OVulYj4PnGORWRev2I5Zw-1
Received: by mail-ed1-f69.google.com with SMTP id u19so961270edr.1
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 08:51:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=82OJUlmZYywMAZgrgNuMbGhtrzeWACyHWF0x0qx48i8=;
 b=bnmS45jKtJFodjcDdFS/wFGR/IwhcZp8e8pqBrHmZ5M7T1WIp9g0asVEbVlPIluqed
 2rNrftgOOwbqTTTuklieP3sSIUc0nZPRkyluEOtOU401u4u/m5tdlj6XaZoVFmg6srd4
 y4S0/Enh7wvVMSUXZebn5TFpAuDitMoqqpUFkFv45AKQJx+P19kkHvKX0ho5/eMSZQ2U
 CK3GsOA2hl89BEVqbzR9IcBixw8MXUOK0/eEiNnxge32og6c7ojN7Mg9+Ep6am+vRXyt
 w8JNjMLvH4DsxJDKTb93Vue4ICTarzpnccPAZeugsBGASkA1KJA14FvpCiPY73tZa8yA
 JIuw==
X-Gm-Message-State: AOAM530wZK1y/LFeBWLsnRSGQS7AKcr3iOKOgW1cXNKQ+br6PLIoPgvA
 GxqvqWgqH29nOiEaSv1PM4eMjqlYDWWSwUUtStNXwMfN2x1UoiUDcEGEV4xQpiiEXXM2atkmYYd
 vjkiVB8I4/aAYIYA=
X-Received: by 2002:a17:906:1ed6:: with SMTP id
 m22mr248550ejj.231.1611247879902; 
 Thu, 21 Jan 2021 08:51:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwugbS1T6zENIiYlAs7Cc8nNxkXj8gx/jE02TCU4Oas8krg3CGqMC+einWjVCXl/rliO10drw==
X-Received: by 2002:a17:906:1ed6:: with SMTP id
 m22mr248535ejj.231.1611247879713; 
 Thu, 21 Jan 2021 08:51:19 -0800 (PST)
Received: from vitty.brq.redhat.com (g-server-2.ign.cz. [91.219.240.2])
 by smtp.gmail.com with ESMTPSA id hr31sm2362547ejc.125.2021.01.21.08.51.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jan 2021 08:51:19 -0800 (PST)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v3 18/19] i386: provide simple 'hv-default=on' option
In-Reply-To: <20210121144947.306512e1@redhat.com>
References: <20210107150640.539239-1-vkuznets@redhat.com>
 <20210107151449.541062-1-vkuznets@redhat.com>
 <20210115031142.7c171a7f@redhat.com> <87h7ni7e08.fsf@vitty.brq.redhat.com>
 <20210120141312.0a1e6c33@redhat.com> <874kjb65cm.fsf@vitty.brq.redhat.com>
 <20210120200832.40141dc1@redhat.com> <87wnw64r0y.fsf@vitty.brq.redhat.com>
 <20210121144947.306512e1@redhat.com>
Date: Thu, 21 Jan 2021 17:51:18 +0100
Message-ID: <87o8hi44jd.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.168,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Igor Mammedov <imammedo@redhat.com> writes:

> On Thu, 21 Jan 2021 09:45:33 +0100
> Vitaly Kuznetsov <vkuznets@redhat.com> wrote:
>
>> >
>> > So far I read snippet above as a problem:
>> > 1:
>> >   host supports evmcs:
>> >   and exposes HYPERV_FEAT_EVMCS in CPUID  
>> 
>> Host with EVMCS is Intel
>> 
>> > 2: we migrate to host without evmcs  
>> 
>> Host without EVMCS is AMD, there are no other options. It is a pure
>> software feature available for KVM-intel. And if your KVM is so old that
>> it doesn't know anything about EVMCS, a bunch of other options from
>> 'hv-default' will not start as well.
>> > 2.1 start target QEMU, it happily creates vCPUs without
>> > HYPERV_FEAT_EVMCS in CPUID  
>> 
>> No, it doesn't as on host1 we had at least VMX CPU feature enabled (or a
>> CPU model implying it) to make this all work.
>> 
>> > 2.2 if I'm not mistaken CPUID is not part of migration stream,
>> >     nothing could check and fail migration
>> > 2.3 guest runs fine till it tries to use non existing feature, ..  
>> 
>> I'm also very sceptical about possibilities for migration
>> Windows/Hyper-V VMs from Intel to AMD. Hyper-V doesn't even boot if you
>> don't have fresh-enough CPU so the common denominator for Intel/AMD
>> would definitely not work. 
>
> Like you said host doesn't have to be AMD, just old enough kernel will
> do the job. What exactly will prevent migration 'successfully' completing?
>

First, you can't start a VM with 'hv-default' with an old-enough kernel
because it won't have many other 'hv-' enlightenments
implemented. 'hv-default' will only work for a 'recent enough' kernel
(>= 5.0 when hv-stimer-direct was implemented). 

You can probably try doing '-cpu xxx,hv_default,hv-stimer-direct=off' to
trigger the problem but then KVM should also support nested state
migration to actually migrate a VM using VMX and EVMCS support for it
also emerged in 5.0. I believe that trying to call KVM_SET_NESTED_STATE
(which only appeared in 4.19 btw) on something in between will fail.

> The way it's currently written migration stream won't prevent it.
>
> One way that might solve issue is to add subsection that's enabled when
> kvm_hv_evmcs_available() == true, and check on target that the feature
> is available or fail migration.

Yes, we can but I don't think there's a real issue worth fighting
for. Nested migration was so broken in upstream KVM untill recently that
I don't see why 'old kernel' can be a problem at all. And, again, Intel
to AMD migration is likely off question.

>
> Maybe Eduardo or David can add more how to deal with it if needed.
>

-- 
Vitaly


