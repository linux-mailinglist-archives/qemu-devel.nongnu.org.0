Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 640995EA80D
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 16:12:20 +0200 (CEST)
Received: from localhost ([::1]:58790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocoqI-0005SW-4r
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 10:12:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1ococE-0001YS-75
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 09:57:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1ococA-0008Q5-Hn
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 09:57:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664200656;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZIwKOnLf/14p190vkBty8EvpLDOlGfw7DGdO7oz3Zag=;
 b=irycZu0b4zhUDT2gV1FY1x1c7vscRTq20ndJ7tktfY/uB4+eJ3Z6L+SCZGNxoS76i/2Q+u
 p5pRvaF7hY03e5nN+aMbFgjNDhETXGaInaUfKnJKdgRJGpNagctZ2e1E2VsjTNWwKLoSha
 nUOH7frBama7q9KaSn+zTD1/Slvhb9s=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-373-P03DUbeWMxODEEApSj_Dww-1; Mon, 26 Sep 2022 09:57:28 -0400
X-MC-Unique: P03DUbeWMxODEEApSj_Dww-1
Received: by mail-ed1-f69.google.com with SMTP id
 v11-20020a056402348b00b004516e0b7eedso5478678edc.8
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 06:57:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=ZIwKOnLf/14p190vkBty8EvpLDOlGfw7DGdO7oz3Zag=;
 b=x2jKTtHSRk3baL1Ji/D+6WglkMrS0v1ldVJROXw1xrpdQPw2tcbvm5nMuCJ26O4mSg
 bg2yr33dFd+VRvuMY6hkBnDvKFC1v7r8lxAfq/kbCzmxhv0fLsnMRJpdbUcurJmpYITT
 v2ZH57OL8uq1sW/nu/nRZChH4cGzGo3oMwGldQ+Jlsact043H3AFQu5bLSn6XAbHElQL
 9cNbE4NhLks5xKy8ygCab29muX8grYwrxIBGvXVmvDl3z48ApCpElbEHNfDA/wsLVlek
 QN7QJekxEnrHcWTVQ41Hp0pptzx/SVTVhLLzyOnSeQIgT6fSyFR84W8Qv0Tz3LOIm5vX
 GAdQ==
X-Gm-Message-State: ACrzQf1MlxJ1gm7E/HsJWGG8MZgbVh5rI8AOyeTiCZiVeZYFI8qDB8uT
 AgdbFJ5OwM40IB4+O71BOwjrMznnEWNWaF1C4xsylcrfhmr1TvBCrrlIX9HrOD2cA8pqIbrPU+s
 gPpklYr2w0TaT+kA=
X-Received: by 2002:a05:6402:3509:b0:452:20c7:5a95 with SMTP id
 b9-20020a056402350900b0045220c75a95mr22720218edd.427.1664200644370; 
 Mon, 26 Sep 2022 06:57:24 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM64I//nuBP+S7jnoxvFEhmI7ojQ3cqEFlkjWavkKK44xi0SXoDJfqXTFahxKd5PuWcD+Qw10g==
X-Received: by 2002:a05:6402:3509:b0:452:20c7:5a95 with SMTP id
 b9-20020a056402350900b0045220c75a95mr22720189edd.427.1664200644164; 
 Mon, 26 Sep 2022 06:57:24 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 s14-20020aa7cb0e000000b0044e7862ab3fsm11532741edt.7.2022.09.26.06.57.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Sep 2022 06:57:23 -0700 (PDT)
Message-ID: <8cc743b6-757c-bb25-d153-0f86b28e1f86@redhat.com>
Date: Mon, 26 Sep 2022 15:57:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] target/arm/kvm: Retry KVM_CREATE_VM call if it fails EINTR
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Vitaly Chikunov <vt@altlinux.org>, Marc Zyngier <maz@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20220926133644.1345269-1-peter.maydell@linaro.org>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <20220926133644.1345269-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.319, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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



Hi Peter,
On 9/26/22 15:36, Peter Maydell wrote:
> Occasionally the KVM_CREATE_VM ioctl can return EINTR, even though
> there is no pending signal to be taken. In commit 94ccff13382055
> we added a retry-on-EINTR loop to the KVM_CREATE_VM call in the
> generic KVM code. Adopt the same approach for the use of the
> ioctl in the Arm-specific KVM code (where we use it to create a
> scratch VM for probing for various things).
> 
> For more information, see the mailing list thread:
> https://lore.kernel.org/qemu-devel/8735e0s1zw.wl-maz@kernel.org/
> 
> Reported-by: Vitaly Chikunov <vt@altlinux.org>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> The view in the thread seems to be that this is a kernel bug (because
> in QEMU's case there shouldn't be a signal to be delivered at this
> point because of our signal handling strategy); so I've adopted the
> same "just retry-on-EINTR for this specific ioctl" approach that
> commit 94ccff13 did, rather than, for instance, something wider like
> "make kvm_ioctl() and friends always retry on EINTR".
> ---
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric
>  target/arm/kvm.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index e5c1bd50d29..2982d216176 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -79,7 +79,9 @@ bool kvm_arm_create_scratch_host_vcpu(const uint32_t *cpus_to_try,
>      if (max_vm_pa_size < 0) {
>          max_vm_pa_size = 0;
>      }
> -    vmfd = ioctl(kvmfd, KVM_CREATE_VM, max_vm_pa_size);
> +    do {
> +        vmfd = ioctl(kvmfd, KVM_CREATE_VM, max_vm_pa_size);
> +    } while (vmfd == -EINTR);
>      if (vmfd < 0) {
>          goto err;
>      }


