Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B41A23FB315
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 11:23:27 +0200 (CEST)
Received: from localhost ([::1]:46324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKdVm-0006KY-Mi
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 05:23:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mKdTP-00047q-EK
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 05:20:59 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:36521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mKdTN-0003Ln-48
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 05:20:59 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 79-20020a1c0452000000b002e6cf79e572so14185969wme.1
 for <qemu-devel@nongnu.org>; Mon, 30 Aug 2021 02:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KVugxHD/zxUlZ/fs/lfUJYDxfej2eBD0xLGYkZk6lPg=;
 b=boqvlh8xZdUWjKnVt31RergO2CujVZRre+aXzkFI0Xfb82zPQ3mcGIPDx1Tx5QaWQr
 J0b6PTIKGgIzAORalbCTtSBtURWk4Kkm9ePudFwIR4q0oU43ixcFTe8h+D7b3SDf4nU8
 A6teYc0HxrdAddG6ADNkSKm/gLNdHdbUpvcQFuy64bClMEX1PsVFO2KmgVe+7vYSIvXF
 hMUroiR2lKrrNF0cBRz9OGfp9HRp0xCNSGfAOlwKKPDgGC/ayqbTqiyXWyjADgY3kGvI
 q06nq9bkG0HTRReyzkDjMNGwXhfOQV6FBgA4A8xWigGtfeXb3IVpDtJxaWqk47HbmcUv
 YH6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KVugxHD/zxUlZ/fs/lfUJYDxfej2eBD0xLGYkZk6lPg=;
 b=X+yjbLkFPJqipRd2euQen0Mn4b2x21mOfpC+x9yhunzmf8yIBdxQ4AsBjROXSVv0x7
 Zy5yAW7TRuLujLXZ18JjxWWxhQcrr4oHk2w6RTBimbe1yeYWLVnbdOPPxKBAsvQgxUpi
 mqHALb1eNcM8cYKL5C+DutylMtGLHKK06RPxnUCXZwFiKz/J6MyfhiBMMWiA3F1bVtcE
 W91N6hkaELq2lGIfcpXaf79YIp7ev8gSpRcSY1A378MAJzMbVFENYr4GfDBPKYzZqGEn
 bbCNpmxDVK7Koeg6/8Iu2ZuQ0G72MXyBdCL51Y69e7LfDptWuKlBNDz8NfWD6XGuKBis
 z7yA==
X-Gm-Message-State: AOAM530d5qBeu3gF4Sfafsn6AFTBKIigdsZ/7BW5A+q529oPEmlan0DG
 WLBAPOxABsnU8e3xdqTo8FRF22D984M=
X-Google-Smtp-Source: ABdhPJwOkDtlkT2f/YiYJzKED5mct6S3Y57C54Lv928fKNEmNeF9yHtmqeSKFB3cwEvOAfA+uwJlMA==
X-Received: by 2002:a7b:c4d2:: with SMTP id g18mr17831952wmk.135.1630315255473; 
 Mon, 30 Aug 2021 02:20:55 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id w18sm16304803wrg.68.2021.08.30.02.20.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Aug 2021 02:20:55 -0700 (PDT)
Subject: Re: [PATCH 11/48] tcg/optimize: Return true from
 tcg_opt_gen_{mov,movi}
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210830062451.639572-1-richard.henderson@linaro.org>
 <20210830062451.639572-12-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <4d372422-984a-4523-cc58-6cb6d9cd7e49@amsat.org>
Date: Mon, 30 Aug 2021 11:20:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210830062451.639572-12-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.58,
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

On 8/30/21 8:24 AM, Richard Henderson wrote:
> This will allow callers to tail call to these functions
> and return true indicating processing complete.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/optimize.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

