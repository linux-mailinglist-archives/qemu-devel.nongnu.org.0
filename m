Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F266F423D
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 13:03:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptnmJ-0002In-5e; Tue, 02 May 2023 07:02:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptnlG-0002Ey-Fh
 for qemu-devel@nongnu.org; Tue, 02 May 2023 07:01:50 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptnlC-0002YB-Tx
 for qemu-devel@nongnu.org; Tue, 02 May 2023 07:01:33 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3f09b4a156eso23060055e9.3
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 04:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683025284; x=1685617284;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tDK988EtJlhDmjNL6UBbDMauFcsTOZAKNQmY6wY6/TM=;
 b=qRLo0G62aBnaFbwANKkUx7PHz69353krYSmXX04CHhEnBJTmEVs1dy3LmJgPd5vvyp
 40ITFp5GwqlZirDIMPSMbEcD9/6wuwI+/BfY1tTfyuuiaClNpgWfUdzdVT9xt3jpOLS1
 3cV4uSh9xj70toCTPivDkaVwPd4Y/M/5E2gZnUWims4cUFbbjHeAHCkb4xBasXRdTxBL
 az4KOZIA2LRtVMl+OfwVaMfzjK3e6TKVF2yZ9VQXid/kSy9yXPCNwCid/7L9a+76A2Lk
 1mf+2mnu0JUZdis5zmuJ/5oOjiYMCURwRCi2oBF3X9fnt7lp0gSxnWaeqd/B7rWWIzfJ
 HAmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683025284; x=1685617284;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tDK988EtJlhDmjNL6UBbDMauFcsTOZAKNQmY6wY6/TM=;
 b=Mbk6Ms9IYAwLLkBDoXMSuOIzmUo2F6hxCVEHhP91YFLSJoMreCxMGfMkBB/+XZVvOq
 GOPVGnzYrm+aM+mWg8L19A84JeCR1+BfFk4gWGuFcFbKRBJhgA/dxX8eTV2vgM4kDbeW
 Si7B/hoio8FM0CbSSaD9JHsman0LlBZKtfu12ALKeMQ6IfWCFB1oLDLagpHUgSm/FyEq
 XD/+AEreHsXClxEt7aT6LdsVuwBMmeLn2uUpf34u4bZmygXY8KUjuMoQH0Oxsah6OpfC
 s8W4KUKnRMDxjoO5rUUDJ/afiqnIuPF0uPaTyWkapKSm9erT+LxdgK/kZMOmpnQ9obCR
 WW7w==
X-Gm-Message-State: AC+VfDxFjKsHlq8oSUKwCDwR2C9erL9wMATuFbYbnZtN3Twuxuso9b4s
 NX/qz8DWQrps+9AkMn1BjCedsw==
X-Google-Smtp-Source: ACHHUZ6gesEZPoPVuCPki3ssQZ2gGq8cUlysVxt4PpLE3b4nGS/aNYEqdkSPjL9Wk2HgQcZUTxj2Jg==
X-Received: by 2002:a05:600c:b49:b0:3f1:82d8:8fde with SMTP id
 k9-20020a05600c0b4900b003f182d88fdemr12593915wmr.24.1683025283999; 
 Tue, 02 May 2023 04:01:23 -0700 (PDT)
Received: from ?IPV6:2a02:c7c:74db:8d00:ad29:f02c:48a2:269c?
 ([2a02:c7c:74db:8d00:ad29:f02c:48a2:269c])
 by smtp.gmail.com with ESMTPSA id
 l18-20020a05600c4f1200b003f07ef4e3e0sm49592872wmq.0.2023.05.02.04.01.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 May 2023 04:01:23 -0700 (PDT)
Message-ID: <56514099-ff90-c035-dc8f-5fcd4d153ffc@linaro.org>
Date: Tue, 2 May 2023 12:01:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH RFC v2 2/9] target/loongarch: Define some kvm_arch
 interfaces
Content-Language: en-US
To: Tianrui Zhao <zhaotianrui@loongson.cn>, qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 gaosong@loongson.cn, "Michael S . Tsirkin" <mst@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, maobibo@loongson.cn, philmd@linaro.org,
 peter.maydell@linaro.org
References: <20230427072645.3368102-1-zhaotianrui@loongson.cn>
 <20230427072645.3368102-3-zhaotianrui@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230427072645.3368102-3-zhaotianrui@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x333.google.com
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
> Define some functions in target/loongarch/kvm.c, such as
> kvm_arch_put_registers, kvm_arch_get_registers and
> kvm_arch_handle_exit, etc. which are needed by kvm/kvm-all.c.
> Now the most functions has no content and they will be
> implemented in the next patches.
> 
> Signed-off-by: Tianrui Zhao<zhaotianrui@loongson.cn>
> ---
>   target/loongarch/kvm.c | 126 +++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 126 insertions(+)
>   create mode 100644 target/loongarch/kvm.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

