Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9622417189
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 14:11:02 +0200 (CEST)
Received: from localhost ([::1]:35932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTk2f-0004fO-Q4
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 08:11:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mTjs7-0006pT-MR
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 08:00:09 -0400
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e]:46924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mTjs6-0002mN-4h
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 08:00:07 -0400
Received: by mail-qv1-xf2e.google.com with SMTP id gs10so6034401qvb.13
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 05:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mRjc6lmfWOW8J0zLXFuVUeMLsqoMu4m4XLUywgIOf+U=;
 b=fNUeH3+yU9A6qiN33mEbaAciIUjQcFJsAxOlsaVquZSYtd4MZuJD47a7mqYPGx4kUk
 jesVeTeh/fu+mppRMKsLQtoiJWuFOmjx8vnxS9SSyV4x1Z7ux1xdtXP16mznsG2y/9nC
 /4Q49yKwzpqBQchWnURSp1n9ORTLbvfZRBfbfqu6lpGHXQakJauJEmkLZOZX7RWSK6wH
 3y/1DVItgguyaOvuZvUsiRdi4B7d4QZhQu0C02oojJTUT96tTmOLnUo7c2icxbTk22xB
 /Ko30V5Q1b57UxyFgUV2Pdcx5936eZEjn2OuGMfYGNjJ55TygfA8Uk+nTDw8E/WlX2QK
 s+Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mRjc6lmfWOW8J0zLXFuVUeMLsqoMu4m4XLUywgIOf+U=;
 b=T+E+Zwe0BRTqnudkYzpjwP1kPQ4yLpOQUa1Y3RORzz54AMii36yNEtVjLES1yys5nq
 lMTbMqsyWgepwWj/ezFHnfqtOMRNk6KPlQPpEON3rDnIigNj66HTTYuThUCtuJMUgapp
 bbCh7iezHolu71AahLEAd9WGIGq+9xqossP9gG6iVq9vopqLi9kUWUbb8kaTmy9fj+2b
 YuiOACK9xEOqEe9qiIoEbwaALyDA9fknHyVmotrcb0XUP8PnwouPfGJtzXMN97/3wLXi
 vevsuZaoX48OgvwoIQJLniPBnkXPIfvvKVyIK3LYavAtHh6gIV1pKVISuZ8hOvCHY5Pn
 XS7Q==
X-Gm-Message-State: AOAM532l/GQcMSUEq+D93DcbeKLyu6jQ4JsYZILENyr4c42LjEKGHzFZ
 oS+HFxoL50z6nBG3lCWHWVzUeA==
X-Google-Smtp-Source: ABdhPJxUTDTB0l+olEZYa64Up/SrpqTttoBdZLvQ26zyCaEMlkJuhoMldPJsNHfBxPXhxQXbt2yJGg==
X-Received: by 2002:a05:6214:56a:: with SMTP id
 cj10mr9406221qvb.60.1632484804556; 
 Fri, 24 Sep 2021 05:00:04 -0700 (PDT)
Received: from [192.168.3.43] (cpe-24-74-129-96.carolina.res.rr.com.
 [24.74.129.96])
 by smtp.gmail.com with ESMTPSA id u13sm5867556qki.38.2021.09.24.05.00.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Sep 2021 05:00:04 -0700 (PDT)
Subject: Re: [PATCH v2 9/9] bsd-user/mmap.c: assert that target_mprotect
 cannot fail
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20210922045636.25206-1-imp@bsdimp.com>
 <20210922045636.25206-10-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fce9c17c-991f-7f24-59e8-92489009e76d@linaro.org>
Date: Thu, 23 Sep 2021 10:53:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210922045636.25206-10-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2e;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2e.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: kevans@freebsd.org, f4bug@amsat.org,
 =?UTF-8?Q?Mika=c3=abl_Urankar?= <mikael.urankar@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/21/21 9:56 PM, Warner Losh wrote:
> Similar to the equivalent linux-user change 86abac06c14. All error
> conditions that target_mprotect checks are also checked by target_mmap.
> EACCESS cannot happen because we are just removing PROT_WRITE.  ENOMEM
> should not happen because we are modifying a whole VMA (and we have
> bigger problems anyway if it happens).
> 
> Fixes a Coverity false positive, where Coverity complains about
> target_mprotect's return value being passed to tb_invalidate_phys_range.
> 
> Signed-off-by: Mikaël Urankar<mikael.urankar@gmail.com>
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/mmap.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

