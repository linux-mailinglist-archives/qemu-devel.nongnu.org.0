Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF0D2B98CF
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 18:03:54 +0100 (CET)
Received: from localhost ([::1]:47218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfnLc-0004wF-Qe
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 12:03:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1kfnGB-0000LK-70
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 11:58:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51391)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1kfnG8-0004nW-QW
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 11:58:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605805091;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JoMeEouGSEx7DVLlbUNXTkJw9qzzN+Uyru5quy5gwlo=;
 b=RuBidAeVb91zTCXDtHttfnpeqvvrZ6HvuDtDuCXY7izhfcuWmeJxJnDwoSxyFAhbRqt2fB
 VRlVZeTju4BjeXE0kD+9iwWhj05yyiNzb+XnS2cF7TP3cVoCTzNNxjz2zSRjuObVF63h5X
 KIbK9hHKxPH8Wi4nWK/5c6olgrejx+c=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-445-l-nuE8TUNduzcdeIhC3Kxg-1; Thu, 19 Nov 2020 11:58:09 -0500
X-MC-Unique: l-nuE8TUNduzcdeIhC3Kxg-1
Received: by mail-wr1-f69.google.com with SMTP id n4so2258520wrt.8
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 08:58:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=JoMeEouGSEx7DVLlbUNXTkJw9qzzN+Uyru5quy5gwlo=;
 b=cVIdt64Fm89JTydoNgoswYa1uWoaPpR5UJ54WG1vWHSpR3jgNLBZC8KxSq/VgEgYX2
 zvU/QYP3Wxnz+3a416R9aAnlq96CFUebdmaEXwn2JeOUW+9KnqVs/SyQZPFa+GebBbBs
 Dd9NLVXpmfZC3fbAhQoaILlmb1nTYIyVGT+JvYu0i3lIxA7+SA7GipVD2bzFLSa3Htzv
 WRnpjmUBc4WGtFDdDkRo5j0uWEycJv0ZKb3e2e2PcKiQnM5yaiYnCXUBAqhfRecW/KBP
 tpLMx+YBvIiuKZ9Jj8n3S+p9WDejKg1jTmMg60frfr6p9dRgbW0dnP6dSM4WJ70Nsu6x
 qEbg==
X-Gm-Message-State: AOAM532dCLgHTUCe2jIjMvQIPxNHMS8XrX62UGIzByVpXYogG+zJfiwR
 LaeLkhSlEIrt9P2EMVfYZGsOt5W6waa0b4emRIc/awRRjrxfZ6qgmfYvkx/3SaH+nuJUzv06r/f
 jW6gLiOP0x/cwRAA=
X-Received: by 2002:a5d:4448:: with SMTP id x8mr11188278wrr.364.1605805087871; 
 Thu, 19 Nov 2020 08:58:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzeOV2K2rausRcs6BKqgIQAUB1lMMEe74sdejDz7P/w3FMQvLrY1P2wmqwEX/TPMs6/l2KvGQ==
X-Received: by 2002:a5d:4448:: with SMTP id x8mr11188261wrr.364.1605805087700; 
 Thu, 19 Nov 2020 08:58:07 -0800 (PST)
Received: from vitty.brq.redhat.com (g-server-2.ign.cz. [91.219.240.2])
 by smtp.gmail.com with ESMTPSA id q17sm626929wro.36.2020.11.19.08.58.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2020 08:58:06 -0800 (PST)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Claudio Fontana <cfontana@suse.de>, qemu-devel@nongnu.org
Subject: Re: [PATCH 0/5] i386: simplify Hyper-V enlightenments enablement
In-Reply-To: <5214378f-29fd-e562-ff99-c7868493c9fe@suse.de>
References: <20201119103221.1665171-1-vkuznets@redhat.com>
 <5214378f-29fd-e562-ff99-c7868493c9fe@suse.de>
Date: Thu, 19 Nov 2020 17:58:05 +0100
Message-ID: <87ft55thb6.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Claudio Fontana <cfontana@suse.de> writes:

> Hi Vitaly, I just wanted to raise awareness of
>
> https://lists.gnu.org/archive/html/qemu-devel/2020-11/msg04597.html
>
> because if that series work is completed, you would have already the
> right hook to put your code in, when it comes to your hyperv-specific
> code for the realizefn.

Hi Claudio,

thanks for letting me know! I'll take a look but at first glance it
would just be a code movement. Hope your series gets merged soon, at
least before my bug 'i386: KVM: expand Hyper-V features early"' is
coming (will be submitting it after 5.11-rc1 kernel upstream) so we
minimize the code churn.

>
> Ciao ciao,
>
> Claudio
>
> On 11/19/20 11:32 AM, Vitaly Kuznetsov wrote:
>> This series is a part of the previously sent "[PATCH RFC v3 00/23] i386:
>> KVM: expand Hyper-V features early":
>> https://lists.gnu.org/archive/html/qemu-devel/2020-10/msg02443.html
>> 
>> We're not ready to merge the full patch set yet because the required
>> KVM capability is only queued for 5.11. We can, however, extract the
>> part providing 'hyperv=on' option to x86 machine types which is valuable
>> on its own. Picking up four other patches from the original RFC to
>> minimize the code churn in future (x86_cpu_realizefn()).
>> 
>> Changes since RFCv3:
>> - Rename 'hyperv_features' to 'default_hyperv_features' in X86MachineClass
>>   [Eduardo]
>> - Move x86_cpu_hyperv_realize() invocation after x86_cpu_expand_features()/
>>   x86_cpu_filter_features() as we need to reference cpu_has_vmx().
>> 
>> Vitaly Kuznetsov (5):
>>   i386: move hyperv_vendor_id initialization to x86_cpu_realizefn()
>>   i386: move hyperv_interface_id initialization to x86_cpu_realizefn()
>>   i386: move hyperv_version_id initialization to x86_cpu_realizefn()
>>   i386: move hyperv_limits initialization to x86_cpu_realizefn()
>>   i386: provide simple 'hyperv=on' option to x86 machine types
>> 
>>  docs/hyperv.txt       |  8 +++++
>>  hw/i386/x86.c         | 30 +++++++++++++++++++
>>  include/hw/i386/x86.h |  7 +++++
>>  target/i386/cpu.c     | 52 +++++++++++++++++++++++++++++++-
>>  target/i386/cpu.h     |  6 +++-
>>  target/i386/kvm.c     | 70 ++++++++++++++++++++++++++++---------------
>>  6 files changed, 147 insertions(+), 26 deletions(-)
>> 
>

-- 
Vitaly


