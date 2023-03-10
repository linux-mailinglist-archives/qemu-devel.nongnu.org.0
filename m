Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6046B53A1
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 22:59:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paklO-0000pJ-FO; Fri, 10 Mar 2023 16:58:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1paklM-0000ox-TZ
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 16:58:56 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1paklL-0000fA-BH
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 16:58:56 -0500
Received: by mail-wr1-x430.google.com with SMTP id p4so137594wre.11
 for <qemu-devel@nongnu.org>; Fri, 10 Mar 2023 13:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678485533;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bXq1vKK8L2uxwf+L+ZW4J4coQSmmo91yTtL/tJYz3f4=;
 b=UQSR6l24vila5x7QZ7hpqrh7rr5y872fXJ23v0O6GMiiSgMcgAglOb762aMoDAmIb+
 0MapddQkU5gxt5jBnycGF4I6tAkRDF93Aq9nK7gVQrfFzOBgE6KpdG/sbfFENmQQnwZt
 k528fL5wIVGwzOBo6dFJ9r7eVYitCB0DlgeLC5af73RafZY8CpQK2MEne7axkhoGlRwP
 d/T/MWkXw0+7S0wMAyYzMlvp5vE18Y7eKqs/kdF9RdFnHST3KUhf8mYgrLQIGjH/Av+F
 QPWmpYdAZgVD5iUUFT/fXWrGKKq3kQvgOiV5o0fKZRI6GPD2rTOoA8Paqb7ZpnNmvQG2
 JNFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678485533;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bXq1vKK8L2uxwf+L+ZW4J4coQSmmo91yTtL/tJYz3f4=;
 b=YeXBLVtgIUhqtHsHq8r0r3wJAU18swvN8huPhEQv9Q2EMdgn50eWCH5FcLjLmRVoHo
 cz68rxR24X135Nhddniwe7vaJ2ZeUSJW/SMSZCDB2Ih5BBwVQV9O3xxzZos9waqF/6yM
 C5zW1S9kmhYqF7NveesQRub8EcgV/sK5LfGWBA5fLJK9RYZpvFrSfzk4e79QuhAjCQz3
 zkSv/ZqnVwyx6eHxsyaOtryCJNRBP5AC1rDnPRxyLOYOYJCt8Wp+v2j5Wgh+vNMrq4gg
 tDPe6fHRj7WZafIRij6KnLu9DKE3gBx75BN4imExQja9Sl9PBDtjzdQbWu0p3K4Q633T
 zk4w==
X-Gm-Message-State: AO0yUKUy/vj9Jj1PScMHX5XNj+nomAJNGZtNGbRo+28rMUKUJQAGqcPq
 WGEIMJ9cuGwRQ4gQqqDwRNKNFg==
X-Google-Smtp-Source: AK7set9uk8iEPWC8b4/3HWtuiHA1VNlIORcg8VUz+wOpqiGtdpJCLtU3MN4dB4gakFSgIfxzWDFQ8A==
X-Received: by 2002:adf:fc87:0:b0:2cd:e0a8:f2dc with SMTP id
 g7-20020adffc87000000b002cde0a8f2dcmr17687398wrr.7.1678485533708; 
 Fri, 10 Mar 2023 13:58:53 -0800 (PST)
Received: from [192.168.1.115] (116.red-88-29-161.dynamicip.rima-tde.net.
 [88.29.161.116]) by smtp.gmail.com with ESMTPSA id
 14-20020a05600c228e00b003ebff290a40sm1008145wmf.21.2023.03.10.13.58.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Mar 2023 13:58:53 -0800 (PST)
Message-ID: <cd70d227-e83e-ed39-3da3-b98ab10be2cf@linaro.org>
Date: Fri, 10 Mar 2023 22:58:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 06/10] contrib/gitdm: add Amazon to the domain map
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Alexander Graf <graf@amazon.com>, Paul Durrant <pdurrant@amazon.com>,
 David Wooodhouse <dwmw@amazon.co.uk>
References: <20230310180332.2274827-1-alex.bennee@linaro.org>
 <20230310180332.2274827-7-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230310180332.2274827-7-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
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

On 10/3/23 19:03, Alex Bennée wrote:
> We have multiple contributors from both .co.uk and .com versions of
> the address.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Alexander Graf <graf@amazon.com>
> Cc: Paul Durrant <pdurrant@amazon.com>
> Cc: David Wooodhouse <dwmw@amazon.co.uk>
> ---
>   contrib/gitdm/domain-map | 2 ++
>   1 file changed, 2 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


