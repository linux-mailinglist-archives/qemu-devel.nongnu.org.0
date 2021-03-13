Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5D8339F9E
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 18:49:39 +0100 (CET)
Received: from localhost ([::1]:54440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lL8OQ-0004lz-W0
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 12:49:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lL8Mw-0004Fz-2d
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 12:48:06 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:39550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lL8Mu-0000dG-OF
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 12:48:05 -0500
Received: by mail-wr1-x435.google.com with SMTP id e18so3498915wrt.6
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 09:48:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bWdHBNTBopUCetyPFObBsh0RONrFjGLhc5g9jETie3E=;
 b=uC6vuYbBpkaMxlklkzk0+upTPHNSrwQnY1y60kyyAJaQP4hXw5s1Z61tX0MlFvAW0g
 EeFJ/ypj+SxsyiM2Ok8iNSn76yKh0nRKRXqdYK0Y6eSvFuYMR9NG2WTu5IcCdJcSqUCP
 AVxQERchB/naJhNooqRZlJlaGMlG9caM53M8Niy1zlqz3EYAcZ7eC6S+VtDZ8oz6Byi0
 Q9kNI1VqT0h/BR0h3if+LN2cVGrYO/Wn4koredk0AMFGd7jI5pL1K5kvgub4N7PeHLzw
 7eV5oecTvqUnx/SVp7mWEln9gzWvGknHWsD1x95X8I2VVLJVD2/X+HewXnHUUkMvR7fX
 hfdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bWdHBNTBopUCetyPFObBsh0RONrFjGLhc5g9jETie3E=;
 b=LRLQz+BYCcuXyEPoYPsZ3p8KkVi50PLgiFNxWeUKHN7X+bZo1fYcfWOrC82dfST30x
 CJJDVn1692eAIIRaib6/jGvOn7CAAfSoFfhtxrQdfZsYWMpzgqMU4YwoIohXnqSWiEYY
 t5CZY/2grpzs5VFPYCRGezEJNvxCugFJfeoFId4HLsOfCbqvmo6MlEVw+RkHslXTK8M0
 4WpAev42qLiCAbCgppJQa1uocI3FZu79DHNyAZTSivBBV6K44pkaYNrhOGZE4AzOwJtt
 5RzZ7JciCobYeL6gjt0hsnsk3BN/ieqpuTu0eNCQ95ahTnlDvNsO0NTtvt9JOwId8zWY
 Y03Q==
X-Gm-Message-State: AOAM530k5dGihVcVqB2QrgHrGctqSXxJB+pmO3TRE/YfvPRf6CqzMQby
 468BGm4BWVj0MSF7enfx00U=
X-Google-Smtp-Source: ABdhPJw1lWQ9GR1RYiEAbVUcQs+v+QJb6hXq2NqfY5YIsusDYKAObpbSCXoRjNiinY9AYTpEhU2OSQ==
X-Received: by 2002:a5d:64ac:: with SMTP id m12mr19512585wrp.138.1615657683476; 
 Sat, 13 Mar 2021 09:48:03 -0800 (PST)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id 1sm7326783wmj.2.2021.03.13.09.48.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Mar 2021 09:48:02 -0800 (PST)
Subject: Re: [PATCH 15/26] tcg: Introduce tcg_max_ctxs
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210311002156.253711-1-richard.henderson@linaro.org>
 <20210311002156.253711-16-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <39276b5b-501f-284c-33d6-1f038234e3c9@amsat.org>
Date: Sat, 13 Mar 2021 18:48:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210311002156.253711-16-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
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
Cc: r.bolshakov@yadro.com, j@getutm.app
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/11/21 1:21 AM, Richard Henderson wrote:
> Finish the divorce of tcg/ from hw/, and do not take
> the max cpu value from MachineState; just rememver what

Typo "remember"

> we were passed in tcg_init.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/internal.h |  3 ++-
>  tcg/region.c   |  6 +++---
>  tcg/tcg.c      | 23 ++++++++++-------------
>  3 files changed, 15 insertions(+), 17 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

