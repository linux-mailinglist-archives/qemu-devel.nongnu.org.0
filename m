Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F04635B5958
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 13:31:08 +0200 (CEST)
Received: from localhost ([::1]:35290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXhec-00007L-Lm
	for lists+qemu-devel@lfdr.de; Mon, 12 Sep 2022 07:31:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oXhOu-0002lp-Pu
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 07:14:55 -0400
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a]:42654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oXhOs-0007l9-7Y
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 07:14:52 -0400
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-127d10b4f19so22353967fac.9
 for <qemu-devel@nongnu.org>; Mon, 12 Sep 2022 04:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=lXsY0iu+6OQ14PibNjOM+brA+4sRNvruOHQR8F65xr0=;
 b=IgNAI3jw406JsEHYuIPxsELYcniC7Dcm5NB/rzmcTaAkMwsMcLDHg5xwparB2PR7am
 BRiXKf/bjWORRUK3MyXYcHG8UhdYhQY/zT/MuKCDUm1XNe3jYDND53hezZ/iIc5Ue1BV
 omIuNPEiIpv3DWVxyZHFsSbGhq6k2TLUBT47O0c1xh5qpNxrk/b2cz2ssLTrEUW2e+zN
 OTKUuLmuAyBarPy099KK5tGxxQuDzSKMf/ibYr/ExeHUIKLVHAwM70MB5tmqu9XEycYW
 5Dhp5UY1EnnEvlQxqsAvOhOdAjgg+MwDT/4yTvBVYEpdB+hFUUFGlQwLyiHtq6tWFxFa
 brug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=lXsY0iu+6OQ14PibNjOM+brA+4sRNvruOHQR8F65xr0=;
 b=EUoa/NPIA5BdMY9k2pyOq4mvfz3vkIiXSbiR93SLVX4MUn9CiVZe8yp+CZtSG+fit2
 DfZ0TOPU6dtOh/cxPKgFM3wC4uxoJ2+NkhfF9pxpc+Vl5oIQjQtcU/a4gocvQHSxuyyb
 oxGGZ6Havaw72HDNDQv54CnlGbxOHxuUhSCA/xCjPGqoVY6zJCqQ0eAp/VDpBiX3d5vT
 C5AI+VTpbCaf+5f2NpND+kCohYUGz+HnbrS8Ea3HQdp7KAbdHr2+hs/SEQPuUH1kUQPR
 Yi7kMKbDGEYYwIAFQGgCssmLdWYntcuKzgDSTqvi3wDfIpbEKTeUSXnVG8hl8+wPIRC8
 eVdA==
X-Gm-Message-State: ACgBeo3GHEawrz8qLvBX5O0a2AVRXc5e4oR1nyXg+clUPugA2DBmgvp1
 U4yszQZ5i2APJr7izJSLfgIXhw==
X-Google-Smtp-Source: AA6agR5DIdLy9ZZqBDnj1fXAbPGwR8OkYgVhF6nSdLpTfV3iNTghXOk+vkeOR/ULM7i9wCkO07nWPA==
X-Received: by 2002:a05:6808:1508:b0:344:a3be:c582 with SMTP id
 u8-20020a056808150800b00344a3bec582mr9451937oiw.205.1662981288817; 
 Mon, 12 Sep 2022 04:14:48 -0700 (PDT)
Received: from [192.168.44.231] ([172.102.14.47])
 by smtp.gmail.com with ESMTPSA id
 65-20020aca0544000000b00342d18cc2fdsm3712697oif.53.2022.09.12.04.14.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Sep 2022 04:14:48 -0700 (PDT)
Message-ID: <d73a7bb1-fa76-74a8-4656-cf3f108a9143@linaro.org>
Date: Mon, 12 Sep 2022 12:14:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 17/37] target/i386: provide 3-operand versions of unary
 scalar helpers
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220911230418.340941-1-pbonzini@redhat.com>
 <20220911230418.340941-18-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220911230418.340941-18-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2a;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2a.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.153,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/12/22 00:03, Paolo Bonzini wrote:
> Compared to Paul's implementation, the new decoder will use a different approach
> to implement AVX's merging of dst with src1 on scalar operations.  Adjust the
> old SSE decoder to be compatible with new-style helpers.
> 
> The affected instructions are CVTSx2Sx, ROUNDSx, RSQRTSx, SQRTSx, RCPSx.
> 
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   target/i386/ops_sse.h        | 48 ++++++++++++++++++++++++++++++------
>   target/i386/ops_sse_header.h | 16 ++++++------
>   target/i386/tcg/translate.c  | 22 ++++++++++-------
>   3 files changed, 61 insertions(+), 25 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

