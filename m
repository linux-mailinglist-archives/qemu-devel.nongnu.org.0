Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CCEC3722DB
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 00:06:18 +0200 (CEST)
Received: from localhost ([::1]:42932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldghk-0002SN-G2
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 18:06:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldgg1-00021I-FZ
 for qemu-devel@nongnu.org; Mon, 03 May 2021 18:04:29 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:35449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldgfz-0003YT-QK
 for qemu-devel@nongnu.org; Mon, 03 May 2021 18:04:29 -0400
Received: by mail-wr1-x42d.google.com with SMTP id a4so7178360wrr.2
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 15:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mxhpi5JKK8TaItl7R5ZGUeVmOp/DbTxiwPmkyEqyVl0=;
 b=icCkJ+Nw8s/nffVOFduHE4oyxD6/0OI3RgiI4u4BWBl1+r0sLbjPEQ6HILYdukR/n2
 atO8x2l8qYSDIReiWt1sUh7XVUJEIoC3IxFmrMEr1cKfqEgILNvbvymA8KdpaFcrT6dk
 30ZVJLu7J2ynumRerVnsuH5jNhOLt/jDJGBGp9CKfoZeMnMB6E3wPumbCuG/sd/mMvSy
 u6n8M9iepPbR8cGtA/mgiH3mE8W5FXp8cKKyWGZ6gwsZqBG2gU/iSvKRsc2a+AZ0TXSI
 meF0NK9mt04b3vKIX9fcnK3kMyOBp3pHxEaQUCiIclwty9zJjNwnP8+HA+MtLqIzyccV
 XHdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mxhpi5JKK8TaItl7R5ZGUeVmOp/DbTxiwPmkyEqyVl0=;
 b=SsHRksTi++crPcUvcz+obOFqU86Gi3hhuhFcbpcZDsiX/kTDut3MbFZzROo0a9VYfO
 U9kFG58KFqCjt5kepoqDE1piKHD1mCCmI/qhCX9fUQ5qYykfiBS0fhSxwxp5cZk0uZ7a
 GqiMrAj54ItQdaZaZgHHXs/VRXPO/R8QWi77SApm9v3Ud3HyGhSQAFlEUvylII3rB5S3
 LswbLpPwIdecgjoWF2Oi9iHIj9NxJPavyai2MqzFwVOU6lJCu0KmAJ+UWQbAZ37luKsE
 7Zjp0cUTKY29waiQguNWi3G8kA1VqNmifE1ASoplpxnWLi6xx4sUZKg4IlFXOmNITxbq
 rdJw==
X-Gm-Message-State: AOAM532CCFVyeoBQV4DQRWWmuOMybLWhZBNjj87VQAO1U1uE76KewAXB
 0N48iDUzjMJ+6VaaoCFDvHZ2YHWPUdddvQ==
X-Google-Smtp-Source: ABdhPJxgyJufglsihJ81hLqb0HtIdPa/DzuOYOZs1kbM3xdkuUJIJ2Ga6ETYqdmSS2WBRscgXVsr+w==
X-Received: by 2002:a5d:54c9:: with SMTP id x9mr27106489wrv.91.1620079465917; 
 Mon, 03 May 2021 15:04:25 -0700 (PDT)
Received: from [192.168.1.19] (anancy-651-1-208-144.w109-217.abo.wanadoo.fr.
 [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id a15sm13444135wrr.53.2021.05.03.15.04.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 May 2021 15:04:25 -0700 (PDT)
Subject: Re: [PATCH v6 19/26] tcg/tci: Implement extract, sextract
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210502235727.1979457-1-richard.henderson@linaro.org>
 <20210502235727.1979457-20-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <8bf8b493-5150-a9ad-561f-847a5c819ff9@amsat.org>
Date: Tue, 4 May 2021 00:04:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210502235727.1979457-20-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
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
>  tcg/tci/tcg-target.h     |  8 ++++----
>  tcg/tci.c                | 42 ++++++++++++++++++++++++++++++++++++++++
>  tcg/tci/tcg-target.c.inc | 32 ++++++++++++++++++++++++++++++
>  3 files changed, 78 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

