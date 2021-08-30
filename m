Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B482D3FBE8F
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 23:52:02 +0200 (CEST)
Received: from localhost ([::1]:43418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKpCD-0003lh-PA
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 17:52:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mKpAH-0001XZ-IN
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 17:50:01 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:39564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mKpAF-0000oc-W5
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 17:50:01 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 f9-20020a05600c1549b029025b0f5d8c6cso446624wmg.4
 for <qemu-devel@nongnu.org>; Mon, 30 Aug 2021 14:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=izq8i6RGqEB5FunFyk4fB88XoSyTc0XRSCGM6S8Qw4w=;
 b=Hpb3LZdt1x1nn2rpxgp9SVzAJYr5+spFY/V/zcNCAGlwLRnXDWBu6BgL62x81p+9Yz
 AOHdJuF+89EzBInoZ7tf1wOO4jJ6g3wtnM/4AXSOLVBkPAyGyEze3qcYeZhDPF6X84NA
 uMtZlbn3Fo8mr+u430eUqJjPmp8wgRitZQjjEDWfSUeDw+l8bSIThsOabkeLPEhuoGq3
 lNYhNybdp/MxrOR7OuPDvjp1wt9bALQEqjIPvBtyni9ytfa30v+tYZKB8WezGM/9rfvD
 Od1GxKLQmZGrqzhddXlHkw4XX7DAHuJqTyb3Lju87e65filQonwzPIhN9gXbdfskNEvt
 Kb5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=izq8i6RGqEB5FunFyk4fB88XoSyTc0XRSCGM6S8Qw4w=;
 b=aJGdEifHvueotJY4+A33R1tCzhGjyphwrekKaaOIip2GqnWZ4IrMDT1xwCGliep3zd
 o2FywD+iEP+ud4v5JkVUWTJFZsVZBhmqc5XL6SQAP4OHcNxfkwrYYpV1ZKuAEvj9lN7O
 ZtAY9P6ZPb6XwtWADW4Ga3xyNFiuGbw9JZI4Q1q/L+XfKW0VYjY1XCect1RFYREDR818
 3Jnpnfnqznw9RZub+EfWQLRo92ciCY38hvZdnGGb2fdAKR+r5RXY/78WefdaG8t4hNWS
 8xMM9Z95/ZXB3uIExHlyLQHK2dw+Ze7qbOTuIwySwF1vAqrIn9zprAu3N+uyhifiejVJ
 UunQ==
X-Gm-Message-State: AOAM531WbEKilUlnIC4sP7dK6Gkb7SKyglDMqEIssfsYiMnW5N3VqY1P
 zgVtQOsH4XxzMF6mbGhYC3MfW7++/G0=
X-Google-Smtp-Source: ABdhPJzAsVYnwKk1cG8rDpw6ftc7e2DqW5MNjiD3ML7aof3l9K0r0JPflE8TyGnZMaVzwLshj2Rg6Q==
X-Received: by 2002:a1c:f713:: with SMTP id v19mr1007065wmh.188.1630360198177; 
 Mon, 30 Aug 2021 14:49:58 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id z17sm12205641wrh.66.2021.08.30.14.49.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Aug 2021 14:49:57 -0700 (PDT)
Subject: Re: [PATCH 45/48] tcg/optimize: Propagate sign info for logical
 operations
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210830062451.639572-1-richard.henderson@linaro.org>
 <20210830062451.639572-46-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <61e652ef-03b9-7e1a-c2d2-d49d033b38f2@amsat.org>
Date: Mon, 30 Aug 2021 23:49:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210830062451.639572-46-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.932,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/30/21 8:24 AM, Richard Henderson wrote:
> Sign repetitions are perforce all identical, whether they are 1 or 0.
> Bitwise operations preserve the relative quantity of the repetitions.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/optimize.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

