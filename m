Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54BE3324497
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 20:24:43 +0100 (CET)
Received: from localhost ([::1]:53870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEzm6-0005Fq-CA
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 14:24:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lEzVK-0008LF-Ha
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 14:07:23 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:39538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lEzVI-0006q8-Qu
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 14:07:22 -0500
Received: by mail-pj1-x1034.google.com with SMTP id d2so1978230pjs.4
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 11:07:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MWDR3GtaDEIZzPBAt1a3T9t38HEbXK7fOnJE3COOXrU=;
 b=ANlJ84Ra1BF+Wwd21o6GUC9wmjiu4utNw2tUjWW2zRnQxOWq9zCXvvYdMb8y4oDgtE
 ueJmDIAMBlwpsfxdRabZ1LTJVcYub+aZvU9M7n2C+G5ViFPf6Zxr5KObd12C4WEL7pEo
 kAxVMO1POGrZJt30P/96uzVs0nPW8NpQ6zBViHx1nRXVPkytYGsbMWPCjKHM+6ujuyku
 Px6PYQ/XrU8izpeYU7FPiQjyX6fVMkmuOV7EYtKG8kgL7ctI/+kJsZwD1LBNnb++RKh2
 XLxwkFWIBpo68T2MCDSN5/c9GAvkqIm8VoekLWzT9Xqaw4yAr97zXqON0A6RBPTPgxg8
 eOqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MWDR3GtaDEIZzPBAt1a3T9t38HEbXK7fOnJE3COOXrU=;
 b=kL3YjxGXpLQ25WBIxJfS3xoPoQ5L2dvPI7EXVWrEQVu7Wic8CP/BSnctrMywNMJX8/
 v9KDW+uxgQL+ll6Bh6BCZ2Ij9jgJJQ+bzdoiDNezMpLPbzYe3WADVaVn88QkvmfPwIBE
 2F8V9uG62jVAGB5h96cVis+1ZFYcoQzuqROC/Y92qE7C36otdoif9IdmEDp7iZjhgCBN
 axSjd+31IMKuSTGMiCI5EbVBTdkf+e6xC5+IfmCCiWsp9sAzqZPI7mg/3KCu7lx9qCCh
 tSml1In9pPClHk1mUnB64PEVNuKZy0PbwA4e1R5RL/rwU/wihLN0/kt5yf8ZO11v+YQL
 Kdwg==
X-Gm-Message-State: AOAM533tOy+cIWNOWejjGM777JnyV1zB3xmIaOTVjM9You/NBg0EuzWS
 Z+RWOcTHUAHWcEEoVzEpeZgPsQ==
X-Google-Smtp-Source: ABdhPJxTFKgpZTK06/8lnMidEEvhlmAbdByCq5mcl1JFrNt39pIThu/3UDpwvW74Bobvuptr6slUGg==
X-Received: by 2002:a17:902:8690:b029:e3:91f9:eaeb with SMTP id
 g16-20020a1709028690b02900e391f9eaebmr9157957plo.34.1614193639415; 
 Wed, 24 Feb 2021 11:07:19 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id j125sm3801401pfd.27.2021.02.24.11.07.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Feb 2021 11:07:19 -0800 (PST)
Subject: Re: [PATCH v4 10/12] target/mips: Simplify decode_opc_mxu() ifdef'ry
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210224185706.3293058-1-f4bug@amsat.org>
 <20210224185706.3293058-11-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <bd6bd511-b39b-3aa5-86e2-139a1ef838dc@linaro.org>
Date: Wed, 24 Feb 2021 11:07:16 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210224185706.3293058-11-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Craig Janeczek <jancraig@amazon.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/24/21 10:57 AM, Philippe Mathieu-Daudé wrote:
> By making the prototype public and checking
> 'TARGET_LONG_BITS == 32' we let the compiler
> elide the decode_opc_mxu() call.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/translate.h | 3 +++
>  target/mips/translate.c | 6 ++----
>  2 files changed, 5 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


