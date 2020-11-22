Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C1F2BC761
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Nov 2020 18:09:34 +0100 (CET)
Received: from localhost ([::1]:33488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgsrk-00089y-PZ
	for lists+qemu-devel@lfdr.de; Sun, 22 Nov 2020 12:09:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kgskU-00025a-E0
 for qemu-devel@nongnu.org; Sun, 22 Nov 2020 12:02:02 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:51214)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kgskS-0001xx-Rl
 for qemu-devel@nongnu.org; Sun, 22 Nov 2020 12:02:02 -0500
Received: by mail-wm1-x341.google.com with SMTP id a186so12874968wme.1
 for <qemu-devel@nongnu.org>; Sun, 22 Nov 2020 09:01:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+S9LXThIrHEoGQ8bPlCB1/ZKFiBZVS/LxMPo3Cn52KY=;
 b=Ge15GGRvbQ92o3Ayf0ZzRnqQ3FF7u8pw5iAiVw5icjBVYkR+38rus8yfj10EqcDKg+
 9viJMQorUwx5J/j00C4QygdUESVZkToqskIkbIPOfJwg1w3uOy6Lx4gPzjarOjemWv+p
 FaCFeMx65y238SwkrnMjyTlr2Q04Fv9IwgBqgyyKkh6RYiwx+Nye7WVvVx6kkeok9Bzc
 DcCLA/cWh5bpQ9b41ulVus4rikWc6h3IqPvYxuP//eoQPvLNuA7xzyK8c75DTLWLRB3Z
 E86lD57+FULaQJZnCOBWeKZ+8FX7kjOQxwW7rEhPKaas/mFZaj7a4HDfKuiX/M6Ppt9T
 WDZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+S9LXThIrHEoGQ8bPlCB1/ZKFiBZVS/LxMPo3Cn52KY=;
 b=ZT6ttKPsjdp3WGhgtmA3dCo7c0FtgYqC+NfuvjTrU0jwMeB3NdaQRWJ8Qep8yyreSU
 3TRuRJzK2uYcSY7xHaMX2kMZDLvgbUNniVTOxBH3Mv/ClZMTu+WZZvZvMNMXBHqC9WEM
 cgubGgn9r6B1B0bk9wVKs/eeaiPrNd9iK86Kx2dsUD38szCvN6eUlZ9lp64rZbSmxXqp
 WVryghu5pFu8R1mVeQHujVL8pQJ57CzmBASiMHLxKF4ymOfpNIwsH8qf/+HHojXtJVUD
 Eoz1jnjvMPrsbMWNFmO6BbkEVRC4XjFeOEyA8K6IdtEbCrGHlpD73aLm/uiurQQwLzFX
 crhw==
X-Gm-Message-State: AOAM533YbbtBld8SAItAd1agxbFVm5f4pfqx5eLBn1W2+iFvAnAKRQo9
 bq83V3VjoT4GUrkIiADVVUI=
X-Google-Smtp-Source: ABdhPJwV/o/64qQR+zhYDnja103d7a2sEOAyf1e2WNbxb/wS5+vv7wyXNoQPhF4oyQekSc8r1gF7Og==
X-Received: by 2002:a1c:1b85:: with SMTP id
 b127mr20788661wmb.163.1606064518819; 
 Sun, 22 Nov 2020 09:01:58 -0800 (PST)
Received: from [192.168.1.36] (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id h2sm12186766wme.45.2020.11.22.09.01.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 22 Nov 2020 09:01:57 -0800 (PST)
Subject: Re: [PATCH 01/26] target/mips: Extract FPU helpers to 'fpu_helper.h'
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20201120210844.2625602-1-f4bug@amsat.org>
 <20201120210844.2625602-2-f4bug@amsat.org>
 <663f897c-9ae2-49d0-89a3-1224a7f56c93@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <0b043505-a137-1cd9-ab3a-e9a4da8fddbb@amsat.org>
Date: Sun, 22 Nov 2020 18:01:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <663f897c-9ae2-49d0-89a3-1224a7f56c93@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x341.google.com
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
Cc: Fredrik Noring <noring@nocrew.org>, Craig Janeczek <jancraig@amazon.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Huacai Chen <chenhc@lemote.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/21/20 8:39 PM, Richard Henderson wrote:
> On 11/20/20 1:08 PM, Philippe Mathieu-Daudé wrote:
>> Extract FPU specific helpers from "internal.h" to "fpu_helper.h".
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  target/mips/fpu_helper.h   | 50 ++++++++++++++++++++++++++++++++++++++
>>  target/mips/internal.h     | 42 --------------------------------
>>  linux-user/mips/cpu_loop.c |  1 +
>>  target/mips/fpu_helper.c   |  1 +
>>  target/mips/gdbstub.c      |  1 +
>>  target/mips/kvm.c          |  1 +
>>  target/mips/machine.c      |  1 +
>>  target/mips/msa_helper.c   |  1 +
>>  target/mips/translate.c    |  1 +
>>  9 files changed, 57 insertions(+), 42 deletions(-)
>>  create mode 100644 target/mips/fpu_helper.h
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> 
>> +extern unsigned int ieee_rm[];
> 
> Note for future cleanup: const FloatRoundMode.

Good point, cleaner.

Thanks!

Phil.

