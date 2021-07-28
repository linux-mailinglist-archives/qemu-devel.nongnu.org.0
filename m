Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C297F3D9340
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Jul 2021 18:32:13 +0200 (CEST)
Received: from localhost ([::1]:50914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8mTc-0006bi-BK
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 12:32:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m8mRt-0005Qr-3r
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 12:30:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m8mRp-0000HJ-Im
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 12:30:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627489819;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9c3i7aGabrpPcxV4MJGT0Imf70coSKMLng5EsbAdYU8=;
 b=WRsLHTybBll3/hludx6GlLrHM1QGvqD41XNFRXRfJbkbsX/+eSf7tFUc/Q7cG3diLWlgln
 AFr0Rs1De8RFWj/Do8kpDIFtoOFQIae0YBPYwckYQTX8dRBSpxdeMCrHM5/WnJq6IKe4xj
 umDiUuFuc+S9z7Qb6xMW4Sqz7PZmv/Q=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-439-XFWy2yNXPCq1gzGKS3q0iA-1; Wed, 28 Jul 2021 12:30:18 -0400
X-MC-Unique: XFWy2yNXPCq1gzGKS3q0iA-1
Received: by mail-wr1-f70.google.com with SMTP id
 p2-20020a5d48c20000b0290150e4a5e7e0so1130386wrs.13
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 09:30:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9c3i7aGabrpPcxV4MJGT0Imf70coSKMLng5EsbAdYU8=;
 b=uKBBySE7neBuPMZ9GIeJZAfiNGsXvbGgIAeImz4gv6BjrYzWBfdbuXl44wlJrPunB9
 gCdmop6o+ZkAl8ktera3esPeYBvYxK0BHOb9sncmHFRdXFPRAt/9N9ZYS8N4KH81GuST
 IYb57IgoHoALp+h+eEfyopUu1ox5qB5bxhe4waPOU3stNC8IMAYps71QifO2XOqHixSd
 HK0+Hkmq+JWNGZe4NQtg7yKvxIQmreGKN/gROs1JbdoRVQD/mXDSxM2yHAfUh7rpQVp5
 OIMFoBG+/sD5a1Jiv8NE1KX7Czbmpn+koC12FvKSUccuDoxuW0WzL4UzMF+LMnfUfGOf
 KJ2w==
X-Gm-Message-State: AOAM530uHbsJOzwMI5wR8Z68fVLBiHSSJaspdFYJEx7x0EEn0YmcWY9l
 QziLuT4n82elaZVJTy+QRIQFGey2v1fqZnIiDaTTXQSWIfsgf4JhJgX0nt+N4j6upD72rvEjp1c
 4LWZmDeRM69zN1StGfMGQqQ4LhV8aomW5vXsflqlntkPBvPRS23ytzCgrc95ik4CZ1i8=
X-Received: by 2002:adf:f74f:: with SMTP id z15mr283823wrp.54.1627489816422;
 Wed, 28 Jul 2021 09:30:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwtJICEzibhQamErFhZlE5hAp+yVk4VODKKC9Stc3edQY/Xxz5vDTINQoF1PoWNgtGZsN5F8w==
X-Received: by 2002:adf:f74f:: with SMTP id z15mr283794wrp.54.1627489816140;
 Wed, 28 Jul 2021 09:30:16 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id t1sm485952wma.28.2021.07.28.09.30.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Jul 2021 09:30:15 -0700 (PDT)
Subject: Re: [PATCH 6/7] virtio-gpu: Initialize Venus
To: Antonio Caggiano <antonio.caggiano@collabora.com>, qemu-devel@nongnu.org
References: <20210727170510.2116383-1-antonio.caggiano@collabora.com>
 <20210727170510.2116383-7-antonio.caggiano@collabora.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <2b22835b-3558-c7f1-e81d-c623c43f882c@redhat.com>
Date: Wed, 28 Jul 2021 18:30:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210727170510.2116383-7-antonio.caggiano@collabora.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.277, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 27/07/21 19:05, Antonio Caggiano wrote:
> diff --git a/meson.build b/meson.build
> index f2e148eaf9..31b65050b7 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -483,6 +483,7 @@ if not get_option('virglrenderer').auto() or have_system
>                        method: 'pkg-config',
>                        required: get_option('virglrenderer'),
>                        kwargs: static_kwargs)
> +  add_project_arguments('-DVIRGL_RENDERER_UNSTABLE_APIS', language : 'c')

Can you instead use declare_dependency to make the option part of the 
virgl dependency?

Thanks,

Paolo


