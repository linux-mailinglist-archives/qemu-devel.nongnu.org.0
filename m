Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A566EB15A
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 20:08:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppv9u-0001pV-Lb; Fri, 21 Apr 2023 14:06:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppv9t-0001pF-4g
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 14:06:57 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppv9r-0006OF-Ej
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 14:06:56 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-2efbaad9d76so1907547f8f.0
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 11:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682100414; x=1684692414;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PMv4D0VJfTywI9Nd8ABZBx3lwI6qG06/eyj45xd2sqs=;
 b=zu+5UE2S9nJbllUoQdkYK303rkUANml/z3PH+h1CjhT1X0xKDBu2mNkZ07UEHNLR+F
 a1YQzIXw743wlwgMqlmspWXoaubAVcqiPKCj624k3uTSFf7dlNh91tEw8QnVopVhuRrn
 chsOGzX6RPC6a7EoP44sxi3S188G6b9bRlQn8NSobcxJMuuTIY5LfMzjk2JhERREDXgH
 1YdGvmr2A/fHJCB7whq537b9BnNH7hPC1TzuIzDYHFbNDO5P0ZWI4dqBUu4hEPhdb4q/
 670+hlXaYoN3uzew62c39spr2ohNmCGXasIHEVmGQYoxK09IvFOkjQKwkW/wvtkoPvWY
 7T4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682100414; x=1684692414;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PMv4D0VJfTywI9Nd8ABZBx3lwI6qG06/eyj45xd2sqs=;
 b=hQ78OiVZw3DrwB4Y6rX1gvi5rMN3F5hscSdYpbI8Se55Z2hUltNG5MOjAh6XrR4q51
 UmfUVgPFzDMzX1Nqe2b/QbWtUwXs3CErFTM7HKCpI0pwPUhdaIw70BBim+iZBe8/1TYD
 8PJ21iAl4YxvzSf+M4I8c+5sqiSWQnzN/Ei4ubQEmM2Rku0a3D06vuyAraFJ4+PKVFo5
 DZmyrtIOJsLlBgX7+IXHgP0Bvn4PlM/Ewgiqp8KLhN+KQ4i3apzG7RlyGyMfwQQ3Jmvn
 aNO/gcD48zQBWWJ1WG2vRsvA/XYSbTpB8Ig02ZVSk9b/I7ggiAMNQVB53/nSftzHd35e
 zDIA==
X-Gm-Message-State: AAQBX9dGjhd2FRrqoMf6Af/+D1JmOEjmuCwwGgd/vMBX1FAKIufn/LK4
 s8hGxWlLNenRHNXpyCgLdrhpgA==
X-Google-Smtp-Source: AKy350Y/y+WHoOy+iIAu1YA/9gE0ANdp4Vte3e6po4qt60teMIONC7wQXu0BiiNccxCq3YDdkKm30A==
X-Received: by 2002:adf:f58d:0:b0:2fb:db79:748e with SMTP id
 f13-20020adff58d000000b002fbdb79748emr4793262wro.65.1682100413815; 
 Fri, 21 Apr 2023 11:06:53 -0700 (PDT)
Received: from [192.168.69.115] (min31-h02-176-184-28-119.dsl.sta.abo.bbox.fr.
 [176.184.28.119]) by smtp.gmail.com with ESMTPSA id
 s3-20020a5d6a83000000b002fe13ec49fasm4846938wru.98.2023.04.21.11.06.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Apr 2023 11:06:53 -0700 (PDT)
Message-ID: <3175956a-ab3c-7259-1b28-6fe54043238f@linaro.org>
Date: Fri, 21 Apr 2023 20:06:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v10 06/11] target/arm: move cpu_tcg to tcg/cpu32.c
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
References: <20230412121829.14452-1-farosas@suse.de>
 <20230412121829.14452-7-farosas@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230412121829.14452-7-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.297,
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

On 12/4/23 14:18, Fabiano Rosas wrote:
> From: Claudio Fontana <cfontana@suse.de>
> 
> move the module containing cpu models definitions
> for 32bit TCG-only CPUs to tcg/ and rename it for clarity.
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Acked-by: Thomas Huth <thuth@redhat.com>
> ---
>   hw/arm/virt.c                         |  2 +-
>   target/arm/meson.build                |  1 -
>   target/arm/{cpu_tcg.c => tcg/cpu32.c} | 13 +++----------
>   target/arm/tcg/cpu64.c                |  2 +-
>   target/arm/tcg/meson.build            |  1 +
>   tests/qtest/arm-cpu-features.c        | 12 +++++++++---
>   6 files changed, 15 insertions(+), 16 deletions(-)
>   rename target/arm/{cpu_tcg.c => tcg/cpu32.c} (99%)


> diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
> index 1cb08138ad..1555b0bab8 100644
> --- a/tests/qtest/arm-cpu-features.c
> +++ b/tests/qtest/arm-cpu-features.c
> @@ -506,9 +506,15 @@ static void test_query_cpu_model_expansion_kvm(const void *data)
>           QDict *resp;
>           char *error;
>   
> -        assert_error(qts, "cortex-a15",
> -            "We cannot guarantee the CPU type 'cortex-a15' works "
> -            "with KVM on this host", NULL);
> +        if (qtest_has_accel("tcg")) {

Can we add a comment to explain this non trivial case?

I suppose the reason is "KVM is builtin but not available, so we don't
want to test the TCG fallback", is that correct?

> +            assert_error(qts, "cortex-a15",
> +                         "We cannot guarantee the CPU type 'cortex-a15' works "
> +                         "with KVM on this host", NULL);
> +        } else {
> +            assert_error(qts, "cortex-a15",
> +                         "The CPU type 'cortex-a15' is not a "
> +                         "recognized ARM CPU type", NULL);
> +        }
>   
>           assert_has_feature_enabled(qts, "host", "aarch64");
>   


