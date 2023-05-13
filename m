Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D88D7014E7
	for <lists+qemu-devel@lfdr.de>; Sat, 13 May 2023 09:19:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxjWa-0005sz-SD; Sat, 13 May 2023 03:18:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pxjWZ-0005sp-Fc
 for qemu-devel@nongnu.org; Sat, 13 May 2023 03:18:39 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pxjWY-0003vM-0R
 for qemu-devel@nongnu.org; Sat, 13 May 2023 03:18:39 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3f42bcf5df1so53115195e9.3
 for <qemu-devel@nongnu.org>; Sat, 13 May 2023 00:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683962316; x=1686554316;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ra3qSJv6qTfa0rEeJxmtIqjVl28WXUOsLtDuxKLdqOI=;
 b=nRoTIGuWgifF7qzqscmFHCokIMADo3xWZUkZnbplA+28Wo94eUL29HLzMQRVIEM1fU
 Uz7PmC6mOfk4gRka0lHs9ZdzViB2utJM07b5ahrz/MIm3J6bccBmweunBBU6RpqWZs2Z
 At15pwLpgQWjkFUwuFLPiAtl07Uuu2IMaamAkA16XvDRE/99rD1ziTUi2we9kbAi28sz
 GGljjDqnVMcGaDf/guIeAo8EoNWBrETp60wvyI2iaSIo3Fk+GKWUUz9BubAHhwyAJHIM
 dMEGRcodvkugU9R6RGTKqf3gFi6ATDttSI1kaX9I7nD5b6/UzRTWx7xZso7pkcRQejF9
 YNDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683962316; x=1686554316;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ra3qSJv6qTfa0rEeJxmtIqjVl28WXUOsLtDuxKLdqOI=;
 b=lsoSzG6hBKinO07NbReQWyIee0f3MI5eNF6eFZuZ3NP8RwzykcWeerOrJh84f10Qsn
 avOQ52QbtloVsyzKq90fBCQEVif9YR7jgiBBwOtn84I9MgP+Ihw2vMOQYmbLTly9CZWG
 Og9V8i6qvxiifdgRU+tMsfWS5VTROgmyiTBa43QgnpnnTplD6Mq+EuX0i/RXkXlhHlLY
 IkNgjqfst+/PIgOiMsG9BQNXh4WoQB8YpPIWlsscn8PFPwqanhXadG5+5BxVndMT05T3
 zPeDL8ERMSByCy6Ay50JC5iKdr8K+ivxrzno+4jHOwfNC8NLLcbawvUjiBFPQVuAC+s/
 nw1A==
X-Gm-Message-State: AC+VfDwGnZLOww0LmbbEghIh9omdMZfLONJ4aWiYegYfgbcJ66Istx3d
 6wDTn8N8aLgb6U7Xcj3Dp6BQ2Q==
X-Google-Smtp-Source: ACHHUZ5KOdENGEDNNX0kHZJbSTn207udtoR+gQ1cpRuEJA/Zt71nN6k+Iu5OrscNMVo9xXMNIn1+ZA==
X-Received: by 2002:a7b:cc93:0:b0:3f4:2bb3:a5bb with SMTP id
 p19-20020a7bcc93000000b003f42bb3a5bbmr10181379wma.9.1683962316427; 
 Sat, 13 May 2023 00:18:36 -0700 (PDT)
Received: from [192.168.190.227] ([83.98.42.3])
 by smtp.gmail.com with ESMTPSA id
 21-20020a05600c029500b003f42d8dd7d1sm11582504wmk.7.2023.05.13.00.18.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 May 2023 00:18:36 -0700 (PDT)
Message-ID: <5c541caf-1641-9047-1a96-49cc87f2e2dc@linaro.org>
Date: Sat, 13 May 2023 08:18:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 12/20] target/arm: Convert Extract instructions to
 decodetree
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230512144106.3608981-1-peter.maydell@linaro.org>
 <20230512144106.3608981-13-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230512144106.3608981-13-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32f.google.com
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

On 5/12/23 15:40, Peter Maydell wrote:
> +# Extract
> +
> +&extract        rd rn rm imm sf
> +@extract_64     1 .. ...... 1 . rm:5 imm:6 rn:5 rd:5      &extract sf=1
> +@extract_32     0 .. ...... 0 . rm:5 0 imm:5 rn:5 rd:5    &extract sf=0
> +
> +EXTR            . 00 100111 . 0 ..... ...... ..... ..... @extract_64
> +EXTR            . 00 100111 . 0 ..... ...... ..... ..... @extract_32

When there's exactly one use of the @format, it might be clearer to just merge the two

EXTR     1 00 100111 1 0 rm:5 imm:6 rn:5 rd:5  &extract sf=1


Either way,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

