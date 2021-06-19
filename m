Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6293AD901
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 11:35:08 +0200 (CEST)
Received: from localhost ([::1]:34002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luXNb-0000oy-3h
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 05:35:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1luXLo-0006tg-W8
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 05:33:18 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:47066)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1luXLm-0000c3-QU
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 05:33:15 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 h22-20020a05600c3516b02901a826f84095so7164598wmq.5
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 02:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=06KjZaVcLcdbIuoTRJPwxBrqyg2f6j3mbsVlG5ZvgiI=;
 b=ZpW1wl0ZbLV0nlCgfy2NrUUSE0H26urTAy/dD4HD9h27kFFsBjC/oEgBH8ypPk8FY1
 KRE9W4kDXZnuL+GcCjmdUJ1Vgo4lNoWC+N86QTD04DgzvIA/8rhFbzC0oBrlGUPQ+PLr
 U1FJlYvU3MIhiRG/twldcUcv/9RRqeXjmDvHqa6ZbwudejgdBpKFsSOc6A1w1pGWf1WK
 TfsLYOzRjCOcEZYAfTAlpQWnvZer5UjlWGHL1qYmfUCqc3k5VmEc//8uZFwU88Zafkyz
 qXV3h6tSix03HWsBWUVAT2MuhTFDX6TaVoQtXFm9pm+jh6WCvxL0+PGFfOcjKJxazR9n
 s89A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=06KjZaVcLcdbIuoTRJPwxBrqyg2f6j3mbsVlG5ZvgiI=;
 b=suQQCckowwqji4y61s4wiqPqzPQAHZAs01xKe6vbEvzE14R9KqWFPeyAoDc158+pBH
 B/AzIo84VjCZfKbIngVCevZbGQfH9E4EJIpPoMw2JdvHWx5zbIyp9IJIeQUBKxmFKXeL
 2PO1hjBedr/HKLAuzHntF3OjiFgiuZT/1uNSWAtQCnPo4W9JZFnyY9gaz3S8NdyXA8nn
 EDDjV7LXK9S4/V6wjtaP8f7CJuOWL4nUzA5dKk82+dhDaS5Trbv/pGjpDFmqtILt6u1p
 T3xfks3dsG6+kOBZ/OFBgV7a69TR+3wVGE6Y9uK3qqDArigxslNDtHF6vUeCYggMkW51
 pAOg==
X-Gm-Message-State: AOAM532e7A5qeG6kbNdL5fR7ar0c+y4q+aKhmQBGysKubrvtrK4v2vo8
 kaxuJgLIkmn9/WYE1VJza8s=
X-Google-Smtp-Source: ABdhPJzpN4dVn/y2wbgNDVKrPtHAVW7zDXNdm0pfl+KqGzQpXA7LgR8EfMXpGgI35+B93bbTHSGXWQ==
X-Received: by 2002:a1c:4e03:: with SMTP id g3mr15221985wmh.127.1624095192986; 
 Sat, 19 Jun 2021 02:33:12 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id l10sm11225013wrv.82.2021.06.19.02.33.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 19 Jun 2021 02:33:12 -0700 (PDT)
Subject: Re: [PATCH v2 07/23] linux-user/cris: Implement setup_sigtramp
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210618192951.125651-1-richard.henderson@linaro.org>
 <20210618192951.125651-8-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <5e279c7c-35d6-038c-78d5-19d84489a314@amsat.org>
Date: Sat, 19 Jun 2021 11:33:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210618192951.125651-8-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.202,
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@gmail.com>, alex.bennee@linaro.org,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/18/21 9:29 PM, Richard Henderson wrote:
> Split out setup_sigreturn so that we can continue to
> initialize the words on the stack, as documented.
> However, use the off-stack trampoline.
> 
> Cc: Edgar E. Iglesias <edgar.iglesias@gmail.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/cris/target_signal.h |  2 ++
>  linux-user/cris/signal.c        | 29 +++++++++++++++++++++--------
>  2 files changed, 23 insertions(+), 8 deletions(-)

Nitpicking, 6 -> 3 * 2? :)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

