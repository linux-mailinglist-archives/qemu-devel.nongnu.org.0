Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B009B3AE4FD
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 10:34:44 +0200 (CEST)
Received: from localhost ([::1]:58598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvFOF-0007bh-Py
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 04:34:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lvFMl-0005fL-62
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 04:33:11 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:35801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lvFMj-0002Qp-OI
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 04:33:10 -0400
Received: by mail-wr1-x42d.google.com with SMTP id m18so18622448wrv.2
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 01:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=V9B7xoyexwnYb5fkIHt4B5R2HU2WsuNTvQvPGkuQWv0=;
 b=uDBaEUDu9c5Wc0a0YIjSBBCODBIUixdmz6G0CxeVMrM1cKGbtxNtOKMXXmBmvdN0pZ
 CjGhc8ojeXyDFTgo+YR2Zwm7/dtZwL/tgRblLsf20He8le2eSLAaC8oNKwXStrgUBPY/
 9T+33CnuDn7Gtmjb1kuwP/lORl71KI6vQFSxrb9jiHaphZxJz5nqjkY2jFrQq6pzt6j8
 Vm6ecbRwJf2ETUJpqXkvr/qPpc6Z4CDEz6BRVHnmjsyalt83XKM4AJ19zs+UpxRrI54d
 lBjCvpteyBFzo/zqm7f2wve0kzH+OzyuYKWCo+U6RXhwsxmDk4Li03dYFmvTV4nbwQAv
 vg+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=V9B7xoyexwnYb5fkIHt4B5R2HU2WsuNTvQvPGkuQWv0=;
 b=TTrLLXfnBPiWOECa3zUHmF/OVCjnm+PMa/7SOwmuZNzjap1pvTcvPWNQ1VEzphzdDe
 39dZgGfHrlx8vj8pGYRBs1FfA+mr+dQFSoeGKqgakV/l0pMZ7iX0ti2zs60w/0wNUrhx
 yuoD5PD1ZeiN55rIQXO3AjdfcVWFlfB55PAv0Kumz0Vs+DARWlUjAmCnIkk+GEYUMlSR
 Ly9uHJyP07/DuAZPFTBPwTyGVOYpSXFCwV6HDj/DJKxuUCSe7frAE/3zGAb+iIDsK98d
 6E8FW7yy0fI/92M/6am1lnZi0QsoGXIjsroV0A9e6ehPgjSGlVpTEyuaMajlYVQ04noc
 HgjA==
X-Gm-Message-State: AOAM53069jjUpsPzdmlCa0ipUNcj8MB0wPL3qoJyAGelv4MOZjOVOwv6
 Zje30NScHp4GBYRKT06cnkgUxE9tSKHYUA==
X-Google-Smtp-Source: ABdhPJxqMdRaou8ttcrlxvMZulPGBzgZbgce4vmKHKD2bZNYNY3iLqyFp4gk+vc2QJoJb0+HKkiMsw==
X-Received: by 2002:a05:6000:4b:: with SMTP id
 k11mr21826239wrx.192.1624264387523; 
 Mon, 21 Jun 2021 01:33:07 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id q5sm16827104wmc.0.2021.06.21.01.33.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jun 2021 01:33:06 -0700 (PDT)
Subject: Re: [PATCH v2 3/3] target/avr: Convert to TranslatorOps
To: Michael Rolnik <mrolnik@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20210620215022.1510617-1-richard.henderson@linaro.org>
 <20210620215022.1510617-4-richard.henderson@linaro.org>
 <CAK4993hJGbWG067n3cqOg5dBKkvPnEfL6k4appc+=smMQGP7mw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <d6236689-c559-f9dd-00c7-a6ea7abed174@amsat.org>
Date: Mon, 21 Jun 2021 10:33:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAK4993hJGbWG067n3cqOg5dBKkvPnEfL6k4appc+=smMQGP7mw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Michael,

On 6/21/21 7:38 AM, Michael Rolnik wrote:
> Reviewed-by: Michael Rolnik <mrolnik@gmail.com <mailto:mrolnik@gmail.com>>
> Tested-by: Michael Rolnik <mrolnik@gmail.com <mailto:mrolnik@gmail.com>>

Are your tags valid for the latest patch or the whole series?

> On Mon, Jun 21, 2021 at 12:50 AM Richard Henderson
> <richard.henderson@linaro.org <mailto:richard.henderson@linaro.org>> wrote:
> 
>     Signed-off-by: Richard Henderson <richard.henderson@linaro.org
>     <mailto:richard.henderson@linaro.org>>
>     ---
>      target/avr/translate.c | 234 ++++++++++++++++++++++-------------------
>      1 file changed, 128 insertions(+), 106 deletions(-)


