Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 357EC3496C8
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 17:30:00 +0100 (CET)
Received: from localhost ([::1]:34140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPSrv-0003wR-7R
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 12:29:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lPSXs-0005z6-Qe
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 12:09:16 -0400
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334]:33612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lPSXq-0007Yq-VO
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 12:09:16 -0400
Received: by mail-ot1-x334.google.com with SMTP id
 s11-20020a056830124bb029021bb3524ebeso2489878otp.0
 for <qemu-devel@nongnu.org>; Thu, 25 Mar 2021 09:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=q0ZIs14vf2tUcMX+bvSST1jcqtdNP26nQTnsovRfNnU=;
 b=A9Wb6IkFBP8AP1DIhXftlbp0OSR9davRUp2V+tKJm6W8yVeDfaMQSooLcMyBP9XGWG
 WVkxM42wQsSS4Uv9TP2j0WGOnEcbR7dHZX1avS5mYpmi4iPXqGUP2mXa4ZzuDLc738KW
 BYifu5zZTEHCZMt4dG3T2ZnVFyvuTRjfG3/ZMSqJXnLX5CZAoSDS+yho0BAKhQ7Ss+Kh
 3+rnsJd1+TVfuKagUi7rlHydE+5xuZn93uh3baKuS5DaMsKVSdifY461v+Zcl1sDm04/
 ff1UVHwDQsig8DUcaCaRRz6gDB1VAEGUYo9xv09L2cc0ZiV6Tlb0C7hi0rC2u1ow0cQb
 g2/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=q0ZIs14vf2tUcMX+bvSST1jcqtdNP26nQTnsovRfNnU=;
 b=LhXegnHUPVmR5p1xR7Ohdppso3BJ7mHujrEjNi0IKIcrJ+6+OrUkHG+Z/dqmiB419d
 sI7geRby6tyywYmpKmZc1BfJsJnhChrplTDYpDiu+MWKiSMnWsOws6R5s/3Fg3KQHJ2S
 2P/l4NCJB/8d5mgYXSWugvRd0+o8TD4RFITC1yaAD6EH5yU7AbwUBjW26O3L+FBEkNUt
 RtqZmAieDs/PStQOO+n1w3Oapvw/eOztZrc8srFDcPxb/7Wpq9u7Vj3pMFdgxsXF9gLq
 Xn8BtXZL0pbT1EdMnDDjzYCJtcRoWhxg58a5wjSjjOaCDLUEYyTgMgOyiknj+RsMezgr
 PbgQ==
X-Gm-Message-State: AOAM531yj5d3hZ1XPq22N9OF2jyuUxWcLeAdu3z76DlLbAsR86sP8KOF
 PguxPjcmSoTSHrSiDJhzwqDqcQ==
X-Google-Smtp-Source: ABdhPJxnRXTGXCem1WT1IY5KEbX3ulEFqDU7Ve/vnlOgJbp9b3QJIwkS3K/TC6j/UJIN9yjZwiFcRw==
X-Received: by 2002:a05:6830:1542:: with SMTP id
 l2mr7620215otp.95.1616688553627; 
 Thu, 25 Mar 2021 09:09:13 -0700 (PDT)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id p22sm1472045otf.25.2021.03.25.09.09.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Mar 2021 09:09:13 -0700 (PDT)
Subject: Re: [PATCH 09/15] Hexagon (target/hexagon) use softfloat for
 float-to-int conversions
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1616640610-17319-1-git-send-email-tsimpson@quicinc.com>
 <1616640610-17319-10-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4dca7e06-0782-90dc-c058-b4249193a616@linaro.org>
Date: Thu, 25 Mar 2021 10:09:10 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1616640610-17319-10-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::334;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x334.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: ale@rev.ng, bcain@quicinc.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/24/21 8:50 PM, Taylor Simpson wrote:
> @@ -451,16 +456,28 @@ int32_t HELPER(conv_sf2w)(CPUHexagonState *env, float32 RsV)
>   {
>       int32_t RdV;
>       arch_fpop_start(env);
> -    RdV = conv_sf_to_4s(RsV, &env->fp_status);
> +    /* Hexagon returns -1 for NaN */
> +    if (float32_is_any_nan(RsV)) {
> +        float_raise(float_flag_invalid, &env->fp_status);
> +        RdV = -1;
> +    } else {
> +        RdV = float32_to_int32(RsV, &env->fp_status);
> +    }

So this is interesting.

The 8.3.x Document Bundle, which has the V67 programmer's manual, say the 
output value is IMPLEMENTATION DEFINED (without saying anything more about 
defining values for any particular implementation), while the older 2010 manual 
specifies 0x7fffffff as the result (which is what float32_to_int32 provides).

I must say I find the newer manual very lacking on details, including the 
non-specification of the Behavior pseudocode functions.

I guess the only thing we can do is document this as matching some particular 
hardware implementation?


r~

