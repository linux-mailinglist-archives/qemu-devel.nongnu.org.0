Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC3032015A
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 23:24:19 +0100 (CET)
Received: from localhost ([::1]:48948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDECA-0005Zd-7R
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 17:24:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDEAn-0004z2-KL; Fri, 19 Feb 2021 17:22:53 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:33352)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDEAh-0006TZ-P1; Fri, 19 Feb 2021 17:22:52 -0500
Received: by mail-ej1-x62b.google.com with SMTP id jt13so16520193ejb.0;
 Fri, 19 Feb 2021 14:22:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vHbzLLCsqAcs54CgItp8DtAE8b6rSLILR9DDXki6cEU=;
 b=T3fx0PtE/f7WplyNCSAOTTe7aqez55ahRneg7MwzNnHiUh2WbTeAu+yc5/W+9HJCfy
 a23fsHos4eBNRqNJOmdQMMjoQ4C1NyBJ3khinfNrqrcWwQy9ofVzEi/IRxZ6Sa/iFVBw
 JL6UViUfaCAsBL4UBE0p/Oy9udfex7Hl8FHKh2GeE9CS+KhPhXI5PX3hDdGmQL9ZhFST
 0pTajicsptTyyJNOn/NCEm4agWvrd2C+FEImEmTV6oytyIZaOOMdTd1syExw7Tmk5LFr
 mirIwSuzII4BuRojuoo+4VYGBd2L4whXwYUfMNFOHPGvG0//7NaauaQu8g0srjJVOm+3
 qaAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vHbzLLCsqAcs54CgItp8DtAE8b6rSLILR9DDXki6cEU=;
 b=JtWW3YCM3D7liOSSsCx547YVNDEFVdBw8XBvN4LKLDVKN5UaeKtnW+QlY5fZyEaik2
 qDUgMuVEDAsbqB+vEhNrR42AIUh43x2RlGRmgD29AuhfyBgEXpYAUdWOfBT7Nh9Gj0hU
 SRqX+Y/f88HCN7lTLmLD1TeHr/AWDnf7UIpdI6yNPP46TEwG6mO1bQrTfLiJLYqOni5v
 cOijjsgTwk0YoOMkgvmOqDX+VTJNTcMv/RX/VtbqbjCg9GOUVv8SIJPVZW1ImMeDPW1H
 hx9rvoCHRQ3ixQP7ry/btLad3Pp+2qnzi5rhoZ3N7kupx19p7c1p4ujB4vUVn3ZxY6Ca
 jWqQ==
X-Gm-Message-State: AOAM533wADYvOQtUHt2dIV8wnwtKumqU/7tQvSsLYw3J/zWIX1pxZ9t7
 WLK+vG4TneJvZhk3xxONDE+GkW3Xb2E=
X-Google-Smtp-Source: ABdhPJxqCFVa2K2/p0KG2lE9yqoNauf1pbG1v9P3vlFCx5tPxk9lAKxYW9TEBcAokODVDKDFrwdvBA==
X-Received: by 2002:a17:906:48d7:: with SMTP id
 d23mr9526721ejt.275.1613773365778; 
 Fri, 19 Feb 2021 14:22:45 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id n2sm5778820ejl.1.2021.02.19.14.22.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Feb 2021 14:22:45 -0800 (PST)
Subject: Re: [PATCH v2 7/8] hw/sd: sd: Skip write protect groups check in
 CMD24/25 for high capacity cards
To: Bin Meng <bmeng.cn@gmail.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org
References: <20210216150225.27996-1-bmeng.cn@gmail.com>
 <20210216150225.27996-8-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <ef961270-45f9-f909-e893-10651b699ca5@amsat.org>
Date: Fri, 19 Feb 2021 23:22:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210216150225.27996-8-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/16/21 4:02 PM, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> High capacity cards don't support write protection hence we should
> not preform the write protect groups check in CMD24/25 for them.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> 
> ---
> 
> Changes in v2:
> - new patch: sd: Skip write protect groups check in CMD24/25 for high capacity cards
> 
>  hw/sd/sd.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

