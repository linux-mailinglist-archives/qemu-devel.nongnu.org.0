Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0166D6FDD
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 00:06:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjolw-0005h9-Q0; Tue, 04 Apr 2023 18:05:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pjolu-0005gu-6U
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 18:04:58 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pjols-0002Am-Hh
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 18:04:57 -0400
Received: by mail-wr1-x430.google.com with SMTP id i9so34309324wrp.3
 for <qemu-devel@nongnu.org>; Tue, 04 Apr 2023 15:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680645894;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=A9T8/ra4xy7i6hbdz4aP2jOC3Yt8BpLlT3EI5I7degA=;
 b=qCii2SpVjTU5iUPUEjj6BzsyHm4i2+EPWRdFvu+Eq2Z4sZ9/04zmBBWCwBYUPKaI8a
 +5Hwj0aFfwrxwlVk8Z12G5rtYPFXEC1H0A1B9DWed+cBNuSNohEY1SXuj76PbhJ9KsIC
 Anr0ft+sDPBV7eGop+apPU4mDN0oFOGommYzJittPvTSWzmrCH2C2n0AR2htnYqwmSHg
 X9bPjNwnGsyMfhF3qAtZagu59MX2YAORgusBS7L91XFri1M98BYTkDWE2RE7fDVIx2rO
 RKNy4UupnaKomUfvC7LmecwFIOua+waHEJ6jxnqm7E1jMC3hyQ78EUteQKudFBuj+bCw
 1+bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680645894;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=A9T8/ra4xy7i6hbdz4aP2jOC3Yt8BpLlT3EI5I7degA=;
 b=f3QEtoQMMcSTiXYv5wrCfvlYf6EeqWOoLjnBmAhSduiEU3t8MWK0GlMn03Qhd+AoOE
 C2SpFsPb+9YzozpEWHe/dGpTr9u3BBwmnumyga7USDb4UmYk9uul78r6D/mFgM8LRe2w
 tqrask+k5axWJf0N7TTCLyk5bQ+LF3bTvnTAu9zmADODFP0OTyHArCGnsl8Dg3M7a+aa
 3m3tnT7BKS627zLCwkJ06HWQ2NPAVcSdhfBsV3kWtNqtPWvhKhwg7I9cYqW3dIacI60Y
 Z+Iv6nJyRmnp4gaSSMKtcl+gND7ggjfh8CBZevrv5IE5qZryeT6DA+lkBNwQ7i4PnSSi
 mc6g==
X-Gm-Message-State: AAQBX9fVHT5iJe/xMRAWKxoq6U2X/mx8yQjLoSLceFtLSc10CA0XjCST
 I72gJWrukEqJ4pXFkOloMej/s/t+0SIAS0dh8ls=
X-Google-Smtp-Source: AKy350aoD5mcSbxNbyiTLHq4flkCNBc0jfbfd2lUX1iHk5iTi3LeJgNenPmubVSrgNZ1MGp9DxneVQ==
X-Received: by 2002:adf:efc2:0:b0:2e4:e508:4a8f with SMTP id
 i2-20020adfefc2000000b002e4e5084a8fmr2767438wrp.46.1680645894570; 
 Tue, 04 Apr 2023 15:04:54 -0700 (PDT)
Received: from [192.168.1.101] (4ab54-h01-176-184-52-81.dsl.sta.abo.bbox.fr.
 [176.184.52.81]) by smtp.gmail.com with ESMTPSA id
 j4-20020a5d5644000000b002d9568395f8sm13291098wrw.36.2023.04.04.15.04.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Apr 2023 15:04:54 -0700 (PDT)
Message-ID: <6c84a18e-beff-36e6-1b0b-f8c419197bd2@linaro.org>
Date: Wed, 5 Apr 2023 00:04:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [PATCH] Revert "memory: Optimize replay of guest mapping"
To: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Peter Xu <peterx@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, David Hildenbrand <david@redhat.com>
References: <917c1c552b2d1b732f9a86c6a90684c3a5e4cada.1680640587.git.mst@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <917c1c552b2d1b732f9a86c6a90684c3a5e4cada.1680640587.git.mst@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.925,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 4/4/23 22:37, Michael S. Tsirkin wrote:
> From: Peter Maydell <peter.maydell@linaro.org>
> 
> This reverts commit 6da24341866fa940fd7d575788a2319514941c77
> ("memory: Optimize replay of guest mapping").
> 
> This change breaks the mps3-an547 board under TCG (and
> probably other TCG boards using an IOMMU), which now
> assert:
> 
> $ ./build/x86/qemu-system-arm --machine mps3-an547 -serial stdio
> -kernel /tmp/an547-mwe/build/test.elf
> qemu-system-arm: ../../softmmu/memory.c:1903:
> memory_region_register_iommu_notifier: Assertion `n->end <=
> memory_region_size(mr)' failed.
> 
> This is because tcg_register_iommu_notifier() registers
> an IOMMU notifier which covers the entire address space,
> so the assertion added in this commit is not correct.
> 
> For the 8.0 release, just revert this commit as it is
> only an optimization.
> 
> Fixes: 6da24341866f ("memory: Optimize replay of guest mapping")
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
> 
> completely untested but Pater asked help in sending this.
> 
>   hw/i386/intel_iommu.c | 2 +-
>   softmmu/memory.c      | 4 ++--
>   2 files changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


