Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B100E6EB4B5
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Apr 2023 00:29:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppzE9-0001VB-EC; Fri, 21 Apr 2023 18:27:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppzE6-0001Tq-Ag
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 18:27:34 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppzE3-0005sV-6r
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 18:27:33 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3f1763ee85bso22697805e9.2
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 15:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682116046; x=1684708046;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Vr5k4WBppnj/g5sjUeWylK3sZwLJaOU2u5rkcMVfzfI=;
 b=dvvRDve06C7cAoEKJDQCkoCX2/Dnh2RiJB+V/U1kjrW36xYWBlR81/VKHKnKubU70A
 bbuH/wMCcnabVSrQzwMEfXg4Y15FVws5Bm24KuTsVakiXa7hHGv1NkevEjQfMsEfJYlH
 +FwiUmhQR22p6NAsUtg/2jGmdHdoW1obwNaqIo6BBl9vM6HabM1NZ9XuSKqBdnX9tM4U
 FVm9uo6ZhVc3FI/2SkZw967S8F7XsfiKDJiXJsLB9kdr4iCtp9P44ILO08Be9Z30Inoz
 Op1uoVkmqwDKdN/q01NJBMrD9XlvihIdxkkQbrHdD40N0WLCEWvh1qCfa/tXNLEp/RYp
 VT9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682116046; x=1684708046;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Vr5k4WBppnj/g5sjUeWylK3sZwLJaOU2u5rkcMVfzfI=;
 b=NhMu3DBw/0bCEJ4WIVT3VbN0mn4kDdJC1WxYjMi/ikM8CSJEAGLLThMc7SkYdkQ0m8
 HS4r1fytRRWgi7+2/2yZmo8aeDYbiql6JvIemcRrNuMUzfgjPWehi/hxVt/j7CSHogSN
 dD6BfxKOldiIAsJi0FS81/hyD01YVdXCfjie402kgS6j5HfjvEI810AyZsbjQIzwe/EA
 jDP3ddW0d//1E2+v+23YvHsw4g6pobQfv3IeSje4m5S9zLXn+bHZChHwCaaaAPOO6PQN
 5/dK0E+H+xvA7JfI+TEWjnZ8HXwPMnr5Ooytqo45PENQEwTcnljpC8/0cNs4fb7SdmrE
 bz1w==
X-Gm-Message-State: AAQBX9fWRggfdlmRzb3IlYahOrgAZ+oCciL98htrniwlX09vQ9SOLq75
 iHECiaHjmXfoXQN+puT1VbqMTw==
X-Google-Smtp-Source: AKy350Z0umzmauuX60sxed4CNzbVfHb+XLiEGGBgRCntl9AAZEVPVkvXv/U6Pc/frnOPy+tbgUPsUQ==
X-Received: by 2002:a1c:7716:0:b0:3ef:622c:26d3 with SMTP id
 t22-20020a1c7716000000b003ef622c26d3mr2978568wmi.35.1682116046417; 
 Fri, 21 Apr 2023 15:27:26 -0700 (PDT)
Received: from [192.168.69.115] (uni14-h01-176-184-39-152.dsl.sta.abo.bbox.fr.
 [176.184.39.152]) by smtp.gmail.com with ESMTPSA id
 y21-20020a05600c365500b003f182a10106sm5980830wmq.8.2023.04.21.15.27.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Apr 2023 15:27:25 -0700 (PDT)
Message-ID: <55fd7446-6cc6-61bf-e0ab-4b2498e78398@linaro.org>
Date: Sat, 22 Apr 2023 00:27:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v2 29/54] tcg/sparc64: Drop is_64 test from
 tcg_out_qemu_ld data return
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230411010512.5375-1-richard.henderson@linaro.org>
 <20230411010512.5375-30-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230411010512.5375-30-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.297,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 11/4/23 03:04, Richard Henderson wrote:
> In tcg_canonicalize_memop, we remove MO_SIGN from MO_32 operations
> with TCG_TYPE_I32.  Thus this is never set.  We already have an
> identical test just above which does not include is_64
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/sparc64/tcg-target.c.inc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


