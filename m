Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31FFD3EDD0B
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 20:24:56 +0200 (CEST)
Received: from localhost ([::1]:50730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFhI7-0004ut-6Y
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 14:24:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mFhGk-0003SA-VW
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 14:23:31 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:40634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mFhGj-0001l5-Ai
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 14:23:30 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 n13-20020a17090a4e0d00b0017946980d8dso46991pjh.5
 for <qemu-devel@nongnu.org>; Mon, 16 Aug 2021 11:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=J4QZrwFZKMUCNBS99h70xEJx11pjApq0bR+MSV92EqY=;
 b=EjY4ZGjaoo1i2eUvy5DAGwW6BNMmwnhxgy94k/beI/L+VYvAWYz9qMF6bFGdZYOAB7
 /La8/e3A+EnHEHc8yfDcFWCLGWvDM37raKcgcPLvmURhqoBCvbe/JzXih604X37mDumQ
 bYHedBrnBYotOt8CBggS23hDAcbB9JDYLsFYaKMMMCKv+JAv9S2Z7AKqfyBVRZ2K6pMt
 YG51rCjRvv9Ahrwv9zuvP3yrmlrBCdrGMu0+2Wm2yAAcBqbx46+/BILfVThWJBv+7eO8
 gw7M/Vit+kuiwYSvwaMQAT8T8/85lnXtKY1Hz1fveJCDapjkbhyn7saf/kPfQn7jq6Ko
 LtsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=J4QZrwFZKMUCNBS99h70xEJx11pjApq0bR+MSV92EqY=;
 b=p6BhsrRxpVVUNqz4Gz7+frMwgp+20ppuJwG0bJ+BdyfOz2dqWSknOGnRi71PXRXV8G
 XEhtmNbGkXdA5JbvM1R6w1dcOf10muZLYilfEFQJHhlC3QJM1NgJ5zDZlIQp/Q0JmaIg
 VaUl9P0ojXkzBNv5rQtnt64GqxlpGDK/kTAO+viNyUf/GdNctQmanwR5bBn8YhDMs64a
 0i+VEJfAO9xX2cJ1l7UXvRXAqZesyxcIgE08PeqsTu5VXKl83fdv/KQS/Imxin57J+dX
 sF//jXr2OV6+TDQHSf6I7b1SKRpapX/k/oxJNEk2uDmE0ElWvop64gE9H0nukQaT45dY
 IARQ==
X-Gm-Message-State: AOAM531NbO8HrvgqOcr4yep34HTeQ+XhWyjqaHqoSIEsnMAEmy0BjEDQ
 7XrDsq/fpI0qhvE1EGWgZt9Jjw==
X-Google-Smtp-Source: ABdhPJxipXZ3pPUdDvLkG9pV51F2kCcYuATtGJIpB6f4Xm3R3f4qiTkPuJ6p4dtY2G2dyLcqY+VDjQ==
X-Received: by 2002:a17:90a:74ca:: with SMTP id p10mr1570pjl.0.1629138207652; 
 Mon, 16 Aug 2021 11:23:27 -0700 (PDT)
Received: from [192.168.3.43] ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id n32sm92304pgl.69.2021.08.16.11.23.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Aug 2021 11:23:27 -0700 (PDT)
Subject: Re: [PATCH v3] accel/tcg: Clear PAGE_WRITE before translation
To: Ilya Leoshkevich <iii@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20210805204835.158918-1-iii@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ac89e57c-7b21-f554-f23c-9423957eb791@linaro.org>
Date: Mon, 16 Aug 2021 08:23:23 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210805204835.158918-1-iii@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -57
X-Spam_score: -5.8
X-Spam_bar: -----
X-Spam_report: (-5.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.71,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Andreas Krebbel <krebbel@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/5/21 10:48 AM, Ilya Leoshkevich wrote:
> translate_insn() implementations fetch instruction bytes piecemeal,
> which can cause qemu-user to generate inconsistent translations if
> another thread modifies them concurrently [1].
> 
> Fix by making pages containing translated instruction non-writable
> right before loading instruction bytes from them.
> 
> [1] https://lists.nongnu.org/archive/html/qemu-devel/2021-08/msg00644.html
> 
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---
> 
> v2: https://lists.nongnu.org/archive/html/qemu-devel/2021-08/msg00819.html
> v2 -> v3: Move translator_ld*_swap() functions from translator.h into
>            translator.c for a better size trade-off (Richard).

Thanks, queued.

I've split apart the patch so that we add the argument (and make all of the other changes 
to target/) before actually changing the mapping.

r~

