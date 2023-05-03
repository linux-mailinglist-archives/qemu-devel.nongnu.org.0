Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E536F500F
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 08:24:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu5uq-0001e3-OB; Wed, 03 May 2023 02:24:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu5um-0001dU-TJ
 for qemu-devel@nongnu.org; Wed, 03 May 2023 02:24:38 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu5uk-0005jE-Ux
 for qemu-devel@nongnu.org; Wed, 03 May 2023 02:24:36 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-2fc3f1d6f8cso2854809f8f.3
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 23:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683095073; x=1685687073;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YfFildxBMpyq5zcylzz//tcc/bmJbaXiOpvSUc58CgA=;
 b=mqL5LZH+CuMQeIuK0FoCjG+y+qmXd+h2sXBjoPTPrFant/sy+vjN+/IA/zyM3McZq2
 v/3VCrpNCxcSztl5SPp7KWJ24ob7O226stsps57p5IHr6c/Dp45VPQiNcILyBBcIu6V1
 ANdANKDii0lqOJigjFbWb9arNSTUC4rFCLdKDgCGses8wAiHLd5kLLPfLNYvHb4AupQO
 cCIapGItCUW1o+zI7NaXnY15vIijlzx7Et+39tdzaiAfH3BeE/CxRbWU3NcnPe8fesMX
 gNS/e7pT/QRLpMDLH9z7AXyqvWwn7rlWiT29+Ioh8aZxbUARqqFks/0+klyhzDXTQGWQ
 o9QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683095073; x=1685687073;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YfFildxBMpyq5zcylzz//tcc/bmJbaXiOpvSUc58CgA=;
 b=GrNmjdF35lkBDb4R8Vp2Y5rYXp4cUF2ApPmxmFqaRGbelHMJEa4IeraWnWeWZLifrn
 yIrwssGNfeQhaE2MmFZGP7DZ2I3FMNER661kKkKP4tDxd3dOOFvDwdNo6//olpx2OSao
 MsyQIIQHGMSVGj+/0hLb3Sf3gSndJ65u0yGytc3DpKj456HR0jq9yZylk1+Up3nGVg1W
 UXK5fLpGMUETDOfxs5eL78TTAnAOGeNzJ1DBTThgbKCM7HXxv2BvUTsUHQmUhjWyUvD9
 EgqTfXHmVq7Te7hSIP7oHeY6IxLsym/8UEPJhn18OeR9o7AdHjuuy2rXApRD+1GQEzuB
 e6xg==
X-Gm-Message-State: AC+VfDzkk+KUtVTMPPGobHtkLfPCUZZSMbOaxVf2ah860Hs/9xQOcZLT
 TWvASL3EPE6vQjOlhfSQCXWEMw==
X-Google-Smtp-Source: ACHHUZ7hNRvG41CVHftzmhl0RAqNI7tpiFjPTlCngAl4duPbpNo6fvH65JwNaPEia6A5DSbrZ7ciXg==
X-Received: by 2002:adf:f68c:0:b0:2f5:6430:35c with SMTP id
 v12-20020adff68c000000b002f56430035cmr13449366wrp.26.1683095073446; 
 Tue, 02 May 2023 23:24:33 -0700 (PDT)
Received: from ?IPV6:2a02:c7c:74db:8d00:c01d:9d74:b630:9087?
 ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 x9-20020a5d60c9000000b002fbdb797483sm32476315wrt.49.2023.05.02.23.24.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 May 2023 23:24:33 -0700 (PDT)
Message-ID: <f0195c0a-af05-a78e-6158-635804be82c1@linaro.org>
Date: Wed, 3 May 2023 07:24:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH RFC v2 9/9] target/loongarch: Add loongarch kvm into meson
 build
Content-Language: en-US
To: Tianrui Zhao <zhaotianrui@loongson.cn>, qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 gaosong@loongson.cn, "Michael S . Tsirkin" <mst@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, maobibo@loongson.cn, philmd@linaro.org,
 peter.maydell@linaro.org
References: <20230427072645.3368102-1-zhaotianrui@loongson.cn>
 <20230427072645.3368102-10-zhaotianrui@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230427072645.3368102-10-zhaotianrui@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42f.google.com
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
> Add kvm.c and kvm-stub.c into meson.build to compile
> it when kvm is configed. Meanwhile in meson.build,
> we set the kvm_targets to loongarch64-softmmu when
> the cpu is loongarch.
> 
> Signed-off-by: Tianrui Zhao<zhaotianrui@loongson.cn>
> ---
>   meson.build                  | 2 ++
>   target/loongarch/meson.build | 1 +
>   2 files changed, 3 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

