Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F47662ACC
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 17:06:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEuee-0007uD-1Y; Mon, 09 Jan 2023 11:05:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEueZ-0007qG-W9
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 11:05:40 -0500
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEueX-0007xo-OD
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 11:05:39 -0500
Received: by mail-pg1-x52a.google.com with SMTP id g68so5087145pgc.11
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 08:05:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZzhIWrFISrEHyoYy31oAz9jlFFWkhL62f7bSBQwvXlM=;
 b=LN+PGwuwBQmwQ3Ub4Ru/HlrWZDcFFrTgBKuWgdKsEXudsSp9Tgbkc2MtxGnCyh2sDe
 JFq9utN+BmwHjCKOaZ1U//0J9BWjAdggMFv7JW7rw48XMWXRofnstNr7HiocWNt/Esas
 XgjyhOIFEZ0fJkz3GTC/n9q/SjgSGPZWLWo6lNv8MIPgAFgBj2H0cH3ieqwVAf7dZmU0
 7svnR5U0i93wI7UAxSvAVv2cj3bvtk9kNOwgdArKJkjULUCiqEESQME0AiUdV6QSzSiX
 CUvPYyPAU8FQ0WvnymPeRnmUjsru08agw1XJurU9+46eLCeaES8Hk4s3PBgz1v6oLO/F
 C1wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZzhIWrFISrEHyoYy31oAz9jlFFWkhL62f7bSBQwvXlM=;
 b=bcDZrEZvcVYiMHK8gIwA7MlsbeR1zH5rzZPZvIFvLRzz8p2o/lGFxtLd7W/Mzd+Vpl
 NkNU72ySPUKRnjFZ/G8GQuo5nw5O7SvRJjMahBUUXy8yBwf/DxIE5GZZOHsf0s7onnKp
 T8KpgtqbD7DkSpZmBMb9QUv72K3kApzQXmwhpGOz0tY2aBF4dE8wfbTdiq0EswJ7Jz77
 GN+/fmoHvLvUL0Ca6mObGCx0AnfKd6q+E2pRuMdxUiqUgdooSMoAKVvdzXOmb3k5eIfJ
 Sl3gqaPeJ/gcLXYm9oe7f/HE6PAT72yde18ic0eBmmGnZ+NX7b5zQxFpPq8JCyVvNod3
 Jqxw==
X-Gm-Message-State: AFqh2kpDf3LIr/52Si+iByEea7Uk5D+7FgwL4RzOkj8R1df9ZGh8Aump
 IAhcjiQOC+N8wlSkr+aBI7KDhA==
X-Google-Smtp-Source: AMrXdXtnEhK55vv4F4PzqLzzNcE2/Vy7TQeVCKhbJnYmajLU7tFe917IJh3jIbrma1wPdB9oXs5hvw==
X-Received: by 2002:a05:6a00:21ce:b0:581:26c2:aa0a with SMTP id
 t14-20020a056a0021ce00b0058126c2aa0amr66671593pfj.30.1673280336229; 
 Mon, 09 Jan 2023 08:05:36 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:a909:891c:953d:a6b0?
 ([2602:47:d48c:8101:a909:891c:953d:a6b0])
 by smtp.gmail.com with ESMTPSA id
 i24-20020a056a00225800b00583698ba91dsm6264799pfu.40.2023.01.09.08.05.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jan 2023 08:05:35 -0800 (PST)
Message-ID: <5072666e-928c-1aae-3dde-7c4f3a440b23@linaro.org>
Date: Mon, 9 Jan 2023 08:05:33 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 2/5] hw/i2c/bitbang_i2c: Remove unused dummy MemoryRegion
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>, 
 qemu-arm@nongnu.org, qemu-trivial@nongnu.org,
 Jan Kiszka <jan.kiszka@web.de>
References: <20230109084121.72138-1-philmd@linaro.org>
 <20230109084121.72138-3-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230109084121.72138-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 1/9/23 00:41, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/i2c/bitbang_i2c.c | 7 ++-----
>   1 file changed, 2 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

