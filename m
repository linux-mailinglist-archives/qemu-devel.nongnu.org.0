Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51BE0662C56
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 18:12:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEvgV-0004XD-N4; Mon, 09 Jan 2023 12:11:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEvgT-0004Wt-67
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 12:11:41 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEvgQ-0002ON-W2
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 12:11:40 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 z9-20020a17090a468900b00226b6e7aeeaso10350669pjf.1
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 09:11:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zVQfHa/45xQqxu7dAEmChKwIEyULLSIY67L0WS7I3oM=;
 b=E0T30XnRmjWOIaSvcOEzyX/kgX/t9mVGYOKx2vlwNx05xPG/Gd5mAoYDmobezl+Eqo
 J9wOODNmeUPSCqamZYKtkNkzekQ+oG3wP9wNOzygeZvGwQ2CRc2FqeKHWNZNu+OYFCl+
 Y16OLHzgNa/wDqFymKgDQScW3yIe+futA5MU2zK9CEdbEbNJfE6NsUGhOyzrDILg0pDw
 hR5hzaLl3e5NWbSf4c9bq8hO7PC8d467y/gsD7wTfwp71YZ+83S8PAdevVtDr3+SMYmI
 rb/W+i6fQvngpoviMzpBFLIq4GzJfXSym6+rcZslPH51c0G7ap03ZBj6+ud6onAgMoTi
 TWSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zVQfHa/45xQqxu7dAEmChKwIEyULLSIY67L0WS7I3oM=;
 b=6CGpU8GTlELIlh5sLkQ496JjW08gqjotN5od8cYqR17Rk1jdKO/wm/7bzTclrjR/JH
 tIUtyqVAWK3N/zXMos6CtQLpZ4Le0o9sGGgi6mYmUHDarp4Iqj27IztQ1kyJd6VEP7wc
 S6rt+alSHmFSqC6PjkKFBRPJfkr72KW27eyghJp30mGX0EoxBaOSf5IJAqR3002gnupz
 fq2j828JI6cU6riJPl3cjRN2I2+LyK9RkEz9KGrJErLXE+uu2gTukp6fQRKcHtlz4/yC
 SQh9tlJcyWjTkttgfXXtRZfMik/Ca49LIg2iGSIXb6DpfsM31iH+Le4pirMZvvVb38mR
 KQxg==
X-Gm-Message-State: AFqh2kr2b5GKwcCDHM5osJR3Y4StiD1IG+mo4Mm0/+flGuUoCSxPrzio
 Lto2W21dr4K+YhbN++w8llDMpkhnGbNa3oIQ
X-Google-Smtp-Source: AMrXdXsQ1muvXCGiaqJy49HS9sjEpGf2ljrzbBAj+4+N5hTCkx0H1bb3Y5vO+iiP9Kx5ZyY4isbkPw==
X-Received: by 2002:a17:902:978f:b0:193:3989:b62 with SMTP id
 q15-20020a170902978f00b0019339890b62mr2541561plp.67.1673284297568; 
 Mon, 09 Jan 2023 09:11:37 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:a909:891c:953d:a6b0?
 ([2602:47:d48c:8101:a909:891c:953d:a6b0])
 by smtp.gmail.com with ESMTPSA id
 h6-20020a170902b94600b0018f6e4e425dsm6319542pls.198.2023.01.09.09.11.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jan 2023 09:11:37 -0800 (PST)
Message-ID: <cba77fef-e846-958c-6684-1ddb8bac4d7b@linaro.org>
Date: Mon, 9 Jan 2023 09:11:35 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 4/5] hw/i2c/versatile_i2c: Use ARM_SBCON_I2C() macro
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20230109091754.79499-1-philmd@linaro.org>
 <20230109091754.79499-5-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230109091754.79499-5-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 1/9/23 01:17, Philippe Mathieu-Daudé wrote:
> ARM_SBCON_I2C() macro and ArmSbconI2CState typedef are
> already declared via the QOM DECLARE_INSTANCE_CHECKER()
> macro in "hw/i2c/arm_sbcon_i2c.h". Drop the VERSATILE_I2C
> declarations from versatile_i2c.c.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/i2c/versatile_i2c.c | 7 +------
>   1 file changed, 1 insertion(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

