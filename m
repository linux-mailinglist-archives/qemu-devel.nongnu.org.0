Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5899E6F0201
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 09:45:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prwJ5-00007C-9X; Thu, 27 Apr 2023 03:44:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prwIz-0008M2-Tk
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 03:44:42 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prwIy-0001f4-8w
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 03:44:41 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5083bd8e226so12497443a12.3
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 00:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682581478; x=1685173478;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0I0sWEEvR+qElZC5uPH89Dc84Vnnse7pNikWWnL9Yto=;
 b=NIeLqI+mg4+7PxC63qG7jb988S4KFNgOVoR+Wz0n9LZ+2xr8jCKd7jDFHSzlfNm1xc
 N2BSxbQXcigpd7D386CJGFORk1uzilRTgLdFo9jvcA5N2h2lACgIuQDbR/lhlRcf96mz
 piGNTqMGPyd5/13E1Uftdg/hPoyf77bE8HzyG55T/PoVKXzJTTEeNeHo61SRLgwso1eu
 FNXkF+E6rAu5zeKrWlRp+7gG2XYvozNUQh3gj79ZfQshrvG60KneXqgv5bdgfY6Whoeg
 nUAK/hmKZGCUsh+V17KtHgBEXfvjWFLU0eERdD0ulXMQp4fK74kZzMdo0SrF7coB5v8A
 hQ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682581478; x=1685173478;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0I0sWEEvR+qElZC5uPH89Dc84Vnnse7pNikWWnL9Yto=;
 b=NbWb4QL/aCf68bwP8EzGqmEPpJCCrkJOUlkpSIvMC5BiS7MO1CTWHPrMji/et+P7VI
 q7/xZpyme7Z54i8tcaOR2lRcS+Z/By0OFMvfNwu8nTFdUIdd4tNC9OqE1FlGdCZ1GihW
 Ez7m3iVJE0J0twHS/YrHblGlUyPoDDkqlnhA1rXkC9liCP5VbDg/HZ8XzFnVSwQkl9tH
 n0im/gQm9CRSyQJpNcphxXHBA7gSAHMe8AkiDEID9kbog3TWQnngKRDPrkKqZrHzmq7e
 y2yUevR5GpCmKcF8/Dzst1ruJRTbpFqcmeGTqvQsABoClkBFHTjt/6eiCRv1T9kRXtJG
 Hf/w==
X-Gm-Message-State: AC+VfDziUjCi+NlhmrP1+9AiuBJKFF9HlUcdKM1HtUiQxB1G8CyR+W7/
 1pQ17kd073CQRaIQgMw5zAWmKA==
X-Google-Smtp-Source: ACHHUZ4Lg5iRY4hkq+GwrftVJSlY7zgsVyoXvD4Ro/ylTrUHOLU6eae6UPmlbjiwyh2gYz2R+70Bhg==
X-Received: by 2002:aa7:c247:0:b0:506:84e0:a78a with SMTP id
 y7-20020aa7c247000000b0050684e0a78amr855048edo.3.1682581478447; 
 Thu, 27 Apr 2023 00:44:38 -0700 (PDT)
Received: from [172.23.3.19] ([195.167.132.10])
 by smtp.gmail.com with ESMTPSA id
 i17-20020a056402055100b0050685927971sm7566964edx.30.2023.04.27.00.44.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Apr 2023 00:44:38 -0700 (PDT)
Message-ID: <80d69526-99be-f031-bb75-49f184a58a65@linaro.org>
Date: Thu, 27 Apr 2023 08:44:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 1/2] cpu: expose qemu_cpu_list_lock for lock-guard use
Content-Language: en-US
To: Jamie Iles <quic_jiles@quicinc.com>, qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, philmd@linaro.org, peter.maydell@linaro.org
References: <20230427020925.51003-1-quic_jiles@quicinc.com>
 <20230427020925.51003-2-quic_jiles@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230427020925.51003-2-quic_jiles@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x534.google.com
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

On 4/27/23 03:09, Jamie Iles wrote:
> Expose qemu_cpu_list_lock globally so that we can use
> WITH_QEMU_LOCK_GUARD and QEMU_LOCK_GUARD to simplify a few code paths
> now and in future.
> 
> Signed-off-by: Jamie Iles<quic_jiles@quicinc.com>
> ---
>   cpus-common.c             |  2 +-
>   include/exec/cpu-common.h |  1 +
>   linux-user/elfload.c      | 12 ++++++------
>   migration/dirtyrate.c     | 26 +++++++++++++-------------
>   trace/control-target.c    |  9 ++++-----
>   5 files changed, 25 insertions(+), 25 deletions(-)

Thanks,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

