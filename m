Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 601A43ACE3B
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 17:04:40 +0200 (CEST)
Received: from localhost ([::1]:56106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luG2x-0007pu-EM
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 11:04:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luG1f-0006Ov-8E
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 11:03:19 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:42808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luG1d-0000Pq-MF
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 11:03:18 -0400
Received: by mail-pf1-x435.google.com with SMTP id y4so892324pfi.9
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 08:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1i7+75mqoGcz7mCqJk/Xhd/6L13uMh9ZDpWPc4DdtZc=;
 b=UKJJUyGQkvUbPdD0vkJ1buczsV6Sxa2qpcj3B31bbf/gv6ls733uL0pRLNerVtz6fO
 LQFpDSXy2E8my7Id70vhSvKLRELz9X96jnOYbKdbk3pIkn6ITY2KP6wJMkSCfWlEl+Lu
 ZCUP0UzG/qXVLO04stYMVbaciQ3nV2SVGpF8KGAl/ndl9QpTjZhz+zUz9x9wDqTI2Ona
 K7forrYkBwpcjjK/vj9R/4XmbdxCppinf0wxYrEa13aGQpgzo4rivN6tWO9WEF3d/8iu
 ZoxYdExfZFZliaHhSioSxgrIQyCnz8bTPfCpjIUeMZr8SP6IgrjMvHKZw1tHjwRhRPHU
 0v/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1i7+75mqoGcz7mCqJk/Xhd/6L13uMh9ZDpWPc4DdtZc=;
 b=lgPs91D41QWTo6SNHhC4LTvjDQY1zLptOuFKnqui8G05LGKxmy+QIjE1aOT1cELLjX
 ewjAb7QK7Icim4jwIDjxo0jpYaVJsbv8cthODK+L5LxT+z1I7FltcJjApawskUOm3hMH
 ii9bk+xiv4KfIr99x0ec361BANlLH9MURZFrCh1vcoS5Q/HwV5ezPivKvJlTcNQE8RSk
 xyBxLq9t3IHgLgBWndVCz8MKKo7+45behZsJuMBBYzY58yJOM37yQD7VrdwyT35R0onb
 1l3QQWH19b/ao16VgzlxOC3uyaD5M5nQ818xIY+LfwVPzyL4T51YCbpeu9nHeOogsJFP
 hcLQ==
X-Gm-Message-State: AOAM532EQkxZtlsLA+z+6D2hWrIPvGgYLmmxTpQcNybpvUzydFcV1wO0
 cWTSFD9cxq+Be4NgIlmJRnihBw==
X-Google-Smtp-Source: ABdhPJxPFSp+TTLU3aAEfbfvNwVhickyLtpYrt/eHjAoBXKBTmJZaw7+jgozDu6Yxk0bGYkIB3uO+A==
X-Received: by 2002:a05:6a00:bc7:b029:2f5:7bdb:f694 with SMTP id
 x7-20020a056a000bc7b02902f57bdbf694mr5561531pfu.41.1624028596369; 
 Fri, 18 Jun 2021 08:03:16 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id k8sm8396940pfg.185.2021.06.18.08.03.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jun 2021 08:03:16 -0700 (PDT)
Subject: Re: [PATCH 2/2] target/mips: Merge msa32/msa64 decodetree definitions
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210617174636.2902654-1-f4bug@amsat.org>
 <20210617174636.2902654-3-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e10b2d54-8821-2538-d9f0-28f9afc09adc@linaro.org>
Date: Fri, 18 Jun 2021 08:03:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210617174636.2902654-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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

On 6/17/21 10:46 AM, Philippe Mathieu-Daudé wrote:
> We don't need to maintain 2 sets of decodetree definitions.
> Merge them into a single file.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

