Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FFD5339E6F
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 15:10:22 +0100 (CET)
Received: from localhost ([::1]:43136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lL4yD-0006SH-IQ
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 09:10:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lL4wU-0005wa-IY
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 09:08:34 -0500
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e]:41713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lL4wS-0005tR-TA
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 09:08:34 -0500
Received: by mail-oo1-xc2e.google.com with SMTP id
 q127-20020a4a33850000b02901b646aa81b1so2269883ooq.8
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 06:08:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kx/yonemCADf09MVKMZr3K3FryTY+iSh7taa412Ccjc=;
 b=UDlr8ebJWD78ODIV7ixUbIsdjzZypdtL67iDAdXEZNyPKAkRb0xXCuYMM6bxfG/E75
 3AGh8uXmeK3X0SgZsxZwSELPKzLxGMgEVhyWRSkymCNBm3e03Do/HlU8x4qYp43yqVtH
 +uzIFu997Csx+CC0IDzMkM+o1SnZLr6r30Rddl3sgCzKB7VVxp9WshJ74dP2hy0XGwIx
 feq4lt2IRIUIi1gJGMryp00srCnNA4eFQcS1vTOJ8XXuo8GKNSFW0QmJ3KUkX8v5GwP2
 mvRYGfZOJKNAUcSpSNEgBcU7fTR1229OOUTIvKlMlIScPKuEDKDiG239qpDo+bfcvCYS
 4jSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kx/yonemCADf09MVKMZr3K3FryTY+iSh7taa412Ccjc=;
 b=SHKNcUW6ahjURzvuHnn4RotsxmWg3YVOSMkN1w4KBadAjV1/m0U+Z1EF227s0ACJzP
 8lA+MwXWPaQKNnSNGUT9/NnB3ZgI8VhPo37VZ1YTAn8tfodUJgPrhyQtZivxUU8L5Z7Q
 zXt/apBw2vIny3DLwH7J9sMlMkgKyYOmG8x+DxF4yT6PSANrccCeST0XigGxPO6B8SuE
 0erUv1oFQ4VU84AufYkPnmgqjk2LEvnFfhouogAZxQJp9hjcFqIJmZ/x884iIbT0L0aJ
 oYjqmuiw6Zq9IRnDKtcaAJDz4XjmCRhbt6b0F7adS0+/HbFsOFNCPt8/qPxxCVI/C3E4
 irpg==
X-Gm-Message-State: AOAM5332OIu+pb544t6+xze8eBzhG/cvnLXMdZ6fQcsHOvfV0CuIH1or
 iRdr1hxMaOV8hJIc7213btT2FQ==
X-Google-Smtp-Source: ABdhPJwueT+8SQbVMz6mrUub+7cPaMlE5YUgN1Yzly+YBFgbTkI72XOGdvDfita/ivvbprKGn+nLMw==
X-Received: by 2002:a4a:9671:: with SMTP id r46mr7219005ooi.69.1615644511614; 
 Sat, 13 Mar 2021 06:08:31 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id v23sm3740838ots.63.2021.03.13.06.08.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Mar 2021 06:08:31 -0800 (PST)
Subject: Re: [RFC PATCH v2 12/22] target/mips/tx79: Introduce PEXTL[BHW]
 opcodes (Parallel Extend Lower)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210309145653.743937-1-f4bug@amsat.org>
 <20210309145653.743937-13-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <67215bbc-a83b-aa03-21d1-6a791e74684f@linaro.org>
Date: Sat, 13 Mar 2021 08:08:28 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210309145653.743937-13-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2e;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc2e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
 Aurelien Jarno <aurelien@aurel32.net>, Fredrik Noring <noring@nocrew.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/9/21 8:56 AM, Philippe Mathieu-Daudé wrote:
> Introduce the 'Parallel Extend Lower' opcodes:
> 
>   - PEXTLB (Parallel Extend Upper from Byte)
>   - PEXTLH (Parallel Extend Upper from Halfword)
>   - PEXTLW (Parallel Extend Upper from Word)
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


