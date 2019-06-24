Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B5450968
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jun 2019 13:06:46 +0200 (CEST)
Received: from localhost ([::1]:49788 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hfMo9-0000oy-C7
	for lists+qemu-devel@lfdr.de; Mon, 24 Jun 2019 07:06:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52151)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alex.bennee@linaro.org>) id 1hfMlm-0008Rn-DM
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 07:04:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1hfMll-0001Fl-8g
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 07:04:18 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:39015)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1hfMlk-00018Z-WA
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 07:04:17 -0400
Received: by mail-wr1-x430.google.com with SMTP id x4so13405768wrt.6
 for <qemu-devel@nongnu.org>; Mon, 24 Jun 2019 04:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=8FPs/hw1/dJZRg0MRnndtAJARwr5rRaTNukyhAdcTmM=;
 b=gSkbcmMuMUckw8SemUpCE2HA1aASqpuB6h0+LTEmQfVISGxtyQu/0l3cEoAuzukw4r
 S+cUJM9WLnf3z+F/Je65E8nmyLNUBPxn7IHHYVMindpPpg/rcWxuvGzPd7O//xV8Dq1f
 WrwwtQEqjWq7oIRebV/jhuR3KB8s+JZ5QCPR/24xe7Qz2BAz8b3bNn/Fij04jWEU+ZTG
 6SSArjIRL9t1qNIOPuA7WvyppMMNnQwhO+b1aws9FuobtvITU14E53nT8CghpUFaoRa3
 OTcPqCXN6dT6+ms+6TS3nXX6FUU4L3shCR97XBFijyBOwM0sgRJdudM2TzyTYv2Cr0CQ
 ifqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=8FPs/hw1/dJZRg0MRnndtAJARwr5rRaTNukyhAdcTmM=;
 b=mjnTlS8BQtWgBnDm+WQtjf4WAjjdBCww++RQ1VOrUWV3Si/ci3/VAhQNfplmgqFcoO
 sIzkUSbJsLZyVDUmrhliEvgNEk2F5rxcBOHsSCk8X7+NmeHjYr0zJC2xQbh2L1WMnZyN
 E50VXi51N3qeeOl50a65jiWsX70rxEf/UIgKJak42yj0pOXisAnkG41S/AyCUbhMMrSG
 nmLALzd1J7PKDwap8K7xGwuvzKYFYEirtkvbN5GGcf0tkHQ9tFTOOAMsXaJ8dsVHXM8/
 Tq4owhOhqnCg/NiplObSHHA45OUTpI5fVh/Ed4YZy9NnJ3TSvgI1FR5M6Dx8ztiguOkg
 xXiQ==
X-Gm-Message-State: APjAAAXp5aj8lZGeEQOQvFuz/xcgZCPLaAZRsYnuE7BtIW2BqyiF5lUz
 6GGYtfkOaLnao+axioE5HLZB6A94xek=
X-Google-Smtp-Source: APXvYqwBdbKP6M09WSQgHtr/n9t8kEcs+RV/4SYXCY+jWKY5h1hMR7d07tBUS7rR7AxOc27/0gvkzw==
X-Received: by 2002:adf:f84f:: with SMTP id d15mr108875166wrq.53.1561374254875; 
 Mon, 24 Jun 2019 04:04:14 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
 by smtp.gmail.com with ESMTPSA id t1sm13242652wra.74.2019.06.24.04.04.14
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 24 Jun 2019 04:04:14 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B75B01FF87;
 Mon, 24 Jun 2019 12:04:13 +0100 (BST)
References: <1561116620-22245-1-git-send-email-pbonzini@redhat.com>
 <1561116620-22245-4-git-send-email-pbonzini@redhat.com>
User-agent: mu4e 1.3.2; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
In-reply-to: <1561116620-22245-4-git-send-email-pbonzini@redhat.com>
Date: Mon, 24 Jun 2019 12:04:13 +0100
Message-ID: <87r27j1byq.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::430
Subject: Re: [Qemu-devel] [PULL 03/25] i386/kvm: convert hyperv
 enlightenments properties from bools to bits
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
Cc: Vitaly Kuznetsov <vkuznets@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Paolo Bonzini <pbonzini@redhat.com> writes:

