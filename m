Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE5968F90A
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 21:48:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPrMF-0007Pm-5j; Wed, 08 Feb 2023 15:47:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pPrMA-0007PD-3u
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 15:47:57 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pPrM8-0001Mj-Ji
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 15:47:53 -0500
Received: by mail-pl1-x631.google.com with SMTP id m2so265829plg.4
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 12:47:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6G2zwPWkd3R+8inVHgQtxMZamTpvI9vWbSZUKFtGWYg=;
 b=JLINuwXxb7qMlZwIg+6R4jqqbk/fuR7ua+kjFv6wtp+dWKRSvqHnOi0NY5909Ac/E0
 Tt6jA53cOolTa6pH7ukuOxFNWRdQxyrCVFlG82vNdIl8pjpEioEZnD/I6gVSUinLaSAj
 iVd2UzffcA/x2Sfmtli0PXaaOMmL7Ar8gghAz5ob3x3kkGU6iiKI9Sg4MG93NlwkZMnX
 l0YKR9YnnNH+JnlAFzXqqaWWJRkHWu0S1y/fcxK4gZ75Qr+UxAAapL1SGx8/fDVe4k9J
 ogC0jMfijvhYooi8WRY26463Q3GVrAaO+vBkiH5zUtfcILNxYCimp1X4cRCNGTXzSs56
 8vew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6G2zwPWkd3R+8inVHgQtxMZamTpvI9vWbSZUKFtGWYg=;
 b=hwzb8zVbBxCWbxgqAgHKLwvOGLRhZsyVpNEHNxZt2E5NDy8ZMlQ8DkmDZZFteTZdgV
 bZ4shafda2ATR+r9HGZso4Kl3QA7jk5MqbbfhzJ2hAqjZuzfOmOXI1oXPyGtOqNNjgUm
 zXSKNZR/JXHeRkcvSTmYhaxV8Dogn1R5+x6JDtAniQj+D8Wu05HZxvsdSa6wCuYJkqj1
 SdcFoOrrxueMz3gjZt0Zsjy8S6Oi5n2GnjzI5BrpFGJHnbapA/ys1nyliLd/FiZBngD0
 hAk6EQrNDT8ncJ+vEb5Csu8gakzBEaLXevewS5UxBVvhmquW8b1kp1rmQr9UUFpXXp/Z
 DloQ==
X-Gm-Message-State: AO0yUKUvxrsPBFv/WdkLV0Qg7Z9za4anKvv+usoqgSoeGO5qXndesBh5
 F3bJ2L56O5cdukMGgZGxm3h8Gg==
X-Google-Smtp-Source: AK7set/lPN9PLkpZqhLXH2orX+5oYbeeP32yie43T7NQv6cdqX37SDM2Z+ECG5HGZ8YZeI/uPEl5hg==
X-Received: by 2002:a17:902:c950:b0:196:58ac:6593 with SMTP id
 i16-20020a170902c95000b0019658ac6593mr10602989pla.61.1675889267880; 
 Wed, 08 Feb 2023 12:47:47 -0800 (PST)
Received: from [192.168.101.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 b7-20020a170902d88700b00189d4c666c8sm11497359plz.153.2023.02.08.12.47.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Feb 2023 12:47:47 -0800 (PST)
Message-ID: <c829dc4b-3084-03cc-556c-08f99e16e42e@linaro.org>
Date: Wed, 8 Feb 2023 10:47:42 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/3] include/exec: Introduce `CF_PCREL`
Content-Language: en-US
To: Anton Johansson <anjo@rev.ng>, qemu-devel@nongnu.org
Cc: ale@rev.ng, pbonzini@redhat.com, eduardo@habkost.net,
 peter.maydell@linaro.org
References: <20230207104352.11055-1-anjo@rev.ng>
 <20230207104352.11055-2-anjo@rev.ng>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230207104352.11055-2-anjo@rev.ng>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.146,
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

On 2/7/23 00:43, Anton Johansson wrote:
> Adds a new field to TranslationBlock.cflags denoting whether or not the
> instructions of a given translation block are pc-relative. This field
> aims to replace the macro `TARGET_TB_PCREL`.
> 
> Signed-off-by: Anton Johansson<anjo@rev.ng>
> ---
>   include/exec/exec-all.h | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

