Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C59873C16A7
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 17:53:38 +0200 (CEST)
Received: from localhost ([::1]:45622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1WLJ-0005PB-Pc
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 11:53:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1W24-0000RU-Hz
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:33:44 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:45685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1W22-0004Rx-Ip
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:33:44 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 b8-20020a17090a4888b02901725eedd346so4029400pjh.4
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 08:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BK03VX+kJw+d9kggIaXCdPcY3tslUD5zXvhzEjqTjpg=;
 b=Hdhab6m8TDuvdd4+gIDYMCevnltoJeIMWq8qP6zitJnSeikJeKrfnZPvI/hssgicIa
 X6pb3uSVgZYGKUXCV9JqByplH6Us9XHde8DeD+s8RlnRSn+0tD+r0yLIUwdp6DIU+j8i
 8kJwmPPgz+oXy4axrJfMYM8rOrscXWiWw/nKQvTZkKEVI1Kgi7+sT0cTHScv0Sb90+ft
 EWPkBD0oxJh2foBO/twLuz2h9V7foP8N6gjpSYpHDO1vo6ZnVy3b/8Y7ODqoQCUDr8Wl
 9o3zXrwZyndPRiRBJQatw8fKN2srKTQmM3rJWa0DNqdXZtMJeLj2nTdHX47BACc187yw
 oSjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BK03VX+kJw+d9kggIaXCdPcY3tslUD5zXvhzEjqTjpg=;
 b=Timd5kDZUYI+ADgDRXS0BXYw7fTgIOuc9/gflnWIQgWGuTYjpyuUxNUsmopKNtuqsI
 u94r60Sppk7A/bTdQEmzxnNIW9uHux/qeWMYSVWesg0HiqmzLkRV3qW2PoFoydjVY4CO
 zYJFsjoAqONWKUUSm++aDl9AEK0YcXd0WYH0pNhb5gcrNnmStANcpzwL99fXTKRWKjjv
 PHGdcZ32F8I2m3w1KJKMNOYOUMpDRa+HlvlR8JeiTnWVORodF87orMyfB28gLDo/UevC
 o0Uz3yegEkBfj7n6SnQDSxccBIJr2y0Ofhs+3KLMIkl1DsjVCag5wV02HfGWv6LAd7Cc
 eWow==
X-Gm-Message-State: AOAM533Tt23uN8XIYbwGgjUzAw+//6qrn4ZFLK9ZfeFuXNWku4xzmN/r
 1jGgyh6If0osqTrPAHsVW6OS5w==
X-Google-Smtp-Source: ABdhPJx0bNJ0T8EYFBDqGtNmXCKzZwq5dy2VNjTMdTeHyy0+Pu3juuWK7CxxHbfuyOPUKG0wkxF6FQ==
X-Received: by 2002:a17:90a:3d0d:: with SMTP id
 h13mr33089109pjc.20.1625758421294; 
 Thu, 08 Jul 2021 08:33:41 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id 202sm3288088pfu.113.2021.07.08.08.33.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jul 2021 08:33:41 -0700 (PDT)
Subject: Re: [PATCH v2 1/8] linux-user/syscall: Fix RF-kill errno (typo in
 ERFKILL)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210708141121.1731691-1-f4bug@amsat.org>
 <20210708141121.1731691-2-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <78d3bf63-aa43-d248-5248-a19dbeaa6422@linaro.org>
Date: Thu, 8 Jul 2021 08:33:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210708141121.1731691-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
Cc: Taylor Simpson <tsimpson@quicinc.com>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/8/21 7:11 AM, Philippe Mathieu-Daudé wrote:
> Affected targets: alpha, hppa, mips/64, sparc
> 
> Fixes: fe8ed7d5794 ("linux-user: Handle ERFKILL and EHWPOISON")
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   linux-user/syscall.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

