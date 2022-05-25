Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A66D5533E30
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 15:48:27 +0200 (CEST)
Received: from localhost ([::1]:48434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntrNB-0002om-TN
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 09:48:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ntrLX-00026p-PF
 for qemu-devel@nongnu.org; Wed, 25 May 2022 09:46:43 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:39571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ntrLV-0003oX-UP
 for qemu-devel@nongnu.org; Wed, 25 May 2022 09:46:43 -0400
Received: by mail-ed1-x530.google.com with SMTP id j4so22673148edq.6
 for <qemu-devel@nongnu.org>; Wed, 25 May 2022 06:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jXgCTSbSDnJkglvkWFMlbpweCT4wjV+ZFTqXIgUJsJI=;
 b=h1dXZUXY84j6f48kYoneeKM5KXw1DZV9LJc9vP5+fnbVhooooM0CJdnQ/cCcZGggpi
 INL+IkfaeOqqus6A5c6+3JmZItXtWdsWD8rdCl6R0hZJHH7X0H/i8LWjiSBbSrVzQ5H7
 G0MKYI8rWN4yXmv2aQK7Iy63OEimtSET3IoogGR/SaCOOgOCvwbEydah3iegnaTbZJAI
 B3DRu2sCtNcRYfp11lcl+ZPUsL4YN4ZKL95KApOpElKb+OnV6GtXX/cXIQxdD6T5endF
 dJOyBm0fh0yOmWFJrXE2gSA9J07I/+VP6sECCMhT9fKkf1wtn1rn/FZAvsU0w01Ue+V5
 y3Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jXgCTSbSDnJkglvkWFMlbpweCT4wjV+ZFTqXIgUJsJI=;
 b=L0hZ9yJL3dsFg6zNhiL1qBuxH61wZyBL0lXYcQLaF64cOqanwyQKdkpTQ8RpHzb1PJ
 TelX+OtTjRaaJXjx2G4XIlRTbrKZFK++PqoEadqgM5GONutoEiKFA5bqIpqChj4W1wYc
 LezAuIB372gPYeQ9i2RBs7fV9BWJtjhqHvZJKhT042ty23J7iJLrJ6RFdAaGWT1z4Vu4
 ySLow0kbczDvjQH0Y5uVuEhwyWP2O8KDaEMs9VheFU3g2398342OHeFi9Ee/cQaP1Aty
 3QNvU9oF66v9u0ToHodVhvcUOdRB8zo6WWxZl1RqHDBJbPOYgouh0lsK7PI1TcyIaMrd
 RawQ==
X-Gm-Message-State: AOAM530UQxBjQ/6uELfM8+lho3ZNWZYoGQZ2lnRg2z18LPuQSiCMExBI
 9sos5cU9uWUsypHHLCTthDg=
X-Google-Smtp-Source: ABdhPJxxTz3Tvmvb1OfY+V5uX4ZACX7lWMeceOWuwQt5t69GoZvrnAnw5eZEWwQhA4Z7Qvf0OWhuCg==
X-Received: by 2002:a05:6402:b8f:b0:42a:be5d:7a94 with SMTP id
 cf15-20020a0564020b8f00b0042abe5d7a94mr34424762edb.150.1653486400533; 
 Wed, 25 May 2022 06:46:40 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 f10-20020a056402160a00b0042617ba63a7sm10661223edv.49.2022.05.25.06.46.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 May 2022 06:46:39 -0700 (PDT)
Message-ID: <2683e72e-376e-d675-36de-9a7d7c0be5cd@redhat.com>
Date: Wed, 25 May 2022 15:46:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v4 0/6] i386: Enable newly introduced KVM Hyper-V
 enlightenments
Content-Language: en-US
To: Vitaly Kuznetsov <vkuznets@redhat.com>, qemu-devel@nongnu.org
Cc: Marcelo Tosatti <mtosatti@redhat.com>
References: <20220525115949.1294004-1-vkuznets@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220525115949.1294004-1-vkuznets@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 5/25/22 13:59, Vitaly Kuznetsov wrote:
> Changes since v3:
> - Rebase, resolve merge conflict with 73d24074078a ("hyperv: Add support to
>    process syndbg commands")
> - Include "i386: docs:  Convert hyperv.txt to rST" patch which was previously
>    posted separately.

Thank you very much for reposting this.

Paolo

> Original description:
> 
> This series enables four new KVM Hyper-V enlightenmtes:
> 
> 'XMM fast hypercall input feature' is supported by KVM since v5.14,
> it allows for faster Hyper-V hypercall processing.
> 
> 'Enlightened MSR-Bitmap' is a new nested specific enlightenment speeds up
> L2 vmexits by avoiding unnecessary updates to L2 MSR-Bitmap. KVM support
> for the feature on Intel CPUs is in v5.17 and in  5.18 for AMD CPUs.
> 
> 'Extended GVA ranges for TLB flush hypercalls' indicates that extended GVA
> ranges are allowed to be passed to Hyper-V TLB flush hypercalls.
> 
> 'Direct TLB flush hypercall' features allows L0 (KVM) to directly handle
> L2's TLB flush hypercalls without the need to exit to L1 (Hyper-V).
> 
> The last two features are not merged in KVM yet:
> https://lore.kernel.org/kvm/20220525090133.1264239-1-vkuznets@redhat.com/
> however, there's no direct dependency on the kernel part as thanks to
> KVM_GET_SUPPORTED_HV_CPUID no new capabilities are introduced.
> 
> Vitaly Kuznetsov (6):
>    i386: Use hv_build_cpuid_leaf() for HV_CPUID_NESTED_FEATURES
>    i386: Hyper-V Enlightened MSR bitmap feature
>    i386: Hyper-V XMM fast hypercall input feature
>    i386: Hyper-V Support extended GVA ranges for TLB flush hypercalls
>    i386: Hyper-V Direct TLB flush hypercall
>    i386: docs:  Convert hyperv.txt to rST
> 
>   docs/hyperv.txt                | 270 -------------------------------
>   docs/system/i386/hyperv.rst    | 288 +++++++++++++++++++++++++++++++++
>   docs/system/target-i386.rst    |   1 +
>   target/i386/cpu.c              |   8 +
>   target/i386/cpu.h              |   5 +-
>   target/i386/kvm/hyperv-proto.h |   9 +-
>   target/i386/kvm/kvm.c          |  55 +++++--
>   7 files changed, 354 insertions(+), 282 deletions(-)
>   delete mode 100644 docs/hyperv.txt
>   create mode 100644 docs/system/i386/hyperv.rst
> 


