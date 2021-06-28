Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B72743B66CB
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 18:32:29 +0200 (CEST)
Received: from localhost ([::1]:38942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxuBQ-0002sU-OB
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 12:32:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lxuA0-0001vD-06
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 12:31:00 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:46963)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lxu9y-000772-8U
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 12:30:59 -0400
Received: by mail-pf1-x432.google.com with SMTP id x16so14528021pfa.13
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 09:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=vNSjbU8THh4t8aSdMIn1hsK6nV9QeKdPFes3OCG6L5A=;
 b=NZkLf2m3En2ihN7RoJuM6YgvZyYRIhJgc1cbhxGC5L89IqnytFSMBVHr2x6wRjmvwg
 8qfuxEGA0+dzhD8Njy6aFM/QGUBtDFQszpTwUXUmzKWDY4VJWDhmnV3y7yNVazGICTwo
 4D5JmM50qJAZK1OLmby2JJ2wSIzejChFMMwk5BouWcF6w+KnrTN4cT/GNzqll4ygz1Lk
 nBWDxq1HLaq74tZAiA8a0yeVaGYNEZqdi3ObeoZ6fc7CuLShhNGLyCRfKLSTTcSrt0jh
 EedV0ZvWnPknZyotQaDoqajbotnX6aZK5eXPE2VEouuciF0CIQI88RQENJvlnSZdQjdd
 fpRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vNSjbU8THh4t8aSdMIn1hsK6nV9QeKdPFes3OCG6L5A=;
 b=rNhimukJI4ckMa96ACON9Wb1SjzeSuyBD1nHODF8/LhKBp1jAqheezA8gIKd6h2W9+
 hQaDPK7vvxZx62SgmTZC/9cNnDqqRh/GwQWjpeORJ8VPrlXzXT9ihEwERVUsAw06+Mxe
 mz2yLhBcB1BEI8ebX/Ao9Sy26nAFAGZG48wUE4tnoKkLXeOLKJ1v0xstkXxKIBfvE6a8
 lJflELKZr7BoJ6QwCzQ05FztnJr7+2+YADjVpeYoth2T8j3xd+P6Jc2K04qZAzg9SDhL
 rikxUAjU3aJ7Dn00alY7/kPej1MB/k1q2eNhpx0rTvUARXFx73alU2VdklPu9G7xIDj5
 3+Ow==
X-Gm-Message-State: AOAM533C4oWjj5MHGvem9bD4tOz8N0Qnq6xGDMNBjDU/M+iea/qhgE5b
 R5xNmyU8nZkZbD1MSBeKn2x9yDGC7KU9ZA==
X-Google-Smtp-Source: ABdhPJwS4zk8sRukn+TExRJEOzkmhCYUo04LymPKkXz14aWSEvI+wYDQ3AbR5S5iRI1H0w4ViPIn9A==
X-Received: by 2002:a05:6a00:17a5:b029:305:d4e8:7391 with SMTP id
 s37-20020a056a0017a5b0290305d4e87391mr26253209pfg.0.1624897856606; 
 Mon, 28 Jun 2021 09:30:56 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id p24sm15528928pfh.17.2021.06.28.09.30.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jun 2021 09:30:56 -0700 (PDT)
Subject: Re: [PATCH 11/18] target/arm: Implement MVE VSHRN, VRSHRN
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210628135835.6690-1-peter.maydell@linaro.org>
 <20210628135835.6690-12-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5951e05a-373e-c6e7-abcb-67638b3cd626@linaro.org>
Date: Mon, 28 Jun 2021 09:30:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210628135835.6690-12-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/28/21 6:58 AM, Peter Maydell wrote:
> Implement the MVE shift-right-and-narrow insn VSHRN and VRSHRN.
> 
> do_urshr() is borrowed from sve_helper.c.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h    | 10 ++++++++++
>   target/arm/mve.decode      | 11 +++++++++++
>   target/arm/mve_helper.c    | 40 ++++++++++++++++++++++++++++++++++++++
>   target/arm/translate-mve.c | 15 ++++++++++++++
>   4 files changed, 76 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

