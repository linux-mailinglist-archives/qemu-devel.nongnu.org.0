Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 725773AA365
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 20:42:24 +0200 (CEST)
Received: from localhost ([::1]:55004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltaUZ-00032C-GC
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 14:42:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltaSQ-0000Lm-7l
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 14:40:10 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:33558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltaSK-0002YS-SA
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 14:40:09 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 k22-20020a17090aef16b0290163512accedso4107744pjz.0
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 11:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Wi9dtg6dqHGmvVeUbJTInSqlvtEFX5PRX+UAaaymi6g=;
 b=z5dFkxB2dHLQozVxlrUKeOM/MjU7Lk/0ZCfLEejE9p7wVIh2d/wH511UYyMmlETimd
 1PyJfnzu1IlH/NptQBsOONdyza1xL4gEfQPoVwvdeQCJ6nSCKdcx4NtADndZa5mWyMJH
 597zxkltdmCbvw1mnvoeVQPrr/NJJj2A+e3JXzj7f0ceCXdEa5WVu+UAyJ4rSqz7bqnd
 05PH6SS70LcKyNe97xmAZDEoIbmiTYPkleOP6fPDmTpp/DlxYmaBThkdkSJ4j2J2HNxD
 h0N0eaNaWQp0AK5H9CRHw0S6Pg+WV8AAD7W8az67FQTD02HcXo5EZsiVBQG4gR6B4Crc
 3j9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Wi9dtg6dqHGmvVeUbJTInSqlvtEFX5PRX+UAaaymi6g=;
 b=gwSEgXnWzGodkBe2voPj2z+YDlH1pYUFXEeiuz7KxNqz3GWpV8RqhvvXJOB8jnuN2Z
 44vzyndqnI20EpQST2v80jVao4+D0McZ+Xv3hZJ7n65ZJBMCMeYoJU/VqZUvmSg/28Ik
 gSzsB5OsyTCVhW1ZqbdCR2xY2de8mcP9msBuRP0E7x9kBnkIR50/78k4nHEdVex/+HOc
 x6/BkCNrOMKZyUDmEFp8nz9EUs8+VXZgCZCzFf+rdRpS7jwZpJDkf4wtN96oSvGL5Zf0
 OSDvdLCVMAFGW0Qh6d9Txo4vnCVwY2uz3iUU7hpgPCsW4bm9WZaIXGh0O/q0G9zneMyb
 boCw==
X-Gm-Message-State: AOAM532vAvWz7rhNELDrIBoRDIYHd/4IbQ2DaPojNej5JQ4h05dUDzHf
 Unss6jTEBX+wGAOTTx8xB+Shbw==
X-Google-Smtp-Source: ABdhPJyDgQEm8Erm2SAqJAafnZJlyW8cvyzI0BoV1TgeCN5w+6anVQHxyXb20whfgQ249QIPMpOB/g==
X-Received: by 2002:a17:90b:1489:: with SMTP id
 js9mr1171801pjb.227.1623868803167; 
 Wed, 16 Jun 2021 11:40:03 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 18sm6202443pje.22.2021.06.16.11.40.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jun 2021 11:40:02 -0700 (PDT)
Subject: Re: [PATCH v3 04/13] hw/display/sm501: Replace i2c_send_recv() by
 i2c_recv() & i2c_send()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210616161418.2514095-1-f4bug@amsat.org>
 <20210616161418.2514095-5-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7086c819-b508-6d3c-bb4b-cece62437679@linaro.org>
Date: Wed, 16 Jun 2021 11:40:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210616161418.2514095-5-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.17,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Corey Minyard <cminyard@mvista.com>,
 "Signed-off-by : Frederic Konrad" <frederic.konrad@adacore.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/16/21 9:14 AM, Philippe Mathieu-Daudé wrote:
> Instead of using the confuse i2c_send_recv(), rewrite to directly
> call i2c_recv() & i2c_send(), resulting in code easire to review.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   hw/display/sm501.c | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

