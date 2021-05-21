Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D6038C127
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 09:58:51 +0200 (CEST)
Received: from localhost ([::1]:42446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk03W-0002OF-J5
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 03:58:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lk01s-0000r5-1B
 for qemu-devel@nongnu.org; Fri, 21 May 2021 03:57:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lk01q-00026l-BS
 for qemu-devel@nongnu.org; Fri, 21 May 2021 03:57:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621583825;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zQX7fw9Ezs5m1UxeAE+QOyKtOID/1SDSEaQfBZOeJ40=;
 b=f03lD2vs6vvyTsg7uiL619vI7Wb274D4RFEtG7uxLesvZXs/eKr549N+J0GIw/nIF2pnBb
 1yH9mzaKbdwmn0iUH4R+GHeF+xqrYjG/BJBRgXtoP3cOA9h2i3Z3PLI9/YKzR7/+KnESlP
 p7mhZ8lTEEXeWMQVV+NAFQPlNYck8y0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-29-bNh96fHcOZec-FvUxDVCsA-1; Fri, 21 May 2021 03:57:03 -0400
X-MC-Unique: bNh96fHcOZec-FvUxDVCsA-1
Received: by mail-wm1-f70.google.com with SMTP id
 z64-20020a1ce2430000b029016d56f15ac0so2904046wmg.1
 for <qemu-devel@nongnu.org>; Fri, 21 May 2021 00:57:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=zQX7fw9Ezs5m1UxeAE+QOyKtOID/1SDSEaQfBZOeJ40=;
 b=BNljwIjmWka3vXTZPcOUT0DgxRh7RD+BFp6n0UDbJRP1Dno4zdplZCLtfDpUeAuDwz
 tL/V4+WxJGtWJdvC+UyIyDLsbQnpDjktmvHsj2Ok4WqVX2ngEBxzkJ9cZ7d2/G6vWwar
 rE5fiP0Wof18GJ1AiXPkks3kcNicJN86+4A2eIccEMe5kaHu7WzAGDeAvVD1AtBP/4Rx
 2pzdcX+mvGcParAdoKHqbjp6IlsOT5jtt3nKp9u7d1kOgxQyxcAWJiS2XAl6toAr1UIp
 jIwAxGUpDYb3SinE2yD2VnhvuIkdq3fcq9AB4xBbrPI3VDhLia3ou9+ytptjp8poyYX+
 GtUA==
X-Gm-Message-State: AOAM530TrucYnd3D2H+26jP1ifVPNKCz0tvzqT2D42t92Q76l3oENLSM
 C0P6qLwpoWkF9wu5KrHNBdHcrbk4ZOvGSSARFPkSnbvcqYTXoRmkvY2tJ692BPG3kO/OdQjacbA
 OG2r8gd+pydyqy9k=
X-Received: by 2002:a1c:2048:: with SMTP id g69mr7626786wmg.6.1621583822754;
 Fri, 21 May 2021 00:57:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwXOh8Z4f81IaA1ssSyNcxMDJHroomUCrIM1667e6xBN/50Sc4aYBRSWeUw+UTeSkdECuCI4Q==
X-Received: by 2002:a1c:2048:: with SMTP id g69mr7626773wmg.6.1621583822563;
 Fri, 21 May 2021 00:57:02 -0700 (PDT)
Received: from vitty.brq.redhat.com (g-server-2.ign.cz. [91.219.240.2])
 by smtp.gmail.com with ESMTPSA id z3sm1187720wrq.42.2021.05.21.00.57.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 May 2021 00:57:02 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH v6 05/19] i386: introduce hyperv_feature_supported()
In-Reply-To: <20210520195320.dtamvdimo45jpwu7@habkost.net>
References: <20210422161130.652779-1-vkuznets@redhat.com>
 <20210422161130.652779-6-vkuznets@redhat.com>
 <20210520195320.dtamvdimo45jpwu7@habkost.net>
Date: Fri, 21 May 2021 09:57:01 +0200
Message-ID: <874kewjz8y.fsf@vitty.brq.redhat.com>
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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

