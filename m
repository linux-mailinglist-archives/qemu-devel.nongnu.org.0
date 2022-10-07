Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 327555F765E
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 11:37:53 +0200 (CEST)
Received: from localhost ([::1]:54850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogjnj-0006xV-TG
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 05:37:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1ogjcd-0000Dj-F4
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 05:26:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52118)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1ogjca-0008Da-1K
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 05:26:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665134778;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QjSYSUWBG0AVYzLnxyior/qeZxRXaWTwtQTI/En/joU=;
 b=IjxyZb13jI6V+k89CJXT3Z/5DHgwRCm/Qc4DHYuBYcR0X56AWhkY9N981y/TI0LemVkmrp
 yKM9vJVr9rYIy7sTVWzAMKiP5dKImeNQOHOmzmXqjN6Z/EIauzpBZm29COg6B48OJh5K6m
 ysGDYsUah6hveXePgvN4+HTmuBsMKeY=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-330-J_Y1ZBs-MQmw2MMsGq-D6Q-1; Fri, 07 Oct 2022 05:26:17 -0400
X-MC-Unique: J_Y1ZBs-MQmw2MMsGq-D6Q-1
Received: by mail-ej1-f70.google.com with SMTP id
 ht14-20020a170907608e00b0078d437c268dso2347060ejc.20
 for <qemu-devel@nongnu.org>; Fri, 07 Oct 2022 02:26:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QjSYSUWBG0AVYzLnxyior/qeZxRXaWTwtQTI/En/joU=;
 b=BkhMsQiXVsVP620nj530OnORjguriOt0zeSe2hDyg6+8EfT2dvavDAFhz/nxMP/2WU
 LkjaoJqTLBfWfM4YnyAEH0Q8ZQeIiEbtoW94WiMVpP6kRMTK124oJw3iH8aE3ATkT5vs
 XdCbJTVKMveecSS2psLFU5wLejAFgk4OVfrGV5hGOink4fLll5aXcfkfutGtq+1zZ1/j
 sWqlwzlxgqTRroZbt+D18PrCEqFTWE5z5oJrlrMh1tn16HOQC3mbevlhz9yCFt4H5vg1
 ezeoqz+qxL9tJIJEq9d7Ziprdqc9VQH8/AJs1szwIWh4lP28Zb21eAelrfiKCdCrxiJg
 fwTA==
X-Gm-Message-State: ACrzQf1xrv/K7Yt1AnCYiRrwzKqdJ6ISSA0cpIlOqnog3taCBgSJxCem
 MpN2yzE4/M8pfyeQ5wl/cqhXxuB1FaOz5B5O377w6sm7+RaGcORekZf38EIbn6lNwLhuIVabuP4
 W3HpkeQPC4xa+IWY=
X-Received: by 2002:a05:6402:50d1:b0:45a:fc:86f4 with SMTP id
 h17-20020a05640250d100b0045a00fc86f4mr3749006edb.344.1665134776111; 
 Fri, 07 Oct 2022 02:26:16 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM48ex39ISJWNkAYM1KlGOX7o3/de6btDElJRB7+a7b+/9GD8X+d4zqvSSODBWOwT/S8Gsfr4w==
X-Received: by 2002:a05:6402:50d1:b0:45a:fc:86f4 with SMTP id
 h17-20020a05640250d100b0045a00fc86f4mr3748989edb.344.1665134775828; 
 Fri, 07 Oct 2022 02:26:15 -0700 (PDT)
Received: from fedora (nat-2.ign.cz. [91.219.240.2])
 by smtp.gmail.com with ESMTPSA id
 kx22-20020a170907775600b0078ba492db81sm975153ejc.9.2022.10.07.02.26.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Oct 2022 02:26:15 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Cc: Marcelo Tosatti <mtosatti@redhat.com>, Oliver Upton <oupton@google.com>,
 Maxim Levitsky <mlevitsk@redhat.com>
Subject: Re: [PATCH] i386: Fix KVM_CAP_ADJUST_CLOCK capability check
In-Reply-To: <87wn9pkv6e.fsf@redhat.com>
References: <20220920144024.3559708-1-vkuznets@redhat.com>
 <87wn9pkv6e.fsf@redhat.com>
Date: Fri, 07 Oct 2022 11:26:14 +0200
Message-ID: <87sfk07znt.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Vitaly Kuznetsov <vkuznets@redhat.com> writes:

> Vitaly Kuznetsov <vkuznets@redhat.com> writes:
>
>> KVM commit c68dc1b577ea ("KVM: x86: Report host tsc and realtime values in
>> KVM_GET_CLOCK") broke migration of certain workloads, e.g. Win11 + WSL2
>> guest reboots immediately after migration. KVM, however, is not to
>> blame this time. When KVM_CAP_ADJUST_CLOCK capability is checked, the
>> result is all supported flags (which the above mentioned KVM commit
>> enhanced) but kvm_has_adjust_clock_stable() wants it to be
>> KVM_CLOCK_TSC_STABLE precisely. The result is that 'clock_is_reliable'
>> is not set in vmstate and the saved clock reading is discarded in
>> kvmclock_vm_state_change().
>>
>> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
>> ---
>>  target/i386/kvm/kvm.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
>> index a1fd1f53791d..c33192a87dcb 100644
>> --- a/target/i386/kvm/kvm.c
>> +++ b/target/i386/kvm/kvm.c
>> @@ -157,7 +157,7 @@ bool kvm_has_adjust_clock_stable(void)
>>  {
>>      int ret = kvm_check_extension(kvm_state, KVM_CAP_ADJUST_CLOCK);
>>  
>> -    return (ret == KVM_CLOCK_TSC_STABLE);
>> +    return ret & KVM_CLOCK_TSC_STABLE;
>>  }
>>  
>>  bool kvm_has_adjust_clock(void)
>
> Ping) This issue seems to introduce major migration issues with KVM >= v5.16

Ping)

-- 
Vitaly


