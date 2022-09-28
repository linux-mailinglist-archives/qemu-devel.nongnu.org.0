Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51FDB5EE2FA
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 19:24:01 +0200 (CEST)
Received: from localhost ([::1]:35374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odamu-00078t-E0
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 13:24:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1odaDu-0003uv-PZ
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 12:48:04 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:33514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1odaDt-0001J8-8p
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 12:47:50 -0400
Received: by mail-pg1-x532.google.com with SMTP id f193so12768012pgc.0
 for <qemu-devel@nongnu.org>; Wed, 28 Sep 2022 09:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=zjTRZYpJJ9YN0VJ+QDGE4G5rvyfPXWAZmyhtRugYBAk=;
 b=kze63Vc/k2GQDfUfVjGGterLi9lIFKl+d3n/m3UoRP8NAmBW4f1Fxu5HIvzB3Yk1zd
 jn6MSL+ul0twnxPQrG+nqEwWjnLfJ4Co5bCCLtm1l5fAJXDdyYOH74UQbIE1twfIQSIP
 drLjx+DekHfvo4O0WAgLUBcIQJmefPLxFwGprjo3wuyoBAyLJEU+sJLDnB2R1pUZLpxF
 1dpEtsQAptdN2f+CHGJrAKDHPe/KoODW4vL4X/4sc1lAdW7bUgOZPiw34GJxhlUS8L4e
 YdXA2s5zO8ESyKQTZEJBla4dBZIkuUqjEZvpLuuKXOka/4xu7Eu14C+tkxuZFqPdGdvj
 EDNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=zjTRZYpJJ9YN0VJ+QDGE4G5rvyfPXWAZmyhtRugYBAk=;
 b=QnoykEli0XOROzwzCNoRTvOenpLheRxSDJxIQKSAocCTgLN0wahlcZKSe5kD97plkX
 QDvihYsl0T/RCSNRLSkijEiIld6sKnw3PyrwvsZ4jHtWOtfa1L1DvP4k9/zlhQZ9FFoj
 n4Q1vrwQKw+CI+2R16dCGNH5XrZqQbYookJn9dgvBmDJXvVEetxfPLPYxdGt4+2vLR5d
 vqq/jbX1fquuDmMavxzE9wmPJOsSQoJIC3LWj55FWs2GD0F4UOPh1BY/ORntCp7DZ4tR
 zVetAoFKz0+KCftDLKs/+MMiHd5JP/O9y7RZgRkLMMu5DZL4NC3Q26iXP5NI9m997hog
 GD8g==
X-Gm-Message-State: ACrzQf0WeZSiFMuAspUuiOatPEwJVc7zn5yGTufhBIEl46yRxvIUYxpa
 hYdDdZTL8hWWk2YC5VGjLSJv5ZW+ZmnKQA==
X-Google-Smtp-Source: AMsMyM6Um1qLC+Dw8VCI7VOvZepm3WonMB1woWmF4nP3Q8Fd7MF++LmqYRMYp80ZEQc69xk786dm0g==
X-Received: by 2002:a63:6ac8:0:b0:43a:18ce:f681 with SMTP id
 f191-20020a636ac8000000b0043a18cef681mr29451110pgc.244.1664383667767; 
 Wed, 28 Sep 2022 09:47:47 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:986f:cb56:6709:4057?
 ([2602:47:d49d:ec01:986f:cb56:6709:4057])
 by smtp.gmail.com with ESMTPSA id
 g1-20020aa796a1000000b00537eb00850asm4264461pfk.130.2022.09.28.09.47.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Sep 2022 09:47:47 -0700 (PDT)
Message-ID: <d7ccea3e-04e9-a2a6-a91e-d9a3df5e08bf@linaro.org>
Date: Wed, 28 Sep 2022 09:47:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 03/15] target/arm: ensure HVF traps set appropriate
 MemTxAttrs
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Alexander Graf <agraf@csgraf.de>,
 Mads Ynddal <mads@ynddal.dk>, Peter Maydell <peter.maydell@linaro.org>
References: <20220927141504.3886314-1-alex.bennee@linaro.org>
 <20220927141504.3886314-4-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220927141504.3886314-4-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.319,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/27/22 07:14, Alex Bennée wrote:
> As most HVF devices are done purely in software we need to make sure
> we properly encode the source CPU in MemTxAttrs. This will allow the
> device emulations to use those attributes rather than relying on
> current_cpu (although current_cpu will still be correct in this case).
> 
> Acked-by: Alexander Graf<agraf@csgraf.de>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> Cc: Mads Ynddal<mads@ynddal.dk>
> 
> ---
> v2
>    - update MEMTXATTRS macro
> ---
>   target/arm/hvf/hvf.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

