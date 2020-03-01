Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C52174ECA
	for <lists+qemu-devel@lfdr.de>; Sun,  1 Mar 2020 18:51:16 +0100 (CET)
Received: from localhost ([::1]:50620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j8SkF-0004gS-JR
	for lists+qemu-devel@lfdr.de; Sun, 01 Mar 2020 12:51:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33483)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j8SjH-0003g8-1R
 for qemu-devel@nongnu.org; Sun, 01 Mar 2020 12:50:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j8SjG-00008n-1j
 for qemu-devel@nongnu.org; Sun, 01 Mar 2020 12:50:14 -0500
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:34995)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j8SjF-00007y-RL
 for qemu-devel@nongnu.org; Sun, 01 Mar 2020 12:50:13 -0500
Received: by mail-pf1-x443.google.com with SMTP id i19so4387103pfa.2
 for <qemu-devel@nongnu.org>; Sun, 01 Mar 2020 09:50:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dfxdb7fsCcoZicRbs+z58/8kgpx9oS1+5EKK4VU5s6Q=;
 b=gQLOJgmi3zd/CWRo89RHpidJy/4RAPYMFlLdnV547lLJhHbVm2m6VBq/xkcDcWQfZh
 TWvRkblo8Q9hiXwhB/k5Ej3tGqeNVcFdmeh3psN4+zHMppbZOHstdgiD1+uHYQuu6Qda
 Wj5xKpXmrMskvSi1FL/5ByTVLV5LrhGpht9w1FS4IP89Z7PxHiXyrwi5HHJqlc4MT2O5
 6weMkq4IMNrCzufFTqEiuXjty1P0EpGTp9uop+IV1yzJ2tSa6sy+56KWe2GnsaLDEoNA
 aQ79abM9S4N12SHdKiCJB8D00XXz7EtjoRamCyGIcps8jy8UwikF7v9glxAxSl1bGsvD
 i+AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dfxdb7fsCcoZicRbs+z58/8kgpx9oS1+5EKK4VU5s6Q=;
 b=ZIlSLE1ZYG1YWl4CjU1FuPq6HeWFTdSf3SCeaDr/EJcFgoH+Yk2QtAhgZX6fQBMIzg
 yNdvwELlRV+c86vR6mpvzB5zfpqALlA52zjWCo2PAVbZsPItAiS4TprA1KT06cmjoIxC
 XfDTLIsNLBVzQc4gFIDFKdETEehEZ1tGchJ7WdlyI5o60WuYrcbRMzh84+X00HtboR3z
 D+nytnAoLYdlFsN9RmHiAprQ/+DuSbSRUnxr23+ej53/y3clWHHJYDFfnSSmEfmDWzjv
 sqpDivfG0UEr+BJEc5YZ4UkZVmxWKLXwKZnC1i4onMftc/XP+0ik45o9kx5eiNLVsaXm
 r3yg==
X-Gm-Message-State: APjAAAXzxOwK+tMcrqFu9swu5OKXZwrbXiSxS3UHM4whRtU9Z7qmTgk4
 gHmGAa2OVUjMALrbEy01jQ/+Lg==
X-Google-Smtp-Source: APXvYqx/gsS/XgD0/Ov+teqjMO//NJhilJiBg9EPMWXrcZq5KLpnPZeeIwew6xiuzkhGg+huRhLbiw==
X-Received: by 2002:a62:4d87:: with SMTP id
 a129mr14189456pfb.116.1583085012733; 
 Sun, 01 Mar 2020 09:50:12 -0800 (PST)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 191sm10370082pfa.142.2020.03.01.09.50.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 01 Mar 2020 09:50:12 -0800 (PST)
Subject: Re: [PATCH v2 4/6] target/arm/kvm: Let kvm_arm_vgic_probe() return a
 bitmap
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org
References: <20200301104040.15186-1-eric.auger@redhat.com>
 <20200301104040.15186-5-eric.auger@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <21e0115d-59b5-6923-cb7c-3d84632d9d57@linaro.org>
Date: Sun, 1 Mar 2020 09:50:10 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200301104040.15186-5-eric.auger@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::443
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
Cc: maz@kernel.org, drjones@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/1/20 2:40 AM, Eric Auger wrote:
> Convert kvm_arm_vgic_probe() so that it returns a
> bitmap of supported in-kernel emulation VGIC versions instead
> of the max version: at the moment values can be v2 and v3.
> This allows to expose the case where the host GICv3 also
> supports GICv2 emulation. This will be useful to choose the
> default version in KVM accelerated mode.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  hw/arm/virt.c        | 11 +++++++++--
>  target/arm/kvm.c     | 14 ++++++++------
>  target/arm/kvm_arm.h |  3 +++
>  3 files changed, 20 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


