Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17978323534
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 02:28:16 +0100 (CET)
Received: from localhost ([::1]:47538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEiyN-0007Li-4w
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 20:28:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lEivl-0006SJ-1n
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 20:25:34 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:53821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lEivb-00023J-KO
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 20:25:31 -0500
Received: by mail-pj1-x102c.google.com with SMTP id c19so185135pjq.3
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 17:25:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9fnXA4fwIHLCKaswUTwJI7igPwncKGD4rHMnhq6U28I=;
 b=Yr8QPL0ao5SanB2JLKdEkV8FRl1qc52l8kNmI84feLeBe7sTw2DkevEnaCHcUCzg9F
 A1I5NzV8OkE7pp/2AH+jbydjZWsdXYXzq0ohI7tcYdJ1Im8sCYFyPfMPHlg2taLUwXc1
 741sVVBjaS+NMY/w44GvE1l675degRwh4vTi+YcGtF7Vp8bsSKqYY/chSxeTSyzN7q+w
 zABji+dbmWOdeXMvB3PmyMYRWwJszqXGPp/4kPNRnVGhUGIc34q44Zfuwt9NBcUQUoWi
 5cLRpvkc7uP2S+0z+q9Bixc9l+rLZsHSReSXZtK33+RMz7reNyadpGCacN+1M93PGWDj
 Lb9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9fnXA4fwIHLCKaswUTwJI7igPwncKGD4rHMnhq6U28I=;
 b=j5RZ0euYseB9AaobsDKHyWNwKKWBHp5lP9GGGY5D8ydRrrt5mXFEeURsw1sdW6BAKd
 1H662SMZP2dfD2p6VkuQXiGjGnHq1O8bRfw7idVtnluUBrr7/RzFO3ZOgVHDj90QgVD4
 wwLee7qKGnEQkwiZvwKnTuNBQfdLYLr/nYwokgzAfKMKuD+jaIOQ6R8YgL5k78Z9XXub
 e7u/6eBGrMlmP1nWNYm1fhGpJSlIuciVqxzjc6pXkNzEfYbvT8Lt/uB+S+W25UpQDDi9
 S7O+fz75khkuRv/RPG8XR7T+rHDpUbJtlqXLbjOUS6m+h5y5n1IM2oTfR0sU9gnFUdrJ
 6NJw==
X-Gm-Message-State: AOAM531GSr6ijbtR8zVcYh7KNOYY2iXltz6/AUMEWnrgi2+5Zzud4dKA
 fPMmGZdjtjw3T8b1cE/nd55Y+w==
X-Google-Smtp-Source: ABdhPJzp4dOts8dLHu7xn1B00izbHlDYCC9+yGOT2LQFPN7KHU9XpkI2fAad9SY2MtwJyB5ymYuqYw==
X-Received: by 2002:a17:90a:cc02:: with SMTP id
 b2mr1545285pju.115.1614129919827; 
 Tue, 23 Feb 2021 17:25:19 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id r16sm221203pgj.45.2021.02.23.17.25.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Feb 2021 17:25:19 -0800 (PST)
Subject: Re: [PATCH v3 05/10] target/mips: Extract decode_ase_mxu() from
 decode_opc_mxu()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210222223901.2792336-1-f4bug@amsat.org>
 <20210222223901.2792336-6-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <dbda3d40-667e-5687-304e-8981deb146c8@linaro.org>
Date: Tue, 23 Feb 2021 17:25:17 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210222223901.2792336-6-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/22/21 2:38 PM, Philippe Mathieu-Daudé wrote:
> To easily convert MXU code to decodetree, extract decode_ase_mxu()
> from decode_opc_mxu(), making it return a boolean.
> We will keep decode_opc_mxu() in the translate.c unit because it
> calls gen_arith().
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/translate.c | 45 ++++++++++++++++++++++++-----------------
>  1 file changed, 26 insertions(+), 19 deletions(-)

I guess the split is fine until you can just call gen_mul() from a trans() from
the mxu decodetree.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

