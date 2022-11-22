Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A17B8634012
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 16:23:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxV74-0001U4-Rp; Tue, 22 Nov 2022 10:23:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oxV73-0001QD-8w
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 10:23:05 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oxV71-0005Zd-JT
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 10:23:04 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 p13-20020a05600c468d00b003cf8859ed1bso11554662wmo.1
 for <qemu-devel@nongnu.org>; Tue, 22 Nov 2022 07:23:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=s2hYXa+j4RWWEy8JAff98j4f0z4f7Tfra0avYPgJJF0=;
 b=fei9cj3UX5eyFyIsRsb7NPcobm79oPUKMTHoegjXCr5tksHgwbkHgxcRHhsYClnhDV
 9tVtoGXDEEDrkBDQUbXb3mJIgyUn2RkYZjywp0yBJquiQz290fEQQb98pVsYTtOtKVLd
 q0aAjx47QmKGTj6EFjOyNUHS0kLPuT41wWUUfzyCOsxk53ctUhYRlC8fObHusmMwSfKK
 o27j4D/VHOgdC+fdhGeqEgNsdWA+VJJTk15eqYvw4829+MWHuYYT41CCWDtpEzkNdJOA
 YbGIR+UVdRiey9eBjlnefAUPHgBeofChpJOJfDsH8uhQO0ZBfZ7nfW1EdzLLGJouzJox
 lpcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=s2hYXa+j4RWWEy8JAff98j4f0z4f7Tfra0avYPgJJF0=;
 b=EDyI4sMDpe5e8v2QfWMKbbRpdOZOD+bNV8g5r9hTJPJgNeka2bFDdj2A06FUZryeUi
 1+K2cgL6lmOdhFaWmBxUa1vVnjdTAYbUE5E7MvqTRV4YZyq6K1v/H6ZUfYOqGQOLMiav
 Sp82x5KcL9YS2zxVhwSGeIORvHSJi/n4dw5mCDrpolodetxd2FF9dd4okjO9wW9Bvu9D
 biiEBfMAyp6bK3IBx4Qz5zceyKsSJrQURqG8XWECSl1CoUCyQVvIhD9+im8UmzDYdtu8
 Gc22Qk/kmJWRG3WwUpekaHvTtVn9zFBR1aEzzYGpATPDHUYZ4kE7j+GFfqdv6pJ+ULJD
 ZEsg==
X-Gm-Message-State: ANoB5pkPsx6nmqZCC9AO2RUH8sI00Xf8sWeTtxQ7wi6a5IMqgfRGuNLs
 2N3P0rzi3/D9/Q4RxhmJqsgiBIEA7LIVYA==
X-Google-Smtp-Source: AA0mqf5q49tAts4HCUnSDpKK41prEEvVLh1uJCELEQxSH4LVziy5I8QbUCB8xPluJZLr52Robawhjw==
X-Received: by 2002:a05:600c:3c96:b0:3cf:a457:2d89 with SMTP id
 bg22-20020a05600c3c9600b003cfa4572d89mr19776018wmb.20.1669130582082; 
 Tue, 22 Nov 2022 07:23:02 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 l18-20020a05600c4f1200b003c6f3f6675bsm24390048wmq.26.2022.11.22.07.22.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Nov 2022 07:23:00 -0800 (PST)
Message-ID: <8d800481-ecba-8fbe-ba20-07b061b2ae69@linaro.org>
Date: Tue, 22 Nov 2022 16:22:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH for-8.0 v3 21/45] accel/tcg/plugin: Use copy_op in
 append_{udata, mem}_cb
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20221111074101.2069454-1-richard.henderson@linaro.org>
 <20221111074101.2069454-22-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221111074101.2069454-22-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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

On 11/11/22 08:40, Richard Henderson wrote:
> Better to re-use the existing function for copying ops.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   accel/tcg/plugin-gen.c | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


