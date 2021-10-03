Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A8A42031D
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Oct 2021 19:33:33 +0200 (CEST)
Received: from localhost ([::1]:40936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mX5Mg-0000eq-78
	for lists+qemu-devel@lfdr.de; Sun, 03 Oct 2021 13:33:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mX5Jw-0007h9-3c
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 13:30:40 -0400
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c]:33530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mX5Ju-00034d-Nm
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 13:30:39 -0400
Received: by mail-qv1-xf2c.google.com with SMTP id a9so8752229qvf.0
 for <qemu-devel@nongnu.org>; Sun, 03 Oct 2021 10:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bFoY65933Z5hTpP4wWKZhdIFiRXyAO+IJTFiiAECmtE=;
 b=Pp+wfOjF85VTPg6/9qNcEcVwlNl8fHY0bHXTzyKMlW8yY4oRXdOqcqzT2FAV5P6X99
 OtHfem8MkLiw3cNbnUmY+w6WrSx41oO+whV6OCp3ydlreHotRhOOwxYs0oUq+OYsEBu8
 RQENGp3XwYyeVvsS0DsR0ZOMPohbtRqMdG9E8oCVFIAkb3H5UqcQDG5dYVIy0Ah+40AI
 UUgaNyBPevTlxcK7NYyvoiD7rqhzWquqksph+UZ3AR0C1CJXLYTgeuuoZCvG88ckqpFk
 bhhXU+70OY+5758+9fGaXLMsXkrAYt+grTK1R1eLfbTZgVfperQ5iqQy9bi8jZUOrg2b
 2oKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bFoY65933Z5hTpP4wWKZhdIFiRXyAO+IJTFiiAECmtE=;
 b=1qYVjFvtv6g0DoHba161cRfbS6d1fo6pLkdDGJfkY6twJu/I/bBUFEhn0vcnuONtct
 6lgD8bt8nUGHr22fhBF74irQDFZyURRcEZL2q1Bzge7ivuD7VGwer2JxfAhLOJNc1nHu
 SqF5uj7g+09GRdRvXZm47HjVorVdEoLr5pXuNjZnSru6/ltg8Snr1FNtY3dSe899KrVG
 GJvQAIV4zxW2Dn1JQF9LS5P/yK5FuRYq5/hP88A798UUHtQAYqDfaHG5smWYc4HmFg6B
 TJe5Hcbgfd79Ia+J4dIYKeWopCQQxrwK+55PoBCFAWJ4jriX637kIisHY5icqLihxgaT
 yhnQ==
X-Gm-Message-State: AOAM530nuly1HPyR30nc8kkQxtMjfZL1vrZ+haisVDFo18mJjadh87A/
 ytw54ZeQ88zUHXRuEL2/uTPU38Q+exQTDw==
X-Google-Smtp-Source: ABdhPJxI5721BY1fLy+SmzIbjmTQzf2BqV+YRl/vms6ApqCKU3fmB75CXIfccw/1YRTA+rVBA8nNCA==
X-Received: by 2002:ad4:54ee:: with SMTP id k14mr18502370qvx.46.1633282237709; 
 Sun, 03 Oct 2021 10:30:37 -0700 (PDT)
Received: from [192.168.3.43] (c-67-174-166-185.hsd1.ga.comcast.net.
 [67.174.166.185])
 by smtp.gmail.com with ESMTPSA id v7sm6327405qkd.41.2021.10.03.10.30.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Oct 2021 10:30:37 -0700 (PDT)
Subject: Re: [PATCH 2/2] target/riscv: Use dup_const_tl in orc.b to legalise
 truncation of constant
To: Philipp Tomsich <philipp.tomsich@vrull.eu>, qemu-devel@nongnu.org
References: <20210928205450.4121269-1-philipp.tomsich@vrull.eu>
 <20210928205450.4121269-2-philipp.tomsich@vrull.eu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4d8eade1-0ac8-dbc3-c9f0-66f9fcfd495c@linaro.org>
Date: Sun, 3 Oct 2021 13:30:35 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210928205450.4121269-2-philipp.tomsich@vrull.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2c;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/28/21 4:54 PM, Philipp Tomsich wrote:
> We need to use the newly introduced dup_const_tl in orc.b to legalise
> the truncation (to target_long) of the constant generated with dup_const.
> 
> Signed-off-by: Philipp Tomsich<philipp.tomsich@vrull.eu>
> ---
> 
>   target/riscv/insn_trans/trans_rvb.c.inc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

