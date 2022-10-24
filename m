Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C004A60ACC9
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 16:15:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omxN0-0000Yt-IS; Mon, 24 Oct 2022 09:19:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1omxMr-0000Yf-Em
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 09:19:49 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1omxMp-0002WX-Rv
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 09:19:49 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 l16-20020a05600c4f1000b003c6c0d2a445so6606837wmq.4
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 06:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IaeCsEJi7B8npftPF4xkaOaYsiQJ3MD55wxoXZDHEmQ=;
 b=ZIh3NBm+VkFUdlbxlvvnbke4i4xap5fmK1nK0wA/gLtyfU9zpURhkPdpJdtnZCIaGO
 RXYHursiSGwNIEXZZQsytlJsF+qWIl5WIlmUmZmCQpxwtTu6Y81MBLh42L33GaAaaqFJ
 aoHNz/GAw7D8TDgfkTf/800DVO34L7ZoDGn5BjDUwks4rDaYbfg2L1MBzDwLe4PgAIbW
 j/Fv8CoiaclGAxVhWAariBWzOQOmBe8uM0Qnn3xJXqPtLKnV0cP1GU6uWcKxej6kMz2m
 0Tjt7OJVqjwIJ/zSiSuc4wmaq2ZFuWPUIvqM/uIIOXCo6ip/Y4aLLPY12buXyp5Jmxuy
 f15w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IaeCsEJi7B8npftPF4xkaOaYsiQJ3MD55wxoXZDHEmQ=;
 b=TY2r8H1gRmQC/Bi6/yBbzTfqcjA8wCas4mRwp586iRDKqakCszFVFfHE/TSGEnepDO
 D8mna/LIHgSvYqN3JBjIDhyYcMkgUfPFTtpX0zXTjAjw/mUuTPIYr/sUUgAf4bjNlbYZ
 GC4AmmJBCuGsNp3QNcoVGD1NfQsZ+ZNxYKj8PuxnPmc/COgm3J5vy8Pg4a0qzGNjP+PU
 CxorTSiJJowNOS+6ZUYDhTca3GMR0u7w2XrBiDDxHZVJGS3fNDYU9IjFOxnWaAV9tBr+
 /4CcC+p1MQlO8NbA9lfBF96cEFu/Ss7Qbs+xCJcz4YFilhvpQblyta4PclJLjfptaTi/
 H4aA==
X-Gm-Message-State: ACrzQf26STaJEQeufUsX0IwqPG9l1BM5vO8W8QUqf9WopHrQhAIyE0ui
 Zb+qdp2bC7+/50shuvIodnAV/A==
X-Google-Smtp-Source: AMsMyM7OiimNTd2OSdQSM8znWgxwrBRTmFlgY5KyHANbZFVFET9aYwpa4XsT9P80YmdxXV7jA/xlLg==
X-Received: by 2002:a1c:7c06:0:b0:3c6:cc24:82c8 with SMTP id
 x6-20020a1c7c06000000b003c6cc2482c8mr21580085wmc.180.1666617586039; 
 Mon, 24 Oct 2022 06:19:46 -0700 (PDT)
Received: from [10.50.0.10]
 (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
 by smtp.gmail.com with ESMTPSA id
 u15-20020a05600c210f00b003c65c9a36dfsm10722200wml.48.2022.10.24.06.19.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Oct 2022 06:19:45 -0700 (PDT)
Message-ID: <4ada42d8-80ea-e768-a332-ddc077bd9565@linaro.org>
Date: Mon, 24 Oct 2022 15:19:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH 7/9] tests/tcg/s390x: Add long-double.c
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org
References: <20221021073006.2398819-1-richard.henderson@linaro.org>
 <20221021073006.2398819-8-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221021073006.2398819-8-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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

On 21/10/22 09:30, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tests/tcg/s390x/long-double.c   | 24 ++++++++++++++++++++++++
>   tests/tcg/s390x/Makefile.target |  1 +
>   2 files changed, 25 insertions(+)
>   create mode 100644 tests/tcg/s390x/long-double.c

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


