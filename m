Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C396FDB22
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 11:54:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwgWC-0007l1-Jr; Wed, 10 May 2023 05:53:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwgWA-0007ks-TV
 for qemu-devel@nongnu.org; Wed, 10 May 2023 05:53:54 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwgW9-0000p2-9d
 for qemu-devel@nongnu.org; Wed, 10 May 2023 05:53:54 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3f315712406so239522165e9.0
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 02:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683712431; x=1686304431;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=miamYSXJoUFwuljQzsg0+RLysr5O4hsYyWYVqNDEMP4=;
 b=wDThiZkLwvWxL+4zOETUxTXVundjEI8csqvPr7tvWMVdTXUxkNRJSNXUU8xsucQfGh
 ExIdaXG/KdJGOn24isNRNqRpvUaNflI3kAg+ch/WBkn7s1LRWi+Vyr+bLCnMvEeDKL3N
 jjlUzXvv0b/k/tHY+rwyC6Emp4a2Z2rUBMPlammoj5CIc7Zp+igudAcCtR2XvWYqCZgS
 ZKmS4kem9ilo7eWAVSEPSSpaL+meiUR9+7W3wHrzpQqQ70miGtio4xOXe4/Ue0duCHS5
 OTAg4S2kNps0oxFFxQXxrunGlkwNmFE0oPRn2jli5DG7t7f39k52B87bZxH9+dOResy5
 I1jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683712431; x=1686304431;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=miamYSXJoUFwuljQzsg0+RLysr5O4hsYyWYVqNDEMP4=;
 b=WDPbGIVPQKYkBVGg2JLf5w4sR0ScMOpEYVZTAj4J1Iea/833ESUNGNTPED+J3Xtjht
 9ZkiYFoGZ37v4d+eAxdD4NV1mz6yBzfD7ndhHi/CeBkfJhnzBWoVKiX7otGS7tIAD5+1
 tWVANGnyNjbo2jjW2I2nFAjLZtsBMR1dXA5Y0HYVEPmLUNuek6RJ1k9TW4JxYkRbTS9W
 9tYWzfCaA24ZhDD+y7RukOm2ox3d7Orsn+mVOYCfOTJaS9kivF2gSe7GFsdGpGANtkrF
 2twJvrKd9xxiQ27G8o3RwgrPN3nUukJFDPyMBlWhB/tWKytb0SNaUF4hND2NNM+Wdv+2
 XhTw==
X-Gm-Message-State: AC+VfDy3oznvU7FO3p386YS/e2FHrRyTkz3BActLDytnQrkQJ08w83ra
 +vH2E2Xkbb7uz11bvRRV/HDKjw==
X-Google-Smtp-Source: ACHHUZ4Ke6UnEsH+4bQamuQb/j3KTxznHS4/95SUFTPJ0gEcBycWzOGLTM8UGVrbhrhxP0BwGh4aqg==
X-Received: by 2002:a7b:c856:0:b0:3f4:2d85:bcda with SMTP id
 c22-20020a7bc856000000b003f42d85bcdamr2627613wml.19.1683712431532; 
 Wed, 10 May 2023 02:53:51 -0700 (PDT)
Received: from [192.168.110.227] ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 a6-20020a1cf006000000b003f0aefcc457sm22287345wmb.45.2023.05.10.02.53.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 May 2023 02:53:51 -0700 (PDT)
Message-ID: <ed216c9f-4731-d229-fdf0-56b8d24d5c35@linaro.org>
Date: Wed, 10 May 2023 10:53:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 07/12] accel/tcg: Widen pc to vaddr in CPUJumpCache
Content-Language: en-US
To: Anton Johansson <anjo@rev.ng>, qemu-devel@nongnu.org
Cc: ale@rev.ng, pbonzini@redhat.com, eduardo@habkost.net, philmd@linaro.org,
 marcel.apfelbaum@gmail.com, wangyanan55@huawei.com
References: <20230505141403.25735-1-anjo@rev.ng>
 <20230505141403.25735-8-anjo@rev.ng>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230505141403.25735-8-anjo@rev.ng>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.421,
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

On 5/5/23 15:13, Anton Johansson wrote:
> Related functions dealing with the jump cache are also updated.
> 
> Signed-off-by: Anton Johansson<anjo@rev.ng>
> ---
>   accel/tcg/cputlb.c       |  2 +-
>   accel/tcg/tb-hash.h      | 12 ++++++------
>   accel/tcg/tb-jmp-cache.h |  2 +-
>   3 files changed, 8 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

