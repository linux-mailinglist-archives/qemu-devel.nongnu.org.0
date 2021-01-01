Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B4A2E85E7
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jan 2021 00:18:41 +0100 (CET)
Received: from localhost ([::1]:49144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kvTgu-0002x9-UK
	for lists+qemu-devel@lfdr.de; Fri, 01 Jan 2021 18:18:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kvTfJ-00023a-Qb
 for qemu-devel@nongnu.org; Fri, 01 Jan 2021 18:17:01 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:38572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kvTfI-0003OZ-CA
 for qemu-devel@nongnu.org; Fri, 01 Jan 2021 18:17:01 -0500
Received: by mail-wm1-x336.google.com with SMTP id g185so10486444wmf.3
 for <qemu-devel@nongnu.org>; Fri, 01 Jan 2021 15:16:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=h/JqWn6/2SoAPuY2pL31ugZHQChSVZj1ZEJHoVJ7xoE=;
 b=K0DD9LfmJfWxlpHgWNUH/Zi3KNd028OqBX3Y4HC+pYXIqvGkqCIQ2OJpXUr6BSO8Wk
 wPZ2f04i29Wrlky+2m3LgEhiahidnObG87uYK/kKAVDpkQYzNRusKD6BveIquA7EgNhK
 KXx5YwWDJsYdMUR0Lf92wkj6QXCt64UETux9Ycp07+uFmGN9kxvCo/z9PkkYLKskbXTV
 81qHFC1bk08BPQLPNBigHmE1vd2UFpj5Y0VJHWHFidirj74Y7gL7I514lT44fNmudfyw
 9JsQnpyyRmr7CoS+ng5YLYh7YzV8BMVr4J7Ag+/1Dpcxiafx8DEa1EGXROdcqk7Rl/IV
 31yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=h/JqWn6/2SoAPuY2pL31ugZHQChSVZj1ZEJHoVJ7xoE=;
 b=svYpSNoRRuxbPVLZBham27m9CH/AAQLKMeNUgsU1Dy6L48auyEKYPiJCvtRHxdI/IN
 TdEx1HYTGNLznOdOm0SFETHHnRlfu18DB8u+mpRKbfb7VmgMyVJH+l+gp34O52rQqQlT
 n0b6T1xJbjOjcY8vTNiIsbtfpy0uBh+/8G+/fw4wWkvyP7o+Oq6SbtVJGkviNjZKqKPG
 jwL66INP2v3GrFYFclY/zosFtD9MAeQ4EvSFU23YMlPY0M55jbQUz1wJAf9DRGaRY6t0
 MX9uLDEC9MfdXhkXy3o/D0GAYnu0YfRlZ7UOeodeube0kYuAqPlqEea3SQwt8Uryezqj
 n07g==
X-Gm-Message-State: AOAM530yggNGyoNEhk0OtwYbEXXEmBMR5KFwU27fEs6hLsySwVKwzcE3
 FwyP7kHMU+D36FMV4qP02k9NjPQHH38=
X-Google-Smtp-Source: ABdhPJwivoKKZRsc0CYXFHoE0r7WSnn4dgBkZeL4YUAXduba/vYDGgtj4VYl7Mul6Ui6y/eqppeMoA==
X-Received: by 2002:a05:600c:258:: with SMTP id
 24mr17629173wmj.16.1609543019259; 
 Fri, 01 Jan 2021 15:16:59 -0800 (PST)
Received: from [192.168.1.34] (239.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.239])
 by smtp.gmail.com with ESMTPSA id o124sm20110129wmb.5.2021.01.01.15.16.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Jan 2021 15:16:58 -0800 (PST)
Subject: Re: [PATCH v2 6/8] target/mips/addr: Add translation helpers for KSEG1
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org
References: <20201215064200.28751-1-jiaxun.yang@flygoat.com>
 <20201215064507.30148-3-jiaxun.yang@flygoat.com>
 <6dda6b4b-5808-3e01-b5a8-8ab562a167a9@amsat.org>
Message-ID: <b08929ca-d7f1-b6eb-2223-5ea56033a591@amsat.org>
Date: Sat, 2 Jan 2021 00:16:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <6dda6b4b-5808-3e01-b5a8-8ab562a167a9@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.749,
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
Cc: chenhuacai@kernel.org, paulburton@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/1/21 9:42 PM, Philippe Mathieu-Daudé wrote:
> On 12/15/20 7:45 AM, Jiaxun Yang wrote:
>> It's useful for bootloader to do IO opreations.
>>
>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>> ---
>>  target/mips/addr.c | 10 ++++++++++
>>  target/mips/cpu.h  |  2 ++
>>  2 files changed, 12 insertions(+)
> 
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


