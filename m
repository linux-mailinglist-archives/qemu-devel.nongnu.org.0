Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0092F36CA2B
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 19:15:21 +0200 (CEST)
Received: from localhost ([::1]:58190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbRIu-0006oE-1V
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 13:15:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbRBs-0001Fx-SO
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 13:08:04 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:35415)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbRBr-0005Cx-7i
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 13:08:04 -0400
Received: by mail-pl1-x62e.google.com with SMTP id t21so150387plo.2
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 10:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=fLaBQj31xl74jxr7ut/cO7FC0BHc16En/d1dIqyqIKU=;
 b=R5tdT0/YIA7JhAtKtpW7it/c46fS856L0MTdbU2wtyt8+HcFKs3EmzSDR3zI/DDZsW
 53c6GAvoXD5bSeAlCoHjMHrJ2khi1A1H0sZu8JoZNL27hGE5DLgoJsfPmrI9NSlXKLJ3
 Lqhm6zrngOSw86pGbIy+HKpnumbGW5qu3ktjkFfY2TFo5HXz4+e3+0y1QIqCUDCEhM8d
 BxyICQVpBas/sqtbgXPqPm7IMsxbbl/54AMkopY7TikQjp2CIGkfAMkD0ArSgHWsSWrx
 clYtSNwDOS8E+ERt1604A3nFQ54C4cgHEYXSL++7UQvKxb0LGU4ymdFgxx7oMFvB5DSi
 bTKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fLaBQj31xl74jxr7ut/cO7FC0BHc16En/d1dIqyqIKU=;
 b=aqv5uLHKI1F+1YLxX0fIYYHsCGTYhKfpXYSryPu5Qum8d40ix9RYByrhik0Zc9w9+L
 WBDEqGNGiwRfy35dVuo6UsZHFQwPxRtu1EN3P6MQHUez9n7XpiK3eF16kB7nl18w54al
 XHGA+HDhHMoibEF8IQlFtjzkWwJy/Kw9pWXpl8RaWVxZnvbAWgyGDKECzvCG7VoylQ0R
 kIAHsA7gt3omD044wgEx8jFo4EcqbQnk89DR/s9sSTAGG2SGjJf44cOekp6Au/9x4Bly
 efyXs6krVCzT7t1xyOibs+9AK/4SMtJmrcdZdjJHbusfnMFouFU8cwdO9IBRYT1YjP79
 ANew==
X-Gm-Message-State: AOAM533rf6DYNGL2MfskmOp1XWEBrKGpJt3zmvDdLzehyN+y9EB8ib8c
 P8hqFPgXn7tnUcgV+Z88mADGhquubsO7SA==
X-Google-Smtp-Source: ABdhPJxOP6RdNPtU5W4zNZOeaRE+iHEU9/32kf9bn1+kQ0TeDKAi+ObXK1YwfBhhqtIqF/HtglrHsA==
X-Received: by 2002:a17:902:b582:b029:ed:562a:6f52 with SMTP id
 a2-20020a170902b582b02900ed562a6f52mr5448628pls.73.1619543281685; 
 Tue, 27 Apr 2021 10:08:01 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id h11sm2754205pjs.52.2021.04.27.10.08.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Apr 2021 10:08:01 -0700 (PDT)
Subject: Re: [PATCH 12/13] target/arm: Make functions used by translate-neon
 global
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210413160759.5917-1-peter.maydell@linaro.org>
 <20210413160759.5917-13-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <49dd69b6-b012-769a-423d-bf031e9470ba@linaro.org>
Date: Tue, 27 Apr 2021 10:07:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210413160759.5917-13-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/13/21 9:07 AM, Peter Maydell wrote:
> Make the remaining functions needed by the translate-neon code
> global.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/translate-a32.h |  8 ++++++++
>   target/arm/translate.c     | 10 ++--------
>   2 files changed, 10 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

