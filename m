Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7543AD544
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 00:33:35 +0200 (CEST)
Received: from localhost ([::1]:45432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luN3O-0006XL-Lh
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 18:33:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luN2E-0005kD-QP
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 18:32:22 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:33313)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luN2D-0000ng-A7
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 18:32:22 -0400
Received: by mail-pf1-x433.google.com with SMTP id p13so8897118pfw.0
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 15:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=69XXzDTNDu4xiyxUs3FLExppQsXsH2CC0rGdZ2StYdw=;
 b=ZU+N8chDOBQXI9hNUMfU3XGn71fvsyf3AOF1eFeanK/FYEFQ8fRcJGsgGw5g3Gl3di
 tdj+oW4xctBM39YRET34VWjKhqAQEtdK3pDMzi7M9D4U1e5a0ZJdpX1w5ebvsUbobWGp
 52cZL2gXsteF4Ifb8ALjMC8Ukgy/r7GXnKVpCUuOTy0Pa34C01yJufb1k6OwcC9tjhDD
 Ni/yS1OEMJsxWqZl2cHdmsOZst5SxCCAMsv1UmgczioB2DshwhkLSZ3maPQGifZ1Zs5e
 I351txUiKF3Aiwed7h34FWMYTIQgHHR005FQyF/KG5iks24ywtuq7OtFBS2Nul5WaqLz
 U7hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=69XXzDTNDu4xiyxUs3FLExppQsXsH2CC0rGdZ2StYdw=;
 b=YYTEKO6xINK6+lHb0P7WPBzqn6Zy4H+IPWn/MpngXbbf/UOGpn3UGz4nmNq4Xyuo7r
 ccCdgZCoSrSdoFhe4vMji30PXnxs2Thz7kzS+3vNcfH83IXqoZSV38crZSu1iu4xts2C
 50BUHqjTMftMAsNAkdc0F4KusxizjxwXb0iKsgs5vNlll+nEmT00GhLn3H1BYkt43Eb+
 M03iLXtyLLQrn/B+Ps25FzulKL0bERx/0M3BCPYEM/qt8AfBqgLKHY90XC2t18167sQi
 E1tNgTLUTrMVsJUB7p6WOvYujgq2/vjz/psfka79EKfdDkd+IjFZFywH8xFezYcd3qkJ
 SphQ==
X-Gm-Message-State: AOAM5333fEbD+CIwz/VhtuIVWJN/VNu+sYcT/jXRKoXJkPbp200V+BbQ
 38jenAw+mZifZz+CfmZForvAdg==
X-Google-Smtp-Source: ABdhPJzWPoG7thGwCEMDyvqUoq7H+qsOBxzDVyJwHgfHGFj776GanS4A8rfpECykC187MetF5+jcWg==
X-Received: by 2002:a63:5645:: with SMTP id g5mr12071300pgm.442.1624055539621; 
 Fri, 18 Jun 2021 15:32:19 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id q13sm8883179pff.13.2021.06.18.15.32.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jun 2021 15:32:19 -0700 (PDT)
Subject: Re: [PATCH 2/9] target/mips: Fix more TCG temporary leaks in
 gen_pool32a5_nanomips_insn
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210617174323.2900831-1-f4bug@amsat.org>
 <20210617174323.2900831-3-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <aaf46e64-f95e-f6b7-c2d0-b0859a61000f@linaro.org>
Date: Fri, 18 Jun 2021 15:32:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210617174323.2900831-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.202,
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

On 6/17/21 10:43 AM, Philippe Mathieu-Daudé wrote:
> Fix multiple TCG temporary leaks in gen_pool32a5_nanomips_insn().
> 
> Fixes: 3285a3e4445 ("target/mips: Add emulation of DSP ASE for nanoMIPS - part 1")
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/mips/tcg/translate.c | 4 ++++
>   1 file changed, 4 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

