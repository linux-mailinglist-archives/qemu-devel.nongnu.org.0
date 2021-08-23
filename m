Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5233F4DC5
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 17:53:45 +0200 (CEST)
Received: from localhost ([::1]:43714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mICGe-0003l6-CF
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 11:53:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mICFK-0001y0-GF
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 11:52:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mICFG-0007Od-DS
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 11:52:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629733937;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LOInOSBq4SiKKZCxvVVpGjb1G22K+1MTnUPNDc6hgls=;
 b=Tob9nFMyt8UOl53DPVMKhhWqT5n0b/h/Pu1WlQPFcY0iy9jN+ZrDE3pt2PxQw0ejSUiMGu
 lfmXuQS2QyOcOKcBpytUz9b1QRrzfPoVq5dRLVRpxfUYo+iOIWlEEspdwnVJrS2yBbYjIo
 +EwGY9rDfL5PiXmiWYllrNu9j+SX+L8=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-24-tmOnoUv2Ngijzh80zAhubA-1; Mon, 23 Aug 2021 11:52:16 -0400
X-MC-Unique: tmOnoUv2Ngijzh80zAhubA-1
Received: by mail-ed1-f71.google.com with SMTP id
 b6-20020aa7c6c6000000b003c2b5b2ddf8so1912466eds.0
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 08:52:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LOInOSBq4SiKKZCxvVVpGjb1G22K+1MTnUPNDc6hgls=;
 b=IGUqXjZqxOVoLthtSSKLguAs5sVyFgM8zlo7uQDW7EQfabYshBIEZJKglwl/KSaOwc
 YLlsPvoyQMhVKTsRJSuSiGoKrhKykXOl9iU6Bi1793QZlT79SPky7VTrzx6mpeayJfPv
 MxnXgVfZB6HrBYD2R/YqTPn8sNydhg5+SORsoUg1hMXyRoFp3JSkHnV5kL9xf4mFq+Rf
 HthdYgV9Lguhz9PlQbaFx5PZcYGwK8bZ7cNX01V/0gbyfA+Zylnj/FWOxfspncdLrrco
 97Sr2GQ8t3YOtkXghltsyeDsjr6ihC0wALSB/GwUr8pisbnl6AB8DDSjLtF+f6UFB4ND
 TuUg==
X-Gm-Message-State: AOAM531gfiKw5b6RWwNw8SnEQg5u9GwvQ1/REke4Rb0Pn8Tux7uhSzue
 Azjp3EE+J9iWosWdczgvQD5NMdvEGHLWDi9boNa8h+4zV9lmdlEmHpGvFFmqcD5wCYqv3QaMr4e
 7U02KnZC5hed0O5XyJrDQlD9TsiJ3uAy5x27Y9gXIJQsgyLhzfL6QiuLPZc6sGeMgEQ==
X-Received: by 2002:a17:906:1b08:: with SMTP id
 o8mr3814942ejg.21.1629733935444; 
 Mon, 23 Aug 2021 08:52:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwzvhz7U2FEkVywIeUOnOZGclLWc9t9KrUTgl+XjzTeAdP7lojkNC2gQo3h/0wb6eA1CnCw8g==
X-Received: by 2002:a17:906:1b08:: with SMTP id
 o8mr3814920ejg.21.1629733935161; 
 Mon, 23 Aug 2021 08:52:15 -0700 (PDT)
Received: from gator.home (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id dv8sm7619316ejb.93.2021.08.23.08.52.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 08:52:14 -0700 (PDT)
Date: Mon, 23 Aug 2021 17:52:13 +0200
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH 4/4] target/arm/cpu64: Validate sve vector lengths are
 supported
Message-ID: <20210823155213.hygmnnw2kv4vppxj@gator.home>
References: <20210819193758.149660-1-drjones@redhat.com>
 <20210819193758.149660-5-drjones@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210819193758.149660-5-drjones@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 ishii.shuuichir@fujitsu.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 19, 2021 at 09:37:58PM +0200, Andrew Jones wrote:
> Future CPU types may specify which vector lengths are supported.
> We can apply nearly the same logic to validate those lengths
> as we do for KVM's supported vector lengths. We merge the code
> where we can, but unfortunately can't completely merge it because
> KVM requires all vector lengths, power-of-two or not, smaller than
> the maximum enabled length to also be enabled. The architecture
> only requires all the power-of-two lengths, though, so TCG will
> only enforce that.
> 
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---
>  target/arm/cpu64.c | 101 ++++++++++++++++++++-------------------------
>  1 file changed, 45 insertions(+), 56 deletions(-)
> 
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index 557fd4757740..9cb41c442600 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -329,35 +329,26 @@ void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
>                      break;
>                  }
>              }
> -            max_vq = vq <= ARM_MAX_VQ ? vq - 1 : ARM_MAX_VQ;
> -            bitmap_andnot(cpu->sve_vq_map, cpu->sve_vq_supported,
> -                          cpu->sve_vq_init, max_vq);
> -            if (max_vq == 0 || bitmap_empty(cpu->sve_vq_map, max_vq)) {
> -                error_setg(errp, "cannot disable sve%d", vq * 128);
> -                error_append_hint(errp, "Disabling sve%d results in all "
> -                                  "vector lengths being disabled.\n",
> -                                  vq * 128);
> -                error_append_hint(errp, "With SVE enabled, at least one "
> -                                  "vector length must be enabled.\n");
> -                return;
> -            }
>          } else {
>              /* Disabling a power-of-two disables all larger lengths. */
> -            if (test_bit(0, cpu->sve_vq_init)) {
> -                error_setg(errp, "cannot disable sve128");
> -                error_append_hint(errp, "Disabling sve128 results in all "
> -                                  "vector lengths being disabled.\n");
> -                error_append_hint(errp, "With SVE enabled, at least one "
> -                                  "vector length must be enabled.\n");
> -                return;
> -            }
> -            for (vq = 2; vq <= ARM_MAX_VQ; vq <<= 1) {
> +            for (vq = 1; vq <= ARM_MAX_VQ; vq <<= 1) {
>                  if (test_bit(vq - 1, cpu->sve_vq_init)) {
>                      break;
>                  }
>              }
> -            max_vq = vq <= ARM_MAX_VQ ? vq - 1 : ARM_MAX_VQ;
> -            bitmap_complement(cpu->sve_vq_map, cpu->sve_vq_init, max_vq);
> +        }
> +
> +        max_vq = vq <= ARM_MAX_VQ ? vq - 1 : ARM_MAX_VQ;
> +        bitmap_andnot(cpu->sve_vq_map, cpu->sve_vq_supported,
> +                      cpu->sve_vq_init, max_vq);
> +        if (max_vq == 0 || bitmap_empty(cpu->sve_vq_map, max_vq)) {
> +            error_setg(errp, "cannot disable sve%d", vq * 128);
> +            error_append_hint(errp, "Disabling sve%d results in all "
> +                              "vector lengths being disabled.\n",
> +                              vq * 128);
> +            error_append_hint(errp, "With SVE enabled, at least one "
> +                              "vector length must be enabled.\n");
> +            return;
>          }
>  
>          max_vq = find_last_bit(cpu->sve_vq_map, max_vq) + 1;
> @@ -393,46 +384,44 @@ void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
>      assert(max_vq != 0);
>      bitmap_clear(cpu->sve_vq_map, max_vq, ARM_MAX_VQ - max_vq);
>  
> -    if (kvm_enabled()) {
> -        /* Ensure the set of lengths matches what KVM supports. */
> -        bitmap_xor(tmp, cpu->sve_vq_map, cpu->sve_vq_supported, max_vq);
> -        if (!bitmap_empty(tmp, max_vq)) {
> -            vq = find_last_bit(tmp, max_vq) + 1;
> -            if (test_bit(vq - 1, cpu->sve_vq_map)) {
> -                if (cpu->sve_max_vq) {
> -                    error_setg(errp, "cannot set sve-max-vq=%d",
> -                               cpu->sve_max_vq);
> -                    error_append_hint(errp, "This KVM host does not support "
> -                                      "the vector length %d-bits.\n",
> -                                      vq * 128);
> -                    error_append_hint(errp, "It may not be possible to use "
> -                                      "sve-max-vq with this KVM host. Try "
> -                                      "using only sve<N> properties.\n");
> -                } else {
> -                    error_setg(errp, "cannot enable sve%d", vq * 128);
> -                    error_append_hint(errp, "This KVM host does not support "
> -                                      "the vector length %d-bits.\n",
> -                                      vq * 128);
> -                }
> +    /* Ensure the set of lengths matches what is supported. */
> +    bitmap_xor(tmp, cpu->sve_vq_map, cpu->sve_vq_supported, max_vq);
> +    if (!bitmap_empty(tmp, max_vq)) {
> +        vq = find_last_bit(tmp, max_vq) + 1;
> +        if (test_bit(vq - 1, cpu->sve_vq_map)) {
> +            if (cpu->sve_max_vq) {
> +                error_setg(errp, "cannot set sve-max-vq=%d", cpu->sve_max_vq);
> +                error_append_hint(errp, "This CPU does not support "
> +                                  "the vector length %d-bits.\n", vq * 128);
> +                error_append_hint(errp, "It may not be possible to use "
> +                                  "sve-max-vq with this CPU. Try "
> +                                  "using only sve<N> properties.\n");
>              } else {
> +                error_setg(errp, "cannot enable sve%d", vq * 128);
> +                error_append_hint(errp, "This CPU does not support "
> +                                  "the vector length %d-bits.\n", vq * 128);
> +            }
> +            return;
> +        } else {
> +            if (kvm_enabled()) {
>                  error_setg(errp, "cannot disable sve%d", vq * 128);
>                  error_append_hint(errp, "The KVM host requires all "
>                                    "supported vector lengths smaller "
>                                    "than %d bits to also be enabled.\n",
>                                    max_vq * 128);
> -            }
> -            return;
> -        }
> -    } else {
> -        /* Ensure all required powers-of-two are enabled. */
> -        for (vq = pow2floor(max_vq); vq >= 1; vq >>= 1) {
> -            if (!test_bit(vq - 1, cpu->sve_vq_map)) {
> -                error_setg(errp, "cannot disable sve%d", vq * 128);
> -                error_append_hint(errp, "sve%d is required as it "
> -                                  "is a power-of-two length smaller than "
> -                                  "the maximum, sve%d\n",
> -                                  vq * 128, max_vq * 128);
>                  return;
> +            } else {
> +                /* Ensure all required powers-of-two are enabled. */
> +                for (vq = pow2floor(max_vq); vq >= 1; vq >>= 1) {
> +                    if (!test_bit(vq - 1, cpu->sve_vq_map)) {
> +                        error_setg(errp, "cannot disable sve%d", vq * 128);
> +                        error_append_hint(errp, "sve%d is required as it "
> +                                          "is a power-of-two length smaller "
> +                                          " than the maximum, sve%d\n",

When moving 'than' down to avoid going over 80 characters I somehow added
a leading space, making two spaces between 'smaller' and 'than'. I'll send
a v2 to remove it.

Thanks,
drew

> +                                          vq * 128, max_vq * 128);
> +                        return;
> +                    }
> +                }
>              }
>          }
>      }
> -- 
> 2.31.1
>


