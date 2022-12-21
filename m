Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F7A652AB2
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 02:03:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7nV3-0000tc-DV; Tue, 20 Dec 2022 20:02:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p7nUg-0000jP-Pu
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 20:02:04 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p7nUd-0003Mk-7B
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 20:02:02 -0500
Received: by mail-pl1-x631.google.com with SMTP id s7so14010147plk.5
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 17:01:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TYC4RlEZX85DcloEeHvm418WSLDMXrtH8IdhzDztsgw=;
 b=qWmP1JdTZYm1xu5SBoAvBC1azB8iTw+pNm9I6sTKCOBvN0IrjnOnr4WKyfcUAk6CaH
 bNg2vBWbo4G/xjfAnHR6OiwEjLZ/2N4GXRUW6xmg6kVLn2o8CuR7sLc6BVJuBR35r+it
 FZwPAV5OJK2aCJ2eDSrkwayM3Rh9iBgN6hut1OApFdbmZKzMEPDlYD2XRVAQRgZTRIQV
 qyyBloQl0VoMgoKEv0DZGervtesC56sHffIjG/WHeStj3uFXx++egamNQRipzEw7tA0x
 EsSRMKU1GaCQM0Eli96a09wvNfR4OVLd7WW4i6Wtb2w1Rj2Mu6KuyOX1wRyJYSIiXTnh
 swlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TYC4RlEZX85DcloEeHvm418WSLDMXrtH8IdhzDztsgw=;
 b=C9n1xXi/P5LVZWuf6LUCSFCdfe9FSIzTLfpC0NHVq0N91qTZH9Udpm7Xy/dcV3G3Ac
 ECQafoJ6maxJOAMdkSrf+OkCB5+KGbyTNCS9uNjaNJsOelr5GEC/UQkrx2j59czGbcm4
 awXMZ3MPLem5Pd1ioQPSY8zaiPn8MrIMuzCLAv2NBjqBr7V94oTYv6W68xVvle8wDDi8
 NUldE5/QMPD8WGfOoLxCLPPT0R+FHMH5Ww5v6qyRSHw3uc1yTemOuxMBTaQpomb41RtE
 pCPhedRq4DJIYPaGetBeE7eDgPTzewiu2wIEtCSlTWafpWmIjlEm2zZWiSEyXXuyhKlS
 xMag==
X-Gm-Message-State: AFqh2kq83CPqTxozi0EyXV49HUZTWquSmi5qjXVs7rMZFEnknKVUGr13
 3KAk5XAqJjrGtoAwUjqp5J4ITw==
X-Google-Smtp-Source: AMrXdXvV35he04HnqO7JzfQisvFJmP+q90GOmRYq2WxVB2QFzTdWPlnOK1joQ6tR8T0qiKtD0fISgw==
X-Received: by 2002:a17:90b:4d8c:b0:219:c2f2:f818 with SMTP id
 oj12-20020a17090b4d8c00b00219c2f2f818mr29848pjb.42.1671584517789; 
 Tue, 20 Dec 2022 17:01:57 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:3efa:624c:5fb:32c0?
 ([2602:47:d48c:8101:3efa:624c:5fb:32c0])
 by smtp.gmail.com with ESMTPSA id
 v23-20020a17090a0e1700b00218a4795b0dsm142061pje.34.2022.12.20.17.01.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Dec 2022 17:01:57 -0800 (PST)
Message-ID: <eac96f81-8cd5-5951-6b0f-69da5985d47c@linaro.org>
Date: Tue, 20 Dec 2022 17:01:55 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 3/3] hw/arm/nseries: Silent -Wmissing-field-initializers
 warning
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20221220142520.24094-1-philmd@linaro.org>
 <20221220142520.24094-4-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221220142520.24094-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.161,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 12/20/22 06:25, Philippe Mathieu-Daudé wrote:
> Silent when compiling with -Wextra:
> 
>    ../hw/arm/nseries.c:1081:12: warning: missing field 'line' initializer [-Wmissing-field-initializers]
>        { NULL }
>               ^
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/arm/nseries.c | 10 ++++------
>   1 file changed, 4 insertions(+), 6 deletions(-)

Not a fan of this specific warning.


r~

