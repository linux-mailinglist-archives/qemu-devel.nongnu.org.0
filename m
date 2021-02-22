Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 883E3321234
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 09:46:22 +0100 (CET)
Received: from localhost ([::1]:47076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lE6rF-0002U9-J2
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 03:46:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lE6mR-0006Vx-5s
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 03:41:24 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:54669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lE6mO-0004TI-SQ
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 03:41:22 -0500
Received: by mail-wm1-x32a.google.com with SMTP id w4so12665519wmi.4
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 00:41:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CZ43ua4NTg1G5XB8QP57+s0uB0pCbXWU5unu8PQvI7U=;
 b=kxIvV/dp/KZEeMgBFWLddIgEiJlhmFtjNGtytpH9ws1anc+2L1iM3f2fKHbMTXmYas
 vp6fbT7i8zi4JRC7UE/+/yyRc80dvX2aDr9+Apptb8AenOYIytJpcH01qc2pWKSXhf+k
 UUHRPUdMRaIIsOm8CR2iLn7LzCfuZMwk7XN60mKQrMPs8OH8i5T38foU5DhMdk/fSUqY
 tUGVLUYPpmlPwxWGRx+L7IoQyu6pkl8BZSFIjZhWvk5XpaiyI0G0A7+ydoGSJs2+pQ0U
 h274LLx6VaLrSXtrS/OWhsIkDzXEGhnyIruqjzI2HZnlAOUZReWYi9gXkDWwGusd2cL7
 w5FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CZ43ua4NTg1G5XB8QP57+s0uB0pCbXWU5unu8PQvI7U=;
 b=tON2VQ4bMx4XxA/zORgeQ5gYYKIn1gJROZW3WoX57L4HW0L7aeF9vvQyHOufZmaEzZ
 vy87ak0eKaOp+JUj4R+jWN+Gji/CJ2o6wmnddjkIMaWQJnku1GDMWXGBRcC6uRQ1+7Ul
 +PfHIlaLu6P3aYVGCRz9tAQ/pswDx5fPURx9Pp4WWgYKwlF7YFbeXDQA2dk6PwOvfXOH
 vo6yBUE/s4tUVhzeuI9bt7QKDPpiPp5ftxsluwJcod5lCOX42WVTeyytRNcRwmYXeoh4
 EqQYoPeT8LDL6cKFMhPYWiQ4CkhVn1h+k+IEv+P5hBuAsGUmXS2Mi5oUu3cwr83eHPyU
 anaw==
X-Gm-Message-State: AOAM530fx+5RA3grTkgja8mrhGi0yTwCcFfLw+YLgZOEquCNkuEVtOC5
 wMqEx5hMEP4/lYUYWg3eesI=
X-Google-Smtp-Source: ABdhPJxz01ArdVjkpL52cd/iqqIijvCGb6paUOLjo9In3G+O/OWJiQDG3ktN6ua+Y53K8yirkzcLdA==
X-Received: by 2002:a1c:f312:: with SMTP id q18mr19119727wmq.79.1613983278435; 
 Mon, 22 Feb 2021 00:41:18 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id x66sm24799497wmg.6.2021.02.22.00.41.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Feb 2021 00:41:17 -0800 (PST)
Subject: Re: [PULL v1 3/3] target/cris: Plug leakage of TCG temporaries
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-devel@nongnu.org
References: <20210222083324.331908-1-edgar.iglesias@gmail.com>
 <20210222083324.331908-4-edgar.iglesias@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <39885acc-a692-cd6c-c0bf-46e3193a4d7b@amsat.org>
Date: Mon, 22 Feb 2021 09:41:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210222083324.331908-4-edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org, stefans@axis.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Edgar,

On 2/22/21 9:33 AM, Edgar E. Iglesias wrote:
> From: Stefan Sandstrom <stefans@axis.com>
> 
> Add and fix deallocation of temporary TCG registers in CRIS code
> generation.
> 
> Tested-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> Change-Id: I17fce5d95bdc4418337ba885d53ba97afb1bafcc

Out of curiosity, what is this Change-Id?

> Signed-off-by: Stefan Sandström <stefans@axis.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Message-Id: <20210219124416.28178-1-stefans@axis.com>
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> ---
>  target/cris/translate.c         | 124 ++++++++++++++++++++++----------
>  target/cris/translate_v10.c.inc |  70 ++++++++++++------
>  2 files changed, 135 insertions(+), 59 deletions(-)

