Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C95733CC81C
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Jul 2021 09:50:47 +0200 (CEST)
Received: from localhost ([::1]:55312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m51ZW-0000ll-SK
	for lists+qemu-devel@lfdr.de; Sun, 18 Jul 2021 03:50:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m51Xy-0007Ek-GA
 for qemu-devel@nongnu.org; Sun, 18 Jul 2021 03:49:10 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:34686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m51Xw-0003Sj-SS
 for qemu-devel@nongnu.org; Sun, 18 Jul 2021 03:49:10 -0400
Received: by mail-wr1-x42c.google.com with SMTP id u1so17522534wrs.1
 for <qemu-devel@nongnu.org>; Sun, 18 Jul 2021 00:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LDhIzUS/KJgTr9j17NL0KL0f2gri4CPOn+My1EZDlCg=;
 b=AoUcquElYM8nOu7UMRX+XpltcguKTXgBINVWui9cP41XF+MYgSXmnmwhmlDJ8vuPAg
 eHhJFMQnVlndNiyorY6vZzcRNxnU8W6u0h2oiCgZijrUhjy55KIzxHgIyhZ9r5pagK09
 ubYIU5NZpLxFWDPs978684pwR8GRmDKbCnxexSIDeQFi5rxc+puO3U+5uuzWgOr6eob6
 1bbjLFH15zYqxhvu/DBHMFP64ag4iwAiNbmR6FY6FR0D5JzKBjCKpwEWWHvN+8AvBeYB
 TL0w+V2PPuxN9mtYl41t9iqrkItOeZyRKtMFgxPpbU/jb6lhyTnRBw85pRBfuqp68+bf
 /zYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LDhIzUS/KJgTr9j17NL0KL0f2gri4CPOn+My1EZDlCg=;
 b=lzL73tKUspQdJSKhNvFgs26QNrHcL0xbtybAVmo0hXPJE2ZV2p2AcakWY2kcHYxHs/
 JhHz7uvl7NIOy+JZkohG0LF4Y6S+EzQGPzhWfWg/PVd5oeXH2zlQ0vgt7+3APsNuAKB6
 o96Zez6wTn+/BxUPieesDmbJiHTssx8KPW180dQ9yrYjxyA0BRBAGW7fWpbeRyOxJv5K
 43HOZzwtSrhGgcyN8RegXWayAaxNoTKc7Cxp6KvIi9u1plsfuP11ilv4OAZqD+b0B4aq
 +Ar9XIf1GyYijxLpUcRmo3jDubEAXli6n/t0f7pR2JLbxcPaBoUeX2UNjos3Uy+ozVkI
 FR3A==
X-Gm-Message-State: AOAM532flZZzWrRIocEKV92iNEoWTGRdpTdzdpQ3hiPmBU4NyIijj9fG
 ohOndOGv6mdlKzFdEIEjn6Q=
X-Google-Smtp-Source: ABdhPJzASbyVUZ/OH3U9nOBfj9WdOzi1SNrTZill9Uqcc8RyiLRSh+OqUCSwXFaB8KaCKtNpQ00A1A==
X-Received: by 2002:a5d:6209:: with SMTP id y9mr22903457wru.402.1626594547081; 
 Sun, 18 Jul 2021 00:49:07 -0700 (PDT)
Received: from [192.168.1.31] (abordeaux-654-1-74-136.w109-214.abo.wanadoo.fr.
 [109.214.221.136])
 by smtp.gmail.com with ESMTPSA id v2sm16059326wro.48.2021.07.18.00.49.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Jul 2021 00:49:06 -0700 (PDT)
Subject: Re: [PATCH for-6.2 06/10] linux-user: Split safe-syscall macro into
 its own header
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210717232103.18047-1-peter.maydell@linaro.org>
 <20210717232103.18047-7-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <398652d0-4679-fcc9-c76e-539d86b4c66a@amsat.org>
Date: Sun, 18 Jul 2021 09:49:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210717232103.18047-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/18/21 1:20 AM, Peter Maydell wrote:
> Split the safe-syscall macro from qemu.h into a new safe-syscall.h.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  linux-user/qemu.h         | 135 ---------------------------------
>  linux-user/safe-syscall.h | 154 ++++++++++++++++++++++++++++++++++++++
>  linux-user/syscall.c      |   1 +
>  3 files changed, 155 insertions(+), 135 deletions(-)
>  create mode 100644 linux-user/safe-syscall.h

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

