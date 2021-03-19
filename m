Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5273418AC
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 10:45:04 +0100 (CET)
Received: from localhost ([::1]:47024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNBgl-0005Qy-8r
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 05:45:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lNBds-0003BD-Id
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 05:42:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57238)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lNBdq-0007Px-W2
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 05:42:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616146922;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zCxj7V6yR3Te0+y4rMXR417cMqB+42pb3LjDvadzcC0=;
 b=fTLguSK4Q14mtI3y9V63LbUBMid7ifl3RQZYfApw6vCrvdP+z58vl/wQ2llSIIMV1qE8ZB
 yC5gw6pRh0aFEotO6xnY93nbjH3z664OebJ3pSm82MKfu6dh3QmYsDaW1Mr6R3jnNxyQCP
 21s8MDfo5OCt0y/RdnjCms7uZyDMaog=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-582-18OLK42SPE2Z7b-IdfxhlQ-1; Fri, 19 Mar 2021 05:42:00 -0400
X-MC-Unique: 18OLK42SPE2Z7b-IdfxhlQ-1
Received: by mail-ed1-f69.google.com with SMTP id a2so22515145edx.0
 for <qemu-devel@nongnu.org>; Fri, 19 Mar 2021 02:42:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=zCxj7V6yR3Te0+y4rMXR417cMqB+42pb3LjDvadzcC0=;
 b=GW3jvON3SX0xZxM5S5LdcACae6rcmBzm36eQJV3WHANQXQzsn1N08vSAao/mra1K56
 evTEfoRGlsk+ENL3aJI+FTcyi0B3Lk8jjN2R2TnTA7QUMIPwh0nqZSdBenXqrR+T+GEV
 SsUkn1HaJjg7T/k0SscAgoZ+mR7Ysnlsk3hXYkvsv+8DGd/cT2UJ3klkgLX7KzAtVWPE
 TFz2RigIm5apDLcpojQDm1wHHFB8J58vvkrLksw6IeBZ1L4HuaEzYV6ZqnyNk0lMBBi9
 v1uLQeKGA7SxbB/6Hg3/XFR0ON5VcVRskOiGS/lVG0kOBuEaz4Cdzv/zzBk1P5yRFLO9
 4YTw==
X-Gm-Message-State: AOAM532snpAatvW6owWbF6yg2bOnh5OVhi+cnpo44dhF7Al4cqel2ZGi
 8EYPKd/WmCd1clzffTjYX56l1Nt0WYx084BDgtZejyjXjyp3H9APxPzddfL4yLdUbUvPrszPV1e
 Khrmj6SKjRP7Ut+U=
X-Received: by 2002:a05:6402:2ce:: with SMTP id
 b14mr8413843edx.13.1616146919843; 
 Fri, 19 Mar 2021 02:41:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxKeQVXBNJkWWVNVr0lpOtN09OW4ejNjwMsbSM6ho/59eE92zberLpQ7owwon6EKydmVMsZwQ==
X-Received: by 2002:a05:6402:2ce:: with SMTP id
 b14mr8413830edx.13.1616146919673; 
 Fri, 19 Mar 2021 02:41:59 -0700 (PDT)
Received: from vitty.brq.redhat.com (g-server-2.ign.cz. [91.219.240.2])
 by smtp.gmail.com with ESMTPSA id t27sm3338746ejc.62.2021.03.19.02.41.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Mar 2021 02:41:59 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH 3/3] i386: Make sure kvm_arch_set_tsc_khz() succeeds on
 migration when 'hv-reenlightenment' was exposed
In-Reply-To: <104d7d27-48b9-d2f0-213f-54853270bcd6@redhat.com>
References: <20210318160249.1084178-1-vkuznets@redhat.com>
 <20210318160249.1084178-4-vkuznets@redhat.com>
 <2f377397-0427-95dc-6617-5dedf6533bc4@redhat.com>
 <87wnu45sev.fsf@vitty.brq.redhat.com>
 <104d7d27-48b9-d2f0-213f-54853270bcd6@redhat.com>
Date: Fri, 19 Mar 2021 10:41:58 +0100
Message-ID: <87mtuz5vkp.fsf@vitty.brq.redhat.com>
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
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
Cc: Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini <pbonzini@redhat.com> writes:

> On 18/03/21 17:38, Vitaly Kuznetsov wrote:
>>> Could we instead fail to load the reenlightenment section if
>>> user_tsc_khz was not set?  This seems to be user (well, management)
>>> error really, since reenlightenment has to be enabled manually (or with
>>> hv-passthrough which blocks migration too).
>>
>> Yes, we certainly could do that but what's the added value of
>> user_tsc_khz which upper layer will have to set explicitly (probably to
>> the tsc frequency of the source host anyway)? In case we just want to
>> avoid calling KVM_SET_TSC_KHZ twice, we can probably achieve that by
>> adding a CPU flag or something.
>
> What I want to achieve is to forbid migration of VMs with 
> reenlightenment, if they don't also specify tsc-khz to the frequency of 
> the TSC on the source host.  We can't check it at the beginning of 
> migration, but at least we can check it at the end.
>
> Maybe we're talking about two different things?

No, your suggestion basically extends mine and I'm just trying to
understand the benefit. With my suggestion, it is not required to
specify tsc-khz on the source, we just take 'native' tsc frequency as a
reference. Post-migration, we require that KVM_SET_TSC_KHZ succeeds (and
not just 'try' like kvm_arch_put_registers() does so we effectively
break migration when we are unable to set the desired TSC frequency
(also at the end).

With your suggestion to require user_tsc_khz (as I see it) it'll work
the exact same way but there's an additional burden on the
user/management to explicitly specify tsc-khz on the command line and I
believe that almost always this is going to match 'native' tsc frequency
of the source host.

-- 
Vitaly


