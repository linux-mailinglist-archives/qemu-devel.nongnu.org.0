Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A1E369040
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 12:22:46 +0200 (CEST)
Received: from localhost ([::1]:54286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZsxR-0000s0-MT
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 06:22:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lZswP-0000QD-Gr
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 06:21:41 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:39472)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lZswN-0006By-Tn
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 06:21:41 -0400
Received: by mail-wr1-x430.google.com with SMTP id s7so47742545wru.6
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 03:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6TBtJ2Cq9Hf/qvd2r7/5Sn62A6Gy1R7P/58p7F6arW4=;
 b=Y2dEKwLbGNBnK5uRHAhGSp+WX7WI4F8jyI8w4MC9DEL6k/HfpSyRcrsBK1teyLaUmI
 J7vDnLdMdRtpnr/uyxF4SbHXeqQuT/O1M9VxKH2c7Gptm0VGzTbkNvTZcyVJVBFim//C
 mZezmwtxeICtmFqoXhxSxtP913I735cPWVcXLk/Bh8cvbGgSFgHmO13WH6aC7SUlvSHF
 cI+Wbj1liG4qiG8bPxej63lXd5qxEHoSQsZq5v1JEtGrELzeSxMAqJA8xxCNGxjxrTPM
 /9FGbVap3u7Vu1WZpIr1oePU1l5VqNMoafARlpXv6bGD7WUlqP150Mhr3A7j8eI7wDRK
 c8Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6TBtJ2Cq9Hf/qvd2r7/5Sn62A6Gy1R7P/58p7F6arW4=;
 b=kJMwllOiSOqnIqPUISyzI0Y4nZkz8sxHKsLey61x84Uh/S4qR6R3Xccdxd6/tfWOj6
 juJvULxsx1BjOQ0CyHtYYpPH18XChAFEQANijueAqlf5AgOi+DFAIpdfzSebqK+nEk3N
 tTd8if9/Zbig9HoUAzmkjHcvYi3H+GoxbYJBwP7Yo/Ki5ufY4ROaoxPmPl8Oik73+UKh
 zWyikyFroFDbk453VUfSh+dj1IAirIs01q3N4d+TYT9w+TsiCbU5r5Bt8ciQVbvkcUZl
 VcUzpDd8WgY5GOElc/w21rSikuqx92F8fKh4TordiZFk34BKEPwvfA7J6rs8bkGN2qVF
 a94g==
X-Gm-Message-State: AOAM530uIttcQUeRaC8B0d1XcZTtmh/TQP0c7W5YXO8leJHfZolMftL6
 y2I/+MJRWPhPx1jSUut7y8A=
X-Google-Smtp-Source: ABdhPJz0gx0SRbBeNdKfbBw5evgrN1A+5w3XKVCCmPjx2R6+SXZS2lKX+Gd+9D6AruzW5AU8KK4tyA==
X-Received: by 2002:adf:e60e:: with SMTP id p14mr3642354wrm.427.1619173297827; 
 Fri, 23 Apr 2021 03:21:37 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id z17sm8516842wro.1.2021.04.23.03.21.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Apr 2021 03:21:36 -0700 (PDT)
Subject: Re: [PATCH v2 4/7] linux-user: Honor TARGET_ARCH_HAS_SA_RESTORER in
 do_syscall
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210422230227.314751-1-richard.henderson@linaro.org>
 <20210422230227.314751-5-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <51544b46-f42e-5004-9fe0-6496e8214342@amsat.org>
Date: Fri, 23 Apr 2021 12:21:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210422230227.314751-5-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/23/21 1:02 AM, Richard Henderson wrote:
> Do not access a field that may not be present.  This will
> become an issue when sharing more code in the next patch.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/syscall.c | 4 ++++
>  1 file changed, 4 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

