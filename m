Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF534FE3F8
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Apr 2022 16:37:05 +0200 (CEST)
Received: from localhost ([::1]:43612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neHdg-0002jI-Qd
	for lists+qemu-devel@lfdr.de; Tue, 12 Apr 2022 10:37:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1neHaX-0001om-Gy
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 10:33:49 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:43628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1neHaU-0003wE-OY
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 10:33:48 -0400
Received: by mail-pl1-x636.google.com with SMTP id d15so16927461pll.10
 for <qemu-devel@nongnu.org>; Tue, 12 Apr 2022 07:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=AsQbGBuBH6fLOVzdB9zD00+0+ML6JRYnNy2dbDI1XPg=;
 b=yfYGXppsRxOcp8r1i8ONlC9afuZUWFJW7o/FH7cd7KxksamuTmKDfMtfA2oWW0SVfj
 m7anbG0j4Z7QCX7JJQ3Q3eL7QPeqyeJoCJomhTYJJVLvs50x4nHb+ZXG8ug1/+0Ad972
 56Xb1P4oVLOEFe8u01wR207ShQybXWh5gxHj7jXiZCyx1usCIYWUBhCXCp9DzLmxFDHl
 hY/43PPGWkXPZvZR360HJywZ1T+5Wy6MsHPNWfACFF6Ra795/UbRe7Hf+5bdJreLQQEP
 viw9mh/gL6DYpjNHMIvLrilsUjFRZBr3McQEI0p4O/iceUaPUjC7RWEIvYdyjDRXwnJX
 g/Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=AsQbGBuBH6fLOVzdB9zD00+0+ML6JRYnNy2dbDI1XPg=;
 b=RvOYAxHPnqJU9ytGK3fzZD3hfNDudQ2Ipu4JnD8j+mWwh9oQaDYQHzQFbrSRH8Dbg/
 7pfAgS97ppwGTQ9YpTAKpbl3k7PNm0IdMESqv9xFVjaZefWLay7vifQ7/kwybvPAXM+v
 5B3jM4AyiR0ZgcBe8Uk1h/bWUBmn56w0HbwcLyokuo+dDSvQQAxqe8Xosa0XaCj6tw0e
 xGW6Je8YyUwAnyCIt0KtphOWDrw0spxGx7FBZYdK3o9rDhyle/UMt+X1R/R1dYGKkdzy
 FSGqlptbEnMCv0SiEVnGEJOulZKGGuNKGnJTNRsDAi01BKLMgI8/BI31ASpKWSJmZ/f5
 OlEw==
X-Gm-Message-State: AOAM531gB+ypYrSXjAaYaN4ET60aWmqFg1agPdH03pKLeYpvnEk9eKzj
 BDsBNHDaMlXrsd7ZZpY/OBRh6KUYMsQ9lw==
X-Google-Smtp-Source: ABdhPJwnRAKJT2n54RXJo7KFioL3ect56RK4hZLsYg1Ce3hBjScH1vSVtsxYOr9atKmyD0thCo/6rg==
X-Received: by 2002:a17:90a:b28c:b0:1ca:a055:12ac with SMTP id
 c12-20020a17090ab28c00b001caa05512acmr5296337pjr.215.1649774023127; 
 Tue, 12 Apr 2022 07:33:43 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 u25-20020aa78399000000b00505f75651e7sm3031273pfm.158.2022.04.12.07.33.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Apr 2022 07:33:42 -0700 (PDT)
Message-ID: <a958b361-6226-c5e0-8fbb-ca8ce86f323d@linaro.org>
Date: Tue, 12 Apr 2022 07:33:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH for-7.1] target/mips: Remove stale TODO file
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20220412113824.297108-1-thuth@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220412113824.297108-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: qemu-trivial@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/12/22 04:38, Thomas Huth wrote:
> The last change to this file has been done in 2012, so it
> seems like this is not really used anymore, and the content
> is likely very out of date now.
> 
> Signed-off-by: Thomas Huth<thuth@redhat.com>
> ---
>   target/mips/TODO | 51 ------------------------------------------------
>   1 file changed, 51 deletions(-)
>   delete mode 100644 target/mips/TODO

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

