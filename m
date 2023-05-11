Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2121C6FEDBA
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 10:16:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px1RT-00020z-1g; Thu, 11 May 2023 04:14:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1px1RR-0001zC-7V
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:14:25 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1px1RP-0002qu-OC
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:14:24 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3078cc99232so5200949f8f.3
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 01:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683792862; x=1686384862;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6UR7omSJC23ep+9KmD9quOz2QOgLF4W37cjpLQJX6Bc=;
 b=Roh5CARgLg+7bmL8o5OVdVSMddxOE86PPeJ/hrUmQJfmepcQATTPkKOE7H8Ed9nMfa
 /JKRn3/QQlUhROt2iTQJKkGgTsjcRrmCcffde38keBaE60TEomfw2uMDU77Z3hMeLdbf
 p8xFhPNrIKK+9fqz/ncseo8SfXJ+2KQXRvjPysCqjXBpOCMg2Mnh/tTwITAdh7EUZQ8m
 25sogI87ezw//+vFGn3pQcRhOwqcJwI1a0krFohOd/z9D8YERrXfUMXF5pTBZoTKVrOB
 1KOae8VNCRNFaDew2yiloRKwsd7cZDgf8mCirVBlmN3ptnk599671McDZR7bs4y0l+uo
 cObg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683792862; x=1686384862;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6UR7omSJC23ep+9KmD9quOz2QOgLF4W37cjpLQJX6Bc=;
 b=ROecFImOZWavm1KTIBwH6tpdgzJRf5yEy39hbSWpvIgYMp17ldNmvCsrE3Wlu+B9ka
 n27HuqNG/yaK4c4y6q6WUX6szvxVgpW8WmOhRlGHQgL3+xnV3XQWFATPv0eCG7i+juV5
 0p2H4npF+talmRkBwMoD9tDNejRaOnOhzD3YE0brprGTzV3aLK1CXQRDVWoY0Vl4r7Ja
 V7GGnXM6woWgAzdAwTx3CctuT25TXddcFpiOPagOC7V6gCO2o/b5SSA0VAIYU2OoMT3B
 Ll+5fQ2YA4T/FNyfFWR5jNZnPKSuHJ0Ik0Xfxjan6RT1JkXvnmFklE8QjweUzoxUS+kG
 7ggg==
X-Gm-Message-State: AC+VfDwq1mKIk8hzN6IQ1V/db8XO9t9otvxnSH/KxZSWuhd7/hNQaYSO
 U9XCRA+w21MASSrYdf+SabrQOQ==
X-Google-Smtp-Source: ACHHUZ5Sbz3btEkd1mod50vSr6o+XzzuDDLinYtzbLX0X89qgLAbzTyCyZ+MuDLHd8GXc8GvEIXIfg==
X-Received: by 2002:a5d:4dc1:0:b0:307:97d9:d9a with SMTP id
 f1-20020a5d4dc1000000b0030797d90d9amr9194045wru.13.1683792861912; 
 Thu, 11 May 2023 01:14:21 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.161.78])
 by smtp.gmail.com with ESMTPSA id
 k15-20020a5d428f000000b003062d815fa6sm19566309wrq.85.2023.05.11.01.14.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 May 2023 01:14:21 -0700 (PDT)
Message-ID: <9cd0c9e9-57e3-e6ce-3b30-85d61feb9aee@linaro.org>
Date: Thu, 11 May 2023 10:14:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.1
Subject: Re: [PATCH v2] docs/about/emulation: fix typo
Content-Language: en-US
To: Lizhi Yang <sledgeh4w@gmail.com>, qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, alex.bennee@linaro.org, thuth@redhat.com
References: <20230511080119.99018-1-sledgeh4w@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230511080119.99018-1-sledgeh4w@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.251,
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

On 11/5/23 10:01, Lizhi Yang wrote:
> Duplicated word "are".
> 
> Signed-off-by: Lizhi Yang <sledgeh4w@gmail.com>
> ---
>   docs/about/emulation.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



