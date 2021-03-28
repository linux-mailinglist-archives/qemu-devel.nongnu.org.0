Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CAC234BD34
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Mar 2021 18:14:44 +0200 (CEST)
Received: from localhost ([::1]:47120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQY3n-0002kI-BA
	for lists+qemu-devel@lfdr.de; Sun, 28 Mar 2021 12:14:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQY2H-0002Ht-UT
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 12:13:09 -0400
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c]:41584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQY2B-0001Oy-Hl
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 12:13:09 -0400
Received: by mail-ot1-x32c.google.com with SMTP id
 l12-20020a9d6a8c0000b0290238e0f9f0d8so9982894otq.8
 for <qemu-devel@nongnu.org>; Sun, 28 Mar 2021 09:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=n4aLhtrm3QsoXCwq3mTd7SrCdp0BFO6qpBS5z0Ex4/U=;
 b=BvYXai4aArVKsr3kK+LNFbFRa0VsZVF5SPaY5KYZJ0UZCgCtm2g8L+lmrLZcwclhoM
 0rZInyflfE4ldKv6GKFjo7wG8ndYi2UR6oqN8B2H7YRkiT8zuMbRxkgXofbgdIbUi0t4
 5Uv7/SnL+jywqy7gIdjOgQpDduVV8ivmAEm75ZKTqPEMj+MHJJzJ2hP9+R7Bx670vNPk
 c+XtwGjXfTq6ALtRUCq2nPxj7O+srTLfy9NuTG5Ws2bfAyqoZ/wgBYNEJqBAKc6YIQEd
 13ui9KC+ZWQ4/9pDLWryBHuKe/wTbvllTPvc72/Allqhz3R7xmXYaavb6QJwYNo00XSV
 IqHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=n4aLhtrm3QsoXCwq3mTd7SrCdp0BFO6qpBS5z0Ex4/U=;
 b=f8V10cw6hXMBov4U/R698DHpFFwuHzSVWRWZrE7b+iGuWuNQBDrXxuKbSmGmdIL+Es
 9zphgTARFNydWtwxjSwIXWsvzKlBJrveYUF0xDdj0FH+ogb6FHUR3Ty5EzhqthKM76vC
 TMP5z9yb5RUNhweH7GUCnoUlsWxxB5ochp21r6UpBSuU7lHaMYweRoVA+ZShmhwd+Zj4
 tcJ4mf66x1nlaTESd9CNO9pfpXlS5LjF6M0LwTVJOVQ2Ck32XJyw6Lyfglqr9bhfi/1m
 xsjR22/DUD6/B0J98Q2XJaQafs6IywzRhM4JyyCn2ojybUCdaG25GvHb6R8U4EYnRjp+
 hpaQ==
X-Gm-Message-State: AOAM531rralLuFEaY7qCoXC45wTVTTXycYf0Jg1VOQuXCwEajbAyI3HR
 VvSjU0FdkXKSK/U+b0ktWPeXKw==
X-Google-Smtp-Source: ABdhPJxMRRrC+x/bQZosBei09kyA0/qxBo0+d0VsRGfv2SabMvFV3etpHnTVT2OdHDPoLPthVykYFw==
X-Received: by 2002:a05:6830:1e45:: with SMTP id
 e5mr18784895otj.40.1616947982218; 
 Sun, 28 Mar 2021 09:13:02 -0700 (PDT)
Received: from [192.168.211.34] (171.189-204-159.bestelclientes.com.mx.
 [189.204.159.171])
 by smtp.gmail.com with ESMTPSA id v1sm3733167otk.67.2021.03.28.09.13.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Mar 2021 09:13:01 -0700 (PDT)
Subject: Re: [RFC v12 24/65] target/arm: move arm_sctlr away from tcg helpers
To: Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210326193701.5981-1-cfontana@suse.de>
 <20210326193701.5981-25-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1ce5eecf-af32-208d-b10f-be7dbb097023@linaro.org>
Date: Sun, 28 Mar 2021 10:12:58 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210326193701.5981-25-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/26/21 1:36 PM, Claudio Fontana wrote:
> this function is used for kvm too, add it to the
> cpu-common module.
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> ---
>   target/arm/cpu-common.c | 15 +++++++++++++++
>   target/arm/tcg/helper.c | 11 -----------
>   2 files changed, 15 insertions(+), 11 deletions(-)
> 
> diff --git a/target/arm/cpu-common.c b/target/arm/cpu-common.c
> index a34f7f19d8..892e075298 100644
> --- a/target/arm/cpu-common.c
> +++ b/target/arm/cpu-common.c
> @@ -342,3 +342,18 @@ uint32_t sve_zcr_len_for_el(CPUARMState *env, int el)
>   }
>   
>   /* #endif TARGET_AARCH64 , see matching comment above */
> +
> +uint64_t arm_sctlr(CPUARMState *env, int el)
> +{
> +    /* Only EL0 needs to be adjusted for EL1&0 or EL2&0. */
> +    if (el == 0) {
> +#ifdef TARGET_AARCH64
> +        ARMMMUIdx mmu_idx = arm_mmu_idx_el(env, 0);
> +        el = (mmu_idx == ARMMMUIdx_E20_0 || mmu_idx == ARMMMUIdx_SE20_0)
> +            ? 2 : 1;
> +#else
> +        el = 1;
> +#endif /* TARGET_AARCH64 */
> +    }

My comment was merely an observation; I'm not sure it's a good idea.  And you 
should never make this functional change while moving code.


r~

