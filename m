Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 893B33F0DFA
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 00:18:47 +0200 (CEST)
Received: from localhost ([::1]:36022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGTtW-0001uZ-J1
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 18:18:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mGTsN-0001EN-Ph
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 18:17:35 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:38744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mGTsI-0006Mu-Id
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 18:17:35 -0400
Received: by mail-wr1-x429.google.com with SMTP id u16so5841032wrn.5
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 15:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LeIqYDEbAQdiUH9hwflM9U85v75AjWMq0Ya3wgcVp2s=;
 b=l8WpuZi38Sm0n/YB5ID/DykmZAOSS4atkxHNHxjOKXaBzDOjOuYRvDf7giLh1HwV58
 ciYmXDG+XzjtaY4TUMm/bN8W3FI9qF14n7kbczTas6+agozRNtnJ0lBq/qovUVO2gQMd
 1fY2quUkD+8g8YpWGpwn8nmoxYX+cyit4woPkZ9KL5E4LQKQwV9BvyvLJZHTtHu7z3Cl
 8Zc3nPCAo9523eYSAUEaoycoMTzVLHDCwvLJONjGV6Q6RwjPe98uWz0Jsek7lYQyYh3B
 zkGqvVCffPPrbzlEMbL7sd0HUOUHkAnAvBN9tsfjymXggpHZe/7mGgGsIjk7uejoIabS
 7j4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LeIqYDEbAQdiUH9hwflM9U85v75AjWMq0Ya3wgcVp2s=;
 b=nkjjQ680SxQrxhGqlW8hKKAjOfZJXzIl2K4pnNJNwOHJm/n2ShwDdj1CebmSgmXgFb
 EslOH2K3iNARc3pEFOAWLs7ZfR98X1jIU0HRuWI73wNeYD4/x2EADkqC0Wr5IAfIujWH
 50Sq0CH7pw9ICs9k+fGTgpCFB3CH4v+u8wZaHiVPNw8EIiWIoaR3Q3bCW5kFuE1CYxLl
 ZcFi39BBIkGr3AMP9fhYV9yPKZhM5CIdjLVexrOp3cfDDp5Uz7n2rJGOgI8csPpmTccu
 P1e1nij73+ISBRRYDivkqj9ApB6q6xoidYugh0Zqr6/ec+iLgn3BZtvpj1txb6pBDxax
 RVSw==
X-Gm-Message-State: AOAM531XcC0WN56OFtaiuvoG7HnMN9ZNfEe9dcUF+G3Y3zNhQpzvGJvu
 5t5bUfVFY7U9NLQJjgNZWyN/69U2moI=
X-Google-Smtp-Source: ABdhPJwY0ikjiXifozQ+z26NG6sGTNek/hDLai/CVJqqNg3wimwiDoBeGS4Xvf1fmsM5I2fySRBq0w==
X-Received: by 2002:adf:f285:: with SMTP id k5mr13141968wro.117.1629325047840; 
 Wed, 18 Aug 2021 15:17:27 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id h126sm6502717wmh.1.2021.08.18.15.17.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Aug 2021 15:17:26 -0700 (PDT)
Subject: Re: [PATCH v3 08/16] tcg/mips: Unset TCG_TARGET_HAS_direct_jump
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210818201931.393394-1-richard.henderson@linaro.org>
 <20210818201931.393394-9-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <16e467dc-052f-9a68-bf80-5be49d24adec@amsat.org>
Date: Thu, 19 Aug 2021 00:17:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210818201931.393394-9-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
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

On 8/18/21 10:19 PM, Richard Henderson wrote:
> Only use indirect jumps.  Finish weaning away from the
> unique alignment requirements for code_gen_buffer.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/mips/tcg-target.h     | 12 +++++-------
>  tcg/mips/tcg-target.c.inc | 23 +++++------------------
>  2 files changed, 10 insertions(+), 25 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

