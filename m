Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EEC044014F
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 19:31:40 +0200 (CEST)
Received: from localhost ([::1]:47108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgVj8-0003Tv-VX
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 13:31:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgUxF-0001hs-PZ
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 12:42:09 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:37812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgUxD-0002O3-T7
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 12:42:09 -0400
Received: by mail-pg1-x532.google.com with SMTP id s136so10411046pgs.4
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 09:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Jbk+keCg9LR8OuZEwk1VAc+UI7Okf1Qypzi/IUMy9bU=;
 b=gSfXx1uZMkUQpvmtBeqh8zKcBceyjjfKqCsF4jvlK/ZJWgLocXPii/Q7tNRM+vxlVC
 ip2ZIm8QSsRBh4NbxncJAipNdaYZEqC+GYo5CV4O+Rw3rFtHc6qPKxlnmqET5Yp8Jx4G
 Z03qSY3WxabI3Prq1MmjvvUMB9c/GzJjdV9XwlRdc+X8pIb2hSBuirlCtevEITPIRz16
 3BdLZtRMRUwv4O8jQCGyI5eRZZ7bpZY38jhfXtxzuQOAZmIhwEcKkyMGGTQIkgg2Bi8x
 U72dUos0awOf+CGKQuR1QlsBIMi5PIG3jiV/t3CN19O/uEAL/g6HygTrEJh0WrmbP9JM
 V5Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Jbk+keCg9LR8OuZEwk1VAc+UI7Okf1Qypzi/IUMy9bU=;
 b=j1GATkt5T7GRREGmdA/yQa9e2iGHJESN6z3KEsRi205AsdbSWwx7tuTQXronobArfW
 aZnzqL8quMqizipCyFx+FFU6TxK8ABqN0owchA5km7xkNtpbS2e+ixLQ5RsHCAktzVro
 c80OnBIwHnIodURhIoUiRw3dRTzFrsMe3icxxOZBCdN5sMNUEHtETIQLra6G8o8ZO5Qd
 duItW/XTY0hPm6YGLTwGbbonBA92S746uZ7pxI9iiIpNwtZYQ7ZtUKbKju/er8kB1gUy
 7CSwJ7Aga7m3jG0V0UbqUQJvl1qmyj8kAl3iK0BGPEzLAsnW7W8jDSxlyGyor8iR6I6e
 tgaQ==
X-Gm-Message-State: AOAM5327568sGQ7C8rxD0hgj417D3kykpK3UXlU060XiX1zt50vYh762
 CxZaO2QcGGJOtCU9hsHOdA5GeA==
X-Google-Smtp-Source: ABdhPJzScTNHGxlsAIenbsup5vkkLi/W332+dM+85J8LkpvOoEN7/jvyVbC7W9jE5wVtWRxfopznWg==
X-Received: by 2002:a05:6a00:26f2:b0:47e:69aa:4be with SMTP id
 p50-20020a056a0026f200b0047e69aa04bemr5332008pfw.50.1635525726366; 
 Fri, 29 Oct 2021 09:42:06 -0700 (PDT)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id d19sm6148411pgk.81.2021.10.29.09.42.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Oct 2021 09:42:05 -0700 (PDT)
Subject: Re: [PATCH v3 25/32] target/mips: Convert MSA COPY_U opcode to
 decodetree
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211028210843.2120802-1-f4bug@amsat.org>
 <20211028210843.2120802-26-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b706d2b5-bec1-8405-3e6c-7ca1d38c6504@linaro.org>
Date: Fri, 29 Oct 2021 09:42:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211028210843.2120802-26-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/28/21 2:08 PM, Philippe Mathieu-Daudé wrote:
> Convert the COPY_U opcode (Element Copy to GPR Unsigned) to
> decodetree.
> 
> Since the 'n' field is a constant value, use tcg_constant_i32()
> instead of a TCG temporary.
> 
> Reviewed-by: Jiaxun Yang<jiaxun.yang@flygoat.com>
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
> v2: Add NULL_IF_TARGET_MIPS32() macro, use array of 4 functions
> ---
>   target/mips/tcg/msa.decode      |  1 +
>   target/mips/tcg/msa_translate.c | 66 ++++++++++++++++++++-------------
>   2 files changed, 41 insertions(+), 26 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

