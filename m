Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0758041409B
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 06:36:35 +0200 (CEST)
Received: from localhost ([::1]:34534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mStzm-0006yC-3z
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 00:36:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mStyn-0006B4-3d
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 00:35:33 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:33789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mStyl-0005sT-Gf
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 00:35:32 -0400
Received: by mail-pl1-x635.google.com with SMTP id t4so976465plo.0
 for <qemu-devel@nongnu.org>; Tue, 21 Sep 2021 21:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=qsRYitPkj0BhvSl7Qz6/6ZvOkiIt5BrZrJKU1lAxpRw=;
 b=d37sqDsY56WLGHj5HGmbYOEBEauOfCjGE7+m8/6ADbeU3HCLd/7IfOtXB4bBtIxYpZ
 ajv9+IuKJ7XdiZjGzZ8vemg7th1/XJCBzmQuLnRlLeNl2z5m2cGSC1yuyJKp3674tDXl
 GVV0M8LrhW/PdnigSdXjRuStfdy0zLq+mpuQ/+fBD8mDKziVFnMVVaYjihNQK54rQaZz
 WUdH5zT15XGFWUZ8XNv324WvfwU33oRMwsmRaZE9dbTYNplVthJCZMe28lrKZPqJ3Nhr
 gvxGeqq6PeB3KbgWVvVt/dUPGoHxstLPr0jQEVT6mKxUDpl3NbKwTzaMai8ekNq8C7+7
 fAWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qsRYitPkj0BhvSl7Qz6/6ZvOkiIt5BrZrJKU1lAxpRw=;
 b=dMx9vnuK/4cwDcdlrkrUBuZuMFuaeuZv/owVlTN24+kcVQ8jGpuuiRYMMg6grJACUR
 jbglN0gg8SEqEXLmRtv2JUeE2sHF0YDpRdzJ9ZL1gdj949yN3MXwwBBwLbpciXcsPDON
 3BghjN/NbjBRPwmySiEEeDoTwEtxPXwcbnsaEV6mxKoDAy2y9HWPjWZpYKKkhZmh+zeH
 p2i5MHLwsEcCYofHbvgI81dzl7pk4zv7N/q2n0kyyEn6tDThWYixPiyHI4EsJXveEt/G
 lZCByzQhfcGIZppeQlmYlS3yoJOwYLG0u3JHVAUDh4xEpNWNIvXjgJ7wwJfaofwmrIhB
 R3uQ==
X-Gm-Message-State: AOAM531GjrXDJNJO6ehv0ra1Hv21AB7929pn1G36WlpDCLuIURXlZKwU
 M7I0FhhbyGsc2kXR1i8a/mwp+LFKkQZhlA==
X-Google-Smtp-Source: ABdhPJyrqZP+66ojzo95zTdpHc88Uz0+94oPr31XYfjiReUpAwRRuxPcXQc2t/DdqkV4gTmyQcHQlA==
X-Received: by 2002:a17:90b:314c:: with SMTP id
 ip12mr9205122pjb.32.1632285329827; 
 Tue, 21 Sep 2021 21:35:29 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id p16sm87171pja.24.2021.09.21.21.35.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Sep 2021 21:35:29 -0700 (PDT)
Subject: Re: [PATCH v2 12/30] tcg/loongarch64: Implement
 not/and/or/xor/nor/andc/orc/eqv ops
To: WANG Xuerui <git@xen0n.name>, qemu-devel@nongnu.org
References: <20210921201915.601245-1-git@xen0n.name>
 <20210921201915.601245-13-git@xen0n.name>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <90820738-c1f4-398c-308d-ec89be2d985f@linaro.org>
Date: Tue, 21 Sep 2021 21:35:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210921201915.601245-13-git@xen0n.name>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/21/21 1:18 PM, WANG Xuerui wrote:
> +    case INDEX_op_eqv_i32:
> +    case INDEX_op_eqv_i64:
> +        if (c2) {
> +            /* guaranteed to fit due to constraint */
> +            tcg_out_opc_xori(s, a0, a1, ~a2);
> +        } else {
> +            tcg_out_opc_nor(s, a0, a2, TCG_REG_ZERO);
> +            tcg_out_opc_xor(s, a0, a1, a0);
> +        }
> +        break;

You don't actually have eqv (xnor), so don't pretend that you do.  The middle-end will 
expand this as xor + not on its own.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

