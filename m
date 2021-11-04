Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9373A4458FF
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 18:51:45 +0100 (CET)
Received: from localhost ([::1]:38726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1migts-000784-O2
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 13:51:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1migrJ-0003cY-7Y
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 13:49:05 -0400
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b]:46833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1migrG-0008J5-Kq
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 13:49:04 -0400
Received: by mail-qt1-x82b.google.com with SMTP id s1so4840857qta.13
 for <qemu-devel@nongnu.org>; Thu, 04 Nov 2021 10:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hs4+2w+EPhh1gsybkdyrjCeFQnWf4C2zk7arz+gwxrM=;
 b=dwihwSd6VrF3at5HThaE0CmXhAa3DIV1ZakuLBaIAyJwuoUiw4YL93Gqr6dNjZa0bk
 WnTqru+p40s/4TYeXu9y0LnQDA6H0+KzX/+Skopt3UdzoK2vG+9ONCxxy7aVi6ZEEBc1
 p33/zuwpUGDZjkU2UO6AW/e4oteN2Kd6Yk9pHXhTALAbFYYzKIGTloRp5boA3llpv9ov
 OI2rCEwC4sG41c5GJ5U8I5e+kFouEaWi7qMhC7Ovr/YCASe4A29G/BFYX9/yvSnO+htf
 N37BtDstKIC+S5UcQoxKvPnt+pIIB/o3WLsrsjQkj9IBRaV8rFaNMVU/yTtOsmjDM0u6
 SnRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hs4+2w+EPhh1gsybkdyrjCeFQnWf4C2zk7arz+gwxrM=;
 b=78uuU/yn8Zr1iXMYLkfSJeRpYzDqdr8uFPRhehEq0mEsK0qQGgn/sdpeHFf5hacJ4N
 ADE3DDhR6SLj7Sp8U5OzyxOdAt50mIoq1/xbXSWD5A65C3dRC2+7F7r4FQzY6ded/Kf/
 ytXTLK4KQldKx5Yha3rGFbD/JDZaGyAZYFlpyOaPt6d3hR9T0Y8qd+rezDlqAoECBPFE
 CevorvD1WxavaS99AWc+2mx0UyW6fAn/c/lEjCqf7H2kQyDwJbTbNPG3H8JXZdPzcZrV
 k86mielc0HwBpVeXUxqYzMfVDmV0TKndAAU39TQDaoWY4k/EB5mlHZpEnjx1GNKDNWKx
 ebTA==
X-Gm-Message-State: AOAM5324IRPgTlIMZn7DoKkuhFqvsfDO0XeZn3lLvETQVhwOOz/D/m6G
 TGKJF9iif4qOa7WCtaQNb085mg==
X-Google-Smtp-Source: ABdhPJy+L7uatWrMkqZuQ0aBiTK6JW3P4V72NUYE6DnRRWYu1+tJ7bswHxKxxGHbg+9Bvr0Mw7EsYA==
X-Received: by 2002:ac8:5888:: with SMTP id t8mr55386761qta.121.1636048141438; 
 Thu, 04 Nov 2021 10:49:01 -0700 (PDT)
Received: from ?IPv6:2607:fb90:f802:6e0c:4407:203:e794:8e1f?
 ([2607:fb90:f802:6e0c:4407:203:e794:8e1f])
 by smtp.gmail.com with ESMTPSA id w9sm4200739qkp.12.2021.11.04.10.49.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Nov 2021 10:49:01 -0700 (PDT)
Subject: Re: [PATCH v3 19/29] bsd-user/arm/target_arch_signal.h: arm machine
 context for signals
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20211104140536.42573-1-imp@bsdimp.com>
 <20211104140536.42573-20-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1262504d-1ce4-4720-31e4-e373d74e2b39@linaro.org>
Date: Thu, 4 Nov 2021 13:48:58 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211104140536.42573-20-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82b;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82b.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.093,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Stacey Son <sson@FreeBSD.org>, qemu-trivial@nongnu.org,
 Kyle Evans <kevans@freebsd.org>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>, Philippe Mathieu-Daude <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/4/21 10:05 AM, Warner Losh wrote:
> +typedef struct target_mcontext {
> +    uint32_t    __gregs[32];

sys/arm/include/ucontext.h has

#define _NGREG          17
typedef __greg_t        __gregset_t[_NGREG];

With s/32/17/ here,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

