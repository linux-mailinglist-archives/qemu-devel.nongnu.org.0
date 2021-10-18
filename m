Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BDF64328AB
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 22:58:52 +0200 (CEST)
Received: from localhost ([::1]:47900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcZid-00064g-CD
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 16:58:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mcZgI-00052W-FM
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 16:56:29 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:33534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mcZgA-00060b-22
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 16:56:25 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 q10-20020a17090a1b0a00b001a076a59640so666811pjq.0
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 13:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mFROUQGxPajjJDyyiBZuUAKFIjagCvXcTxAhyZrxrzI=;
 b=Y7icMjUfsNxzV1SS23D0bzqeTEdnX8n91dPF5KL1Sp9Kpp0pDiO13YWd36GT/2OGAu
 jtQyefWQTWqOR0k0+MhYE+fKJ9Kb2w9xZVM8PnaH9zR8jqXux1LqhfUXLWAXyDiLTQcb
 JtCt8X/31ddc05kPGg6oxVnZstDlvWYRU0XSHxpFWW0ElZvXErULmlysUS74wxfOqANO
 5suXpXH3bSAwAo0Z7wHWLsubjWtrzl5StpQ5rrbPnK7On+dWYsmjTJHLuyV5rqIGruHg
 bdcsIs24VrjYELl8klNrwK1w/7KTzTyqeO6gIjyCzqUyrwGvYhQ3H3tlMfPTKsV5Y7hn
 I0FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mFROUQGxPajjJDyyiBZuUAKFIjagCvXcTxAhyZrxrzI=;
 b=nw2uNm1FFWjbuCb0+Ce38KYSEcuRLwrQhJ5oB2XOyM9xNYbF56uG0ljoInMStJY9Nd
 S+arMYqkPkrL/qhu1xZ700UF7x6/SpkQHQsxyVFGc4loQq3DZkvDbVtAFsMqTYQa/30n
 dM2Jwt+b/Kw22gyvCiUPtDpO3w73aSGhXd0XDbAvQ+64AF3fzBdpkihT433b+MS3tM+m
 Dl2jwvJaXXCA/8lygy3GkbwuyL8X/p04DYw/DfVbxXPge30xPNbRkjK+IGTTo7B7jfYX
 nXF3ljuG9MVqEP/yKJ9I8Ufk8DSVYQMl2IUnZnSiywudZgjtMLA4tivlSRp99IZusgHx
 WmZg==
X-Gm-Message-State: AOAM532s1iKEd4qAHL/pdRUCqcoMg95SQqFNdIOuTh7I1O8z5jj3yS0K
 h3HFuadwiDDkTkW2y2H+/90sMg==
X-Google-Smtp-Source: ABdhPJymNPFRAFgebz9KoBJ3VQJ/9yrb2ht0+LoZbMSwV6rMkG7ThVngH+Wg1COUNj6Q71KJ0t6Hwg==
X-Received: by 2002:a17:90a:e64a:: with SMTP id
 ep10mr1427035pjb.124.1634590576161; 
 Mon, 18 Oct 2021 13:56:16 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id c9sm13571171pgq.58.2021.10.18.13.56.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Oct 2021 13:56:15 -0700 (PDT)
Subject: Re: [PATCH v2] hw/elf_ops.h: switch to ssize_t for elf loader return
 type
To: Luc Michel <lmichel@kalray.eu>, qemu-devel@nongnu.org
References: <20211014194325.19917-1-lmichel@kalray.eu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ca79c888-71dd-b9d9-d5d0-49dc235c99ec@linaro.org>
Date: Mon, 18 Oct 2021 13:56:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211014194325.19917-1-lmichel@kalray.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Stefano Garzarella <sgarzare@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/14/21 12:43 PM, Luc Michel wrote:
> Until now, int was used as the return type for all the ELF
> loader related functions. The returned value is the sum of all loaded
> program headers "MemSize" fields.
> 
> Because of the overflow check in elf_ops.h, trying to load an ELF bigger
> than INT_MAX will fail. Switch to ssize_t to remove this limitation.
> 
> Reviewed-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> Signed-off-by: Luc Michel<lmichel@kalray.eu>
> ---
> v2:
>    - Turn load_elf ret local variable to ssize_t [Stefano]
>    - Add Phil's R-B
> ---
>   include/hw/elf_ops.h | 27 ++++++++++----------
>   include/hw/loader.h  | 60 ++++++++++++++++++++++----------------------
>   hw/core/loader.c     | 60 +++++++++++++++++++++++---------------------
>   3 files changed, 75 insertions(+), 72 deletions(-)

I'm going to queue this to target-arm.next, as there doesn't seem to be another more 
obvious tree.


r~

