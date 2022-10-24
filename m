Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E56960B127
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 18:16:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omxJw-00079i-0y; Mon, 24 Oct 2022 09:16:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1omxJH-00079M-Lv
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 09:16:07 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1omxJG-0001sl-8R
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 09:16:07 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 az22-20020a05600c601600b003c6b72797fdso6597659wmb.5
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 06:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5SUFewXY6TWXf/s4gy+gCECUmOlf/s2PFkKhK/LQ0/o=;
 b=sjWTEvDcF6gqK9mT72bygxd1xX2tOsBL9z+qBYQriTnEZHzGSr+eyz4ShTL/bZCM2n
 Vgj9l7ojgnvIq8XFsxVCG8mZ7P17ASxj5zatbZ0sS4FI9aKIohz6o60IiopGknvpNivz
 2h6BQGb5yyVNoEGOKLIl0qT3uJeoDI0o9DA5xlhm+hm5O6ven8g9TMNWOQFba419lt29
 tXFfE788FJQAW3e2ChoTCbEEtYpy/V78Abi6RBorlaAqRBkPWPmm4BujnprD5ElfoFdX
 DsgliT9gSFLWID0zbWLlFIiOBTN33GXLl9w8Mwxy8Kir0mNuq2fAYPlwAQuKIJNFFJ6d
 W+kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5SUFewXY6TWXf/s4gy+gCECUmOlf/s2PFkKhK/LQ0/o=;
 b=YJ0E7YzXGfL9MruDD8XdcR5aRfir+n7rbj2evrI3iWocvoYXqHW5eT2RtPQ/6anrFL
 bOiXaZH0fkSXybY+ntA6DVNqNZNNI3SGRyEOXj2j0M1CbmL87aczYwosNrVAKtbUJP5F
 XdRl6ywLc+jXEBMu3zvslDooyeIzWBzijueCTyBXCWpN/pQeV5CIv+M9sxQoCsbXaQmK
 v7qIJcH2q10BVMwkaiO9nPUIJVhNrNqyVnhH1Cmcn+TgsHFrbQEqXWp1+2TtayHn91/F
 YbrzLL8sDS5ii2q7Ypgc2Ry59PFGiuYen/w5FvOF1KOjSO7sa9GuYY8jpFDC7fofRBgY
 rxqQ==
X-Gm-Message-State: ACrzQf0QWJnMDLzG9wtIR0ZoRprLkc1SKeAfEvJtT1/s4Sj+W30RVaci
 viuBDlCL5E7pUxLIlECPiqv/Hg==
X-Google-Smtp-Source: AMsMyM54G2UzQxnBbUTzZERCE2L8CUIEcU9pcFrlc/mgxobpN4wuIxnsYOJkVrw1j8Gv+xSAIPWc/w==
X-Received: by 2002:a1c:2543:0:b0:3c6:b7bd:a474 with SMTP id
 l64-20020a1c2543000000b003c6b7bda474mr41026877wml.95.1666617364969; 
 Mon, 24 Oct 2022 06:16:04 -0700 (PDT)
Received: from [10.50.0.10]
 (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
 by smtp.gmail.com with ESMTPSA id
 n34-20020a05600c182200b003b3307fb98fsm10652542wmp.24.2022.10.24.06.16.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Oct 2022 06:16:04 -0700 (PDT)
Message-ID: <faad5069-a2d4-f00e-0c62-430a423a683a@linaro.org>
Date: Mon, 24 Oct 2022 15:16:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH 2/9] target/s390x: Use a single return for
 helper_divs64/u64
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org
References: <20221021073006.2398819-1-richard.henderson@linaro.org>
 <20221021073006.2398819-3-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221021073006.2398819-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 21/10/22 09:29, Richard Henderson wrote:
> Pack the quotient and remainder into a single Int128.
> Use the divu128 primitive to remove the cpu_abort on
> 32-bit hosts.
> 
> This is the first use of Int128 as a return value.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/s390x/helper.h         |  4 ++--
>   target/s390x/tcg/int_helper.c | 38 +++++++++--------------------------
>   target/s390x/tcg/translate.c  | 14 +++++++++----
>   3 files changed, 21 insertions(+), 35 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


