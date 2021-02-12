Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A5C31A559
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 20:27:14 +0100 (CET)
Received: from localhost ([::1]:34856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAe5x-0007Ja-QN
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 14:27:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lAdlU-0007lM-Dd
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 14:06:06 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:42805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lAdlS-0006Fp-4C
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 14:06:03 -0500
Received: by mail-wr1-x42a.google.com with SMTP id r21so410097wrr.9
 for <qemu-devel@nongnu.org>; Fri, 12 Feb 2021 11:06:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jqKCKcC3Ftr1+EOm9I8ZmQvGK9FoWzhHh8E38fG11oA=;
 b=I5pkGuy5SJMArlLZKIVcQzXJMuh2iB0RI4xnm9vS4T1/KKCoWArWcwjIjmc8yCeBqu
 /g6K2eBNCh/Z1y1QmgjFmlcDubICx4rEefUsiLzLmoeQ3SELRTaynAgxS+Al5uG7dmA/
 h1BrvvpZt+zGhdQHWb+i7wfaNY/F2BOj8I7SpE/KUVmLjJ/kVnq+9RuNFjp0N+wfmuJ3
 ZUS6amA/KrqNa99g9phXkWD908m+SfBSpWlqcrD4bACzVVgX00zM2seK+H3jm7JaJPlh
 UJ4Rwnd1gIG9Tmm1ZAOGZKF4DTmRx9fSXkj3RRQwLvehYniVMzs5aVCeNcoMXtSmzq3+
 9aKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jqKCKcC3Ftr1+EOm9I8ZmQvGK9FoWzhHh8E38fG11oA=;
 b=dzm4PX2pAQvZ41xMChGh+TcWiOa4X1kxivdNkVKxpyQi8U+75vTgi+NpGk6RzsnaaX
 BFAudxf41vRtIMG+IfTSMMEidAgCsj0I/lDZ+6IJ0WKX6+w5JHfROQS3aKmDfUJRxMvG
 kuQ4qHb+xpPZJp+pTjSkmrWYpu+CWvKIWgY6kPIwOA2WA61/pCJ69dMozByG2KPDbkYF
 L9Pn/j6EZUuywJVMu/f+eLsImUPykJx5vpFCpDumBiLlkYYTYSBBcGJ15AGVFegRkcvl
 JoJ6DlgUPY6pDDs3c72G0bYA61GOGvs1bDwzMpTxydPO3wBuUiffD7tKNkO05BV8U646
 19Kg==
X-Gm-Message-State: AOAM533FRl4HJFJqKMIYskbSgKcU94qFJCQV96piqPdEUI3gVrFYv4sG
 ZG961WW19bBH/HRGxf2x8Zg=
X-Google-Smtp-Source: ABdhPJxFPBz6Z/mF/nhW2mGS1cHla/AMs9H+JBBj5ObZijAjWoQXaNRMnh0WpJ2GFeVRZQnSaFTMAA==
X-Received: by 2002:adf:f701:: with SMTP id r1mr5133312wrp.353.1613156760537; 
 Fri, 12 Feb 2021 11:06:00 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id x9sm17455630wmb.14.2021.02.12.11.05.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Feb 2021 11:05:59 -0800 (PST)
Subject: Re: [PATCH v7 04/31] exec: Use uintptr_t in cpu_ldst.h
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210212184902.1251044-1-richard.henderson@linaro.org>
 <20210212184902.1251044-5-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <bb39d08c-91ad-4562-bfc4-f0d5982abfd4@amsat.org>
Date: Fri, 12 Feb 2021 20:05:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210212184902.1251044-5-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.119,
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/12/21 7:48 PM, Richard Henderson wrote:
> This is more descriptive than 'unsigned long'.
> No functional change, since these match on all linux+bsd hosts.
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/exec/cpu_ldst.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

