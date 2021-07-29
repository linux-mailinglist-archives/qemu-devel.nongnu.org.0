Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23BA13D9DB9
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 08:37:38 +0200 (CEST)
Received: from localhost ([::1]:36782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8zfl-0007sz-7L
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 02:37:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m8zck-00047K-Fe; Thu, 29 Jul 2021 02:34:30 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:46046)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m8zcg-0000Zu-6G; Thu, 29 Jul 2021 02:34:27 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 l11-20020a7bcf0b0000b0290253545c2997so3223182wmg.4; 
 Wed, 28 Jul 2021 23:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YZXlcihIpBSPNCvsn0tcjBJyLwfJ6R2kWcZN3ggk5yg=;
 b=I910HMz5a4InlsIZB2GYb0bQWEuBGUCfYs69wLuk4R4pmLcdeAOc1HdrgC0+J6nRzz
 9VofwhS167+CaHlI5PYEzhqJcn3DpsNPKAAeAeFPb0rWm73jL5LhP+hZ4ipN0cicTe0S
 r8qS5QtvnJrR+fPEq2J45IGJigBSwwYXqukpv1o5hqGVgtyLnCjxFlwSk2RpjMzG5pb/
 KB3yfdKcXVyhzBLoztVlLo/3Ejj4lAuMihBch1b+FTZTy3KIJzmHq/sBlrqFOkpjHcd3
 GGHpqzf+tRA5Xl1ULT0FFC+wis7uQhWlT3ze+gM12Zw6i5///K/A4iiBLUH7ouFUZgf4
 +JLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YZXlcihIpBSPNCvsn0tcjBJyLwfJ6R2kWcZN3ggk5yg=;
 b=spEAiNA8i6vCM70xmL+sygFYEmt8R3MPzZHb8QosEmAhse8UXnhozAuPrPQrLg3HBL
 XSWBXWaKEov1Zr8tSquvdxi5OIdg2sKUarIeCwvvz6HS9+b5s3xJVn7G3YGH0KmQtLQA
 asP68C8549FewHNmSFc3RNnfK2/gdu8GeDpQTGSTTvWBqb0Tb3WCLxwPvJYs4VwoGtz9
 oJl4s6PRLpYWoccuYBAK9+mVmlgEwqQiAKw3znUsqxljrAmxm4Y9wi/q3fZefnhpzYl7
 EkXvaaBikE17VmEfhittwMrUb7eR3kGbKZF9aoB7MrnoFjLjbq16voQn7PIrFtzwgcwX
 /nQw==
X-Gm-Message-State: AOAM530gV5M5769y1leV5BfI5doCuGXKauf01/KRdYeVRJXIZ2g+gOJ6
 BrmV276DAL7e1/23Vb4jVw97gVMLqNrdAw==
X-Google-Smtp-Source: ABdhPJx8+jUlVJ2y1mE6svIwVStav6O4NkiqfR3ORtwITbUig6bMHa21FEDEowg5SIsxZBcuzeNhvA==
X-Received: by 2002:a05:600c:4649:: with SMTP id
 n9mr5422660wmo.168.1627540463949; 
 Wed, 28 Jul 2021 23:34:23 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id e6sm2733785wrg.18.2021.07.28.23.34.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Jul 2021 23:34:23 -0700 (PDT)
Subject: Re: [PATCH for-6.2 29/43] target/ppc: Use MO_128 for 16 byte atomics
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210729004647.282017-1-richard.henderson@linaro.org>
 <20210729004647.282017-30-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <50b87072-0d8d-c97f-8896-72d7991b4e3f@amsat.org>
Date: Thu, 29 Jul 2021 08:34:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210729004647.282017-30-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.277,
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
Cc: qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/29/21 2:46 AM, Richard Henderson wrote:
> Cc: qemu-ppc@nongnu.org
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/ppc/translate.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

