Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2F53EA9C9
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 19:50:49 +0200 (CEST)
Received: from localhost ([::1]:43928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEEqr-0003qU-Vz
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 13:50:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mEEox-0001sy-Lt
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 13:48:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mEEou-0001CG-4W
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 13:48:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628790523;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ojFx2DSaAaabzG3DkZR17ix0paD3QapfwbqzD0RPdgc=;
 b=UTCxtfnxAb1SCfbWSTIKXWTC9fwl4zAg4z5pDRYMmb+lMbg75fyMg62mHpJp/cK3mmuB3x
 fUliCPW/vIW5Y474/YUQqu2rb7ws7mFD7y8BfjjDvm96ZZHnT6dTalgWp2I5h1mXz95vu5
 R7+GqP1pG/nEaavwUIXd+CG4sCdVQxo=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-217-NfBv5MRyP9-vASfuC4pc2Q-1; Thu, 12 Aug 2021 13:48:42 -0400
X-MC-Unique: NfBv5MRyP9-vASfuC4pc2Q-1
Received: by mail-ej1-f69.google.com with SMTP id
 ci25-20020a1709072679b029058e79f6c38aso2116251ejc.13
 for <qemu-devel@nongnu.org>; Thu, 12 Aug 2021 10:48:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ojFx2DSaAaabzG3DkZR17ix0paD3QapfwbqzD0RPdgc=;
 b=QF1xr7OOfH6TvCB/PaxVeFdYLdL7/xnXEJ04LSEkuBpgqCDeWykxAS4KU1jSOynaEa
 YT4KAX1g06bKFnrDnmQlXQ3to6drbszkEHBpTXfdP9jcbYr2Kgx8cXvGmHVgaeV11ezF
 NBLRFQ0PrWwvvtgrYQUFuQJYhh775DBdeekyUt9nqJ4zwUVchyb0Bqj25FkdRfTw9ekn
 fIQYK1T1p3uCFWNH74UB9JP5H5Dz3Aueb5bELYNYrx0K76aBj3gG/5UtYDPXA0IojlbW
 Bc4P1X+9fkql2/VftawH0EoE5YoTFVFg9kea2RN/7p7kKiNg3scwzq0aB25SH+iHWBWa
 fSqw==
X-Gm-Message-State: AOAM533+db8c3zKPSoNoZxLddkRJ1qbFdzhamycgScV1Bh1Lr5/bwChw
 UFmvGYpftqcI5fM8dL1jq8ra8LlnXGDBRS+I6s8r1/BZ2YlsP4Ea9tAy4KpvqlOR/W9Dys4vnT/
 WOVW8YwvbpF07nvQ=
X-Received: by 2002:a17:906:38ce:: with SMTP id
 r14mr4851300ejd.268.1628790520888; 
 Thu, 12 Aug 2021 10:48:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyPRfesKmz037BnFoXFkfrkD+ANR3/b3dV+0u/gG5if98Z+WgoMLD8FGZIEj9RqA+PcUqdSlw==
X-Received: by 2002:a17:906:38ce:: with SMTP id
 r14mr4851287ejd.268.1628790520697; 
 Thu, 12 Aug 2021 10:48:40 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id a25sm1073142ejv.91.2021.08.12.10.48.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Aug 2021 10:48:39 -0700 (PDT)
Subject: Re: [PATCH] target/i386: Fixed size of constant for Windows
To: Lara Lazier <laramglazier@gmail.com>, qemu-devel@nongnu.org
References: <20210812111056.26926-1-laramglazier@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <af0ddb50-c353-4661-07d1-61b0d7039fae@redhat.com>
Date: Thu, 12 Aug 2021 19:48:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210812111056.26926-1-laramglazier@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/08/21 13:10, Lara Lazier wrote:
> ~0UL has 64 bits on Linux and 32 bits on Windows.
> Fixes: https://gitlab.com/qemu-project/qemu/-/issues/512".
> 
> Reported-by: Volker Rümelin <vr_qemu@t-online.de>
> Signed-off-by: Lara Lazier <laramglazier@gmail.com>
> ---
>   target/i386/tcg/sysemu/misc_helper.c | 2 +-
>   target/i386/tcg/sysemu/svm_helper.c  | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/i386/tcg/sysemu/misc_helper.c b/target/i386/tcg/sysemu/misc_helper.c
> index 0a7a58ca9a..91b0fc916b 100644
> --- a/target/i386/tcg/sysemu/misc_helper.c
> +++ b/target/i386/tcg/sysemu/misc_helper.c
> @@ -97,7 +97,7 @@ void helper_write_crN(CPUX86State *env, int reg, target_ulong t0)
>           break;
>       case 3:
>           if ((env->efer & MSR_EFER_LMA) &&
> -                (t0 & ((~0UL) << env_archcpu(env)->phys_bits))) {
> +                (t0 & ((~0ULL) << env_archcpu(env)->phys_bits))) {
>               cpu_vmexit(env, SVM_EXIT_ERR, 0, GETPC());
>           }
>           if (!(env->efer & MSR_EFER_LMA)) {
> diff --git a/target/i386/tcg/sysemu/svm_helper.c b/target/i386/tcg/sysemu/svm_helper.c
> index 3891f4e4a8..42cd5053e5 100644
> --- a/target/i386/tcg/sysemu/svm_helper.c
> +++ b/target/i386/tcg/sysemu/svm_helper.c
> @@ -290,7 +290,7 @@ void helper_vmrun(CPUX86State *env, int aflag, int next_eip_addend)
>       }
>       new_cr3 = x86_ldq_phys(cs, env->vm_vmcb + offsetof(struct vmcb, save.cr3));
>       if ((env->efer & MSR_EFER_LMA) &&
> -            (new_cr3 & ((~0UL) << cpu->phys_bits))) {
> +            (new_cr3 & ((~0ULL) << cpu->phys_bits))) {
>           cpu_vmexit(env, SVM_EXIT_ERR, 0, GETPC());
>       }
>       new_cr4 = x86_ldq_phys(cs, env->vm_vmcb + offsetof(struct vmcb, save.cr4));
> 

Queued, thanks.

Paolo


