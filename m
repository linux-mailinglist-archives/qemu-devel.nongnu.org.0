Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A399064FB94
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Dec 2022 19:32:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6bz2-0001SC-9g; Sat, 17 Dec 2022 13:32:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6byv-0001QM-9i
 for qemu-devel@nongnu.org; Sat, 17 Dec 2022 13:32:26 -0500
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6byt-0005PO-GU
 for qemu-devel@nongnu.org; Sat, 17 Dec 2022 13:32:20 -0500
Received: by mail-pg1-x52a.google.com with SMTP id r18so3737486pgr.12
 for <qemu-devel@nongnu.org>; Sat, 17 Dec 2022 10:32:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5qd9AJmL9PwC92DpgH+pdVpgelIgBmIGy2bF+HEzbSk=;
 b=sBpxGH0AhD0RL3ufxUI37hLXm9Dp1+N3k9dwWSe24rGyPHZ57/+n/yggaxQghVtb0Q
 lw5pU82T2n5FL2hcZNUmBlot/nnUs/QrvOaliH6LGlsN/Izy+XKEF5kZ09ZrllXpcZOL
 3hb2U15dk7Oqo0KEgXJDnkf+tqCGU0BLvvJbr9qHm3kp5WonZWyne7A1wsGdGZ0Hscp5
 /bnueOMuUu0ew92xFonEgf18psgD/rXfACK42CqeCc0OrH0W+WZTiSM3mEbrWs/toxyj
 bBuVH7vNxIQ0Rb7rFEqQAPOjcLLQx5h5fNdMuh4wZYJXMwYwaPd+POk9Z4DuaXdtB0MZ
 WQzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5qd9AJmL9PwC92DpgH+pdVpgelIgBmIGy2bF+HEzbSk=;
 b=7DmP6zByD3tQ1kGXkhEvfgz4B6l3wEAUn6+5TwI9MpCyMwB1n99VrFZc6ZYPXWdk/n
 vGyOW8aNVXHTpSLgg/oZz+83NoR/WJj8NXVCneR0QxLM/yBey2ZSQfQ0LO6RihszyOaG
 eS4/jDRKo0m8jBfbOsMFWK+QWoFRV0//N1e9ckTW6TelvEzFf22cZ9JVZBzHIEhPskoU
 r3QJsFzhn9k2JLvPyy1Sh+xgJ/11IAHs5v9UNJMi2d9+MFtBxtDQ5qYw6AT0kWoqCUpq
 WSNvlUf8e+oZKp2DmRNn6iz6Ekp/jql/Xw/ZuccvQntMow39cWdwRaIKli3XU3GVnpR6
 n2Cg==
X-Gm-Message-State: ANoB5pnX4WCDq+4uCT+ontX2JRaMDq0ZaFUth1LQGthTuJVj/AjGYUI3
 3mbPiFQzUvqYFVFSL8f+4r9GeQ==
X-Google-Smtp-Source: AA0mqf6o0e1hesxwu/MQ1MYvBb1ZTPnEuhZoV5cKQrRvU87ZQfNRPpvZFrx33GBDfhiz4gOFhARbhg==
X-Received: by 2002:a62:17c4:0:b0:578:43e3:f48e with SMTP id
 187-20020a6217c4000000b0057843e3f48emr28002783pfx.16.1671301937771; 
 Sat, 17 Dec 2022 10:32:17 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:dbe7:d50a:f977:e69b?
 ([2602:47:d48c:8101:dbe7:d50a:f977:e69b])
 by smtp.gmail.com with ESMTPSA id
 f196-20020a6238cd000000b0056d2317455bsm3457958pfa.7.2022.12.17.10.32.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Dec 2022 10:32:17 -0800 (PST)
Message-ID: <7f3bcd1b-0acc-48d0-7010-fa2eab283ac4@linaro.org>
Date: Sat, 17 Dec 2022 10:32:15 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 6/9] target/riscv/cpu: Move Floating-Point fields closer
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
References: <20221217172907.8364-1-philmd@linaro.org>
 <20221217172907.8364-7-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221217172907.8364-7-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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

On 12/17/22 09:29, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/riscv/cpu.h | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

