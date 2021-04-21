Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8674C36635F
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 03:32:56 +0200 (CEST)
Received: from localhost ([::1]:53714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZ1jb-0005a0-GG
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 21:32:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZ1iO-00059E-UH
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 21:31:40 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:40795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZ1iN-00062C-EV
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 21:31:40 -0400
Received: by mail-pg1-x52a.google.com with SMTP id b17so28200441pgh.7
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 18:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=nfnzCAipoH1ANO5u22G2lg29Jyq23XwMx/UxgXOIVNA=;
 b=pppmX64LPkf3TAGyVIDWF49kjW7jbZuNaIymuAX1wG5wDhJZXdmA0P478KYK71Wr/C
 PWMS5Soe5V+LxkFcnYeRzZ+OXpll7Eech1WnJyLdyFyuTSs+2i4YZTfUZg5PhITfNZBi
 /dUBE6kB8Jl3HJhKb51lrFRPuvXn2XPQoGcB+Yrl/6i0Q63IP242WFUFzPJG13Bn9+l/
 UG+MWCrR3+qDDXM18fd/FnvR+YhykKdEKt3jY/PX6XCcfia8M3e1R4RAjWK293SkVxJu
 +XaKIantivQvW6JBUPq4WlBSyPMJZDNWHlI8zg36XjCgoVgecdCATvEh9vktQxoJ2Ro4
 pJ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nfnzCAipoH1ANO5u22G2lg29Jyq23XwMx/UxgXOIVNA=;
 b=MzgQsZLkr79rLxLKyYaSYD0fqH3iFeb0hJj7bfsyUmvKbotkw4/E08CB5f9wL/QPyt
 BoCwdqq8V8e+PaX2JwondxZwoJpQgLiTRoLSPT2c4SJjfLpVPMekoYGv7N6RStiBk3By
 GwrUffhzXtpvL8xsbNyDy/yZtZMpdR9iVBnsTA1q+ERLoSLL+EmmPMDTdCeS3Mz5fmzT
 ZUdwiuQGbWUwZ5Djvb2/kcB47+/nvUqKlRKit/eQqP/zTQyiGwZxOQQBFsZy1I/6JQ2e
 +ctlANCfyR68GAiThc3DkNUAG6jQC18h05g44TBo1ILDWGtCWA7mlGr/znebJedbOoU0
 jYGw==
X-Gm-Message-State: AOAM5306yf1MwoVh0DZ88/Ww4JsAkbV6drgN2BtBAzYDzQ+hYEpKGqE7
 qwheQe0GOgQz+Bth5aSDv7s+nA==
X-Google-Smtp-Source: ABdhPJwNR/wuMEPn3X5tYh6FD2QaAErUkM/wsl94k2wtXpmwvg8MkEbNyTEmVG0FBNcRCuyu0pBlJg==
X-Received: by 2002:a65:4548:: with SMTP id x8mr19609480pgr.413.1618968694373; 
 Tue, 20 Apr 2021 18:31:34 -0700 (PDT)
Received: from [192.168.73.113]
 (50-200-230-211-static.hfc.comcastbusiness.net. [50.200.230.211])
 by smtp.gmail.com with ESMTPSA id k17sm218641pfa.68.2021.04.20.18.31.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Apr 2021 18:31:34 -0700 (PDT)
Subject: Re: [PATCH 1/5] target/mips: Remove duplicated check_cp0_enabled()
 calls in gen_cp0()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210420193453.1913810-1-f4bug@amsat.org>
 <20210420193453.1913810-2-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e8829133-8df0-e422-8523-13f13ac81acc@linaro.org>
Date: Tue, 20 Apr 2021 18:31:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210420193453.1913810-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/20/21 12:34 PM, Philippe Mathieu-Daudé wrote:
> We already check for CP0 enabled at the beginning of gen_cp0(),
> no need to check it again after.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/mips/translate.c | 2 --
>   1 file changed, 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

