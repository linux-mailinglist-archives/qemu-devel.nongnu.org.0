Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8BE3CB73E
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 14:13:12 +0200 (CEST)
Received: from localhost ([::1]:43544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4MiO-00088p-1q
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 08:13:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1m4MhR-0007Qt-6y
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 08:12:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35402)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1m4MhP-0005cX-JB
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 08:12:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626437531;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Q6eeHb+3tICxL0Qu3RVisX+wMvdiGzzKSK4cKTk7J7I=;
 b=WSJkK+RqRgG8UBp9eYV6qefvb6EYY/J77neHNI6r4HOxC/866Y4N5CYbi2uHbjawEop9Ro
 eN2rxsh3Gr2gwaj5OpHpxRN58loVb7Ri3Vds0jYD07Y00IG7tAfxCqc3AI84RSaCt7dRyA
 p0nUQya19vD4QjQUCRbNhW6wYvirfp8=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-601-rQrK4vaTNUGWjEq_E6R6ig-1; Fri, 16 Jul 2021 08:12:08 -0400
X-MC-Unique: rQrK4vaTNUGWjEq_E6R6ig-1
Received: by mail-ed1-f70.google.com with SMTP id
 n6-20020a05640205c6b02903a65bbc4aebso4707472edx.10
 for <qemu-devel@nongnu.org>; Fri, 16 Jul 2021 05:12:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=Q6eeHb+3tICxL0Qu3RVisX+wMvdiGzzKSK4cKTk7J7I=;
 b=ZWwPR/qXnp8P+lU4EOcD+c1P6jtRnnMsRxvyz8bmlUqhd0ez5HjJrBOh39lvlAXOYI
 mAJkTz1zmAJ7l3zCGRtKDZGZo0YS8cQfMcXzOW+JVajPvPU741W8HIbYjtCPofABmgX1
 V1IpqJl6HRAujkE4/Cg7cy3m9eqhqqOEeY7Mll2jk0/aE+KzDaHp8NG+rEPD8tReGaXJ
 miClIyy8nPM2KXlx/jmo1ep4pgs7YoL4BvfPkU2CpRhTdsO9wUfrs8fp6HNB7CbEJIvS
 rQ5cCAmF2Ep3YhkxJYO+tirRG332npzVIhsAYgX6qtns8eJBHog1TJCkJIWsqBER4TqD
 bhrQ==
X-Gm-Message-State: AOAM5321kDDFmdEtqU79Rh9VcY8hZ0eXHVF7B5xqa0kvakF1yJ9L5Z7m
 ObQzVsz4mHHRY97jRPvMnedGQ5aZYcI1uaie6gfWGCcweC//I3XOAKTPDoZZJ4+ABWVuR56Dvfa
 YivjPExbmkLZRS7A=
X-Received: by 2002:a17:907:704d:: with SMTP id
 ws13mr11436819ejb.147.1626437527741; 
 Fri, 16 Jul 2021 05:12:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzhSoxd3e8MsCjH2uLUhd1wpok6KF/YdP6uYQK2cGR1ezjSDv+bKTxa1Q1JUOt5mpgFe9ogig==
X-Received: by 2002:a17:907:704d:: with SMTP id
 ws13mr11436803ejb.147.1626437527553; 
 Fri, 16 Jul 2021 05:12:07 -0700 (PDT)
Received: from vitty.brq.redhat.com (g-server-2.ign.cz. [91.219.240.2])
 by smtp.gmail.com with ESMTPSA id gh15sm2832589ejb.46.2021.07.16.05.12.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jul 2021 05:12:07 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH v8 9/9] qtest/hyperv: Introduce a simple hyper-v test
In-Reply-To: <20210709102242.2a7cd7f7@redhat.com>
References: <20210608120817.1325125-1-vkuznets@redhat.com>
 <20210608120817.1325125-10-vkuznets@redhat.com>
 <20210708210222.arl4zzquuw75ptwp@habkost.net>
 <20210709102242.2a7cd7f7@redhat.com>
Date: Fri, 16 Jul 2021 14:12:06 +0200
Message-ID: <875yxa1mqx.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
 qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Igor Mammedov <imammedo@redhat.com> writes:

> On Thu, 8 Jul 2021 17:02:22 -0400
> Eduardo Habkost <ehabkost@redhat.com> wrote:
>
>> On Tue, Jun 08, 2021 at 02:08:17PM +0200, Vitaly Kuznetsov wrote:
>> > For the beginning, just test 'hv-passthrough' and a couple of custom
>> > Hyper-V  enlightenments configurations through QMP. Later, it would
>> > be great to complement this by checking CPUID values from within the
>> > guest.
>> > 
>> > Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>  
>> [...]
>> > +static bool kvm_has_sys_hyperv_cpuid(void)
>> > +{
>> > +    int fd = open("/dev/kvm", O_RDWR);
>> > +    int ret;
>> > +
>> > +    g_assert(fd > 0);  
>> 

g_assert() was an overkill, just 'return false' would do.

>> This crashes when /dev/kvm doesn't exist.  See:
>> https://gitlab.com/ehabkost/qemu/-/jobs/1404084459
>
> maybe reuse qtest_has_accel()
>  https://lists.gnu.org/archive/html/qemu-devel/2021-06/msg06864.html
>
> instead of op encoding it.

The purpose of this function is to check if KVM_CAP_SYS_HYPERV_CPUID is
supported by KVM. It is certainly unsupported when KVM is not present
:-) but an ioctl() is needed when it is.

We already have a similar check in tests/qtest/migration-test.c where we
test for KVM_CAP_DIRTY_LOG_RING, maybe we can create a library function
but we don't seem to have any KVM-specific stuff in qtest at this moment
...

>> I'm removing it from the queue.

I'll fix g_assert() and send as a separate patch if it's fine.

-- 
Vitaly


