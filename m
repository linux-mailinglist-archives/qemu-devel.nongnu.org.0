Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D516A3B9DE3
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 11:08:02 +0200 (CEST)
Received: from localhost ([::1]:46752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzF9V-0001RT-Cz
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 05:08:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lzF7z-0000GE-6W
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 05:06:28 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:37778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lzF7S-0003Kh-5l
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 05:06:24 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 r9-20020a7bc0890000b02901f347b31d55so5689436wmh.2
 for <qemu-devel@nongnu.org>; Fri, 02 Jul 2021 02:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GEkoo5kj4Corn1Ry9oJcsQrNc/Kk3pe3EPTYDp2yBT8=;
 b=d/xxhNriYkTSn4rwP/wWKdf5Fwh6mxOv6XP2TNrgrMOmtJC7OUQDmdiIWaeEDvg2ZS
 3bqOO3xrVOBLekHloS7U1t2NbpQAH6N77HVUwYt2OE3oEp1aOY1wGFD6Gwwx9+8og09e
 MyeYys1EzhtWCjwg7INbo7EURlCoajogR5eRGpEPuNsl1o9xeMe5Gg0bgF8a6inzL0wc
 u4Zz2jLaVhLxAsN3hWOXKlbcERY9TZm+icFSNUc9iWCPnm6JZc95jKQrJ397el2hhPOK
 jaFCymrIQpow1Mwngjv8cc/jwewMaVc8Y23K8O2jYSa09g3W1d9NHf3sYBYR7r687b/u
 62Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GEkoo5kj4Corn1Ry9oJcsQrNc/Kk3pe3EPTYDp2yBT8=;
 b=JxsnJf/oOrZcKQFdF91dAehZozVjcHg/ktnmuEcL2NsuiOb/kSri6fimUDipBbKwHa
 6fUemKu7zL7akVMNZf0bRiAo3fdgU5gYgGfZ6XKX0autWD/jUA8i3pTo87FhHFk7qV8r
 7ccfAoeI+XHReAFuzFOU3VdSAuVdRdwkZvAyaKQH/Qghhs/GxusL3Tr6vdcTFQfLg33K
 drmOGpfdPLhB7UwPEGDy4ff+9Tc5MUubFTUX69Ax1wz0F22r1jweL5ktoNe1vswSlwI/
 BBH7m9zk8G+g4d9W19zxBZcQ7p44p/ArdvOEl9fPzMGyY1nFrGKK31u4eWRFAJZA1VXS
 nQxA==
X-Gm-Message-State: AOAM532JCn3235Kitz64C780hVMFTdNVYjy5BjX3kzoczsYWYriYduIc
 fFkf873/DDah+9nVXJhlRVk=
X-Google-Smtp-Source: ABdhPJw67bi5hlOtHLUSmFMaNmGS1Muyqf61QDklHF5oP1sNg8yJZ06tW4qzoGdUBigLcioJ6XqLzA==
X-Received: by 2002:a05:600c:4f15:: with SMTP id
 l21mr4276395wmq.72.1625216752368; 
 Fri, 02 Jul 2021 02:05:52 -0700 (PDT)
Received: from [192.168.11.95] (pop.92-184-108-94.mobile.abo.orange.fr.
 [92.184.108.94])
 by smtp.gmail.com with ESMTPSA id n20sm2301150wmk.12.2021.07.02.02.05.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Jul 2021 02:05:51 -0700 (PDT)
Subject: Re: [PATCH v2 21/23] linux-user/sparc: Implement setup_sigtramp
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210618192951.125651-1-richard.henderson@linaro.org>
 <20210618192951.125651-22-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <5df2cc9a-b5cf-491a-4be1-28eb8e9a56a9@amsat.org>
Date: Fri, 2 Jul 2021 11:05:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210618192951.125651-22-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
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
Cc: alex.bennee@linaro.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/18/21 9:29 PM, Richard Henderson wrote:
> Create and record the two signal trampolines.
> Use them when the guest does not use SA_RESTORER.
> 
> Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/sparc/target_signal.h |  4 ++++
>  linux-user/sparc/signal.c        | 32 ++++++++++++++++++--------------
>  2 files changed, 22 insertions(+), 14 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

