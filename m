Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 834263AFD3C
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 08:48:20 +0200 (CEST)
Received: from localhost ([::1]:57720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvaCp-00082Q-KG
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 02:48:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lvaBQ-000730-Mx
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 02:46:52 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:34489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lvaBP-00020R-5S
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 02:46:52 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 u5-20020a7bc0450000b02901480e40338bso932135wmc.1
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 23:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Q53D3uqUNxb+g7ym9Q3tgmUkS3yY3iTxog2/UWhKsuc=;
 b=s4+6Df7zCi4exEmkWVLRAjtltWTfa/7TK7wmkFKhQqtJaDT4PmqocXy2gTyR0GpK2o
 Gj3c/jfcPk2eyVUoT6eVd+P89Xuc907GB57Tsev0Tf4O/QCr70Vto7+ziROMNMeNMZOP
 OIEkT9Ju6yfNpq2u3WjnuTc1qR7LaE0kCFbVNbnGiBk6Y7FZkzTaziYCv9l8FWBb54Fr
 cmeB3GUoLCPLZ00e1o6494cRB12PQrRE5ec/RptTtoUr/cRLeiysRyVhKlHZVXPlHbaJ
 5J4sHxX0JA/u+Dg8dswXczfC/6t1gjHr3i1dX7dzV3R9UYOFmZCS1O/pMkVl2sIXytCU
 QEfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Q53D3uqUNxb+g7ym9Q3tgmUkS3yY3iTxog2/UWhKsuc=;
 b=lsStsU7Ac6dTcuKcaH+6BkoWaKXD3z3ajU3K6KCVS2pdeTXLXsvVz8DIXnjthXkv9x
 uZQ6fRWBk4J3lkqEOfCXv8a+od/gv7KqoRGNoxk9r+aUfJR4Q6D8FZjaWzWSLD4js4S5
 wu0KfTzYfEDL1F2E/e9haa0iz8BA/EdZZG5KDIry6y/UalvkVPMPXNYFnHXRMqUAMWTm
 8Rgo9nCY8Dzv259OY+1HBl+mPcUIQ/1tJcqhZ3x07u8XxouYJiJKL/olVjIb+tkp/LJt
 lEyu7YnzI/OkWAYHbyN4pHR4iYf/MyZGIukVfmgQHmAC1uxtkdzMjFL0zGqNuYiBWrrY
 0mSA==
X-Gm-Message-State: AOAM532s4GWamKR12yyowRs1thXAvsfVG6OzYaOofwDTKl/NX9zX3jaD
 H+01oFiyYfe98k5cm7DMSUc=
X-Google-Smtp-Source: ABdhPJygWjkBfP6MItD1pATaDGkrlym7tKymC+adKHS5K4l7l80m5i7Ljw8RwD5CTxTjS0e9atXm3Q==
X-Received: by 2002:a1c:1d8d:: with SMTP id d135mr2754654wmd.180.1624344409456; 
 Mon, 21 Jun 2021 23:46:49 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id h9sm1228506wmb.35.2021.06.21.23.46.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jun 2021 23:46:48 -0700 (PDT)
Subject: Re: [PATCH v2 19/29] tcg: Make use of bswap flags in tcg_gen_qemu_ld_*
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210621231849.1871164-1-richard.henderson@linaro.org>
 <20210621231849.1871164-20-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <17aaa6d6-9e1d-080b-19f4-ca5f2a92ab8d@amsat.org>
Date: Tue, 22 Jun 2021 08:46:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210621231849.1871164-20-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/22/21 1:18 AM, Richard Henderson wrote:
> We can perform any required sign-extension via TCG_BSWAP_OS.
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/tcg-op.c | 24 ++++++++++--------------
>  1 file changed, 10 insertions(+), 14 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

