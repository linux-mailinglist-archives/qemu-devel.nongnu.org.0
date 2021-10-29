Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66189440036
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 18:19:22 +0200 (CEST)
Received: from localhost ([::1]:35500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgUbB-0007ll-Gb
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 12:19:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgUUk-0001dy-1n
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 12:12:42 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:36763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgUUf-0005N2-ER
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 12:12:41 -0400
Received: by mail-pf1-x42a.google.com with SMTP id m26so9695155pff.3
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 09:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=McIH6S40YEVAsznDUEdHwbzEp41PQMkLHAyGYO/Xo+k=;
 b=Hwg+B6vHF8giZ2cZGbQkIAxKZ34a+IpI5yc84KVlqDMPTkyXiDs6ds/AN4btBhHX1w
 WzAaJA8Z3ut9BiX0ZkpD0M+87Z76t2qhrfI77IXzxyfgHuINvQqMJMsE27UNw18HAGBJ
 A9FawbwU6tUYOvhJlOOQE0o9UG8y/t2ZcIRwWfHD06BQuE7wXm3YRNQHDqz4O01GdHB6
 F9XsQnf9PswcJ/qA9fUAYGopxRLzTMeRm0j4dGKLitI8i5LsSqp1VVRb107VXjH0rmbm
 5yE3fjpSDcLkWAQSJW69QjOPPXmC99ohhpMWm/z5HY22KtkP/G/8LinS8BHbDOWQXJpi
 6vRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=McIH6S40YEVAsznDUEdHwbzEp41PQMkLHAyGYO/Xo+k=;
 b=Zi0Fm8xB6yLIsbABSrq1PgwT4pmeG0Bsfu5jLynMiQMa8XjJiMpCogZzyBRcpHT1cE
 7qZGX9nmaq8SDy2BcWhaL+PyplsSWTsN0SQv7atrBKNWzMHyEjwnCkX+s2Tcx7Jjdxg4
 /WWYYop5eM44yYCXbSQRGsYf5KIx33wGfQcEcc8+G+qrhImrRKySuIt8Dg5iQ0ziX+vQ
 44WVx33ZqDBLy3NFsCfUdAfRzQocQFQmDp7IN99ZJ3SsgMNcevyTpYvlGlVTJG65+gq0
 MGKvwToNcZ62Vd9ckdi+dui9VgrPXQOVt6n1yeGQz533mZUYamThovu+2lZOu0S2UoIT
 7hFw==
X-Gm-Message-State: AOAM531JwmtbSWqH/TPUDkOWekSZpdWoFsnmiqlkZoMR336u66EugUHI
 92OOqmlams+Ty0bvYjvOf7IjsQ==
X-Google-Smtp-Source: ABdhPJw4Q3cAW/iYnULAzhLvMvA4CAgTyUGXsN9xE007/PsLv7ybEvHMpxYmUhuWklHIHM0y5pisEA==
X-Received: by 2002:a05:6a00:248f:b0:47f:c4f4:865 with SMTP id
 c15-20020a056a00248f00b0047fc4f40865mr687201pfv.40.1635523954752; 
 Fri, 29 Oct 2021 09:12:34 -0700 (PDT)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id y9sm1945225pjt.27.2021.10.29.09.12.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Oct 2021 09:12:34 -0700 (PDT)
Subject: Re: [PATCH v3 03/32] tests/tcg/mips: Run MSA opcodes tests on
 user-mode emulation
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211028210843.2120802-1-f4bug@amsat.org>
 <20211028210843.2120802-4-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6efe2cd7-3aea-5162-bdf5-d34ecb6539ec@linaro.org>
Date: Fri, 29 Oct 2021 09:12:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211028210843.2120802-4-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.512,
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
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/28/21 2:08 PM, Philippe Mathieu-Daudé wrote:
> The following commits added various user-mode tests
> for various MSA instructions:
> 
>   - 0fdd986a6c8 ("Add tests for MSA integer add instructions")
>   - 1be82d89011 ("Add tests for MSA integer average instructions")
>   - 1d336c87a3c ("Add tests for MSA bit set instructions")
>   - 1e6bea794c8 ("Add tests for MSA integer max/min instructions")
>   - 2a367db039f ("Add tests for MSA pack instructions")
>   - 3d9569b8550 ("Add tests for MSA move instructions")
>   - 4b302ce90db ("Add tests for MSA integer multiply instructions")
>   - 520e210c0aa ("Add tests for MSA integer compare instructions")
>   - 53e116fed6d ("Add tests for MSA integer subtract instructions")
>   - 666952ea7c1 ("Add tests for MSA bit move instructions")
>   - 72f463bc080 ("Add tests for MSA integer divide instructions")
>   - 8598f5fac1c ("Add tests for MSA FP max/min instructions")
>   - 99d423e576a ("Add tests for MSA shift instructions")
>   - a8f91dd9fd0 ("Add tests for MSA integer dot product instructions")
>   - b62592ab655 ("Add tests for MSA bit counting instructions")
>   - ba632924450 ("Add tests for MSA logic instructions")
>   - fc76f486677 ("Add tests for MSA interleave instructions")
> 
> Cover them in the buildsys machinery so they are run automatically
> when calling 'make check-tcg'.
> 
> Start running them on the mips64el target.
> 
> Cc: Alex Bennée<alex.bennee@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---

Acked-by: Richard Henderson <richard.henderson@linaro.org>

