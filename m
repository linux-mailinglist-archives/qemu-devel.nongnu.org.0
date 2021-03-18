Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3CE340A35
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 17:30:01 +0100 (CET)
Received: from localhost ([::1]:44396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMvX6-00027f-A6
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 12:30:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lMvG6-0000x2-Be
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 12:12:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56013)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lMvG4-0006eh-Sc
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 12:12:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616083943;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q95tz2kPuhxcp+aAS5FR4IQ8Ab1y0tt773qMi3LduPE=;
 b=czD2WIvDzQt+UgnYpAzZe1RWhpmDHKkejHJ9f9+/+Ynph+MlPkqg9KiE/yx5M3pCbJhG6o
 ncDT/C1lC01la/grg5wqMIBMJ1V/ev1Ge7EFRCuM/+0Uzfb7kECNWPbT1bj+cNt1NM4kZD
 nnhyRS+wSQb5Sk2o+X45SvQIrnYYKzk=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-195-AtFVl54LMmKYUVcKMgbUtg-1; Thu, 18 Mar 2021 12:12:22 -0400
X-MC-Unique: AtFVl54LMmKYUVcKMgbUtg-1
Received: by mail-ed1-f71.google.com with SMTP id bm8so8325013edb.4
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 09:12:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=q95tz2kPuhxcp+aAS5FR4IQ8Ab1y0tt773qMi3LduPE=;
 b=tgUCgwRyt9P7fKA+2RHH2uBEM39sN+Y8eRF3w8KgMgEDKHNk2DPuGwncmOSbgZpACi
 EMoq6/AwZRRFb8zwqC4+wLQ6Rz0iU4bvETsxiGuY3F1YVdMhhZSbRh7M4+ZDQMxwvX3T
 gGszI1EN+VZVOFma24fWpQUrOPdu5Nidl5YfWk6oIKGPt9FKxSuU/u1S1Ysl7dqeKQeP
 42uTjfz60UAb4ZbMZvGk+8jzyVT5UvyEbs+VLeLJOsc3/pM685w9myDGO1z9zVkRWuYF
 Xk3eJu8PiAvfvgaEdk69MFOGRftJ4Q9C35WIYhUc72nBM6454h1QFZjsqUJxdVYJnH+Q
 oCKQ==
X-Gm-Message-State: AOAM531FMTM55DH+eb6b52f5ZcLqBpOwPqv16nL3QSrHUgRUXksNjOGK
 wkAzVCtVmbwpXGir4AqFUxO2BEQQH6FIgimVJmZPepoC/n637qwaupbfBR5GKEiAKdgO+u9wvgx
 GtSyEC2HlYHfjCpg=
X-Received: by 2002:a05:6402:51d4:: with SMTP id
 r20mr4584923edd.112.1616083940852; 
 Thu, 18 Mar 2021 09:12:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxp67R8GvQvflmlma7Oa4KA9lLVTIQ1C7bPFsGadNErsoFevEfcAYffDYb2kIiL3ktXzggABA==
X-Received: by 2002:a05:6402:51d4:: with SMTP id
 r20mr4584904edd.112.1616083940724; 
 Thu, 18 Mar 2021 09:12:20 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id w18sm2228043ejn.23.2021.03.18.09.12.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Mar 2021 09:12:19 -0700 (PDT)
Subject: Re: [PATCH 2/3] i386: Fix 'hypercall_hypercall' typo
To: Vitaly Kuznetsov <vkuznets@redhat.com>, qemu-devel@nongnu.org
References: <20210318160249.1084178-1-vkuznets@redhat.com>
 <20210318160249.1084178-3-vkuznets@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <f10521dc-ee20-7bec-5da3-5ab689b4cc79@redhat.com>
Date: Thu, 18 Mar 2021 17:12:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210318160249.1084178-3-vkuznets@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/03/21 17:02, Vitaly Kuznetsov wrote:
> Even the name of this section is 'cpu/msr_hyperv_hypercall',
> 'hypercall_hypercall' is clearly a typo.
> 
> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
> ---
>   target/i386/machine.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/i386/machine.c b/target/i386/machine.c
> index a4777a73b0a9..715620c58809 100644
> --- a/target/i386/machine.c
> +++ b/target/i386/machine.c
> @@ -706,7 +706,7 @@ static bool hyperv_hypercall_enable_needed(void *opaque)
>       return env->msr_hv_hypercall != 0 || env->msr_hv_guest_os_id != 0;
>   }
>   
> -static const VMStateDescription vmstate_msr_hypercall_hypercall = {
> +static const VMStateDescription vmstate_msr_hyperv_hypercall = {
>       .name = "cpu/msr_hyperv_hypercall",
>       .version_id = 1,
>       .minimum_version_id = 1,
> @@ -1487,7 +1487,7 @@ VMStateDescription vmstate_x86_cpu = {
>           &vmstate_msr_architectural_pmu,
>           &vmstate_mpx,
>   #ifdef CONFIG_KVM
> -        &vmstate_msr_hypercall_hypercall,
> +        &vmstate_msr_hyperv_hypercall,
>           &vmstate_msr_hyperv_vapic,
>           &vmstate_msr_hyperv_time,
>           &vmstate_msr_hyperv_crash,
> 

Queued, thanks.

Paolo


