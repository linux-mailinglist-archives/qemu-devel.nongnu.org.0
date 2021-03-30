Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F1334E6E6
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 13:52:28 +0200 (CEST)
Received: from localhost ([::1]:57926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRCv5-0006Aq-2q
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 07:52:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lRCu6-0005Z1-7l
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 07:51:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22433)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lRCu3-0001M3-Jq
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 07:51:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617105082;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=u24XQMo3Gmj7ItgB1gSPoUtPsSKqhpRcnwDoPLZ+WGQ=;
 b=BI9X0ui1xYFZ5UQAHDIgipDZ+VTzJLA2IOzMJJgcB8kDEGw0yWJ8skBosbGe/biIzYk8G8
 0QQ8dEP2YYP50f98fr+HJ964zvtk3Nej1kcCdab8YxyEMY3kw72XhOwClnK3Akb7Bomp9a
 A/QgGWC6yTQdIW/Q72NRpUlYFs8YxPo=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-16-qIyVNx2aNaObGnHGgwuWzA-1; Tue, 30 Mar 2021 07:51:20 -0400
X-MC-Unique: qIyVNx2aNaObGnHGgwuWzA-1
Received: by mail-ed1-f70.google.com with SMTP id i12so6689372edu.23
 for <qemu-devel@nongnu.org>; Tue, 30 Mar 2021 04:51:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=u24XQMo3Gmj7ItgB1gSPoUtPsSKqhpRcnwDoPLZ+WGQ=;
 b=MafxjrSs92OMXvNercJC9ET/WsxrvMDgi/r/jNrISxuoOXJVSypLBCwvZ9I7XboqB1
 NxuphfBt/C2IbN7lkYkxVs5dlWNai8bHS2eSrlLM1SJW5gOTDm38H9Mmml6S41//3L+S
 t/zBat/wHUwGw4A47t5LTZ+ldPrMkHaS1ssT5/+PhCL+fQ9xTmv2dxqhlX/9J1Kw8eJj
 v/B1rTPl6LPbcgC5PboxCwMAQvCpjA4LMlkKv2s4RlYT22DomXG9fxEhU/NujlcVSSam
 AsYkz/wkGmp/R4/qvU9wQuxdPj86jb9hXtrkF8CSEttw0R/1lKIaLygaEnfWQANuFhZe
 G8oQ==
X-Gm-Message-State: AOAM530vB6j/32/vwWa03GtoCL9Ef+EQP2q9ij95i67dTNNwDm370riy
 pD2nIJvgcAvu77So+Fc0IvkZcyuUWrxj/dVlAAKZeokOevUdSGvwjoiOb1NsJAzpzmHzHG8d435
 SoAYIMX4TX+L1Tnk=
X-Received: by 2002:aa7:dcc7:: with SMTP id w7mr533653edu.255.1617105079411;
 Tue, 30 Mar 2021 04:51:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy0XASawG10k5Mn+Gu8g99EuADiNg/b9ZWih/LD2khEqMrpQMFlrqaz/BG1lAFGxfqqXVq8iQ==
X-Received: by 2002:aa7:dcc7:: with SMTP id w7mr533636edu.255.1617105079167;
 Tue, 30 Mar 2021 04:51:19 -0700 (PDT)
Received: from vitty.brq.redhat.com (g-server-2.ign.cz. [91.219.240.2])
 by smtp.gmail.com with ESMTPSA id q10sm10976050eds.67.2021.03.30.04.51.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Mar 2021 04:51:18 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v2] i386: Make migration fail when Hyper-V
 reenlightenment was enabled but 'user_tsc_khz' is unset
In-Reply-To: <YGHo6WiRVcmVrnSZ@work-vm>
References: <20210319123801.1111090-1-vkuznets@redhat.com>
 <YGHGR9LkV92k0IF2@work-vm> <87y2e69lg8.fsf@vitty.brq.redhat.com>
 <YGHo6WiRVcmVrnSZ@work-vm>
Date: Tue, 30 Mar 2021 13:51:18 +0200
Message-ID: <87im58uafd.fsf@vitty.brq.redhat.com>
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Dr. David Alan Gilbert" <dgilbert@redhat.com> writes:

