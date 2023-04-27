Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6776F024E
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 10:05:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prwct-0001Qm-0p; Thu, 27 Apr 2023 04:05:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prwcc-0001Oi-RV
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 04:05:01 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prwcZ-0005cf-6Y
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 04:04:56 -0400
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-505934ccc35so14110840a12.2
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 01:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682582693; x=1685174693;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4qr5jt5WAjNSbgoCKF/4sqIyCh8uzHDekRXQxOSt6Uc=;
 b=cF2VW/awz/dL1bMLnCeRrN3M6tHAlM/n/PRr1FzeVl9v7SxpTYg4WJUWxq4X1AYYWj
 kcG8t6znZwhwddBKx8dcbjcCIny7Kayu80dZBQclyuxnypu1J6Itmcn5MiEMsFIHRy3a
 j5w0+uivjfY8MGeUdGOdUOHfa8hN/K7t5Y83K0YvL21nmzTJRuuepylOSFLwaZ9rxelc
 2xqMreFxn//kpOPiCgNwM8RLofPBjtTiM4AyHS0eTJS/FfDpTMVMDenuB/U3AG3VRDEa
 N3M2+r+546nfuyB9RFhOaS6mxkZvlrLSRu4oAIfB8MIo2YDihIGyfRbUxlTud4OlsokB
 YhoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682582693; x=1685174693;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4qr5jt5WAjNSbgoCKF/4sqIyCh8uzHDekRXQxOSt6Uc=;
 b=dCmW96qsj+Ou6c401tYlltzDEAupIrYdSb8GazzncknOKlImmgt1kfrmhU0YSoe571
 M1oAyHywrb2CnSY8g2c4PqzoB9yL/vgkZ4HUpXc+y3fWmsQRGFMkM7Vt3PYT3Yh82Hmw
 Sa4CESm36ZN07C2yAm80Cr9ta1k9dMngmxNJZ0GWHWUgBae9q4eyePtci/EtzCvmkJkR
 uICknBK7Rq/P/ask87wrVy97hAKkerziwaXno3151bncsXLdEQYDKSZjtwwb01i98EZQ
 9lxfvkXeK6BXadLBmrjRWGYrtEmuX6XusTWPbX2Ktjilc40QVDsgoEjdSdRe6gidxWFb
 D4XQ==
X-Gm-Message-State: AC+VfDwxIQxU3f9UIoTyZ74Y5SNJx+mAw2jtOv7qlu54b9Ks7Gc7FdVK
 C8KdW3d9LwxZPqZ4+AI0UOHyrA==
X-Google-Smtp-Source: ACHHUZ4xGiafay9kr86DfQNsqidWWZR06B31EYjH4aROU1MkXM4g+0uoDwQT7l4uNlxnzuqS9Y688w==
X-Received: by 2002:a17:907:6ea1:b0:947:335f:5a0d with SMTP id
 sh33-20020a1709076ea100b00947335f5a0dmr978835ejc.62.1682582693446; 
 Thu, 27 Apr 2023 01:04:53 -0700 (PDT)
Received: from [172.23.3.19] ([195.167.132.10])
 by smtp.gmail.com with ESMTPSA id
 lh15-20020a170906f8cf00b0094e62aa8bcesm9246237ejb.29.2023.04.27.01.04.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Apr 2023 01:04:53 -0700 (PDT)
Message-ID: <f40f140d-25fd-73c1-6837-425f052784cd@linaro.org>
Date: Thu, 27 Apr 2023 09:04:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 10/21] Hexagon (target/hexagon) Mark registers as read
 during packet analysis
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
Cc: philmd@linaro.org, ale@rev.ng, anjo@rev.ng, bcain@quicinc.com,
 quic_mathbern@quicinc.com
References: <20230426004234.1319401-1-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230426004234.1319401-1-tsimpson@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x52e.google.com
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
> Have gen_analyze_funcs mark the registers that are read by the
> instruction.  We also mark the implicit reads using instruction
> attributes.
> 
> Signed-off-by: Taylor Simpson<tsimpson@quicinc.com>
> ---
>   target/hexagon/translate.h          | 36 +++++++++++++++++++++++
>   target/hexagon/attribs_def.h.inc    |  6 +++-
>   target/hexagon/translate.c          | 20 +++++++++++++
>   target/hexagon/gen_analyze_funcs.py | 44 ++++++++++++++++++++---------
>   target/hexagon/hex_common.py        |  6 ++++
>   5 files changed, 97 insertions(+), 15 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

