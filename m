Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ABC26EFC67
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 23:24:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prmbb-0004of-E7; Wed, 26 Apr 2023 17:23:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prmbZ-0004oA-Hu
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 17:23:13 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prmbW-00026N-Vi
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 17:23:13 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3f315712406so1445785e9.0
 for <qemu-devel@nongnu.org>; Wed, 26 Apr 2023 14:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682544189; x=1685136189;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TrUDpmraLkrzDB9JlQqfkxgNEUwUSORNCUCp+dPNDsc=;
 b=Vbew1sNR8NCf+/x/YLvtsTGphP4OqfnCfgoL5KYGakxZGhA+qAIqdC00rEFnheN3uB
 hQAOlByhZQB6NCejS6Tgai9+O0VQWzu2yFJGrW2uCX4Qyc+QbfixZ7GqXaf4bELruarD
 nZRnnucTcmH70jv4fROBKt2FMM2BrKDegCSvHuCyhLV6OPjk/q/mj7O9tsci80torT/H
 Y3rVyhGw/sbuqJEOZ/H6dZOMNwKGZRseyhJPQyPX/8Ni2RFOKoPZVLRPk7EysXR3ozX6
 cizgzFS8oATbc4I8bYer+wM2MnCaLfCgoVJAnPxpuIFqSgVjCfFOcPguE8rNfPdjWSsv
 EAdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682544189; x=1685136189;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TrUDpmraLkrzDB9JlQqfkxgNEUwUSORNCUCp+dPNDsc=;
 b=DkpiFVyE00zE1jQB27RCAdf/uNAmUFRdFcVEWAeFvEL8VG2wOwHPjwWWqGYbVVcNIt
 3dSVfjCC8sivTR2hrjc9i8Cz3/p/Px+BouttFDsViFLdhBBC/2DKB9OP/iGZ/zYmNloN
 OQuLT/JzuYSKCyVP7dF88BMEY2hov3pQu6+KtC0nLp14NrPRY7ZplICC6MdXACNI38u/
 A3rIaJG9dc8CTsdLdRu33YW5qV7o6ZK3+mLmugzuj7bER/Y/KqFMdf2vHIRuexmSJ/Dx
 qgZ5qBNumO0ZVcPoPZeH70D2ySAPhCLPd8mZc5Jw5EKaZ2H8Eq3D6iy+FfxMwTZwI0rt
 mVTg==
X-Gm-Message-State: AC+VfDyDVbOrRTipZiUbYaHdIfUaTF585WOhzhEce1smX2a48Ryr2d6b
 uQPPzKK67VxqST9RO1rfG8Qn2A==
X-Google-Smtp-Source: ACHHUZ4FMr9uT2tsododNHGmE/h4rbyRAt7vrSkt0Atq+C0yVhjsQlDzKAIT5uoqRRdQt5+W/uG7xA==
X-Received: by 2002:a05:600c:4f55:b0:3f1:88b:bd40 with SMTP id
 m21-20020a05600c4f5500b003f1088bbd40mr2372461wmq.14.1682544188913; 
 Wed, 26 Apr 2023 14:23:08 -0700 (PDT)
Received: from [192.168.5.119]
 (cpc148070-lewi21-2-0-cust450.2-4.cable.virginm.net. [82.15.53.195])
 by smtp.gmail.com with ESMTPSA id
 bg39-20020a05600c3ca700b003f09c34fa4csm22836170wmb.40.2023.04.26.14.23.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Apr 2023 14:23:08 -0700 (PDT)
Message-ID: <379e70f9-2d04-dddc-fe5b-d4eee3bde62f@linaro.org>
Date: Wed, 26 Apr 2023 22:23:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 08/21] Hexagon (target/hexagon) Clean up pred_written usage
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
Cc: philmd@linaro.org, ale@rev.ng, anjo@rev.ng, bcain@quicinc.com,
 quic_mathbern@quicinc.com
References: <20230426004202.1319250-1-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230426004202.1319250-1-tsimpson@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32d.google.com
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

On 4/26/23 01:42, Taylor Simpson wrote:
> Only endloop instructions will conditionally write to a predicate.
> When there is an endloop instruction, we preload the values into
> new_pred_value.
> 
> The only place pred_written is needed is when HEX_DEBUG is on.
> 
> We remove the last use of check_for_attrib.  However, new uses will be
> introduced later in this series, so we change it to "static inline".

This is insufficient -- clang will warn about unused inline functions within the main C 
file (as opposed to #included).

Use __attribute__((unused)) instead, and remove it when it gains new unconditional uses.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

