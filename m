Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A8A4E5B6B
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 23:44:17 +0100 (CET)
Received: from localhost ([::1]:43880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX9iB-0001Me-Uy
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 18:44:15 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nX9gE-0000Pd-BG
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 18:42:14 -0400
Received: from [2607:f8b0:4864:20::102c] (port=34093
 helo=mail-pj1-x102c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nX9gC-0001Fk-QU
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 18:42:13 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 o68-20020a17090a0a4a00b001c686a48263so4381621pjo.1
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 15:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=bVY7soqiA3XCeAktGtOltVSnsWK0ipkOhc3Gp8lbCXw=;
 b=HCXj+BCwblaGSuakokQGfF9RI/TV1E1oKcG0pXTRawG6eqa3KSsr9di1HwaoQQCsL5
 NZP3ZBvGO5Kaq6KkB6v5U1oRnKcS91AsC7MdA4JGYaBM7bhH+tFxGlB1ahZQrQtblaHh
 /CKkq1nDH/pgeB4Zw3WuRfPiK03tRTlPk3JL5wz5cW0sz2jV2mvKbGCjrk2zfs5DgwQ6
 LPIYGNegATnOlfpu5MBSQvk79HLHDbnx5mecffGmtQ5ScbkfdPm92m8tJe3K6LB4Zcbn
 8dZ41nT5HX/w7IVBteYIKIrCqR4cnnZufysW1fgQSOpePn80cE9u4dNwChI6UBUXuwhX
 c2Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=bVY7soqiA3XCeAktGtOltVSnsWK0ipkOhc3Gp8lbCXw=;
 b=wyl92zXYJT9T+jG6mjHshhw2jYUgGhPdxY4KnyhlZ4MCCoETkn2exRqgWicuzitzTB
 jtI/iTLIGJhFr4sNpd2apyGp/fExy09krATCWZSodklxRC2CCB1s14oMBCDscl+xU6Ni
 W+1JdcUcYAwLiMpWzb3qynCjkWVVtJ2mKZUUBrKj4L5b9nWjck0zCKvN9QUX01xz4yRq
 mR/Zzcny4meouF4RSuO1UmXOLtpijVWODzyNfHGxeQo6nNU1m/QjWo5vosqoaOQx5Rpl
 U3m4rGNmDA92tULTD3mXaMj/h1bMPPhV8dnqeeR9I3pM6XxFm9tSqXBtEZlK+DutZIzY
 yD0w==
X-Gm-Message-State: AOAM533BN9pQSWR6yGu90xkZyAzdYKodi3R1jcg/edkkfsOZ/Ex+JGeD
 cts5iO3stLUODxCqIcmVtzSFmg==
X-Google-Smtp-Source: ABdhPJyVLtKRpLSTaZKPfxDXW9cS9gB0xbc6CTvIQGWYScQ4QvflxTFKgrae8jcYgMYAsfgEms3Vxw==
X-Received: by 2002:a17:90a:bd09:b0:1c6:d549:7b92 with SMTP id
 y9-20020a17090abd0900b001c6d5497b92mr2332661pjr.94.1648075331335; 
 Wed, 23 Mar 2022 15:42:11 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 p3-20020a056a000b4300b004faee36ea56sm15607pfo.155.2022.03.23.15.42.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Mar 2022 15:42:10 -0700 (PDT)
Message-ID: <443e171e-77a1-e51f-569d-e65f37077922@linaro.org>
Date: Wed, 23 Mar 2022 15:42:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 11/13] accel/tcg: Add rr_destroy_vcpu_thread_precheck()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>, qemu-devel@nongnu.org
References: <20220323171751.78612-1-philippe.mathieu.daude@gmail.com>
 <20220323171751.78612-12-philippe.mathieu.daude@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220323171751.78612-12-philippe.mathieu.daude@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/23/22 10:17, Philippe Mathieu-Daudé wrote:
> +bool rr_destroy_vcpu_thread_precheck(CPUState *cpu)
> +{
> +    if (single_tcg_cpu_thread) {
> +        single_tcg_cpu_thread = NULL;
> +        return true;
> +    }
> +    return false;
> +}

This would become

void rr_destroy_vcpu_thread(CPUState *cpu)
{
     if (single_tcg_cpu_thread) {
         g_free(single_tcg_cpu_thread);
         g_free(single_tcg_halt_cond);
         single_tcg_cpu_thread = NULL;
         single_tcg_halt_cond = NULL;
     }
}


r~

