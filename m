Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 815B73928B4
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 09:40:35 +0200 (CEST)
Received: from localhost ([::1]:35468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmAd8-0007Fh-LA
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 03:40:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lmAbm-0005wY-FS
 for qemu-devel@nongnu.org; Thu, 27 May 2021 03:39:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lmAbk-0007re-SC
 for qemu-devel@nongnu.org; Thu, 27 May 2021 03:39:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622101147;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IuDA6+c9wudCXcPQIA4akealQlGkoAFTqD5W1pI6z0w=;
 b=hchW/tvFYimYFvLa5QLEgHB8+t6OF0IGo6SWvPT7Xps1NNEK0quDoSN5GYDsjG2VgxVWFj
 XIE6frRxdr2sBgv59XBPF12SAw1R273I+DL4nZLKkxYnGuSq78Bas50TDjw8o60MQrj/78
 FwqI9Hy9gRo2zrMtEqj7wwQTPp4hRLM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-591-4uueFa-mOE6z4L1WvzUQCw-1; Thu, 27 May 2021 03:39:05 -0400
X-MC-Unique: 4uueFa-mOE6z4L1WvzUQCw-1
Received: by mail-wm1-f71.google.com with SMTP id
 o3-20020a05600c3783b029017dca14ec2dso1028749wmr.8
 for <qemu-devel@nongnu.org>; Thu, 27 May 2021 00:39:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=IuDA6+c9wudCXcPQIA4akealQlGkoAFTqD5W1pI6z0w=;
 b=tJYzTsISWGuwyWBwK+mRW7TNImv2YiBHdC1vcJerHE9c8oe28dWs93P21Ti7L6MWUH
 l1nyOJYtVVOJDNe3hSjbzrJcAIQTOvN3nDEDvDzZ1Fnh+AdCGA0QFEzk1N/nVSuzR6Th
 9SyfKzfat9TwSlRNczxHq8xnLMemL85N7PlVyCoHSU74/qjNt484d4z0jj7bZi+s/AFk
 IvAzX6cVnn/Bl7VDgyrhemhYh2Tzz0TkIl1fUO3HgaBna/TeSY1bbJyDR10F0uGmlOEI
 YUW+G92W3ci1TB3bp6Eyb6FAU9DU69R/CEh9hTrgykajT2SVfgMNRGoJHCSDyEAtOId9
 pC3g==
X-Gm-Message-State: AOAM532C5OtgeFCh3Xyf3TF4yQ83NjQauXYB/mh0gsleSRU9pIU2kuUs
 JxzwCneHnXY3iTdzXdUp2X38W4vJIOBYoNwxUyf9ZEOJ+2/hm6wGFYttE63fNkbu76NWQvhQGfa
 OZNTWkSkodaDZwns=
X-Received: by 2002:adf:8b14:: with SMTP id n20mr77303wra.28.1622101144573;
 Thu, 27 May 2021 00:39:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwZCbVVOCWhgg5A01OpxU6l0wy5VQ1FvMTED8CiUYJW2vh7C7p8KtS9MvIBwx8q3Pquwlazlw==
X-Received: by 2002:adf:8b14:: with SMTP id n20mr77286wra.28.1622101144348;
 Thu, 27 May 2021 00:39:04 -0700 (PDT)
Received: from vitty.brq.redhat.com (g-server-2.ign.cz. [91.219.240.2])
 by smtp.gmail.com with ESMTPSA id b15sm1931054wru.64.2021.05.27.00.39.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 May 2021 00:39:03 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH v6 00/19] i386: KVM: expand Hyper-V features early
In-Reply-To: <20210526202014.tkeim3ofmsknbijy@habkost.net>
References: <20210422161130.652779-1-vkuznets@redhat.com>
 <20210526202014.tkeim3ofmsknbijy@habkost.net>
Date: Thu, 27 May 2021 09:39:02 +0200
Message-ID: <87fsy87hih.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
 qemu-devel@nongnu.org, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eduardo Habkost <ehabkost@redhat.com> writes:

> On Thu, Apr 22, 2021 at 06:11:11PM +0200, Vitaly Kuznetsov wrote:
>> Vitaly Kuznetsov (19):
>>   i386: keep hyperv_vendor string up-to-date
>>   i386: invert hyperv_spinlock_attempts setting logic with
>>     hv_passthrough
>>   i386: always fill Hyper-V CPUID feature leaves from X86CPU data
>>   i386: stop using env->features[] for filling Hyper-V CPUIDs
>>   i386: introduce hyperv_feature_supported()
>>   i386: introduce hv_cpuid_get_host()
>>   i386: drop FEAT_HYPERV feature leaves
>>   i386: introduce hv_cpuid_cache
>>   i386: split hyperv_handle_properties() into
>>     hyperv_expand_features()/hyperv_fill_cpuids()
>>   i386: move eVMCS enablement to hyperv_init_vcpu()
>>   i386: switch hyperv_expand_features() to using error_setg()
>>   i386: adjust the expected KVM_GET_SUPPORTED_HV_CPUID array size
>>   i386: prefer system KVM_GET_SUPPORTED_HV_CPUID ioctl over vCPU's one
>>   i386: use global kvm_state in hyperv_enabled() check
>
> I'm queueing patches 1-14 (the ones above) on my x86-next branch.

Thank you! Is it published somewhere so I can base next version[s] on it? 

-- 
Vitaly


