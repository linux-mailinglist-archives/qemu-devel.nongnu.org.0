Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2F17014ED
	for <lists+qemu-devel@lfdr.de>; Sat, 13 May 2023 09:27:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxjeL-0000Ov-OK; Sat, 13 May 2023 03:26:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pxjeK-0000Og-6K
 for qemu-devel@nongnu.org; Sat, 13 May 2023 03:26:40 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pxjeI-0005fu-N4
 for qemu-devel@nongnu.org; Sat, 13 May 2023 03:26:39 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3f423ac6e2dso50381835e9.2
 for <qemu-devel@nongnu.org>; Sat, 13 May 2023 00:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683962797; x=1686554797;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=38vAQsS9Pg104C4fhaluIxHULL7vICvxFQPaDzfZwsc=;
 b=VGwkR9hPizwAKrmDOZu09d/ztkcnZHcq3S2TNZdxINJ+PfpHQ9BD1tZaWNIdVlOOZG
 Ty7zn+8W4/O5YpM93WOHrCKprQJgRlK6jAbpcDU6OZH0xe/WcAaNf1z7fc9L3hCPabiN
 Qb9oN+wDpByiVIs/tgKiIXEda3buYPXijZQIvZXUh4GDp8vnJ8waKOBl0/pfNKTCEHss
 Sat8/r0sm0wBYVFsX6VeE+/g09Bx1qrPXdUID09rfIBJjNgwJaMiA7LnQqkt9uwl9QWY
 in/iEqvV4tPVlmiSeSmpqcTcZB57jhHDKtMgVCSLa00E4uiWfi30Ux5JPyPjD9rlJdoU
 xMJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683962797; x=1686554797;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=38vAQsS9Pg104C4fhaluIxHULL7vICvxFQPaDzfZwsc=;
 b=T/V0SDDn71SVBWjsjPQiZokW17xxKSbxjKxROTvukzyEsNXFRVv9/46lG+AdDrPT9e
 MpCVZEOedQfWjunDVEsR3Xl3fl7pTdgNzZVRMBq5bwGY8lgHeXIckKrt0ezrGp4Q4/jm
 hzzQVrQDfUxEogr9vQscZMc5ZDirrDnsydpqfMLjnl2f9pSHIfhfW4tqxIL+fn8YvrDe
 GWJZ5zKqJ+UImEeY/06hDJwRqafSFVkUGhumW8BrEjSjUs3PNHOXZwdJzgvwIFCKbcK4
 W/ANKkCZ9HY7KFuIaK9uf2txUI0vi2RhoZKgXtgHdiVl6BZhSZoUJkU+j0G+zodh9Blb
 Jqgw==
X-Gm-Message-State: AC+VfDypXvP7T0BQbTmNN9cnzE4vJr5nie7L5Bc26PsC4Bn9B99QFZHt
 LopfBFy4YggTS6GZxgHT5/+qyQ==
X-Google-Smtp-Source: ACHHUZ4oSZHZzg6C8v34hPhCQ+wK6mkxEl7ZjsGtoBpeYuV1t5nJdNSQXkNr2cEinONOsXAA+3M6mg==
X-Received: by 2002:a7b:ce09:0:b0:3f4:ec32:6a00 with SMTP id
 m9-20020a7bce09000000b003f4ec326a00mr5426612wmc.6.1683962796897; 
 Sat, 13 May 2023 00:26:36 -0700 (PDT)
Received: from [192.168.190.227] ([83.98.42.3])
 by smtp.gmail.com with ESMTPSA id
 p26-20020a05600c205a00b003f4f1b884b3sm5186754wmg.20.2023.05.13.00.26.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 May 2023 00:26:36 -0700 (PDT)
Message-ID: <5f92c292-8c33-b9c2-4c0f-709b554ab1cd@linaro.org>
Date: Sat, 13 May 2023 08:26:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 14/20] target/arm: Convert CBZ, CBNZ to decodetree
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230512144106.3608981-1-peter.maydell@linaro.org>
 <20230512144106.3608981-15-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230512144106.3608981-15-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.845,
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

On 5/12/23 15:41, Peter Maydell wrote:
> +@cbz            sf:1 ...... nz:1 ................... rt:5 &cbz imm=%imm19
> +
> +CBZ             . 011010 . ................... ..... @cbz

Similarly re the single-use @format.

Either way,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