> From: Vitaly Kuznetsov <vkuznets@redhat.com>
>
> Representing Hyper-V properties as bits will allow us to check features
> and dependencies between them in a natural way.
>
> Suggested-by: Roman Kagan <rkagan@virtuozzo.com>
> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
> Message-Id: <20190517141924.19024-2-vkuznets@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  hw/i386/pc.c          |  3 +-
>  target/i386/cpu.c     | 44 ++++++++++++++++++---------
>  target/i386/cpu.h     | 37 ++++++++++++++---------
>  target/i386/hyperv.c  |  2 +-
>  target/i386/kvm.c     | 83 +++++++++++++++++++++------------------------=
------
>  target/i386/machine.c |  2 +-
>  6 files changed, 91 insertions(+), 80 deletions(-)
>
<snip>
> diff --git a/target/i386/cpu.h b/target/i386/cpu.h
> index 0732e05..30cd1a0 100644
> --- a/target/i386/cpu.h
> +++ b/target/i386/cpu.h
> @@ -734,6 +734,22 @@ typedef uint32_t FeatureWordArray[FEATURE_WORDS];
>  #define MSR_ARCH_CAP_SKIP_L1DFL_VMENTRY (1U << 3)
>  #define MSR_ARCH_CAP_SSB_NO     (1U << 4)
>
> +/* Supported Hyper-V Enlightenments */
> +#define HYPERV_FEAT_RELAXED             0
> +#define HYPERV_FEAT_VAPIC               1
> +#define HYPERV_FEAT_TIME                2
> +#define HYPERV_FEAT_CRASH               3
> +#define HYPERV_FEAT_RESET               4
> +#define HYPERV_FEAT_VPINDEX             5
> +#define HYPERV_FEAT_RUNTIME             6
> +#define HYPERV_FEAT_SYNIC               7
> +#define HYPERV_FEAT_STIMER              8
> +#define HYPERV_FEAT_FREQUENCIES         9
> +#define HYPERV_FEAT_REENLIGHTENMENT     10
> +#define HYPERV_FEAT_TLBFLUSH            11
> +#define HYPERV_FEAT_EVMCS               12
> +#define HYPERV_FEAT_IPI                 13
> +
>  #ifndef HYPERV_SPINLOCK_NEVER_RETRY
>  #define HYPERV_SPINLOCK_NEVER_RETRY             0xFFFFFFFF
>  #endif
> @@ -1370,23 +1386,11 @@ struct X86CPU {
>      CPUNegativeOffsetState neg;
>      CPUX86State env;
>
> -    bool hyperv_vapic;
> -    bool hyperv_relaxed_timing;
>      int hyperv_spinlock_attempts;
>      char *hyperv_vendor_id;
> -    bool hyperv_time;
> -    bool hyperv_crash;
> -    bool hyperv_reset;
> -    bool hyperv_vpindex;
> -    bool hyperv_runtime;
> -    bool hyperv_synic;
>      bool hyperv_synic_kvm_only;

This looks like it's broken the build:

  configure' '--without-default-devices' '--disable-user'

with:

  /home/alex/lsrc/qemu.git/target/i386/hyperv-stub.c: In function =E2=80=98=
kvm_hv_handle_exit=E2=80=99:
  /home/alex/lsrc/qemu.git/target/i386/hyperv-stub.c:18:19: error: =E2=80=
=98X86CPU=E2=80=99 {aka =E2=80=98struct X86CPU=E2=80=99} has no member name=
d =E2=80=98hyperv_synic=E2=80=99; did you mean =E2=80=98hyperv_vendor_id=E2=
=80=99?
           if (!cpu->hyperv_synic) {
                     ^~~~~~~~~~~~

Does the stub need updating for the new flag? I'm a little confused
about the relationship between HyperV and KVM. I thought they were
different hypervisors?

--
Alex Benn=C3=A9e

