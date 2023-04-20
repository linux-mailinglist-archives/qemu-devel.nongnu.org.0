Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4946E9660
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 15:54:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppUjq-0004KU-0E; Thu, 20 Apr 2023 09:54:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppUjo-0004Gf-0A
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 09:54:16 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppUjm-0003hZ-Hm
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 09:54:15 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3f18ece69dbso1340035e9.3
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 06:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681998853; x=1684590853;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=e2RuHz7r/UqCDMRAxdT5JNp0MuzVfRW/221x9fNXJJU=;
 b=S5KRd9gpzlkmf9YAfWA/OPF7C0DVF1fKVJ9H4ZwoU67oQuHy7wZSZ5dTlE58OiRHJ0
 x/8iOTlNSUrlbEMciGoXBmLrQnSY4UYNrTGSNfUvyaaUqy+TE4xd7tYkGdx69UCyJ7X7
 tqY1eyuczcsVzbPKM1EyhqEepVQDr0SCQDv9+zVgY79RfSFkY25EeA3vrded79Oaz4Ei
 dn39alVL8rM22gHL9KzQyc3PimZLQN7GkY+QwP5SpJwblA6nf50BCZeRHybsm8Tp5V4m
 MQTxiRjWFvxzGI1V81lm+6xELIZgGZJzPdgRusE0919PNIYvEE2fe4bgmj9DmqeZNptU
 4ZBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681998853; x=1684590853;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=e2RuHz7r/UqCDMRAxdT5JNp0MuzVfRW/221x9fNXJJU=;
 b=R2CHom9od0QNf2Mo1iGYlG+Ngl2rgrLd8ImdVfH65gA9c5teD1wJFKR1nt51MJL2TB
 F/duAG/nPMiLups/ML7gIQVYzbVaJvoMMzFR/WOFwaoIbzjJtKuPM0aN3cU9rM+u1hhM
 9xGZehiUPQVWBg5fCRowmAiZPOfz3Ub8Xw0VzExQxuWrcqT83641Qm5BvIv0J7255C2x
 G0BZ7K4oBiV9fdheKFWZKa3EAY1sxsAtuTcrf/ECliD0reApcmsohOeWD6BPGna7wogk
 hAvQrtRvXEjC8EyZbFe3XYHVU+EORan3j7KYzMF7Z+bdRH4Ekj1BNYFFUT2vMVKszI9l
 IjfQ==
X-Gm-Message-State: AAQBX9cCdp/w0fcSNrzFwsSS4K7ky4jFOk/XboOLqW8hWGCLlVkQ1jnY
 hGAm91vPLwitXM0phu8X3hAjvw==
X-Google-Smtp-Source: AKy350Z6ZU1T+0hJEt0aIMHdBMyGDqwq6Veefqx6YAV9rCAQ1clO3S5jfnNQw23DHl84MZNM7gVCAw==
X-Received: by 2002:a5d:560e:0:b0:2ce:a8e9:bb3c with SMTP id
 l14-20020a5d560e000000b002cea8e9bb3cmr1360939wrv.15.1681998852942; 
 Thu, 20 Apr 2023 06:54:12 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 u15-20020a5d468f000000b002f5fbc6ffb2sm2054245wrq.23.2023.04.20.06.54.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 06:54:10 -0700 (PDT)
Message-ID: <6e7ef796-7526-587d-5f96-3cb4b826fb65@linaro.org>
Date: Thu, 20 Apr 2023 15:54:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH] hw/rdma: Compile target-independent parts of the rdma
 code only once
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>
Cc: qemu-trivial@nongnu.org
References: <20230419114937.667221-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230419114937.667221-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.669,
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

On 19/4/23 13:49, Thomas Huth wrote:
> Some files of the rdma code do not depend on any target specific
> macros. Compile these only once to safe some time during the build.

s/safe/save/

> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   hw/rdma/meson.build | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


