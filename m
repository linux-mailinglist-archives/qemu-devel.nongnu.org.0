Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 408A943E634
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 18:35:48 +0200 (CEST)
Received: from localhost ([::1]:56248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg8NX-0007NC-As
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 12:35:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mg86p-0007mI-7S
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 12:18:32 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:34449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mg86m-0000Pj-VO
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 12:18:30 -0400
Received: by mail-pf1-x42a.google.com with SMTP id 127so6490036pfu.1
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 09:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Bn9ZApLw5RmSOHXv+vS42sOOTg9U6Qd63aH3LyvgGT8=;
 b=z6tku0uKZNK5A5+9s139Gluk1FV9yDBTEiGkezggOXJkxpK/7HSxzelSheEVGvjiOv
 DgQnkpsJzIafeyYUPzzK4k6Wsk3/OMk7nLeW5ioupDY+ZmIMYvGQdSwAjHeCGkzEoF/e
 CXSDZ/lODyTd1UuYOei3uZ1EtpJemqjO+BDd6KoEwzZjKR8Um6N5y1hPh0LrGHEeTHsZ
 QttI/KhnRruhqIwURbD5VN354LuordvcFNpu/xPqROiiwNFLM/KGySsbX8BKA/0Jv0SQ
 5GEf5TCqDFvhXZkrmrwkJN1t5HyOPG5sgwe9ppc1VLfrnbpUcLPWteAtJUjk6V+rLmoV
 ijUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Bn9ZApLw5RmSOHXv+vS42sOOTg9U6Qd63aH3LyvgGT8=;
 b=Rv4mq6zagowB9uH3248N1nmE+2CjCKZ0L2sl/W10yLdMXbEbyQiVmTt4K7C82M8rMc
 tWwY+rRrgTME5U7gYpufbi5+dKNeMlRKH1OIKVtVfZrf2zylpTdJ9Yo4QCHi3fVIjN/m
 q1ULCJKaKswEgHN5GqytJ6/MQVnkBA0TM6bCT3j9iPtqXRegqlXzVCD+7NZdK16zEgSf
 Q/KmJqzPqubCI5GEtogt7X/RS8kjZUpwXp5K9zxZYfqTP+hbU7SfPVu3+PqxgKmv86Wr
 V9sN1Arr+vfjsP/SoDR2oHgggy9gR9B80A6zHHXIshoWFpdd29D6dbotX5EPDqcjJBqs
 SiQQ==
X-Gm-Message-State: AOAM531YqG/oGjBVgWZSuApGNkAvZj+aVR+SCgTm4/ZAoPOHNlvDJr6l
 g+AuQKKvxYnhLhuyTptLphBIVw==
X-Google-Smtp-Source: ABdhPJxOXaQUlwjvV6yR9y8+DLIBPaQ0Qq4P+KToqCqRK8W80LJj5qSN2+ZJQd25eSdr9qN6dlqHnQ==
X-Received: by 2002:a05:6a00:815:b0:44d:2193:f688 with SMTP id
 m21-20020a056a00081500b0044d2193f688mr5433133pfk.4.1635437907421; 
 Thu, 28 Oct 2021 09:18:27 -0700 (PDT)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id m186sm3808081pfb.165.2021.10.28.09.18.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Oct 2021 09:18:26 -0700 (PDT)
Subject: Re: [PATCH 17/24] bsd-user/arm/target_arch_signal.h: arm specific
 signal registers and stack
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20211019164447.16359-1-imp@bsdimp.com>
 <20211019164447.16359-18-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d1dc2f64-22bb-c29f-1fec-a9f44c0e295e@linaro.org>
Date: Thu, 28 Oct 2021 09:18:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211019164447.16359-18-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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
Cc: qemu-trivial@nongnu.org, Kyle Evans <kevans@freebsd.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Stacey Son <sson@FreeBSD.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/19/21 9:44 AM, Warner Losh wrote:
> +#define TARGET_INSN_SIZE    4       /* arm instruction size */

What is this for?  arm max insn size?

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

