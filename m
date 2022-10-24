Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B1260ADC3
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 16:33:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omy3q-0006Ri-LH; Mon, 24 Oct 2022 10:04:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1omy3o-0006RD-91
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 10:04:12 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1omy3l-0002HG-4O
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 10:04:11 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 fn7-20020a05600c688700b003b4fb113b86so6750059wmb.0
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 07:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=t8PylLZAFYFtbLbxjl/1A1vME4l9Kv2GmM1TEEcW+68=;
 b=CZWLRWDRjD8aIaDkA7KwlpkF2OzOsh6Rp0UObtG/IoRj24Xh25WZMsMWX/uxsPAmUj
 Rjwi5Pn4iVk6ndkm5yHASsvBg2Hq2ISQCpiHSBbxub7ZI1svHc0lFWSa1Ev5bNIbO84i
 hTCDgAM23VERWu60STKrH31nbydPlc1+M15b2THhwuVour3OQaWW+yMVHFwXE5B0pLhN
 1kvgldGGw4zWWU2qAS8wxAyFj7iqqgFdq6PwwB5wAQk5j0Klkl015+j14RFMgOkLl6Ru
 uoxVqIv83d11V+Qqy4km748du9+ETU1NOwSK1VevoRnT2Fwt8LlCUytRT4qzB45FoyaO
 vrLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=t8PylLZAFYFtbLbxjl/1A1vME4l9Kv2GmM1TEEcW+68=;
 b=7FJXSCgmbpBfOGeRBK1bXjnuGNHb2J4xOYl+bK88ra4rKONHOVD2BoAe1QvLP+lSbr
 KuulUWnKj8iecQi0nb/uhZd3tJ7PDddUS/CPhc5Xq0wudGBM9/679wz415pwSNQg6AZc
 0JBRL1986CvEYaHpQOswaWNy0ewJUVJsqfXafvB8547FqDwPGrm4xBtQiXNbrd7DsT4J
 1AuKCapS7BomRItyrN7OC2TbSY+DRm+apNGignstBz6jJoZiQvvVl+xd3bi8H0pgTe76
 zvZp9Nroju2a1eivZu30yqgpQMXFrBPsPaZb1Du43p5A8VVt1Fnn6xEUeR5H4Z/cn5lf
 HACg==
X-Gm-Message-State: ACrzQf1onKi/9TwXmyfzvIV7zMVtSofyh3d3/KHUPpBT01CIj9dd3PX8
 aFS5KvXhVXwKemsJyF60P1fdRQ==
X-Google-Smtp-Source: AMsMyM54XcKPc3stkwi180wakU1YcOkfzJRLEhzlOymp3m8PZxXzYuaeGB8HksuVM4Oq0Z18coNPxw==
X-Received: by 2002:a05:600c:3584:b0:3c6:f234:852b with SMTP id
 p4-20020a05600c358400b003c6f234852bmr29983577wmq.10.1666620247402; 
 Mon, 24 Oct 2022 07:04:07 -0700 (PDT)
Received: from [10.50.0.10]
 (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
 by smtp.gmail.com with ESMTPSA id
 g5-20020a5d4885000000b0022e55f40bc7sm26351309wrq.82.2022.10.24.07.04.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Oct 2022 07:04:07 -0700 (PDT)
Message-ID: <53e73ae0-6ee2-5a85-cb16-9be6ac1d1f99@linaro.org>
Date: Mon, 24 Oct 2022 16:04:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH 19/29] target/sh4: Convert to tcg_ops restore_state_to_opc
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20221024132459.3229709-1-richard.henderson@linaro.org>
 <20221024132459.3229709-21-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221024132459.3229709-21-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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

On 24/10/22 15:24, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/sh4/cpu.c       | 16 ++++++++++++++++
>   target/sh4/translate.c | 10 ----------
>   2 files changed, 16 insertions(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


