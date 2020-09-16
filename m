Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 974C926C4DC
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Sep 2020 18:08:14 +0200 (CEST)
Received: from localhost ([::1]:36514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kIZyf-0004Di-5g
	for lists+qemu-devel@lfdr.de; Wed, 16 Sep 2020 12:08:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kIZs9-0007gW-Jw
 for qemu-devel@nongnu.org; Wed, 16 Sep 2020 12:01:29 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:41533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kIZs2-0004Xy-Sd
 for qemu-devel@nongnu.org; Wed, 16 Sep 2020 12:01:27 -0400
Received: by mail-pl1-x644.google.com with SMTP id m15so3420574pls.8
 for <qemu-devel@nongnu.org>; Wed, 16 Sep 2020 09:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2u/k++NYCDG5lbmUAzr60Vg46lz4FJsNsAdkC9OB2S4=;
 b=frWMQ79LWE3Ta0UTWRjmbGvUuIS3WB1kXWAqaP8J+jYonkS+5UJsaFPBsLBMXdv9mK
 7SoSPu0Syf3YN3NjFCLXpuZJngXhp1iDdZtaWn0jC17NPfjqi2uk5+3yJi/GmKjfLiWC
 B18SqBFaj7nITQ3x2PJ7FGuNR2y2X7R6iV6s8KvBtl4X0FlA5UMhayEjSNP0LxzkkG5u
 q4Lyh8UxfHBOI2xVGkIpLNaKXmoy1v83wLe36aGLV6pTDs7No0tcbzVe5vHrNr9B9+82
 hX4z/0ycKFLmQaAyyX9W1R/oN1eEKtjc/1o+Go5VATw36KsiB6TPZb3qpcaBvovT6J7F
 bn7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2u/k++NYCDG5lbmUAzr60Vg46lz4FJsNsAdkC9OB2S4=;
 b=PJW1fiRK139b6oMXWsbJ5kXQ4z9XRlJKIdc/ZHTz8l7rCa7lta5PVXOom1/9fCgwbR
 0/S1Ew/CzBHxXuIA4ktvBjLUCuNtLKfQf4rHyZ+AiyTtB5UJwsNiCK1T8hnDRJpiminA
 sE3XU6fco4tuonJFoeFAHIxZj4fQ7TyxHu0KNpOh95U9yYdbLHH4OEwXj0BOEOb0wYMF
 fh5AGe6b0ZLNqkuBBuzgR48qA036s5PfP0FpGDObxriCgp7NoAvlMFOvq0JiwhyKQzuz
 JlGcno98ob4zp7YwyMinTbAalCDtaRb6y6X5360W8cq65Q/QyNAtyALt/x8gEpegb7K4
 LX4Q==
X-Gm-Message-State: AOAM532WGYHXyVnQ/S9kh6p6ckiE1ChSkkKeyugSnsnj+a86VwPXmUdE
 92eiADS/bFIsDIPqDozMYXKdUg==
X-Google-Smtp-Source: ABdhPJzQaxUbzxii5kSs4m18LgjgSyNrkapDqSqoFgoFWKGeGQhk6Ar3O0n9ucC7uGKJsmaFyMfSXg==
X-Received: by 2002:a17:902:d897:b029:d1:e5f8:d263 with SMTP id
 b23-20020a170902d897b02900d1e5f8d263mr6571108plz.64.1600272081049; 
 Wed, 16 Sep 2020 09:01:21 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id j20sm17369313pfh.146.2020.09.16.09.01.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Sep 2020 09:01:20 -0700 (PDT)
Subject: Re: [PATCH] configure: move malloc_trim/tcmalloc/jemalloc to meson
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20200916080608.17689-1-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ede35e9a-3f20-c193-d2ec-a7920fe10169@linaro.org>
Date: Wed, 16 Sep 2020 09:01:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200916080608.17689-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::644;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x644.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.062,
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
Cc: Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/16/20 1:06 AM, Paolo Bonzini wrote:
> Because LIBS is not used anymore, tcmalloc/jemalloc does
> not work with binaries whose description is in Meson.
> The fix is simply to move them to Meson too.
> 
> For consistency with other configure options, specifying
> --enable-malloc-trim together with --enable-{tc,je}malloc
> becomes a fatal error.
> 
> Reported-by: Stefan Hajnoczi <stefanha@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  configure         | 84 +++++------------------------------------------
>  meson.build       | 28 +++++++++++++---
>  meson_options.txt |  5 +++
>  3 files changed, 38 insertions(+), 79 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


