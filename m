Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35FE93BE440
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 10:20:36 +0200 (CEST)
Received: from localhost ([::1]:43216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m12nL-0002eb-8O
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 04:20:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m12mQ-0001gX-4e; Wed, 07 Jul 2021 04:19:38 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:56097)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m12mO-0004aS-NC; Wed, 07 Jul 2021 04:19:37 -0400
Received: by mail-wm1-x32f.google.com with SMTP id j34so1220833wms.5;
 Wed, 07 Jul 2021 01:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0VvLrPkUw1CijMSUnXNhF63BtgLwLzjXm9/+kAQ4kWc=;
 b=KqsmbVqceuEl5hi2YdvhaJ+65CD2XGRYpRKgPFH1tjT6oRM+cLq/0UjziobywPp2+I
 +WFw9h5p6eabVJRO6K1on8Nts7L0HxmTYZdvLz0EBWxFOhWzvApTMeSuUZPSNA696QGh
 ePKHUJNWylSMKuNrwIXfUUnqzuUAOpRiUqRFSNr3TkowIhWzxWt3FlnpFIEEGizjJoBF
 9UZUmL8dYzsPpJJ1FhzXR7P2YBTqoQtnLXfiAE+qvri/CYsIrA1xy58RwmHvGKkmLoeL
 9+fixQNXiLkabX6IRUh2ScE4EKLUjp0fYehijGvzCmMb5kmA2vN2S629hk8B0/6TfVE2
 AKdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0VvLrPkUw1CijMSUnXNhF63BtgLwLzjXm9/+kAQ4kWc=;
 b=Jhkd2PuxHgT9EOmJXN23JIrFSk/f10vrZhZ/NJO3YdSL5a9598Jv8WOJD24IHP8GIy
 Ng9NKNIp/bU1V0eUyA6yoGsOFaEP91dlL7ZevaogNaJOd4w5mb4MlsrQu+i6B5P6Bjr6
 b0PngEGf7sQyh41ozV8Wu79W7c3Buu0/SjKvDYSFU2jx7fIfsJTTBFvzuCr03H2taqA5
 JBgpldLXyRbu/5q20b46vJx3VoZ6YDKErQkkDYSGpXFDsgeTXZDQqFZxRBqNJ6UZw0ig
 3uMivNVRaUA2L43lf/9paWTP5UE9cmD/ngYkD6S2mpfchEyf9Ws/AAGHVjThlaQbdaxP
 /kdg==
X-Gm-Message-State: AOAM533yyeBwL91T0wrHspRNK2E3FEZFG+1j1CxjsyVX1EbOUbDfD+KS
 oLBpc8Cnn7a4H/MgUdSxXuc=
X-Google-Smtp-Source: ABdhPJztxgOt9Uc4XTtuuOBHrOj1Ghbr7UWD/+oqmu8upmbBTL7dcr8VYgX7m2v61C1gEaz7gqd9qA==
X-Received: by 2002:a05:600c:198c:: with SMTP id
 t12mr24735717wmq.140.1625645974993; 
 Wed, 07 Jul 2021 01:19:34 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id e8sm19598774wrq.10.2021.07.07.01.19.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jul 2021 01:19:34 -0700 (PDT)
Subject: Re: [PATCH v2 13/36] linux-user/arm: Drop v1 signal frames
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210706234932.356913-1-richard.henderson@linaro.org>
 <20210706234932.356913-14-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <be2cbb7e-1375-ce67-a62b-ad8a60fee721@amsat.org>
Date: Wed, 7 Jul 2021 10:19:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210706234932.356913-14-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 alex.bennee@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/7/21 1:49 AM, Richard Henderson wrote:
> Version 2 signal frames are used from 2.6.12.
> Since cbc14e6f286, we have set UNAME_MINIMUM_RELEASE to 2.6.32,
> which means that version 1 signal frames are never used.
> 
> Cc: qemu-arm@nongnu.org
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/arm/signal.c | 220 +---------------------------------------
>  1 file changed, 4 insertions(+), 216 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

