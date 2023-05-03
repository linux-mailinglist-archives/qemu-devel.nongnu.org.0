Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E2B6F5564
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 11:54:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu9Bl-0005F2-QM; Wed, 03 May 2023 05:54:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu9Bf-0005Eb-En
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:54:15 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu9Bd-0004K6-VP
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:54:15 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3f173af665fso31310535e9.3
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 02:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683107652; x=1685699652;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Zfy4l5l4nR6bZslXzX4SscpHHqXVxlnkuwVq0z1cnts=;
 b=PuTQ/4cLZNV/gmHWbFQDBpNTFUTm9lubnROanw887X1SKvYCr2vY7vWCUnAIwvKmbq
 FHhTgP0dQ9wX5pZbhlez9cFg/T3m4tKoMJw6A/G/sqKrxYsQ53v9kz+FfIQ4CGdWxu3s
 GGr08+1hrX+DDSw4clGdfX067DHfu9YsEJPDHGiDTovDsSw28LMU9NdwjzZOLRII83aT
 e3QYzM1G9nUlwvNOgWrE/UCMhIZdKhFfIlsbZXyVXFFpsssrBAcSCNyJ+bImEcWRUPIU
 qaXgjEpDqak8spaqwVcsaJb2T4L5U2GFtxTNMmuPIJMsLfb2kQmLXtxz0+pN0Ey2pU1P
 kF4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683107652; x=1685699652;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Zfy4l5l4nR6bZslXzX4SscpHHqXVxlnkuwVq0z1cnts=;
 b=h06j9fbHHTdqUP8X0bpjQ3WfCzcK0nhHQ0OKJucKzMhjvefEk+TZHYlbGrN4cRP917
 PuXGT/4A+z3yjG+duyzEL3rtYJqn4ab8YwkWSI5f6CJeM4vPsPFcTHFOe6tloDkUDJhi
 RHOQ7sfAm5hTq6PmIS/+mzicdVX7EIaKQJJzPFK+2xvYZ8eJRuX/XQD5k2PkCVvPjRTr
 IzvqT2eKHT8lAxT3NTIQXAdbuxuMv8i5/duFFNXGU3fX4070XiEv66VmX99N76bBVEKw
 DDdwphRZU00OTF3v8272lztZ2HRWhhZRW0aM9qgGc20I6rrQbyvyXdiCJmZoaUJPySMk
 Y6RQ==
X-Gm-Message-State: AC+VfDzzOKzz8luLar+Udp1YoHFzO9f/X6nAGr1ngREeb5HXeiyRsbBk
 dfzwd6jmI7N8+f0/Na9ALR+AAcoCE59T2sCvuqE4Mg==
X-Google-Smtp-Source: ACHHUZ7pE43DGy4Din7nzN7f31Bg4LW9vKRkey8Ez5AR01k29IGqOAZx5o8L5aKrYFqElpE1DQmLSg==
X-Received: by 2002:a1c:7416:0:b0:3ed:6c71:9dc8 with SMTP id
 p22-20020a1c7416000000b003ed6c719dc8mr14597272wmc.22.1683107652338; 
 Wed, 03 May 2023 02:54:12 -0700 (PDT)
Received: from ?IPV6:2a02:c7c:74db:8d00:c01d:9d74:b630:9087?
 ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 h5-20020a1ccc05000000b003ee5fa61f45sm1391950wmb.3.2023.05.03.02.54.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 May 2023 02:54:12 -0700 (PDT)
Message-ID: <3286ce2d-84f0-7578-0070-7d157f47a701@linaro.org>
Date: Wed, 3 May 2023 10:54:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 04/10] scripts/qapi: document the tool that generated
 the file
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20230503091756.1453057-1-alex.bennee@linaro.org>
 <20230503091756.1453057-5-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230503091756.1453057-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x335.google.com
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

On 5/3/23 10:17, Alex Bennée wrote:
> This makes it a little easier for developers to find where things
> where being generated.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   scripts/qapi/gen.py | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

