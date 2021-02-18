Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C36BC31F319
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 00:31:11 +0100 (CET)
Received: from localhost ([::1]:57508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCslK-0000GW-Qu
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 18:31:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lCsf8-0002NH-Pb
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 18:24:47 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:50294)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lCsf5-0001Ap-NI
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 18:24:45 -0500
Received: by mail-wm1-x329.google.com with SMTP id a132so5188221wmc.0
 for <qemu-devel@nongnu.org>; Thu, 18 Feb 2021 15:24:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qObnsNFoFdKtcoCJzoNSBWAkq5QgCfQOVeE+B1Q3zgM=;
 b=LjcLIGZXSUdwr5XvIZkb6yDo93+Okw6qIqkfLaDT6WLQrbfWe1ZhfrdeyRANAOXu7s
 zBbatzEX0Tz//JURqSu2y/rZygOkCMVqGn60Sey6j5MU+TbI0pWqv2GE7biN46gOA5gH
 K1UO5n5JWnO/pB37GSRnpODiqFQKo9E5WtPNvPQU2idMW+fr6Vg8pr8eID3jKT85pRIm
 OQHSdVWSWLxvEV/Jm1LJavtn4pKy/isFVJ/z0eFzhgn612pvtT2MPNvCYQgeGd1RxzEt
 fbvycJYj3aVdVLkuftPjZ08/Q2yf2pwyCY/Ganf39fSH9sy6swHs2b3fP3x/SW4JuUNm
 oSzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qObnsNFoFdKtcoCJzoNSBWAkq5QgCfQOVeE+B1Q3zgM=;
 b=b5eQv6amn2KtAHRO1NPveXQVWk5vGEZK2aTrsMqN6WYGmZXaRRf1G68guGcmO05pc8
 dQ/tVh70Bxpn2fG3a7A0JeM7JbMdjkAEwCQpAIz62ALpGso6IFbGybCahRQjfor0v0Lq
 iEMKqsXlXEhvC/FlVTMMct3f0S475yQlG/hIbnBvaBtq+MK4WxU8ve++IxpJMOI8JGby
 CizA5kj/csWNxz0kLJeL74LPRJsNYI4Y8G7MElfcH80fVwSc/gyRsnKx/gXI4MnbyEa/
 Y90PanS7oxy3WSlBuo9ljTFeKqzF/JLLB/2mxADf6vYUSMURzCal5FsS2gv1SyEjoCfw
 hu5g==
X-Gm-Message-State: AOAM531pgKmLWkq1FCq/auXCiHPtQTnyzuSWy3vEY6c/OdhYt4w6gRK+
 CRf5N7AZlwsTVh9R3Mp951M=
X-Google-Smtp-Source: ABdhPJzcVXQPq46iu6eq7QLXIUqqMSh+mNEHIXop0F5HbqmbqOfLEV1clvEsQJm2I3TIVTBbiH0LZw==
X-Received: by 2002:a7b:c5d6:: with SMTP id n22mr5390101wmk.70.1613690681542; 
 Thu, 18 Feb 2021 15:24:41 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id c128sm9371119wma.37.2021.02.18.15.24.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Feb 2021 15:24:41 -0800 (PST)
Subject: Re: [PATCH v4 04/71] tcg/tci: Merge identical cases in generation
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210217202036.1724901-1-richard.henderson@linaro.org>
 <20210217202036.1724901-5-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <bbf88ac6-60de-cb9a-6d57-d41582386199@amsat.org>
Date: Fri, 19 Feb 2021 00:24:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210217202036.1724901-5-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: sw@weilnetz.de, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/17/21 9:19 PM, Richard Henderson wrote:
> Use CASE_32_64 and CASE_64 to reduce ifdefs and merge
> cases that are identical between 32-bit and 64-bit hosts.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/tci/tcg-target.c.inc | 204 ++++++++++++++-------------------------
>  1 file changed, 73 insertions(+), 131 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

But I had to split this patch to follow all the changes.
I'll send as a separate series, so if you find it useful you
can replace it.

