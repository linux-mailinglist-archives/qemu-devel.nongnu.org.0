Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC816C1B45
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 17:22:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peIGm-0002zh-Ic; Mon, 20 Mar 2023 12:22:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1peIGj-0002o3-1S
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 12:21:57 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1peIGh-000734-6P
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 12:21:56 -0400
Received: by mail-pl1-x632.google.com with SMTP id c18so12990505ple.11
 for <qemu-devel@nongnu.org>; Mon, 20 Mar 2023 09:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679329309;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=v6sG6IPOG86VksSWCqvyoE6vBhSZkY1uYvjcQKWxdQ4=;
 b=BOU6BZf5tUs9Kdqc/JRHCPfll641LgXQtKli8cGOer4/47B/tRn1vwJADz9H05HC8E
 cX0Amqxuxd3Q8markl3LTmoFLLVx2vwQH2oGEXWP3IyeccBya0QXZ44mBhe0Ma4gI+/n
 UCG29+iHpfMHePl0MdiGDDfMTs9bH5QtlFqUCn+Ko2+7m+7TqYcoHHScDdYsPpd7CTL4
 drkkvv+1SPRHTseoKYrMMYVG/l3NKvOMI7VV9LfFPoLss3/wljIpeiBSPDIu7zFEKleM
 yhP9UkfxrOJ2Hgm+p8MuKxKKPB/aueMdwH8ro5nZATIpEFPsqEp2OXeMnQN4OhcFltcv
 yrrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679329309;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=v6sG6IPOG86VksSWCqvyoE6vBhSZkY1uYvjcQKWxdQ4=;
 b=fif9fcnZ1GKcCqnTSwzRYKx19qXn/mdmTCA/wyhsCHOP4Gv8BYFmxmS/ngKDkgpykR
 ibwk8VdYqoEDDv2/BJ3R/ANB8vlGl25QyL/xixXHFb4KZckros2Be6/rEuEE/HO1vfiF
 GN4teZO3L6kn6/Kcm1kVqGuaxpkuz/0OXOZJKrsvUuBupZ3egAbxM+OelpHg7zSGd2XR
 XX5v/By3edMdmBlopzxLGM73bJJ6VVjLGfdNF4GYDccilX/5GVjQnCu0H3jC5nAVJX5k
 LKKh+3/KIiclNx/FsRHCl6Zq3P+WDZXLZBjzIF09zJKVeaQ2u+FBcvlKNwx1zRtWmvQ/
 9rJw==
X-Gm-Message-State: AO0yUKX3fJs+qid82WmaJuKQn6KqAI+9qTQlqgfwARyW5S2C7nDiI8Lb
 soK/38TKTtzYiUxofWysfmS9Fw==
X-Google-Smtp-Source: AK7set+Qg8661L6KXubOxfBrFv3Q/K8C4jg6ro7a+G/1eEEm0gCdNOhw86Xa1obJzmt1NYAkFlhuOw==
X-Received: by 2002:a17:902:e808:b0:1a1:da3c:6065 with SMTP id
 u8-20020a170902e80800b001a1da3c6065mr2402961plg.22.1679329309073; 
 Mon, 20 Mar 2023 09:21:49 -0700 (PDT)
Received: from [192.168.4.112] (096-041-163-098.res.spectrum.com.
 [96.41.163.98]) by smtp.gmail.com with ESMTPSA id
 jw24-20020a170903279800b0019ab3308554sm6935097plb.85.2023.03.20.09.21.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Mar 2023 09:21:48 -0700 (PDT)
Message-ID: <673e106b-7e39-a4b0-96de-976855defc7f@linaro.org>
Date: Mon, 20 Mar 2023 09:21:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 07/10] accel/tcg: use QEMU_IOTHREAD_LOCK_GUARD to cover
 the exit
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Alessandro Di Federico <ale@rev.ng>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>
References: <20230320101035.2214196-1-alex.bennee@linaro.org>
 <20230320101035.2214196-8-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230320101035.2214196-8-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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

On 3/20/23 03:10, Alex Bennée wrote:
> This avoids us having to make sure each exit path does an unlock.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   accel/tcg/cpu-exec.c | 12 +++---------
>   1 file changed, 3 insertions(+), 9 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

