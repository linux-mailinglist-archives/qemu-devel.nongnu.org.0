Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC7F3722E2
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 00:12:00 +0200 (CEST)
Received: from localhost ([::1]:45822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldgnG-0003vo-Hp
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 18:11:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldglV-0003L6-Ai
 for qemu-devel@nongnu.org; Mon, 03 May 2021 18:10:14 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:50906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldglT-0006bf-Nr
 for qemu-devel@nongnu.org; Mon, 03 May 2021 18:10:09 -0400
Received: by mail-wm1-x331.google.com with SMTP id n84so4216488wma.0
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 15:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=71JRebHiLRoLp4g6vd4qFSi3hB7rH1vEZImVIWsg2hk=;
 b=EXAWFjkQUtds9LITyfMfhDiHP0//pUbs+z+geXZ6GJlIbLe8hW/lxYWw+YDcg618Mm
 BafyJmorU3W78aXAioz4hj6uNFHsXuWhqpE2mTJ9X6X2Rnr+Zr5CDMTlOGa/hLiGeKL1
 YbOtoe7yqUEfcd3rWhUgue9bFUE15FFGP05mIQs5fp/lJsPu75DbkOwoOZ9P94Ul+/nI
 2ZQb2GCNWjQkwmyOHJCmZdt7iMLDAdXH531R34GFvWAPJLGEv8FP6/8rUuOxmBIyxMXD
 Rto+bYs9QSYb/v862M4IynQ41fBUrUfLvSMu2cb5s9xG6sEoOyeMCV7XOUgBhQtpX+Nm
 R5eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=71JRebHiLRoLp4g6vd4qFSi3hB7rH1vEZImVIWsg2hk=;
 b=YGlOu60mtSa4JPa15ESMkKrOIhAoXAbnNJMKl6MzMKtW/7nkpYOePcF//kG6aM2c/i
 aYCYjEGM0Asjp6DM8+QpxtL/RjEJ455VVv8ji1yflrC91gd4EK3o8CvgxOmyBuykIyqh
 dTfqzInUhXJtM3gTu+xwNvdHC2hvFM5lrhF829oGEjkwZrXCuCtj0KMgEFRLTumLbCuf
 Wetdx4+tLni5a2Hy6egLUHHeM7Iaxu0DTJlMeI0s0FSxPiUJvcr7HYrMhwegAt+vCqOz
 SYvLy7bFV30TFR4JZid1I7fxQlL3OVf9QBEkAjxArvAarVlHjNrHMPiWOpM+6m6ZNM2x
 zBkQ==
X-Gm-Message-State: AOAM532lJ4aHrAgVHPkYKgr1iF5ulMO6aeE7OrBGlysC50qSnRTjFROP
 ZrYHqUNAQwdyIrkbNvO3kvMtYgMf/n2dbw==
X-Google-Smtp-Source: ABdhPJx1I7Bu8aWWf85AuZXuwWoqEvkSSECDFeKPq9CHUk9EIzHEqUBPYVxUEPTJPDQIddPdvFMFQA==
X-Received: by 2002:a7b:c312:: with SMTP id k18mr24205424wmj.89.1620079806025; 
 Mon, 03 May 2021 15:10:06 -0700 (PDT)
Received: from [192.168.1.19] (anancy-651-1-208-144.w109-217.abo.wanadoo.fr.
 [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id h5sm657052wmq.23.2021.05.03.15.10.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 May 2021 15:10:05 -0700 (PDT)
Subject: Re: [PATCH v6 20/26] tcg/tci: Implement clz, ctz, ctpop
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210502235727.1979457-1-richard.henderson@linaro.org>
 <20210502235727.1979457-21-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <a127f345-8ca2-4f09-12a8-9a644ac14f6c@amsat.org>
Date: Tue, 4 May 2021 00:10:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210502235727.1979457-21-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/3/21 1:57 AM, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/tci/tcg-target.h     | 12 +++++------
>  tcg/tci.c                | 44 ++++++++++++++++++++++++++++++++++++++++
>  tcg/tci/tcg-target.c.inc |  9 ++++++++
>  3 files changed, 59 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

