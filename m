Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4CB40352D
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 09:21:08 +0200 (CEST)
Received: from localhost ([::1]:39728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNrtL-0007zt-Eb
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 03:21:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mNrp3-0000vN-Qq
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 03:16:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44209)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mNrp1-0005mX-Ag
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 03:16:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631085398;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QVcnxqH4ZqJw6GWyOzcoVHdPqx/ncSD3ywy2ZrdHJuQ=;
 b=KvbojsG32GyEWVEvaf63KxbUG+sut00DN+pkeB6b6QfltANjQHG+HQSMc4FteqNpCRV3GG
 nQPegm7w+pckl1qjsLTLEMRbZAEDYsdzEwSHz60iC0w+yeLFZR6xeIoaBz84ZPgCmtm6V9
 vsx0rtswVHUOOY5/6EMPNr+t6MqE1sA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-536-3xN5l9XaPz6g6qOsMyiYrA-1; Wed, 08 Sep 2021 03:16:37 -0400
X-MC-Unique: 3xN5l9XaPz6g6qOsMyiYrA-1
Received: by mail-wm1-f71.google.com with SMTP id
 p11-20020a05600c204b00b002f05aff1663so511003wmg.2
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 00:16:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=QVcnxqH4ZqJw6GWyOzcoVHdPqx/ncSD3ywy2ZrdHJuQ=;
 b=bs+IKnyzUkJj/1XAT0ujcwe9UYGVX16PxH1/vuEjvYAnTFv+H5tlKM2zox2jnmxLxv
 LyEirO4IUalOutZW5w+q6Y4dTG9bfx1k+N3ombgyVkbvkz/xOyP+hbshngF3ddX+squR
 m3R2fsCXisrRiNiaqiFKjUuN+lyUmyycQOz7Pz8oE7/Yc8B/t0G2W4hbt9bplxK406o1
 RgPqNy+LHLozc6mtbmuz6J7JhhdZNyyHyekIYo2MUMhZyq4Zyb+LDU439woj3HJ+9o7D
 S9JTGVPKDo4j9+6p8BfsITF+32X+ia60HJMSt/DyN3pDw9izcnB940OcWqhsU0iH0pQu
 BJEw==
X-Gm-Message-State: AOAM532fDC6Vp6D4zWgM8mK75HbgQ1dfxOSUxsH8q+X9Tp03g2QdW6AT
 ftJYFhQai5iNavPoBPB0Kcgx3Bmc262gE3Ctn1gsISP5RAz22ezMan8p22JwHzleWI+ZGJxtg3B
 ef98obHtEq3GjDsI=
X-Received: by 2002:a05:600c:3502:: with SMTP id
 h2mr2063426wmq.182.1631085396044; 
 Wed, 08 Sep 2021 00:16:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwylCkktON4n0tuWNbSRxevfGzWWZe7Oajxrq8VSijl8FtjLV0eusWXE2xNxDIPwLnilJrmvw==
X-Received: by 2002:a05:600c:3502:: with SMTP id
 h2mr2063409wmq.182.1631085395846; 
 Wed, 08 Sep 2021 00:16:35 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id n14sm1213320wrx.10.2021.09.08.00.16.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Sep 2021 00:16:35 -0700 (PDT)
Subject: Re: [PATCH 1/3] hw/arm/virt: KVM: Probe for KVM_CAP_ARM_VM_IPA_SIZE
 when creating scratch VM
To: Marc Zyngier <maz@kernel.org>, qemu-devel@nongnu.org
References: <20210822144441.1290891-1-maz@kernel.org>
 <20210822144441.1290891-2-maz@kernel.org>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <a38b75a7-4f75-e42c-5804-6115e5d52394@redhat.com>
Date: Wed, 8 Sep 2021 09:16:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210822144441.1290891-2-maz@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.332, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Reply-To: eric.auger@redhat.com
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 kernel-team@android.com, kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Marc,

On 8/22/21 4:44 PM, Marc Zyngier wrote:
> Although we probe for the IPA limits imposed by KVM (and the hardware)
> when computing the memory map, we still use the old style '0' when
> creating a scratch VM in kvm_arm_create_scratch_host_vcpu().
>
> On systems that are severely IPA challenged (such as the Apple M1),
> this results in a failure as KVM cannot use the default 40bit that
> '0' represents.
>
> Instead, probe for the extension and use the reported IPA limit
> if available.
>
> Cc: Andrew Jones <drjones@redhat.com>
> Cc: Eric Auger <eric.auger@redhat.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  target/arm/kvm.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index d8381ba224..cc3371a99b 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -70,12 +70,17 @@ bool kvm_arm_create_scratch_host_vcpu(const uint32_t *cpus_to_try,
>                                        struct kvm_vcpu_init *init)
>  {
>      int ret = 0, kvmfd = -1, vmfd = -1, cpufd = -1;
> +    int max_vm_pa_size;
>  
>      kvmfd = qemu_open_old("/dev/kvm", O_RDWR);
>      if (kvmfd < 0) {
>          goto err;
>      }
> -    vmfd = ioctl(kvmfd, KVM_CREATE_VM, 0);
> +    max_vm_pa_size = ioctl(kvmfd, KVM_CHECK_EXTENSION, KVM_CAP_ARM_VM_IPA_SIZE);
> +    if (max_vm_pa_size < 0) {
> +        max_vm_pa_size = 0;
> +    }
> +    vmfd = ioctl(kvmfd, KVM_CREATE_VM, max_vm_pa_size);
>      if (vmfd < 0) {
>          goto err;
>      }


