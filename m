Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE25A6F0452
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 12:42:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prz55-0002Fk-SZ; Thu, 27 Apr 2023 06:42:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prz54-0002FM-2p
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 06:42:30 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prz52-0001of-L6
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 06:42:29 -0400
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5058181d58dso14652382a12.1
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 03:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682592146; x=1685184146;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=k+tfVwThdFAynxOqcngYKsJz43soLAsdUvJQE53Rmng=;
 b=nuscJ62YxnyAFXpm9+MylnUYKvQ2iUYQ9gqbFjpb/T8Zzfxyyu/fhwByKT+PBfWM9W
 MNV8UuPQvGzYJWQM0yo4BQ1XAgOAxGcAJ9JRIslUwFxx4rwg12DU1GRoyFKDj7RF10/Q
 Frh0XwStFbYUFObiHNSd+ylTbehmf2p32xnANcjZKtmnpZx71Fb1hpQqmw/m5fLa8Du4
 bdjESFGSm+M44l9Fnh8K67l5QSQ6LOTUcPwHZ8CAzErTe8Y81E31vjHw8Si2kfSrO5xg
 baAeYM55XMfPvaMEXwaJRXyHY43j0LGXTeH0FW7BVfGqyGvWT7dvnmxwB1lTMxspTsgY
 3dGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682592146; x=1685184146;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=k+tfVwThdFAynxOqcngYKsJz43soLAsdUvJQE53Rmng=;
 b=j44QBXYN5PusHJpAS63KIOpIKWzTSw0icum4vdigpuhCU0k26ZsuW2TqD/t8DDTYoz
 Yj9z/f5hVIA8SYGCfT8eGlmZ6M5Kt5lUcdFMUY6IFq7/V6DUFP+Z44XDt+NVHP9MHLls
 SQbh+KCQ1b+zDS2vEFw/dgf+GvcNndZ6/IHXV04pr3lpBMSVUb0navkugWxm2VvwrNy8
 ielC/I3hEB0lIWNZsIqOEygTlgOO1TOv28yzKcrJuZfuSnMoYI13CCK6xXO2W7GpTmIZ
 CfB0OnJxHIjCuxUgz2JmURoa5vn8aoUXyAV8Qbvt+X4z74JIn5aTs8b/eB8S4cbRGiJ9
 FCag==
X-Gm-Message-State: AC+VfDysUHXYJt6pTAPrlDZVOe8O7KgAOqYRon40mecOWGY8iKgfHewV
 LD2cRwMWTM5tgA+9OXBZVi0yIg==
X-Google-Smtp-Source: ACHHUZ7hYUGhSW+3dx2lpbDT2fOkXW2CaT9DsrwlNnXnPBE/hsMVgJCZNTwmsLO/knXU4Mf1WA3T5Q==
X-Received: by 2002:a17:907:6e16:b0:94f:1:8468 with SMTP id
 sd22-20020a1709076e1600b0094f00018468mr1233997ejc.17.1682592145859; 
 Thu, 27 Apr 2023 03:42:25 -0700 (PDT)
Received: from [172.23.3.19] ([31.221.30.162])
 by smtp.gmail.com with ESMTPSA id
 fp31-20020a1709069e1f00b0095251a3d66fsm9364261ejc.119.2023.04.27.03.42.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Apr 2023 03:42:25 -0700 (PDT)
Message-ID: <15994a01-e2e2-2d80-5ea3-3850a8e76da4@linaro.org>
Date: Thu, 27 Apr 2023 11:42:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 13/21] Hexagon (target/hexagon) Short-circuit packet HVX
 writes
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
Cc: philmd@linaro.org, ale@rev.ng, anjo@rev.ng, bcain@quicinc.com,
 quic_mathbern@quicinc.com
References: <20230426004234.1319401-1-tsimpson@quicinc.com>
 <20230426004234.1319401-4-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230426004234.1319401-4-tsimpson@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x52a.google.com
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
> In certain cases, we can avoid the overhead of writing to future_VRegs
> and write directly to VRegs.  We consider HVX reads/writes when computing
> ctx->need_commit.  Then, we can early-exit from gen_commit_hvx.
> 
> Signed-off-by: Taylor Simpson<tsimpson@quicinc.com>
> ---
>   target/hexagon/genptr.c    |  6 ++++-
>   target/hexagon/translate.c | 46 +++++++++++++++++++++++++++++++++++++-
>   2 files changed, 50 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

