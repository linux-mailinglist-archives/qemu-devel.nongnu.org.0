Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FDF76F4240
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 13:05:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptno8-0003eJ-Ke; Tue, 02 May 2023 07:04:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptno2-0003d0-QO
 for qemu-devel@nongnu.org; Tue, 02 May 2023 07:04:26 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptno0-0005sm-Vr
 for qemu-devel@nongnu.org; Tue, 02 May 2023 07:04:26 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-306342d7668so782716f8f.1
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 04:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683025459; x=1685617459;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+hjWpb0pMW2nCyTz3f9wKT0AcLqHoErfQAToeTh2JiY=;
 b=NQjRjFoCVoLyU2madL/Ci07RlLjFG6DjPrv3N3HxwGTt7TmwxKIC1ukihGdSg+vk+N
 VO8LQf/D2c9sVU2afhuQgGlCYIBEBTE6sq3s70bLZlJIbuxZGeREn1P1tlX6znfcGUoy
 bQDCCLWXuOJdYHvmZVBUjEIstsV+E0h8/nihqEggeo45z5VJcE5dn/YWfq6EZEteHnhj
 rkncKdw/LEs4gEbQRDd9QgPKz1CM4CAJfV22pze8GaupausnnnaLyMq6Ah9qQPK/Uof9
 i0gADxQhX+yKII+0VNHN/lBnguIv1FKdRls7Lbup+jMadynJXsveIy55G8rqX3sr571T
 whpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683025459; x=1685617459;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+hjWpb0pMW2nCyTz3f9wKT0AcLqHoErfQAToeTh2JiY=;
 b=kiMYpx2Uwt4ot2aJ4aHk300HfY27tBZPfe+NSNeB43217PuJOQtO0M4Knc3MEAGjHx
 cZTmCw4zevk3/fPhRrpf55I7HPlyRLdLX0aImFJyzg8Rdb3YF+uhsVejNwEvdt3fI2O1
 taD4FSBeWrlsC4WQVoQBCV2Cnwz9XbcZowgsYVOmWpNbIvJIQRlXjpfoOirlav21E5Ud
 dsR6k7akF2pkazF17FDSujCmeC8BwiyJRWpiBq97xZwFKfEgjt2hr9SLHpZVoHRLA0X3
 T59ehyHkgMDlcpFyRODgVTvAvDFyEeFTy+1l5yMlMfuZw3imhUXW4d5bf854byfesHJG
 FyDw==
X-Gm-Message-State: AC+VfDwaBdrgqv5jFiWnxYe47I7iXskgy8PFsMcaDlJTBaGGZxOnvq8/
 gn5W6d9rp2BquL3e0R3+8oFZfg==
X-Google-Smtp-Source: ACHHUZ5LhFClrKCQb5kVRCBTX4aoJ4VRCEkJLsUzYo0foTrnW08haSIrJrrYsiBBTg1IcwNy//Qj9A==
X-Received: by 2002:a5d:4a50:0:b0:2fe:c8b5:b5d5 with SMTP id
 v16-20020a5d4a50000000b002fec8b5b5d5mr11280182wrs.2.1683025458915; 
 Tue, 02 May 2023 04:04:18 -0700 (PDT)
Received: from ?IPV6:2a02:c7c:74db:8d00:ad29:f02c:48a2:269c?
 ([2a02:c7c:74db:8d00:ad29:f02c:48a2:269c])
 by smtp.gmail.com with ESMTPSA id
 b5-20020a056000054500b002e5ff05765esm31001750wrf.73.2023.05.02.04.04.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 May 2023 04:04:18 -0700 (PDT)
Message-ID: <cccd2658-26fa-ca9f-68f7-9704eb095c99@linaro.org>
Date: Tue, 2 May 2023 12:04:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH RFC v2 3/9] target/loongarch: Supplement vcpu env initial
 when vcpu reset
Content-Language: en-US
To: Tianrui Zhao <zhaotianrui@loongson.cn>, qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 gaosong@loongson.cn, "Michael S . Tsirkin" <mst@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, maobibo@loongson.cn, philmd@linaro.org,
 peter.maydell@linaro.org
References: <20230427072645.3368102-1-zhaotianrui@loongson.cn>
 <20230427072645.3368102-4-zhaotianrui@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230427072645.3368102-4-zhaotianrui@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 4/27/23 08:26, Tianrui Zhao wrote:
> Supplement vcpu env initial when vcpu reset, including
> init vcpu mp_state value to KVM_MP_STATE_RUNNABLE and
> init vcpu CSR_CPUID,CSR_TID to cpu->cpu_index.
> 
> Signed-off-by: Tianrui Zhao<zhaotianrui@loongson.cn>
> ---
>   target/loongarch/cpu.c | 3 +++
>   target/loongarch/cpu.h | 2 ++
>   2 files changed, 5 insertions(+)

Why do you need KVM_MP_STATE_RUNNABLE in loongarch/cpu.c, outside of kvm.c?
For Arm, we test the architectural power state of the cpu.


r~

