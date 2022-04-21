Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C87150AB71
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 00:21:49 +0200 (CEST)
Received: from localhost ([::1]:49446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhfBL-0000kv-VY
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 18:21:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhf9h-0008P1-A5
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 18:20:05 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:40770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhf9f-0004JH-P0
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 18:20:04 -0400
Received: by mail-pf1-x436.google.com with SMTP id i24so6239567pfa.7
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 15:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=Tduc33cP5697gZn2ndco/MzKF2smwJxIlClG2/03b84=;
 b=MSd5CJvDhLZGABtMGWZ7IvbDxB6Scx8iWjrYUbCZKG6sxBh5is+y13etVna0K75xmX
 WlUYNpB7rvj+t9T8ql5xPcD+Jjh2pl7GG+zDCE5bV7A4WyyVRMlutpJ4u/IcywPs0uXn
 BRdfShTCWKHPHHGbp9D7IQaWw+4HiTu5dGuDf+yEsis4sz1oIjkiyboPdreLxjTv7l2d
 C6mNvljNEzzVsuJgkNFwSxS+49QasVtfZygAw+xfWJ26GsHj9frduB0vEVQ+ShEFPxr7
 WJrC2MdVnM/B/3UqFDtMz51GMvrBkYBCrXuA1taMLGChI5ZV7kSu0ARCFAM2iTv5Zma1
 bDrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Tduc33cP5697gZn2ndco/MzKF2smwJxIlClG2/03b84=;
 b=D+2rirPmIMfpKQr6BaJYoJnyFSP2vyOJILBaStZP30ovq9+P/ro6MCP22N0kuLhbfz
 LLHbEG3PHfirK1qvfLUiTSJFaL869nOEbkODJA22S3lyrxgjYw+fxdpOty8RAXSN57iI
 dAKvKDwou2fwsEtS0gDWk0xMc/77wJ7KjmHU+thSatGvasSSbCtyoXQk8vbcpBSB6dHS
 WdzhI4gkPmo05Bo76+F8amRN9JbtLqwr7SY9mBw2sXOXJs5mVVLisaXIYufUgqtK85C5
 bCXHSRfAHzed5WBvTdgoyWy0hdbQVZF4byjYtNFJjr5E5cjWSCHI1T49GqJHX0PaR0SP
 2Vkw==
X-Gm-Message-State: AOAM530s9xiAIe5Z1e9C2dkUMkvwYS4eiuUp4bnvSFo4INMq3ybI4BUD
 fAbs7WwxI0f0zEMxb6MiFKijAhAfdRamZw==
X-Google-Smtp-Source: ABdhPJyOqinHNyvtYxKCk3vxFuBDCY3FJOwUKkMK3P4Z9lFOcoNI6ZfbjkndLQs1bp85xSHwPt3p/A==
X-Received: by 2002:a63:101:0:b0:3aa:b7e9:6708 with SMTP id
 1-20020a630101000000b003aab7e96708mr1284798pgb.111.1650579602273; 
 Thu, 21 Apr 2022 15:20:02 -0700 (PDT)
Received: from ?IPV6:2607:fb90:8060:946d:c7f7:991d:96a5:ff15?
 ([2607:fb90:8060:946d:c7f7:991d:96a5:ff15])
 by smtp.gmail.com with ESMTPSA id
 s19-20020aa78d53000000b004fdaae08497sm124289pfe.28.2022.04.21.15.20.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Apr 2022 15:20:01 -0700 (PDT)
Message-ID: <66ca1fe2-1a36-3303-5681-2acb65fd26cb@linaro.org>
Date: Thu, 21 Apr 2022 15:19:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 01/50] dino: checkpatch fixes
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, deller@gmx.de,
 qemu-devel@nongnu.org
References: <20220421193100.5098-1-mark.cave-ayland@ilande.co.uk>
 <20220421193100.5098-2-mark.cave-ayland@ilande.co.uk>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220421193100.5098-2-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/21/22 12:30, Mark Cave-Ayland wrote:
> Signed-off-by: Mark Cave-Ayland<mark.cave-ayland@ilande.co.uk>
> ---
>   hw/hppa/dino.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

