Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C012113EC
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jul 2020 21:54:09 +0200 (CEST)
Received: from localhost ([::1]:60668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jqio4-0003XJ-9B
	for lists+qemu-devel@lfdr.de; Wed, 01 Jul 2020 15:54:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jqimx-0002Mp-3s
 for qemu-devel@nongnu.org; Wed, 01 Jul 2020 15:52:59 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:39266)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jqimv-0001Qn-ES
 for qemu-devel@nongnu.org; Wed, 01 Jul 2020 15:52:58 -0400
Received: by mail-pg1-x544.google.com with SMTP id z5so12222090pgb.6
 for <qemu-devel@nongnu.org>; Wed, 01 Jul 2020 12:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=m1IqagvgGuprmozoSU1Dcz3h23wth+mcwBwxwUQVuOE=;
 b=Y94oijp9hQr6qJb0nfLXFoBKt6c1WCGgjD8dW4B5oN2QLKQ65f2kwaIHFHyj60ofy/
 +HWykwfm11smQGqYogyfKRkiYyRYC4m6B4CeDsFoSo/Qj4twlmfE2jmpZbc1AsQZ+ydL
 FJx9RPP9N3Ab2Z7jdHr30UAfm8ks3UnlksqY4ogQQvsalL5tAfgpiljDUUSWcHjF5Eaz
 bU1wQMdmWUgVpMoyAMU/jShPdp8dq6SwPDQ3EDG3j13TX1bPjg5KGCW7rR/OmIGyN0Ou
 P7Nd+0Y9IHw40kTSVPJa/87XYBbvh5ajulpLmoQhL9FYlgam9n7SzGPuhb6aekl1Rmfu
 AF5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=m1IqagvgGuprmozoSU1Dcz3h23wth+mcwBwxwUQVuOE=;
 b=bXPLwapUaMDwaVgbVVsf9sHfJDdG2jLkHpsVEZ9GLrNR7ehwd4QlmuRDYkZEUaLg5X
 p1An3T6KcPaZwSdpyDGDR87xRGcLFAoXaueDi85GLgk72FvF9ANUiU5Nk1JqQ5YwSAU7
 vkAMfUWzzzVCfIhPolAM54WccvdPwKD/kVwSSfqmaspqXBBBt9KccgE0NuPsDBte3/dZ
 zjk9cGQAjgLjR6BdAQIl39QImkH/D6EoCp0rbrsmgZHxhFP8BnmENWAHVsGg9gnWtVys
 Ioaf+iR1z3JYk0x7FhS9vt8s4NEE/2hXjpFkvKZoEXeoq/aoSyrkx/3EjgCsbsjGQGmH
 hQRA==
X-Gm-Message-State: AOAM530D0V1/A0SWvYQWVd73+tozuLG48+PrH8MY3LUVd+kuV0t2IyA7
 dhScBUYUG3glIzgWxMyohd3zwyGMGwI=
X-Google-Smtp-Source: ABdhPJwR8mJPtxOci5zBjeOJugC+747e8HBwwbt34HacQqpvCe1xJ5tudigS+Q0zCH1HTst0aOQoTg==
X-Received: by 2002:a65:4b85:: with SMTP id t5mr19004877pgq.36.1593633175603; 
 Wed, 01 Jul 2020 12:52:55 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id d18sm5884922pjz.11.2020.07.01.12.52.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jul 2020 12:52:54 -0700 (PDT)
Subject: Re: [PATCH] target/i386: implement undocumented "smsw r32" behavior
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20200626104419.15504-2-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <65a8b4e0-07ab-3bab-c806-5e201476d608@linaro.org>
Date: Wed, 1 Jul 2020 12:52:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200626104419.15504-2-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::544;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x544.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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

On 6/26/20 3:44 AM, Paolo Bonzini wrote:
> In 32-bit mode, the higher 16 bits of the destination
> register are undefined.  In practice CR0[31:0] is stored,
> just like in 64-bit mode, so just remove the "if" that
> currently differentiates the behavior.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  target/i386/translate.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

