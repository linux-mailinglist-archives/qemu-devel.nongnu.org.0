Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2F22FF7E0
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 23:22:35 +0100 (CET)
Received: from localhost ([::1]:53180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2iLa-0002su-GX
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 17:22:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l2iK0-0001vf-Qx
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 17:20:56 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:45655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l2iJy-0004Op-Ui
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 17:20:56 -0500
Received: by mail-ed1-x530.google.com with SMTP id f1so4330750edr.12
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 14:20:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Q5avNgvBoAUAPLfuUBSUKu+nHg30G/SGwdgQmpI1x1M=;
 b=WrcDB4ZqldArdeMPXqtyj5QHXr1XGBEcLTgRz5ITn0vG06DMfgR0fj1Jw8a6Rjc6zL
 Cwu7DMORoLEAtpyQaI0Un2z9+Vf9U5TINrzgd94oFsDUupnhiNESMclwAmUv/7e0RUxj
 eAFD8cggF91S+uwL9O2kRZlexAqZdU/y4hsqunWtEnds8k7rn84lTnI/WP6N5iG3cKkZ
 X94tkXvaKQNG7YtPJatD/xpN4dXaB5dqpWYdjex4JEhl5AIL9fyANjh71nfunXDgquWD
 t17foT/Vt47GmjK55CTUz+mEz06ufhpQ1wmiPgvYxSmoD/ujsb15R94Wyic6d+UCaF2H
 ERHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Q5avNgvBoAUAPLfuUBSUKu+nHg30G/SGwdgQmpI1x1M=;
 b=L+D4KNblfh4OTnxMskoIW4niIO6tBnEguLhWq0P+KHzn/7uL4ru7TUc15MhsTkVrOF
 gykEfpVooN/h2K4UUOMNERzGj4mDIajrwKmrU9vWWo7EvvEgAuM9vpgxsiw+z/AAI/Ve
 Ych2lWU1TBqlQhBifYWlZO2MUyNn5FdfVq0/oCHNEApi4z3Cq56mXE2DpwplOtmz6vhd
 bksIpKYg6eXQFefYK6igjOPLnxBSz0H6wGigth7grNAL+RNgonIwi++sGl8uGl5LGtIq
 d7FvihGsJkharYwcSm5I8B5NA91DPPjXhycXyEL7FZ3GyPBO1NLexVWg1yM+DSeGKzID
 tUKA==
X-Gm-Message-State: AOAM530feWezYr6aFF0ra+Wl+cXSAKJBj2rNey/aod+0Pmh/sd1h+ym7
 uIStuopaFtH0NrrG+O/tCeM=
X-Google-Smtp-Source: ABdhPJxOig1LHDQs9XUJUK5CrhWQBHw5R0LjjfGoaumaZ64fWXV9CDqPVFrT4qRVKDC2HfAwEJRmbg==
X-Received: by 2002:a50:85c4:: with SMTP id q4mr1000319edh.7.1611267653221;
 Thu, 21 Jan 2021 14:20:53 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id r18sm3654943edx.41.2021.01.21.14.20.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jan 2021 14:20:52 -0800 (PST)
Subject: Re: [PATCH 0/6] target/mips: Convert Loongson LEXT opcodes to
 decodetree
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210112215504.2093955-1-f4bug@amsat.org>
 <e0385d70-81d7-fe70-b5c3-6607c1212ce9@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <cb45ca32-848b-8a7c-ceae-deefa531196c@amsat.org>
Date: Thu, 21 Jan 2021 23:20:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <e0385d70-81d7-fe70-b5c3-6607c1212ce9@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x530.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/21/21 9:07 PM, Richard Henderson wrote:
> On 1/12/21 11:54 AM, Philippe Mathieu-Daudé wrote:
>> Based-on: <20210112184156.2014305-1-f4bug@amsat.org>
>>           "decodetree: Allow 'dot' in opcode names"
> 
> I'm still unconvinced about this.  I've reviewed the code without regard to the
> spelling in the decodetree files.

Understood.

Thanks for your review!

Phil.

