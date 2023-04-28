Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5306F12F3
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 10:03:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psJ3Q-0004uS-5t; Fri, 28 Apr 2023 04:02:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1psJ3K-0004u3-FO
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 04:02:03 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1psJ3I-0005Cs-Sr
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 04:02:02 -0400
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-957dbae98b4so1196761866b.1
 for <qemu-devel@nongnu.org>; Fri, 28 Apr 2023 01:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682668919; x=1685260919;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qccLkG3dVqoqDqndrRxn14Ekah1xdu2SAKuqadTCHuM=;
 b=Fi1+tAzGfvB25ecb2CGJyuafW2GDUFD6CVN/F+06HSIpkA/KGcx5bhMNb86fQZoPPW
 +ueg9HkYYfjVrAligX/sP4WxNMO99T3n/ci06WnDXIrq35EgE0fjC77DfrZZKEotwfF7
 wMbwuwpArbN1yLcNoBmcH4f036IxxnrduN+vYqf9t6TPZeDVWQSfxu+/CY9uD6GqU7zU
 jI53yq7nNHY+p2LHEH3gIyMOMh09qRx87XTF7/lYMw066FcM3ifybWQG88pLiP8WN8m/
 MnEAGMKobjr9XxhXu7z2K+IPkp9thgTPXmpmv4tk01WXM2LnGmgoPgI+T7ztFVd6wOUI
 Ytxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682668919; x=1685260919;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qccLkG3dVqoqDqndrRxn14Ekah1xdu2SAKuqadTCHuM=;
 b=PMpIUyItnReFNWxlxBKlGz/glqqTlsKgMAb1E8soo17TOpxJMhX2y+6G6jCqql8tkm
 0GIy8p3Wv9WDRlVI0QCcLfhUm5YFv+c9TBNugJk2c56NqNJkYLUsEOpI4O6qVwOgI1TM
 SwBOwhglzu/AoEJdQwj9J4lbtK7n0DCbRu9zzTrDJRW8/UMLc0NCy4o8QSDxv0PvbQ4N
 keq/yHsJXJ9ad0AFbW05IqhW5PYBEyFvpLKhmk97JTABm5VRR3AKCS7Km2QJ63oomJRv
 IWywax0a0sxKvc4h+x8gRnJKVz8oeSG6FKeB1WYeCnPZ2TRW9gRJvchkGH1LDtPH67Br
 dkgg==
X-Gm-Message-State: AC+VfDyh5sg1B0APRO4lK1hhQvqHjlg3uHnIepO9X98XIxSj3B9T8ydh
 EpbMJNwSBX1lCbdAwFLxMMMKgA==
X-Google-Smtp-Source: ACHHUZ6x44P9Pbneg18sTGpQPSTWYZGjOp0rQQ4ezG0RdXrcs1hRwO6KiGRpuTFkE/yjWz1URjg25Q==
X-Received: by 2002:a17:907:7da9:b0:94b:cd7c:59f4 with SMTP id
 oz41-20020a1709077da900b0094bcd7c59f4mr4441683ejc.16.1682668918894; 
 Fri, 28 Apr 2023 01:01:58 -0700 (PDT)
Received: from [172.23.3.19] ([195.167.132.10])
 by smtp.gmail.com with ESMTPSA id
 vp3-20020a170907a48300b0094f14286f86sm10668504ejc.48.2023.04.28.01.01.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Apr 2023 01:01:58 -0700 (PDT)
Message-ID: <174e1acd-083c-c934-e4f8-2aaaf9498b94@linaro.org>
Date: Fri, 28 Apr 2023 09:01:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 01/21] meson.build Add CONFIG_HEXAGON_IDEF_PARSER
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
Cc: philmd@linaro.org, ale@rev.ng, anjo@rev.ng, bcain@quicinc.com,
 quic_mathbern@quicinc.com
References: <20230427230012.3800327-1-tsimpson@quicinc.com>
 <20230427230012.3800327-2-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230427230012.3800327-2-tsimpson@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x636.google.com
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

On 4/27/23 23:59, Taylor Simpson wrote:
> Enable conditional compilation depending on whether idef-parser
> is configured
> 
> Signed-off-by: Taylor Simpson<tsimpson@quicinc.com>
> ---
>   meson.build | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

