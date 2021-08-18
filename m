Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E6A3F0DDF
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 00:06:49 +0200 (CEST)
Received: from localhost ([::1]:50430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGThw-0000gg-4J
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 18:06:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mGTg8-0007lE-36
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 18:04:56 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:41540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mGTg3-0006Ra-PQ
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 18:04:53 -0400
Received: by mail-wr1-x430.google.com with SMTP id x10so5769186wrt.8
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 15:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7+nBJJjpYnL6WVXtifAUzUowNJRNuL55cnlBddqb6Ag=;
 b=jNopCSR+twEXQiCAJt8YwMoHWtkMjc/ihovaka5l7ZETzbS8bDGlEy0bu2sKrbTQV/
 5S382aYCF0bYYNn5OIkxpZJWgKdbdw1cLCtc+mwEFLBcJcTciNObseZNR3tHzLAHlKy4
 TSDWeqjrQut0inZdcZgRSVa+k5o7NmzZKO863JVwzQGTO5gL4cO8U8wqH2m/LboHJnGM
 ex6NRpZD6b2tdCO/7xJ05TUa/JRHFDzg9XQUarhMMKgBWS82b9bDg2uKgjB2Dz2RYAxs
 RrmHE25Ny0Hx4yPB8x3akfHc0kKmeOTHg4uNvUtayDWuOxpQIdVtoLy+VagjOunXD0JN
 9PlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7+nBJJjpYnL6WVXtifAUzUowNJRNuL55cnlBddqb6Ag=;
 b=MSqxzKrTSwKkA8YhG5P/T4cYk08vL2pqxruAIp2xZnlFqV4w+yYb+cvlGarnQb5fvM
 +9PpJVjlPHw3TKYwsTTSRQA9CZs7DOB5PueDVvxSIOsBgmgSdlpSs863qWCt6LoYsiAX
 rNBgWZQonH5/DbPOdmtzhFxyKFZ3lQePYPuiSjWPKZ1ERJlI9DwKPT2srkGmgPofoL8K
 r3DRW1WMGU8Kyj9RzCVyTPBgF/dneIKCPTLx7nNSTfZvQ4vZXAEXD2oR+vkIlIhSwNir
 TdFkaCuS3iOtDgl6PTr2Sg/+ICPVUDmJhKPHB2GbwFWervf+FlY3RmMZtVMTP7Zj+8zZ
 sRvQ==
X-Gm-Message-State: AOAM533baAfRFopWiF34BrKswM35E3NVHIeyy8+3/m3e1171gumSpYk2
 riGgrlfoREgmFhfQ1ZvhpY4+620go0o=
X-Google-Smtp-Source: ABdhPJyvijjDVSxLRjC7KKrJMDHuIABsCfu/+iqdUAJ384dtM73S9lQ5CiAS1P2yK6LoQHY8Is513g==
X-Received: by 2002:adf:e6c4:: with SMTP id y4mr13007707wrm.220.1629324288127; 
 Wed, 18 Aug 2021 15:04:48 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id c190sm926999wma.21.2021.08.18.15.04.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Aug 2021 15:04:47 -0700 (PDT)
Subject: Re: [PATCH v3 11/14] tcg/arm: More use of the ARMInsn enum
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210818212912.396794-1-richard.henderson@linaro.org>
 <20210818212912.396794-12-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <9f08d338-088d-c0b2-77f4-612601a40161@amsat.org>
Date: Thu, 19 Aug 2021 00:04:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210818212912.396794-12-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.961,
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

On 8/18/21 11:29 PM, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/arm/tcg-target.c.inc | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