> On Thu, Apr 22, 2021 at 06:11:16PM +0200, Vitaly Kuznetsov wrote:
>> Clean up hv_cpuid_check_and_set() by separating hyperv_feature_supported()
>> off it. No functional change intended.
>> 
>> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
>> ---
>>  target/i386/kvm/kvm.c | 49 ++++++++++++++++++++++++++-----------------
>>  1 file changed, 30 insertions(+), 19 deletions(-)
>> 
>> diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
>> index f791baa29acf..ba093dba4d23 100644
>> --- a/target/i386/kvm/kvm.c
>> +++ b/target/i386/kvm/kvm.c
>> @@ -1107,13 +1107,33 @@ static int hv_cpuid_get_fw(struct kvm_cpuid2 *cpuid, int fw, uint32_t *r)
>>      return 0;
>>  }
>>  
>> +static bool hyperv_feature_supported(struct kvm_cpuid2 *cpuid, int feature)
>> +{
>> +    uint32_t r, fw, bits;
>> +    int i;
>> +
>> +    for (i = 0; i < ARRAY_SIZE(kvm_hyperv_properties[feature].flags); i++) {
>> +        fw = kvm_hyperv_properties[feature].flags[i].fw;
>> +        bits = kvm_hyperv_properties[feature].flags[i].bits;
>> +
>> +        if (!fw) {
>> +            continue;
>> +        }
>> +
>> +        if (hv_cpuid_get_fw(cpuid, fw, &r) || (r & bits) != bits) {
>> +            return false;
>> +        }
>> +    }
>> +
>> +    return true;
>> +}
>> +
>>  static int hv_cpuid_check_and_set(CPUState *cs, struct kvm_cpuid2 *cpuid,
>>                                    int feature)
>>  {
>>      X86CPU *cpu = X86_CPU(cs);
>> -    uint32_t r, fw, bits;
>>      uint64_t deps;
>> -    int i, dep_feat;
>> +    int dep_feat;
>>  
>>      if (!hyperv_feat_enabled(cpu, feature) && !cpu->hyperv_passthrough) {
>>          return 0;
>> @@ -1132,23 +1152,14 @@ static int hv_cpuid_check_and_set(CPUState *cs, struct kvm_cpuid2 *cpuid,
>>          deps &= ~(1ull << dep_feat);
>>      }
>>  
>> -    for (i = 0; i < ARRAY_SIZE(kvm_hyperv_properties[feature].flags); i++) {
>> -        fw = kvm_hyperv_properties[feature].flags[i].fw;
>> -        bits = kvm_hyperv_properties[feature].flags[i].bits;
>> -
>> -        if (!fw) {
>> -            continue;
>> -        }
>> -
>> -        if (hv_cpuid_get_fw(cpuid, fw, &r) || (r & bits) != bits) {
>> -            if (hyperv_feat_enabled(cpu, feature)) {
>> -                fprintf(stderr,
>> -                        "Hyper-V %s is not supported by kernel\n",
>> -                        kvm_hyperv_properties[feature].desc);
>> -                return 1;
>> -            } else {
>> -                return 0;
>> -            }
>> +    if (!hyperv_feature_supported(cpuid, feature)) {
>> +        if (hyperv_feat_enabled(cpu, feature)) {
>> +            fprintf(stderr,
>> +                    "Hyper-V %s is not supported by kernel\n",
>> +                    kvm_hyperv_properties[feature].desc);
>> +            return 1;
>> +        } else {
>> +            return 0;
>
> The reason for returning prematurely here when
> !hyperv_feat_enabled() is not clear to me

This hopefully gets much better at the end of the series where
hv_cpuid_check_and_set() is split into 'check' and 'set'. The reason to
return immediately is: if the feature was not requested explicitly and
we're not in 'hv-passthrough' mode, there's no need to check whether KVM
supports it, if we have all the dependencies,... 

> but you are keeping the existing behavior, so:
>
> Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
>

Thanks!

-- 
Vitaly


