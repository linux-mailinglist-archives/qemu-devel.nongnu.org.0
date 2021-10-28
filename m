Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E8743E63B
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 18:38:46 +0200 (CEST)
Received: from localhost ([::1]:34336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg8QP-0003Ea-CX
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 12:38:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mg7vJ-0006zI-Nm
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 12:06:37 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:45654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mg7v6-0005nj-8c
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 12:06:36 -0400
Received: by mail-pl1-x636.google.com with SMTP id f8so4737089plo.12
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 09:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JhgE3TwApbRmbv/VEJNadv4ZWobGwFWNHSxc1DT31aM=;
 b=RR4q5SpcPfETQBuerwhI8xife5n6Mg8KEuaApFLSS85G0nmJyPOuZ53AMlrM1Kim1r
 8L+attKXgnOezHF7rP0NajUBlyYNooas3H6srR+36C9NTdxvUfXYBnEMZD7NGmF2kXko
 estO7Fkd724wZCqi2TMiTLZuil6t+W6CPUJYEpwPDXNXe0oJ37dBY/o5q2VevIY0aNhi
 wLl6v7N1ZwoUmyXIs83AS/Ka1bTY9RGrs8W9EjoT+vNG9F9FxQI1dpXT1Jd9KC5xphh6
 OwnBnmBcjvGCjS82XxMi3YNk8GehBaJmGC5Mk3HDyNILvvXAX4G9fb0HmBVgjLxKpUbf
 xVIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JhgE3TwApbRmbv/VEJNadv4ZWobGwFWNHSxc1DT31aM=;
 b=bXgwuC29u2MCURrur9/iqQR1ob07DFHN4pzptwnmF6d/bbQlqhSIPZsGFC8pQmf/Vx
 H1OeQUyw1WmK4fYYLJ4JhiBD7sFChFsuI/NNoldnBI6U3YZioxwIiqUV6iIzty4cf2zp
 dRvEkaZ+ICP6EhN1g7zLpDxO2+Z1o5Z2vEzpFtFhWncXsYvxfgC5ZvcnRzYB5rIX+jh8
 o1xPcb0Ob65FIAlAv9h9fyL4ksZqX+1mbtJt5HIjDO2hA50r6sQWZd3MYeGUpt0RF1fK
 am3yhoai5rVoXEm2j7mZgO3ZepTpYHeUpMZbiauEmrSa7wP8+qxGpzdSe2qLoUVrc0qM
 etsA==
X-Gm-Message-State: AOAM5337gnS0VP6RcK42MNKd3251QqsCfEMIrzfgpQa5lnr2J+KUS2wl
 zAGvbiJFVwHUnUfbhiSbZXzrq+6fvoM0Ng==
X-Google-Smtp-Source: ABdhPJx/AW01LI0f55UUJW08Bi4q+AaeqHrD0amfrAPJLEWjDpoq1pccP2yBgJ2bPX4FdWWgAMd5nQ==
X-Received: by 2002:a17:90a:fe8a:: with SMTP id
 co10mr5483680pjb.183.1635437182802; 
 Thu, 28 Oct 2021 09:06:22 -0700 (PDT)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id d15sm4372877pfu.12.2021.10.28.09.06.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Oct 2021 09:06:22 -0700 (PDT)
Subject: Re: [PATCH 15/24] bsd-user/arm/target_arch_elf.h: arm get hwcap
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20211019164447.16359-1-imp@bsdimp.com>
 <20211019164447.16359-16-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <585a6b5a-1ac5-9916-c922-260532ec754b@linaro.org>
Date: Thu, 28 Oct 2021 09:06:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211019164447.16359-16-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.847,
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
Cc: qemu-trivial@nongnu.org, Klye Evans <kevans@FreeBSD.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Stacey Son <sson@FreeBSD.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/19/21 9:44 AM, Warner Losh wrote:
> Implement get_elf_hwcap to get the first word of hardware capabilities.
> 
> Signed-off-by: Klye Evans<kevans@FreeBSD.org>
> Signed-off-by: Stacey Son<sson@FreeBSD.org>
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/arm/target_arch_elf.h | 72 +++++++++++++++++++++++++++++++++-
>   1 file changed, 71 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

