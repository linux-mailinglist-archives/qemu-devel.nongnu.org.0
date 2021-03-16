Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7900D33E1B7
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 23:51:49 +0100 (CET)
Received: from localhost ([::1]:42542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMIXU-0000yM-Hp
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 18:51:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMIWJ-0000Lb-RO
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 18:50:35 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:38684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMIWI-0005it-Bj
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 18:50:35 -0400
Received: by mail-wr1-x429.google.com with SMTP id z2so8272863wrl.5
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 15:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wDYxflG7INx8rNbSI9DeO9PQEvbOQHXRRI0FpOFFHGI=;
 b=sdtd65dKfaD3LMJ2yxSo7dxQlm6+JsNmzzYOny4ScR1qT2FVGyEarPoirXFCHrBYdO
 hSoK/kCO3Qvl2rmG2Ii8KOdVN7VIp2m7fNYCh4EagIDpL/JwZ2qIW3fFTVAqHcILo866
 d/tDTkd4IFESBJ3thf0uQeAqlloygcbkSbJAaIKl3Vav/I6kvuK0l/9JbVD1mPBl9/pI
 vHzO88vUGMEU3sUMxTb3rSPRcLbBmvIviUCoK9PQoTrGJt3iG8Nrhqn65y7l0FByL03W
 X8gefrkWL0p9rXSsZ/41zJehZqzUKiIp25YDoIqsb25SoXlS5MmGwq9ovZnPm00w9siq
 FHOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wDYxflG7INx8rNbSI9DeO9PQEvbOQHXRRI0FpOFFHGI=;
 b=sfYd1J5bNuwcxcoWEgh52o3laeeLDgtBabrgQixlZtU5sKxiT2zUjXCfJ+0zHl6j3P
 JbCb69ICEMT5NBQIBsWSTjo9mxBqJFRqAgvQEFpK9ICyWnUhZBWzUL4Yfn9Le3EOuXBY
 kgxA17TkQXIUxz2MASHnsh3iKee7cwCMVh5pnH5OHQvYCnBDbpASXPZreFH738hy94fO
 megYBn3KieQVdoxkoysDAso7P8Dl3JFeBQDCbnfgNSssjpVLSHg2P3xOiU+XXyD5iy8h
 oae7P/uxea539UZcRAclf/4EZkcYOpFN8HEERA4Yx547NFtK8xz/2vdLldu7sC36dVGd
 8p4A==
X-Gm-Message-State: AOAM531yAM9e9VwtPsXfHsmLU1rBj2uwQy2y/STnkY6pQl8a8LngU/Rx
 uHEUt8yut/d0SyEWVPKq9XI=
X-Google-Smtp-Source: ABdhPJwerEus85nzsD28ynXDxl8Fhm6Dr/udA9WgGKIuTty2eRfKGlGd9RJbUm3hB2UzaZUEJrh3kA==
X-Received: by 2002:adf:dc91:: with SMTP id r17mr1190915wrj.293.1615935032994; 
 Tue, 16 Mar 2021 15:50:32 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id j12sm23601066wrx.59.2021.03.16.15.50.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Mar 2021 15:50:32 -0700 (PDT)
Subject: Re: [PATCH v5 03/57] tcg/tci: Split out tci_args_rrs
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210311143958.562625-1-richard.henderson@linaro.org>
 <20210311143958.562625-4-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <1a5b4c75-c474-7ab6-8234-cc1cb07ca87b@amsat.org>
Date: Tue, 16 Mar 2021 23:50:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210311143958.562625-4-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: sw@weilnetz.de, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/11/21 3:39 PM, Richard Henderson wrote:
> Begin splitting out functions that do pure argument decode,
> without actually loading values from the register set.
> 
> This means that decoding need not concern itself between
> input and output registers.  We can assert that the register
> number is in range during decode, so that it is safe to
> simply dereference from regs[] later.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/tci.c | 111 ++++++++++++++++++++++++++++++++----------------------
>  1 file changed, 67 insertions(+), 44 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

