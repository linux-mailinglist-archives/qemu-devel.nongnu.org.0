Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E409831C13A
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 19:15:08 +0100 (CET)
Received: from localhost ([::1]:33940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBiOp-0005an-VE
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 13:15:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lBiMm-0004E9-08
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 13:13:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52333)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lBiMj-0007HH-JQ
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 13:12:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613412777;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yhrcFK2ydZ/x3kk4+5jSfTLN4yuHPKbkxgTPcP29M2Q=;
 b=SBEVfWBjVR4IzZbxgKiD1dkJwEWvAd/c/1lHkeBPH2b5BXxUj7qj2VmTKAzIoHE/u73h19
 AA+/O3zODe0qz1EcE/E9MxhpSABaJcZWNPVBhsRO0fM/+BXN9IG6dtRtsjNESkJqYC4b4/
 JjX+IpIpkDmPAkZU0W2p5wPkOq0doO8=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-444-L4CZZjk0O_GtqSKA0Sy2mA-1; Mon, 15 Feb 2021 13:12:55 -0500
X-MC-Unique: L4CZZjk0O_GtqSKA0Sy2mA-1
Received: by mail-ed1-f70.google.com with SMTP id d3so2329172edk.22
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 10:12:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=yhrcFK2ydZ/x3kk4+5jSfTLN4yuHPKbkxgTPcP29M2Q=;
 b=Fz0QlZIKWrR0B8zvpp+waTF1SZ4uqdjJ9yv216o9WeGCJhclrnw5+AEKJZ9y05DGmj
 ZFrJJ/virJW0BKg+Qg60UzsPLunpL3T5be9L4hzitbMrGwk0vpu4AjnqiVmWsR3SxRz9
 jj6R+d2fMkp+ll/ZK+m5UmAN2S1tpJPmuk1SRvVIT6o9joRL8zvP6QgjzrNbIyuR54yO
 tOYR9kmr439F3144WDQCQn4NGzR8PtMRQO9NlqegVLybBl9rApv4UDcP9LEj8V0cu+X3
 XuyN0tkfbvl/4ppEs77lLJ6MEQr2FVkUUIugH8siNR9z7fSIC7ZW73/lrOnguGprUNwe
 lsvw==
X-Gm-Message-State: AOAM5324SGI8WlrZNuGdnotDIq+Eb1zpwi76Z8KKRRzaat8oT1EdZ1j3
 5oHfDEhH+b/9MNeONJoB9jq1B3jYA5FwWcYcW9pcLFHC/xZLWzDeyZwAQr8H/DmHIi2YlTjWMzB
 s5g7QksEl7P5AvCw=
X-Received: by 2002:a50:8167:: with SMTP id 94mr9879425edc.173.1613412774179; 
 Mon, 15 Feb 2021 10:12:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwnX1JpF+sBjvjv+YB0DGeyEsNBB9hhReau4H/vV1OjqI+qJoLz3BWM/obFBhhWGRaZ59AA9w==
X-Received: by 2002:a50:8167:: with SMTP id 94mr9879400edc.173.1613412773960; 
 Mon, 15 Feb 2021 10:12:53 -0800 (PST)
Received: from vitty.brq.redhat.com (g-server-2.ign.cz. [91.219.240.2])
 by smtp.gmail.com with ESMTPSA id g3sm11218876edk.75.2021.02.15.10.12.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 10:12:53 -0800 (PST)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v4 16/21] i386: track explicit 'hv-*' features
 enablement/disablement
In-Reply-To: <20210215165502.64e1e629@redhat.com>
References: <20210210164033.607612-1-vkuznets@redhat.com>
 <20210210164033.607612-17-vkuznets@redhat.com>
 <20210211183555.2136b5c8@redhat.com> <87tuqhllmn.fsf@vitty.brq.redhat.com>
 <20210212151259.3db7406f@redhat.com> <87k0rdl3er.fsf@vitty.brq.redhat.com>
 <87h7mhl33o.fsf@vitty.brq.redhat.com> <20210212170527.0e93e6b2@redhat.com>
 <87blcllnf0.fsf@vitty.brq.redhat.com> <20210215165502.64e1e629@redhat.com>
Date: Mon, 15 Feb 2021 19:12:52 +0100
Message-ID: <87pn11jj2z.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=vkuznets@redhat.com;
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, drjones@redhat.com,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Igor Mammedov <imammedo@redhat.com> writes:

> On Mon, 15 Feb 2021 09:56:19 +0100
> Vitaly Kuznetsov <vkuznets@redhat.com> wrote:
>
>> Igor Mammedov <imammedo@redhat.com> writes:
>> 
>> > On Fri, 12 Feb 2021 16:26:03 +0100
>> > Vitaly Kuznetsov <vkuznets@redhat.com> wrote:
>> >  
>> >> Vitaly Kuznetsov <vkuznets@redhat.com> writes:
>> >>   
>> >> > Igor Mammedov <imammedo@redhat.com> writes:
>> >> >    
>> >> >>
>> >> >> Please try reusing scratch CPU approach, see
>> >> >>   kvm_arm_get_host_cpu_features()
>> >> >> for an example. You will very likely end up with simpler series,
>> >> >> compared to reinventing wheel.    
>> >> >
>> >> > Even if I do that (and I serioulsy doubt it's going to be easier than
>> >> > just adding two 'u64's, kvm_arm_get_host_cpu_features() alone is 200
>> >> > lines long) this is not going to give us what we need to distinguish
>> >> > between
>> >> >
>> >> > 'hv-passthrough,hv-evmcs'
>> >> >
>> >> > and 
>> >> >
>> >> > 'hv-passthrough'
>> >> >
>> >> > when 'hv-evmcs' *is* supported by the host. When guest CPU lacks VMX we
>> >> > don't want to enable it unless it was requested explicitly (former but
>> >> > not the later).    
>> >> 
>> >> ... and if for whatever reason we decide that this is also bad/not
>> >> needed, I can just drop patches 16-18 from the series (leaving
>> >> 'hv-passthrough,hv-feature=off' problem to better times).  
>> > that's also an option,
>> > we would need to make sure that hv-passthrough is mutually exclusive
>> > with ''all'' other hv- properties to avoid above combination being
>> > ever (mis)used.  
>> 
>> That's an option to finally get these patches merged, not a good option
>> for end users. 
>> 
>> 'hv-passthrough,hv-feature' works today and it's useful. Should we drop
>> it?
> well,
> try suggested idea about using scratch CPU and it might get merged sooner.
> (it's not like I'm suggesting you to rewrite half of QEMU, just some of
> patches, which most likely would simplify series from my point of view
> and would be easier to maintain)
>

I don't see anything in the series which will go away if I implement
this idea but as I hate it deerly I'm likely not going to.

-- 
Vitaly


