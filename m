Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 641D826DCEE
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Sep 2020 15:37:18 +0200 (CEST)
Received: from localhost ([::1]:48586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kIu69-0000Va-4j
	for lists+qemu-devel@lfdr.de; Thu, 17 Sep 2020 09:37:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1kIu42-00079l-I5
 for qemu-devel@nongnu.org; Thu, 17 Sep 2020 09:35:06 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:20521
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1kIu3z-0005Ja-Dr
 for qemu-devel@nongnu.org; Thu, 17 Sep 2020 09:35:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600349699;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Upv/zsabZhVThcDruLXnpR9oFE2OG+47TaCji+VvkXE=;
 b=F47O8N7v41hFiJQtZSy/M8wZZSU+phYn4BloC070uBeHgAImB15s4d6EU9rWGZnELa1qgW
 a/v3LuUVBHdtxn4/jbxSo6lz4yatESJRR6m1sOdXXwbdU4YNUq7KqVTd+L14MbTX0X+Nth
 OtoRCIFa/9o+rbEMhjqpWRDJarLH9yY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-523-TbibE7InPLKB7xWv81C9wA-1; Thu, 17 Sep 2020 09:34:57 -0400
X-MC-Unique: TbibE7InPLKB7xWv81C9wA-1
Received: by mail-wm1-f70.google.com with SMTP id c200so759185wmd.5
 for <qemu-devel@nongnu.org>; Thu, 17 Sep 2020 06:34:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=Upv/zsabZhVThcDruLXnpR9oFE2OG+47TaCji+VvkXE=;
 b=gVAK+MLar3Fz2ePnDct71QoDkIUDFgSFlgaUATQYgZA/72fdKkcp6arb2mLBPphYml
 wWROKQ5QND/yXzEdHWdysLQzY0UwGq1DF4ja+Eedl1rSxtdwa5qroL//Hw8lEuyLie7d
 eRUAw4GIMecq60JnTjHyX8wotsETMNVt7QQMimxS7JK6qbcKqbhkc/rGSEJht7ZIyysv
 WsbQI6Ig7SueLQl/PFsRIUUbLoOqRKmc2KaR8By15KfGBjKa/ifyYTiPJs8dRN2ptsz/
 xbEZBiQf253bwPnDIgZTQx+Bhh9/3qZMHqxmCycZqnP8gmcfrBKvzViXgNyH6mSxaxXc
 vR7Q==
X-Gm-Message-State: AOAM5336a8Tvd5GIWaICT9T1b58RYKl75HV18YmIUMB8vbDLMkWFkvkF
 LgbSaEsxwSjtTergjf8Aw1Te+BYXOpcQ2A3mqREH3Y6BBkrCFXKOKPH3cd6gSO5Nh8hHVGJPEp2
 seib63EASdQGBZ+8=
X-Received: by 2002:a7b:c751:: with SMTP id w17mr9802069wmk.97.1600349695488; 
 Thu, 17 Sep 2020 06:34:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzeOhPTC6E5lrpsiv2mWLlihBuvML/PuW6YZjUwUNnHE+Smha1ImVTQCeFEkficMVBD8QCYzA==
X-Received: by 2002:a7b:c751:: with SMTP id w17mr9802048wmk.97.1600349695194; 
 Thu, 17 Sep 2020 06:34:55 -0700 (PDT)
Received: from vitty.brq.redhat.com (g-server-2.ign.cz. [91.219.240.2])
 by smtp.gmail.com with ESMTPSA id z14sm7595565wrs.76.2020.09.17.06.34.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2020 06:34:54 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Antoine Damhet <antoine.damhet@blade-group.com>
Subject: Re: [PATCH] target/i386: always create kvmclock device
In-Reply-To: <20200917122559.e7i5o64k7rw7urdh@tartarus>
References: <20200917111306.819263-1-vkuznets@redhat.com>
 <20200917122559.e7i5o64k7rw7urdh@tartarus>
Date: Thu, 17 Sep 2020 15:34:53 +0200
Message-ID: <87ft7gh6gy.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=207.211.31.81; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/17 03:47:35
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.997,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Antoine Damhet <antoine.damhet@blade-group.com> writes:

> On Thu, Sep 17, 2020 at 01:13:06PM +0200, Vitaly Kuznetsov wrote:
>> QEMU's kvmclock device is only created when KVM PV feature bits for
>> kvmclock (KVM_FEATURE_CLOCKSOURCE/KVM_FEATURE_CLOCKSOURCE2) are
>> exposed to the guest. With 'kvm=off' cpu flag the device is not
>> created and we don't call KVM_GET_CLOCK/KVM_SET_CLOCK upon migration.
>> It was reported that without these call at least Hyper-V TSC page
>> clocksouce (which can be enabled independently) gets broken after
>> migration.
>> 
>> Switch to creating kvmclock QEMU device unconditionally, it seems
>> to always make sense to call KVM_GET_CLOCK/KVM_SET_CLOCK on migration.
>> Use KVM_CAP_ADJUST_CLOCK check instead of CPUID feature bits.
>> 
>> Reported-by: Antoine Damhet <antoine.damhet@blade-group.com>
>> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
>> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
>> ---
>>  hw/i386/kvm/clock.c    | 6 +-----
>>  target/i386/kvm.c      | 5 +++++
>>  target/i386/kvm_i386.h | 1 +
>>  3 files changed, 7 insertions(+), 5 deletions(-)
>> 
>> diff --git a/hw/i386/kvm/clock.c b/hw/i386/kvm/clock.c
>> index 64283358f91d..526c9ea5172b 100644
>> --- a/hw/i386/kvm/clock.c
>> +++ b/hw/i386/kvm/clock.c
>> @@ -330,11 +330,7 @@ static const TypeInfo kvmclock_info = {
>>  /* Note: Must be called after VCPU initialization. */
>>  void kvmclock_create(void)
>>  {
>> -    X86CPU *cpu = X86_CPU(first_cpu);
>> -
>> -    if (kvm_enabled() &&
>> -        cpu->env.features[FEAT_KVM] & ((1ULL << KVM_FEATURE_CLOCKSOURCE) |
>> -                                       (1ULL << KVM_FEATURE_CLOCKSOURCE2))) {
>> +    if (kvm_enabled() && kvm_has_adjust_clock()) {
>
> Shouldn't the old check used when machine type <= 5.1 in order to avoid
> migration incompatibility ?

Hm, when the check fails we just don't create the device and no error is
reported, so even if we have kvmclock data in the migration stream but
fail to create it migration will still succeed, right? (not a migration
expert here :-)

>
>>          sysbus_create_simple(TYPE_KVM_CLOCK, -1, NULL);
>>      }
>>  }
>> diff --git a/target/i386/kvm.c b/target/i386/kvm.c
>> index 4a8b3a41c1bc..20b31b65307b 100644
>> --- a/target/i386/kvm.c
>> +++ b/target/i386/kvm.c
>> @@ -143,6 +143,11 @@ bool kvm_has_adjust_clock_stable(void)
>>      return (ret == KVM_CLOCK_TSC_STABLE);
>>  }
>>  
>> +bool kvm_has_adjust_clock(void)
>> +{
>> +    return kvm_check_extension(kvm_state, KVM_CAP_ADJUST_CLOCK);
>> +}
>> +
>>  bool kvm_has_exception_payload(void)
>>  {
>>      return has_exception_payload;
>> diff --git a/target/i386/kvm_i386.h b/target/i386/kvm_i386.h
>> index 064b8798a26c..0fce4e51d2d6 100644
>> --- a/target/i386/kvm_i386.h
>> +++ b/target/i386/kvm_i386.h
>> @@ -34,6 +34,7 @@
>>  
>>  bool kvm_allows_irq0_override(void);
>>  bool kvm_has_smm(void);
>> +bool kvm_has_adjust_clock(void);
>>  bool kvm_has_adjust_clock_stable(void);
>>  bool kvm_has_exception_payload(void);
>>  void kvm_synchronize_all_tsc(void);
>> -- 
>> 2.25.4
>> 
>> 

-- 
Vitaly


