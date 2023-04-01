Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F616D2E6C
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Apr 2023 07:47:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1piU4i-0003wO-Qw; Sat, 01 Apr 2023 01:46:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1piU4f-0003wE-6R
 for qemu-devel@nongnu.org; Sat, 01 Apr 2023 01:46:50 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1piU4d-0005BC-Ks
 for qemu-devel@nongnu.org; Sat, 01 Apr 2023 01:46:48 -0400
Received: by mail-pf1-x430.google.com with SMTP id l14so16097430pfc.11
 for <qemu-devel@nongnu.org>; Fri, 31 Mar 2023 22:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680328001;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/Xsp6WfL6b5KVgK3bL4z/Pj4f0A8WxCAP9/aAGDvxEg=;
 b=vt3OmKx5CchSgbVPdgdJkhZXbBPobspVaxk1ytQSbv1Yrxhohu7SEEf7Di/E1mogih
 X6SMOw8GpPRmGAkEU+dEWms5rBj0ozgBItRyO19xsqHFrMGL17Sidiv+RQ+Zj4wQTZCI
 GdX3iGEK3gR9MdMC56prTA4DA9EAYOcmtGN0bojHyKYzJdqu6ZI/pMna/i+TH+Epoaoc
 96W/efUq3wuN1nvS49xPEqii2R2WPx6/GKZdxPbLr0jrd2D4mcO4rPdkj50iba9PrTt6
 63ff7dGf4hHt8FLTwqoK+iV+gKC/LglocmHqWkNaxvx30FduDmvXVVC51K8INBjHWJJo
 FUTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680328001;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/Xsp6WfL6b5KVgK3bL4z/Pj4f0A8WxCAP9/aAGDvxEg=;
 b=6h2L/QyouUjcHNJnpaHyD29/KdMxDzq/m7xO0VXqqz+yMghWc9bVWSImBs9oZdvy1s
 QpS3Jd1XYXwyvWeaTJPr8ktQqlu4z/8guOhu0drgHPQXVnmC8gZlPB+/b7MQA8Yv2lCL
 HIfHjeEtamh5X+uSUU+N40TpK2Ab1xYm6tm5g8MlLjcvtckGccbdqnNgfwbq6f3mhWOK
 ylzauw3bOyUx4UYyWVKfBr3ckUdV67I3oDma7vDe9fN9IXaN1j/Tctuvndwg8O3j1X5m
 jFc9gxmm6VJRjdpxbgsCfDYRMmaDl6BSr7k0L37BLL3r3bEpyem3FGGUg1i5e/nsOL+U
 iylw==
X-Gm-Message-State: AAQBX9cBVIHAlfkTtaDvRUEEucKNlISS3ofBU/W5Sd8QSb5Qc4sWQDNv
 +IczIRu8smFxGvtYW9ojA3V2WWNMabpHmw2LZ2g=
X-Google-Smtp-Source: AKy350Zyc/cj+Y8gScWqwOywBrxwLbiKkcpPi93BAi8gGdTsfdEL8AxVrdDgSl5UrAwqQUG1qjwgQg==
X-Received: by 2002:aa7:92ce:0:b0:62d:9b98:8042 with SMTP id
 k14-20020aa792ce000000b0062d9b988042mr11290706pfa.0.1680328001290; 
 Fri, 31 Mar 2023 22:46:41 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:b714:1fce:85fa:2fc7?
 ([2602:ae:1541:f901:b714:1fce:85fa:2fc7])
 by smtp.gmail.com with ESMTPSA id
 j15-20020aa7928f000000b00628e9871c24sm2702614pfa.183.2023.03.31.22.46.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Mar 2023 22:46:40 -0700 (PDT)
Message-ID: <c676d020-212a-c321-bd21-bf4436ecf601@linaro.org>
Date: Fri, 31 Mar 2023 22:46:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC PATCH v2 26/44] target/loongarch: Implement vsrln vsran
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20230328030631.3117129-1-gaosong@loongson.cn>
 <20230328030631.3117129-27-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230328030631.3117129-27-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 3/27/23 20:06, Song Gao wrote:
> This patch includes:
> - VSRLN.{B.H/H.W/W.D};
> - VSRAN.{B.H/H.W/W.D};
> - VSRLNI.{B.H/H.W/W.D/D.Q};
> - VSRANI.{B.H/H.W/W.D/D.Q}.
> 
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> ---
>   target/loongarch/disas.c                    |  16 +++
>   target/loongarch/helper.h                   |  16 +++
>   target/loongarch/insn_trans/trans_lsx.c.inc |  16 +++
>   target/loongarch/insns.decode               |  17 +++
>   target/loongarch/lsx_helper.c               | 118 ++++++++++++++++++++
>   5 files changed, 183 insertions(+)
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

> +    Vd->D(0) = temp.D(0);                                    \
> +    Vd->D(1) = temp.D(1);          

Oh, just noticed but lots of instances: better as *Vd = temp.


r~

