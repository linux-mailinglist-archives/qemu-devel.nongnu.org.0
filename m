Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5082C612E44
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 01:31:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opIgx-0008Mi-Qb; Sun, 30 Oct 2022 20:30:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1opIgv-0008MI-9o
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 20:30:13 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1opIgq-00073k-2q
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 20:30:10 -0400
Received: by mail-pl1-x634.google.com with SMTP id d24so9414735pls.4
 for <qemu-devel@nongnu.org>; Sun, 30 Oct 2022 17:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QHmabc3qDzMnMDqpeXUZkIjApnFFfCqZMif1at/w5Ps=;
 b=z4abOlepL08sv00rhMK1ki/FmVwGwVjFwI+wQGIfO2Pg7Nq/tIgAMRoZs8xethRaNm
 jP+Cfq6ZsnoFkIcr/6ODaLRv9F7+2lXisTjUyU8DUULW7qWd5nioTaVOLuDhoHJpheOK
 thIVSlPUDzDJ8llzSsOg64Gy2kPKmDWyBvSHob+/lFLCLPsboArhUfHtRDjYMdwDsOsI
 XDDto63bEt5MLxITD+BhCDRTpUIPVcfaEY5JBfin/GhLW//wFsg4SJy2wjBh0oPyCt0+
 ubv5LdS4xOcYNF+YM6rOO1ME6jd/WRJPmQk4NjvUFCnDnfz3oiIy/5ue0h3VPwsB2rVo
 LGpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QHmabc3qDzMnMDqpeXUZkIjApnFFfCqZMif1at/w5Ps=;
 b=n2hVPHWCBKZ6p6LUmkYKmIU3lTxyNp+63v16SUVRrtk8R74DFU+ymvQDRL3Ps+IH0K
 RrF81WAIhbZ821LIiLoXLRJTfYhuqcPm38DyhRGKVdYFWx+/5dyWMEjuTfC4/jYAA6Tm
 gFvw6JaPgCsTOfLqxdttH6iaDpWxbqrJT7ZzsBlGHIaudJfzB0b0LRTNpwzpZvzlufvJ
 Ne+ByFD9+j+TpzSPjjb4HLGp8VZVlF4PYTzpOfy6Qq1ur7Kmcq5ZLVyw/Ww3RGC7NvTT
 EOu3Z0pKsvwS6LfN4eqmq0jEDqzjxYkuntSl7BJM5OWzfbkdWUec8sSJ2Q83QEpo92dL
 EELw==
X-Gm-Message-State: ACrzQf2tOtYYMTHLUnwdUiWpENLRBWdB4g3BgnlR2Ryeb4vbvr0cCZC2
 lAviyNJehSXwle857mYcovgQy8pmVFQEvw==
X-Google-Smtp-Source: AMsMyM5upjppXA9YAl0Yo3+PWGRW9tiFzUQf5M1/gBexI6jWtD5cVzcv5tW8X950YI+kX32iSZDbBQ==
X-Received: by 2002:a17:902:b70c:b0:179:eb79:cf9a with SMTP id
 d12-20020a170902b70c00b00179eb79cf9amr11519281pls.130.1667176206389; 
 Sun, 30 Oct 2022 17:30:06 -0700 (PDT)
Received: from [192.168.207.227] ([172.58.27.183])
 by smtp.gmail.com with ESMTPSA id
 x19-20020aa79573000000b0056bcb102e7bsm3178163pfq.68.2022.10.30.17.30.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Oct 2022 17:30:05 -0700 (PDT)
Message-ID: <fd1d539f-51da-4d25-63db-841114267169@linaro.org>
Date: Mon, 31 Oct 2022 11:04:52 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 1/3] target/mips: Set CP0St_{KX, SX, UX} for Loongson-2F
Content-Language: en-US
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, f4bug@amsat.org
Cc: qemu-devel@nongnu.org, pavel.dovgalyuk@ispras.ru
References: <20221029020030.13936-1-jiaxun.yang@flygoat.com>
 <20221029020030.13936-2-jiaxun.yang@flygoat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221029020030.13936-2-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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

On 10/29/22 13:00, Jiaxun Yang wrote:
> As per "Loongson-2F processor user manual", CP0St_{KX, SX, UX}
> should is not writeable and hardcoded to 1.
> 
> Without those bits set, kernel is unable to access XKPHYS address
> segmant. So just set them up on CPU reset.
> 
> Signed-off-by: Jiaxun Yang<jiaxun.yang@flygoat.com>
> ---
>   target/mips/cpu.c | 6 ++++++
>   1 file changed, 6 insertions(+)

Based on down-thread discussion of the manual:
Acked-by: Richard Henderson <richard.henderson@linaro.org>


r~

