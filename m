Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 439106F42C8
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 13:27:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptoAF-0002Dv-No; Tue, 02 May 2023 07:27:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptoAC-0002DR-9q
 for qemu-devel@nongnu.org; Tue, 02 May 2023 07:27:20 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptoAA-0005up-Fm
 for qemu-devel@nongnu.org; Tue, 02 May 2023 07:27:19 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3f19a7f9424so35864805e9.2
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 04:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683026836; x=1685618836;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NsayxzKy/RyIeoLNcn+o6YxMBMjitP1LJXdDm+9c9zw=;
 b=IfF/O6zC0uKOOhaxZevx28cGQ0t5F3nb6tfELvDEuAv4Ho+uJW/SKpo8GRT5kp2ipU
 xjEYoo6oe+XYSY9fjo7ZGztVtu1sAhXQttJHeDubVmCXEdx/U9Fvf5o0+yCXCsVBE0Bl
 YZpTpYVIivQUBbB4viIJQ3/1oxMa3PJ6k+pTVMrKjjmCUf3DbHcPI3HcbIOTKg72A9RG
 vqh50Tu2Ei/T/Ipa3d2VzCxXZ1TPsYmnMuTvhdkl6a1O6QbAADNkNVharORgEnmSMrga
 5rSn4VaykotpVQRotHcG03hXyVEIy2SoGKG+bWeDIlrkzM266PxkQ8osacdc60fzTyep
 EE+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683026836; x=1685618836;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NsayxzKy/RyIeoLNcn+o6YxMBMjitP1LJXdDm+9c9zw=;
 b=SnbcNOvFjdhWj4B+l25OoX1Ke8D6fsMcZ/an0e7fnie6etOwdjX4IsNzvK4f3pSGsj
 teMz0gA95mD5yEDQKxC7pVrw6Lf8aAlbvq8YzixGYwtTsNb31ua7vaCBNEeBQmECcBUm
 1HPNmvLBz5ZKEu/SJDG1FFRL8MTq4Ew+KjMP/6rcW33z7bUOKnTTsCHYS84Znu1v1fc0
 JvP+xywziZguqFn+iSj8tLgznQJaEJ7StmVCLLR/R4XHj3xFP0sCZ/Skp3D/CyNmv3KA
 5YIAafRFkv1rBavxXR1UoXM6XDIoQ3gTz92nK1a5l9Iiep3UxewguqdZS69YhwNyy/JH
 uTTg==
X-Gm-Message-State: AC+VfDyKJnUWtVn1dIcpBZwKlaVQy1JL17p4IuergPKoE0zIIKoKz5qB
 vyNrbO7yU6ZuW9oIu2MI2ArE+w==
X-Google-Smtp-Source: ACHHUZ7or5DBLdeIYckUdS/BPaSulrcDTUNlqpkHUvD1wvclCb/16UHB4oXbJqxmoGkAqXINNge4uQ==
X-Received: by 2002:a7b:c7d4:0:b0:3f1:6fb3:ffcc with SMTP id
 z20-20020a7bc7d4000000b003f16fb3ffccmr12628005wmk.22.1683026835891; 
 Tue, 02 May 2023 04:27:15 -0700 (PDT)
Received: from ?IPV6:2a02:c7c:74db:8d00:ad29:f02c:48a2:269c?
 ([2a02:c7c:74db:8d00:ad29:f02c:48a2:269c])
 by smtp.gmail.com with ESMTPSA id
 n17-20020a5d4c51000000b002d6f285c0a2sm30741205wrt.42.2023.05.02.04.27.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 May 2023 04:27:15 -0700 (PDT)
Message-ID: <7d71b26f-3c5d-1588-6cb2-f6043b03b0bf@linaro.org>
Date: Tue, 2 May 2023 12:27:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH RFC v2 5/9] target/loongarch: Implement kvm_arch_init
 function
Content-Language: en-US
To: Tianrui Zhao <zhaotianrui@loongson.cn>, qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 gaosong@loongson.cn, "Michael S . Tsirkin" <mst@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, maobibo@loongson.cn, philmd@linaro.org,
 peter.maydell@linaro.org
References: <20230427072645.3368102-1-zhaotianrui@loongson.cn>
 <20230427072645.3368102-6-zhaotianrui@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230427072645.3368102-6-zhaotianrui@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32e.google.com
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
> Implement the kvm_arch_init of loongarch, in the function, the
> KVM_CAP_MP_STATE cap is checked by kvm ioctl.
> 
> Signed-off-by: Tianrui Zhao<zhaotianrui@loongson.cn>
> ---
>   target/loongarch/kvm.c | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

