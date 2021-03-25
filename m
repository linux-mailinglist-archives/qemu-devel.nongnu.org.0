Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C3A3491C5
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 13:20:56 +0100 (CET)
Received: from localhost ([::1]:60838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPOyt-0000RA-1H
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 08:20:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1lPOwt-0007yU-I0
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 08:18:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1lPOwp-0001VF-ST
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 08:18:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616674726;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=jperPNLmhByLCS/rEka9DO+sGWRrZa+aR6WQ/k/a/3o=;
 b=aa211rrRHOtBpkLLLkdB5a3U5CjNHVfWptlbX5z5o+e2G3ZMB4r5oeFZantLJHZWxeUf6F
 5wtFszMd06UDjV5eop97iHhD7ybeKrcVq4+5Z2u4ST0nBYgXzzSeAygaKDwyU0ddka1fGO
 QYt7uP8MGlQ9zgkWcaYyrCJEtCNG6V8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-454-nFNWD9SpNdq7j0so8yvbcw-1; Thu, 25 Mar 2021 08:18:44 -0400
X-MC-Unique: nFNWD9SpNdq7j0so8yvbcw-1
Received: by mail-wr1-f69.google.com with SMTP id b6so2539238wrq.22
 for <qemu-devel@nongnu.org>; Thu, 25 Mar 2021 05:18:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=jperPNLmhByLCS/rEka9DO+sGWRrZa+aR6WQ/k/a/3o=;
 b=myd3jkL2y4OMjQF+hsvae2gmh7KY4Nw2huMxb2USYtdRfTASq0CWb5sKsrRuCQK7Nn
 y6IuyjI/qW86KQxL39vG7PPatOHW0zfagUf8QQ7BgusEm85KkdUzhhC1nqXE64ilweaW
 ssmfZoNiAjf0ofDHa0Nrzyl+BsHBA2icDOfzuLNfZhcZ4nFUX+OEsi8GxWFcLUXbBwj1
 /bACIobmZna8vpOqgmrd6daXpXprNyrJ1CxOKpQRBEL4+QUePmhMn2xtI2kqQ+Bj8dUu
 /ydgCyufUVMQ9tltnsjNEMzW7TkAFDJ4GArYFe02Xk9zsEzHP371KS/KRRVdk1d9CkrC
 S9zw==
X-Gm-Message-State: AOAM533W2u3tZ3FXb956bKiUmgZwcG3zvxzAMnYCLSgL7XenoG3QTma1
 gkwnN0ajite5ZcEW3BHtvqFV7Y/M0KQ+Hb93+J+KYXhKt4K5MGmKiEY3MdL1SNqdceYCnuqvi18
 los+q7KnK1PkSF5M=
X-Received: by 2002:a5d:4686:: with SMTP id u6mr8596611wrq.60.1616674722011;
 Thu, 25 Mar 2021 05:18:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyPFKHdPPXvrDwIjjzUHItfLCrhlbFZ3sKNQLH6gWb/9Ifi8lq9Sz+BOyAZIwhHkj8yCSOS0Q==
X-Received: by 2002:a5d:4686:: with SMTP id u6mr8596576wrq.60.1616674721758;
 Thu, 25 Mar 2021 05:18:41 -0700 (PDT)
Received: from localhost (trasno.trasno.org. [83.165.45.250])
 by smtp.gmail.com with ESMTPSA id c16sm8078071wrs.81.2021.03.25.05.18.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 05:18:41 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Haibo Xu <haibo.xu@linaro.org>
Subject: Re: [RFC PATCH v2 3/5] Add APIs to get/set MTE tags
In-Reply-To: <5f269099f5f06c23f11d41b45d64f77eca23a8ff.1615972140.git.haibo.xu@linaro.org>
 (Haibo Xu's message of "Wed, 17 Mar 2021 09:28:22 +0000")
References: <cover.1615972140.git.haibo.xu@linaro.org>
 <5f269099f5f06c23f11d41b45d64f77eca23a8ff.1615972140.git.haibo.xu@linaro.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
Date: Thu, 25 Mar 2021 13:18:40 +0100
Message-ID: <87tuozo28v.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: quintela@redhat.com
Cc: peter.maydell@linaro.org, drjones@redhat.com, richard.henderson@linaro.org,
 dgilbert@redhat.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Haibo Xu <haibo.xu@linaro.org> wrote:
> MTE spec provide instructions to retrieve the memory tags:
> (1) LDG, at 16 bytes granularity, and available in both user
>     and kernel space;
> (2) LDGM, at 256 bytes granularity in maximum, and only
>     available in kernel space
>
> To improve the performance, KVM has exposed the LDGM capability
> to user space by providing a new APIs. This patch is just a
> wrapper for the KVM APIs.
>
> Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
> ---
>  target/arm/kvm64.c   | 24 ++++++++++++++++++++++++
>  target/arm/kvm_arm.h |  2 ++
>  2 files changed, 26 insertions(+)
>
> diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> index 73a191f8e1..3157025316 100644
> --- a/target/arm/kvm64.c
> +++ b/target/arm/kvm64.c
> @@ -1606,3 +1606,27 @@ bool kvm_arm_verify_ext_dabt_pending(CPUState *cs)
>      }
>      return false;
>  }
> +
> +int kvm_arm_mte_get_tags(uint64_t ipa, uint64_t len, uint8_t *buf)
> +{
> +    struct kvm_arm_copy_mte_tags args = {
> +        .guest_ipa = ipa,
> +        .length = len,
> +        .addr = buf,
> +        .flags = KVM_ARM_TAGS_FROM_GUEST,
> +    };
> +
> +    return kvm_vm_ioctl(kvm_state, KVM_ARM_MTE_COPY_TAGS, &args);

Just a question, how fast/slow are this calls?

My understanding is that we are making a kvm call for each page that we
want to migrate, right?

Each time that we want to send it.

Later, Juan.


> +}
> +
> +int kvm_arm_mte_set_tags(uint64_t ipa, uint64_t len, uint8_t *buf)
> +{
> +    struct kvm_arm_copy_mte_tags args = {
> +        .guest_ipa = ipa,
> +        .length = len,
> +        .addr = buf,
> +        .flags = KVM_ARM_TAGS_TO_GUEST,
> +    };
> +
> +    return kvm_vm_ioctl(kvm_state, KVM_ARM_MTE_COPY_TAGS, &args);
> +}
> diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
> index 34f8daa377..bbb833d6c6 100644
> --- a/target/arm/kvm_arm.h
> +++ b/target/arm/kvm_arm.h
> @@ -360,6 +360,8 @@ int kvm_arm_vgic_probe(void);
>  
>  void kvm_arm_pmu_set_irq(CPUState *cs, int irq);
>  void kvm_arm_pmu_init(CPUState *cs);
> +int kvm_arm_mte_get_tags(uint64_t ipa, uint64_t len, uint8_t *buf);
> +int kvm_arm_mte_set_tags(uint64_t ipa, uint64_t len, uint8_t *buf);
>  
>  /**
>   * kvm_arm_pvtime_init:


