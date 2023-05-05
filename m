Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC6D6F865C
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 18:07:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puxxt-0007Wm-Bg; Fri, 05 May 2023 12:07:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1puxxm-0007VX-VT
 for qemu-devel@nongnu.org; Fri, 05 May 2023 12:07:19 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1puxxl-0004yw-7K
 for qemu-devel@nongnu.org; Fri, 05 May 2023 12:07:18 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-2f9b9aa9d75so1351407f8f.0
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 09:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683302835; x=1685894835;
 h=content-transfer-encoding:in-reply-to:references:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ms0hPIKQrxo2H18QEXJjB029aeqifyInSR6UVXQydw0=;
 b=xj6GhYLJH0iFnzFXuhmbvwqBmHywr0eYqelN0ZUZyw6ufp2jm6hZglrVh4STgVXB4Y
 1chsFGr6qsXzlWTPmFsuOb6W+i1EzRxn7vhX2WZ4BZ1+o8jyrdT407KmpeDLF1MjS6y8
 GKxPt/xFevEp+nu0kmaTSkm1VZimwrmO7em1lA5SrX9M7ww4Q1tXfp7eJ7jaYFMLZ9Xz
 38BhQv7kn8SYOTXA12xjBEeLMThKbe99TuZTXlmwyKmYq+3LdseomaihFwXBvL/Aic2w
 1poMzE82pCvD0Hi1lOYyP4s1oZ6mQlsiWrQkczOm7CLC0lUajFu6oxv8aCKLqQ4vZeOz
 TVqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683302835; x=1685894835;
 h=content-transfer-encoding:in-reply-to:references:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ms0hPIKQrxo2H18QEXJjB029aeqifyInSR6UVXQydw0=;
 b=BflZLKsJTm+xzmj4LmkayyEm493VYMVdtgmZuJWKYOLuKePhBoNGcaTFKOWVkb6T1w
 eVuWv48jo5H5qoPlWBUC9vOgqT3vkbAlAH806ZKunAYJEjT1KlGXocbvy3u6ma1PeYJl
 t2UwOLGzFS3vUePLcZCZaLCMoF8HD9hXdz/KyTMpVuZlEcQogceohMuhXPycPMjQGLAY
 7eS+7EvtOdTMV+BlCnfHRmgL+owVT3wQfLnHmmLplatX3dPcnzffeQndVHxaOucQNwgS
 vxbl1HSSPkPjEa65598kyof8vDkG1aHbNWQrITDdA6sYAh8z1rjlPJXBOn06p3/xTwwG
 jZ0Q==
X-Gm-Message-State: AC+VfDztkaFQfmCG5Ssnn7laoz/jnxDdasbKMPN+yLtK3c1qvhkKC2bt
 PCn+SJYLxYHV8Lt7aXcuFuKw/+2CaqXuciC5GWGevg==
X-Google-Smtp-Source: ACHHUZ5Z2l6LGgPqFs299nC84YgkE6tvu5+p/hYrH7Sszmae34xNs8gx4wUfjxHEZxHKEY7kWS6rzg==
X-Received: by 2002:a5d:688a:0:b0:306:2b53:e7de with SMTP id
 h10-20020a5d688a000000b003062b53e7demr1652386wru.28.1683302835437; 
 Fri, 05 May 2023 09:07:15 -0700 (PDT)
Received: from [192.168.20.44] ([212.241.182.8])
 by smtp.gmail.com with ESMTPSA id
 b13-20020a05600010cd00b00306299be5a2sm2813099wrx.72.2023.05.05.09.07.14
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 May 2023 09:07:15 -0700 (PDT)
Message-ID: <e9768333-f851-8e1d-33b5-f5a75e73f41a@linaro.org>
Date: Fri, 5 May 2023 17:07:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 0/9] tcg: Remove compatability helpers for qemu ld/st
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20230502135741.1158035-1-richard.henderson@linaro.org>
In-Reply-To: <20230502135741.1158035-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -63
X-Spam_score: -6.4
X-Spam_bar: ------
X-Spam_report: (-6.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.28,
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

On 5/2/23 14:57, Richard Henderson wrote:
> Finishing this conversion has been a long time coming.
> This is a prerequisite to removing TARGET_ALIGNED_ONLY,
> which in turn is a prerequiste to building TCG once.
> 
> 
> r~
> 
> 
> Richard Henderson (9):
>    target/avr: Finish conversion to tcg_gen_qemu_{ld,st}_*
>    target/cris: Finish conversion to tcg_gen_qemu_{ld,st}_*
>    target/Hexagon: Finish conversion to tcg_gen_qemu_{ld,st}_*
>    target/m68k: Finish conversion to tcg_gen_qemu_{ld,st}_*
>    target/mips: Finish conversion to tcg_gen_qemu_{ld,st}_*
>    target/s390x: Finish conversion to tcg_gen_qemu_{ld,st}_*
>    target/sparc: Finish conversion to tcg_gen_qemu_{ld,st}_*
>    target/xtensa: Finish conversion to tcg_gen_qemu_{ld,st}_*
>    tcg: Remove compatability helpers for qemu ld/st

Queued to tcg-next.

r~

