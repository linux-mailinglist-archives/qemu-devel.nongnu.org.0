Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1046DDB1D
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 14:45:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmDNA-0003vf-45; Tue, 11 Apr 2023 08:45:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pmDN6-0003vX-Ew
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 08:45:16 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pmDN4-0003Fl-MJ
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 08:45:16 -0400
Received: by mail-wr1-x431.google.com with SMTP id w21so7322663wra.4
 for <qemu-devel@nongnu.org>; Tue, 11 Apr 2023 05:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681217113;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BmF5Khz2Jm7zj5Sbn0IifMkQLaAGRaUyNlW0rKUN400=;
 b=RTNpsNT6JBrCFtfR1WpRcyhGuhPUqR4QWh257Tzlcj5hX8LZckHMKO4QZ8pqyoZ/6m
 p3g/AeV/V6WBrABYak+li+PIzUaGc6LuuvQzEghNe8cUIgP4KPqZZ5/DqLIIU3WDId5S
 2akc/C/Nw2ZWqArRg9Od01qW9Z70o9j1rLdAVRzZgT1i6yKDrIYqYFzDoSzbAAn0I5z5
 B0/vdIn5zyBtOQyqvt+YerrtUazX85dLDtK3+DW1arEX7drYxTZpN2X6ZaOmc2H3V+qU
 /yp4jZQL/PfAFZjJOJblOzfu5iV0lS7DAHrAQSnkFAL+oaQjHvkmxi0Ja3RRvt+jj0xf
 GHAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681217113;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BmF5Khz2Jm7zj5Sbn0IifMkQLaAGRaUyNlW0rKUN400=;
 b=MKY6dtjcCtFUMIjrx8y+3ivMm74VJUO75ARimHqqm9363UnfZeu8Kfcjux5epe84/H
 vWIRiIC7H2IqfJJLkgEaXu4SJMaSRxG7i8zIXe503aS7Krt4XRWdViHSvLkibRuo2kBs
 eslVFY4iUcytCEE/HCdX3EDtrbZYHWfYG2hZ0SVMB58nyq77sxflQkugcy8GLMOESCJT
 WVjtuD1g8bilimXficEeDVIIrxcYvlQdk1Qix5bexKH0kaqXmGwpGsVkt05RFDFxJ0SR
 XFqonsEYMHkp/Qxc/iDimhw8qkEfFBll9+Fi+pLXnRRZGEvmrRvJk/MgCSFmn9/l82Yy
 rXDA==
X-Gm-Message-State: AAQBX9cDGtiyKOavtv3nDBVfAAsTEzDT1wMlz2qJNnRiOJYQFcCDY8ig
 FWEQjpD+go35dlqqFTwtvOztaOfft9Fg+7noUVM=
X-Google-Smtp-Source: AKy350afCVVlQtlMGbMfxnSGL2slzNk1hFjWyteLIeTmVZuyowl12TmNzbbwZKkHmaN5HfHo6qjmNQ==
X-Received: by 2002:a5d:6ad0:0:b0:2f1:ad73:c32d with SMTP id
 u16-20020a5d6ad0000000b002f1ad73c32dmr4506634wrw.30.1681217112847; 
 Tue, 11 Apr 2023 05:45:12 -0700 (PDT)
Received: from [192.168.1.101] ([176.187.195.239])
 by smtp.gmail.com with ESMTPSA id
 z16-20020a5d4c90000000b002cf1c435afcsm14533910wrs.11.2023.04.11.05.45.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Apr 2023 05:45:12 -0700 (PDT)
Message-ID: <c76dcc2a-08e2-7f7a-c3eb-494f28bf2760@linaro.org>
Date: Tue, 11 Apr 2023 14:45:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [PATCH] docs/devel/kconfig.rst: Fix incorrect markup
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>
References: <20230411105424.3994585-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230411105424.3994585-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.17,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 11/4/23 12:54, Peter Maydell wrote:
> In rST markup syntax, the inline markup (*italics*, **bold** and
> ``monospaced``) must be separated from the surrending text by
> non-word characters, otherwise it is not interpreted as markup.
> To force interpretation as markup in the middle of a word,
> you need to use a backslash-escaped space (which will not
> appear as a space in the output).
> 
> Fix a missing backslash-space in this file, which meant that the ``
> after "select" was output literally and the monospacing was
> incorrectly extended all the way to the end of the next monospaced
> word.

Apparently the single case (git-grep -E '``[^ ]+``[a-z]', other
are separated with '/').

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   docs/devel/kconfig.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