> * Vitaly Kuznetsov (vkuznets@redhat.com) wrote:
>> "Dr. David Alan Gilbert" <dgilbert@redhat.com> writes:
>> 
>> > * Vitaly Kuznetsov (vkuznets@redhat.com) wrote:
>> >> KVM doesn't fully support Hyper-V reenlightenment notifications on
>> >> migration. In particular, it doesn't support emulating TSC frequency
>> >> of the source host by trapping all TSC accesses so unless TSC scaling
>> >> is supported on the destination host and KVM_SET_TSC_KHZ succeeds, it
>> >> is unsafe to proceed with migration.
>> >> 
>> >> KVM_SET_TSC_KHZ is called from two sites: kvm_arch_init_vcpu() and
>> >> kvm_arch_put_registers(). The later (intentionally) doesn't propagate
>> >> errors allowing migrations to succeed even when TSC scaling is not
>> >> supported on the destination. This doesn't suit 're-enlightenment'
>> >> use-case as we have to guarantee that TSC frequency stays constant.
>> >> 
>> >> Require 'tsc-frequency=' command line option to be specified for successful
>> >> migration when re-enlightenment was enabled by the guest.
>> >> 
>> >> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
>> >> ---
>> >> This patch is a successor of "[PATCH 3/3] i386: Make sure
>> >> kvm_arch_set_tsc_khz() succeeds on migration when 'hv-reenlightenment'
>> >> was exposed" taking a different approach suggested by Paolo.
>> >> ---
>> >>  docs/hyperv.txt                |  5 +++++
>> >>  target/i386/kvm/hyperv-proto.h |  1 +
>> >>  target/i386/machine.c          | 20 ++++++++++++++++++++
>> >>  3 files changed, 26 insertions(+)
>> >> 
>> >> diff --git a/docs/hyperv.txt b/docs/hyperv.txt
>> >> index 5df00da54fc4..e53c581f4586 100644
>> >> --- a/docs/hyperv.txt
>> >> +++ b/docs/hyperv.txt
>> >> @@ -160,6 +160,11 @@ the hypervisor) until it is ready to switch to the new one. This, in conjunction
>> >>  with hv-frequencies, allows Hyper-V on KVM to pass stable clocksource (Reference
>> >>  TSC page) to its own guests.
>> >>  
>> >> +Note, KVM doesn't fully support re-enlightenment notifications and doesn't
>> >> +emulate TSC accesses after migration so 'tsc-frequency=' CPU option also has to
>> >> +be specified to make migration succeed. The destination host has to either have
>> >> +the same TSC frequency or support TSC scaling CPU feature.
>> >> +
>> >>  Recommended: hv-frequencies
>> >>  
>> >>  3.16. hv-evmcs
>> >> diff --git a/target/i386/kvm/hyperv-proto.h b/target/i386/kvm/hyperv-proto.h
>> >> index 056a305be38c..e30d64b4ade4 100644
>> >> --- a/target/i386/kvm/hyperv-proto.h
>> >> +++ b/target/i386/kvm/hyperv-proto.h
>> >> @@ -139,6 +139,7 @@
>> >>   * Reenlightenment notification MSRs
>> >>   */
>> >>  #define HV_X64_MSR_REENLIGHTENMENT_CONTROL      0x40000106
>> >> +#define HV_REENLIGHTENMENT_ENABLE_BIT           (1u << 16)
>> >>  #define HV_X64_MSR_TSC_EMULATION_CONTROL        0x40000107
>> >>  #define HV_X64_MSR_TSC_EMULATION_STATUS         0x40000108
>> >>  
>> >> diff --git a/target/i386/machine.c b/target/i386/machine.c
>> >> index 7259fe6868c6..137604ddb898 100644
>> >> --- a/target/i386/machine.c
>> >> +++ b/target/i386/machine.c
>> >> @@ -883,11 +883,31 @@ static bool hyperv_reenlightenment_enable_needed(void *opaque)
>> >>          env->msr_hv_tsc_emulation_status != 0;
>> >>  }
>> >>  
>> >> +static int hyperv_reenlightenment_post_load(void *opaque, int version_id)
>> >> +{
>> >> +    X86CPU *cpu = opaque;
>> >> +    CPUX86State *env = &cpu->env;
>> >> +
>> >> +    /*
>> >> +     * KVM doesn't fully support re-enlightenment notifications so we need to
>> >> +     * make sure TSC frequency doesn't change upon migration.
>> >> +     */
>> >> +    if ((env->msr_hv_reenlightenment_control & HV_REENLIGHTENMENT_ENABLE_BIT) &&
>> >> +        !env->user_tsc_khz) {
>> >> +        error_report("Guest enabled re-enlightenment notifications, "
>> >> +                     "'tsc-frequency=' has to be specified");
>> >
>> > It's unusual to fail on the destination for a valid configuration but
>> > guest state;  wouldn't it be better to always insist on tsc-frequency if
>> > that hv feature is exposed; failing early before reeiving the state?
>> >
>> 
>> Doing so would make a number of currently existing configurations
>> invalid, even when re-enlightenment is not to be used by the
>> guest. AFAIR Windows without Hyper-V doesn't enable it. Generally, we
>> just advise people to 'enable all currently supported hyper-v
>> enlightenments' to make things easier so reenlightenment may end up
>> being added for no particular reason.
>
> Ouch, that's difficult - the problem with testing this late is that the
> migration fails right at the end so it's an unpleasent surprise.
>
> Could you disallow re-enlightenment without tsc-frequency on new machine
> types?
>

Will do. I'm not exactly sure if I should target 6.0 or 6.1 atm, let's
try the former first.

-- 
Vitaly


