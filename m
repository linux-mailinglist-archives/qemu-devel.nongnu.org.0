Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D91135529D
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 13:44:53 +0200 (CEST)
Received: from localhost ([::1]:59516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTk8Z-0008Tn-Nx
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 07:44:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lTk6V-00080q-LH
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 07:42:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49505)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lTk6S-0005Fg-1A
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 07:42:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617709359;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=y0gP63Prjx9tLG78Y6QTJBjHDnGy4bjNR6vl/qmKtb8=;
 b=CVfV6L7Hje43PssKsVwjBDs/v0j10eBEkXG76iS1yYcPRLOjsHMU7DV5mzc2XFc9HC2vkq
 pGnbekPZRK5R4urpRorRwDEkjJI4XP7AINiBbl9Mg1SL8jvPbIJAX8lsRzam0Z9rA0zURZ
 RjsXRA3t/qSGm0mR4rBtBcDOVud0n0o=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-384-2VwjCgdSPoeF8AgFDmB4uA-1; Tue, 06 Apr 2021 07:42:37 -0400
X-MC-Unique: 2VwjCgdSPoeF8AgFDmB4uA-1
Received: by mail-ed1-f69.google.com with SMTP id i12so10324483edu.23
 for <qemu-devel@nongnu.org>; Tue, 06 Apr 2021 04:42:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=y0gP63Prjx9tLG78Y6QTJBjHDnGy4bjNR6vl/qmKtb8=;
 b=NoFcV48GHJvIgT1zDJloekBYJ7bp/PFlKIk6DFlUyJe0WLHTQX/WVd8N6ainFQeaG/
 qZSIOD4b7KndjuCXY4vcFuBVDEFWWREI8if9uQcIiKJjsrNDfpDX/kCykAHhnWEuhxwB
 r86buvTkf3fo5NwsYb8i1xSiTBwHY59egOwC3PIyjmDogYRN6zmNFoBoLQ+h31XBG2I/
 dEIVmuqVzzSq7SRHXxoa461zPQh86FCHVPt5TMHEOPwTUFNicS2dO/dKDPG+hDmK4qqd
 FFFFxxWf5a9dizsmosNgsD7mW+HcbrO8prQkN/o/L+FWP/tzE/Q3HTeOTSieOAEUdwLr
 PnYQ==
X-Gm-Message-State: AOAM531+IZFulqMFU86FeGk3YybcRTqxRJLF1N5ib+Jl9p9orri0KTf3
 elTwUpCjuU0VMoTjymvInYKT8leEWvE3UjSpC5UTQ+5ofipX3+wp1cqcRlsj32d9mcI4DgEmGyX
 11syug2lbc2SGGdw=
X-Received: by 2002:a17:906:32d1:: with SMTP id
 k17mr33649393ejk.94.1617709356456; 
 Tue, 06 Apr 2021 04:42:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy0D6EGpw4bPmUClp/c7yj8UXebdE/geD4+GBfSjXpugWFaGynPUSIKznssHlcZINGDz4VKIg==
X-Received: by 2002:a17:906:32d1:: with SMTP id
 k17mr33649385ejk.94.1617709356289; 
 Tue, 06 Apr 2021 04:42:36 -0700 (PDT)
Received: from vitty.brq.redhat.com (g-server-2.ign.cz. [91.219.240.2])
 by smtp.gmail.com with ESMTPSA id p24sm13811998edt.5.2021.04.06.04.42.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 04:42:35 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH 0/2] i386: Fix interrupt based Async PF enablement
In-Reply-To: <ea3fc380-332f-b9e5-aa31-3540916cfc33@redhat.com>
References: <20210401151957.408028-1-vkuznets@redhat.com>
 <ea3fc380-332f-b9e5-aa31-3540916cfc33@redhat.com>
Date: Tue, 06 Apr 2021 13:42:35 +0200
Message-ID: <87sg43d4gk.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini <pbonzini@redhat.com> writes:

> On 01/04/21 17:19, Vitaly Kuznetsov wrote:
>> I noticed two issues with 'kvm-asyncpf-int' enablement:
>> 1) We forgot to add to to kvm_default_props[] so it doesn't get enabled
>>   automatically (unless '-cpu host' is used or the feature is enabled
>>   manually on the command line)
>> 2) We forgot to disable it for older machine types to preserve migration.
>>   This went unnoticed because of 1) I believe.
>> 
>> Vitaly Kuznetsov (2):
>>    i386: Add 'kvm-asyncpf-int' to kvm_default_props array
>>    i386: Disable 'kvm-asyncpf-int' feature for machine types <= 5.1
>> 
>>   hw/i386/pc.c      | 1 +
>>   target/i386/cpu.c | 1 +
>>   2 files changed, 2 insertions(+)
>> 
>
> Wasn't this intentional to avoid requiring a new kernel version?

I think I forgot the initial plan :-( The problem is that after we
disabled the original APF (#PF based) almost nobody is using the feature
as it needs to be enabled explicitly on the command line.

Several considerations regarding the default: if your kernel doesn't
support the feature you get as much as a warning:

qemu-system-x86_64: warning: host doesn't support requested feature:
CPUID.40000001H:EAX.kvm-asyncpf-int [bit 14]

older machine types are still available (I disable it for <= 5.1 but we
can consider disabling it for 5.2 too). The feature is upstream since
Linux 5.8, I know that QEMU supports much older kernels but this doesn't
probably mean that we can't enable new KVM PV features unless all
supported kernels have it, we'd have to wait many years otherwise. 

-- 
Vitaly


