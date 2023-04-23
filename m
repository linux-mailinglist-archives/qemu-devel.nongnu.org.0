Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D2546EBE32
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Apr 2023 11:12:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqVlC-0005k5-8l; Sun, 23 Apr 2023 05:11:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqVl7-0005h8-Hz
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 05:11:49 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqVl3-00011e-0t
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 05:11:49 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3f09b4a1527so34509485e9.0
 for <qemu-devel@nongnu.org>; Sun, 23 Apr 2023 02:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682241103; x=1684833103;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bwu2q8vaa0A1hlmXBOrwV3/WsmQJ/wGbWpeY5DOdsfQ=;
 b=gKJ3floUWEQD/c8H+oPkgcfvBuaAl0vasMcpnUi8dBufzp+VKnwi6+wQHXZ3nvTYvL
 uLKtw/6509SfArbiLvX6zwOeuPgMoYUHR+MS+i5RqvdZsEvzi8ykopttwopWS82fY/SW
 zW1dWgNoZcxlsTqdUISXNMd3SoGkm3zcEDi/nRg1muFWTGWe1VfYWJDg7KNuawFWfn63
 /a2+usXe2jaF4Yp/a4YHM0bkXIolDwCLphrXwB/qA6MS8MP6rXuyWeXQyzwjzF2ca/MI
 AS2Mczx7x0XPKDevqkMsQo9ka/lP6WhmfPOcM2wZzyhbt3TxxIcgNaThEWwfcILuEeE6
 tDEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682241103; x=1684833103;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bwu2q8vaa0A1hlmXBOrwV3/WsmQJ/wGbWpeY5DOdsfQ=;
 b=BNJFxvluq+ooWICBDUVpXGLvV1HFJjXkPQXNWaDnlSG80p6EVnQKuGyE4k9LBhBq4m
 kBqPxkB89yyB1EhM1Am2PS7uvugBfB1++jIXJbFKWhZGSMX7nOUjT4oW+7+hrULIcbpx
 Ko2nkd6zAuADLNqhcxEBt2wxohGokR86M+7vujr+Pu3n/ZYIm6Jkd5ljdFReLEO8HhYZ
 ee81CcBCAsRgIVwEuggHm7QWGW/tHL5MCAPR9yVqDPtW1vR9OD5TSEH2aiPQaEWYleQI
 n1gQ36U5QVIHc1nClRKFYXpbycH8rhe4TSGy6ikBaEC4KurCKJFy4VFVDnmR+aqVdu5l
 Mp9g==
X-Gm-Message-State: AAQBX9dMKpknPuKIixqXv8mbDYqkf77hUnXkg4PWk65ksiphyogSH4vv
 yH5GCI7aZxl8hg4W7iUlBnBR0pRAMXj6h/dNOYdpUw==
X-Google-Smtp-Source: AKy350Zk9/CZajtexGf9vpVlVEVXhaZdC+JbVnQC7nY55Yd/CuKnrpJAyOjCFyjHkFQwtN58so0dKw==
X-Received: by 2002:a5d:4485:0:b0:2f8:d224:c1e4 with SMTP id
 j5-20020a5d4485000000b002f8d224c1e4mr7392609wrq.65.1682241103530; 
 Sun, 23 Apr 2023 02:11:43 -0700 (PDT)
Received: from [10.43.4.99] (cust-west-loneq8-46-193-226-34.wb.wifirst.net.
 [46.193.226.34]) by smtp.gmail.com with ESMTPSA id
 g13-20020adfe40d000000b002f8d402b191sm8235204wrm.112.2023.04.23.02.11.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Apr 2023 02:11:43 -0700 (PDT)
Message-ID: <2db33811-690d-1d42-f917-0b4c5458cb90@linaro.org>
Date: Sun, 23 Apr 2023 10:11:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 5/8] accel/tcg: Replace target_ulong with vaddr in
 translator_*()
Content-Language: en-US
To: Anton Johansson <anjo@rev.ng>, qemu-devel@nongnu.org
Cc: ale@rev.ng, pbonzini@redhat.com, eduardo@habkost.net, philmd@linaro.org,
 marcel.apfelbaum@gmail.com, wangyanan55@huawei.com
References: <20230420212850.20400-1-anjo@rev.ng>
 <20230420212850.20400-6-anjo@rev.ng>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230420212850.20400-6-anjo@rev.ng>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.047,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 4/20/23 22:28, Anton Johansson wrote:
> Use vaddr for guest virtual address in translator_use_goto_tb() and
> translator_loop().
> 
> Signed-off-by: Anton Johansson<anjo@rev.ng>
> ---
>   accel/tcg/translator.c    | 10 +++++-----
>   include/exec/translator.h |  6 +++---
>   2 files changed, 8 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

