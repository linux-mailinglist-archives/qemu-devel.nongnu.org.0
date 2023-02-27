Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E596A4AD7
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 20:28:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWj9b-0003Uf-MJ; Mon, 27 Feb 2023 14:27:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWj9Z-0003Tr-Ij
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 14:27:17 -0500
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWj9X-0002Vb-MG
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 14:27:17 -0500
Received: by mail-pj1-x1044.google.com with SMTP id
 6-20020a17090a190600b00237c5b6ecd7so6704631pjg.4
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 11:27:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kqYO+7y/VtfWRw+KQ3HbANz+57CkpBoY1Ad7grkR4Ck=;
 b=kuKdL5HKqoFCpU05aMO4lWPIbeLrh5la56Vbr5iA4hkcagWEfsAmG+SuX+rdAZVWu0
 EBvDLlS+2g5CQTm6QPs7y6u6nqYg5J9l/r8Cc+Dg+JRwBGf0A8XFFfRxbe79D15ECEJb
 CM7E1IxSJp1HGIoeYmPOj2SVbAsyEvK1A27hCR7AaWG1QfrhADTcK99XHTOjVjEOxt5k
 kUC75GZJlM1uqstlf95fQB8pVrS6oW4FgQtx9QNxNbxGCyiYKWysJoMoig0l8O9hShKC
 qCTQ2aycDdRT5yYnml1nDy8q0ljL5ddrspk70pkAeTebr5KlgPTiBDtMzpDW7fk/uwd/
 Vgdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kqYO+7y/VtfWRw+KQ3HbANz+57CkpBoY1Ad7grkR4Ck=;
 b=A3e3Ro6NqbYVcD6ydnW+3E0IIEivoQ0jg+v1v+sK+IThhcskJA11GrZvueFzNgF/31
 ERxGheOOZmYpL+bGYuLWKDr4d/+n3LkyXI7P3BVdL+qJR7p43te0cM4qoXg1PCWCde1d
 rGvKRPYXP+4aHUtDD/4XoK4awYmV+lJTxzzYbPMqJzcGo6lk6Exu/k9FSjvQMSS5L3vl
 hwnMOAz40Lsspe0QO8ncMNH+fOytj8jVG9ss63wMLOSeQPo8ypMZL69ZtxFWSYF5TZGr
 QBsT1o1N6/Bu/QwHMKRMnmw66a3Gaw3vs4VmIMbFM8xQohvU4umvRyghiQxxeCInRZMY
 GGYA==
X-Gm-Message-State: AO0yUKU+z5wT3RPYG9iWxewqJa1jroRN2uFsDNtzpXuoYcV1sUp7VeYO
 aXazTMNRgCQP6e7v68hOMG0k7w==
X-Google-Smtp-Source: AK7set8AXQygbIhe/NkGG+jKyBEWbv+FGNQeV6cGg7IxYbSbl04ifSQsCyrCoXhrGWcuLRUXXTS24g==
X-Received: by 2002:a17:902:e5c9:b0:19e:2d25:897e with SMTP id
 u9-20020a170902e5c900b0019e2d25897emr70177plf.13.1677526034243; 
 Mon, 27 Feb 2023 11:27:14 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 c4-20020a170902d90400b00196807b5189sm4960277plz.292.2023.02.27.11.27.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Feb 2023 11:27:13 -0800 (PST)
Message-ID: <787401ce-475c-9fe4-8712-abf8347ef500@linaro.org>
Date: Mon, 27 Feb 2023 09:27:10 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC PATCH 3/5] target/arm/kvm: add helper to detect EL2 when
 using KVM
Content-Language: en-US
To: Miguel Luis <miguel.luis@oracle.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Haibo Xu <haibo.xu@linaro.org>,
 Andrew Jones <drjones@redhat.com>, Marc Zyngier <maz@kernel.org>
References: <20230227163718.62003-1-miguel.luis@oracle.com>
 <20230227163718.62003-4-miguel.luis@oracle.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230227163718.62003-4-miguel.luis@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1044;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1044.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 2/27/23 06:37, Miguel Luis wrote:
> From: Haibo Xu<haibo.xu@linaro.org>
> 
> Introduce query support for KVM_CAP_ARM_EL2.
> 
> Ref:https://lore.kernel.org/qemu-devel/65b8771bfecada08bf02c9cf87c2f0f9cdf943b3.1617281290.git.haibo.xu@linaro.org/
> 
> Signed-off-by: Haibo Xu<haibo.xu@linaro.org>
> Signed-off-by: Miguel Luis<miguel.luis@oracle.com>
> ---
>   target/arm/kvm64.c   |  5 +++++
>   target/arm/kvm_arm.h | 12 ++++++++++++
>   2 files changed, 17 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

