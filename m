Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D68572F9C31
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 11:09:26 +0100 (CET)
Received: from localhost ([::1]:49160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1RTR-0006ae-UB
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 05:09:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l1R8F-0000zY-D9
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 04:47:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l1R8B-0001Cv-PR
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 04:47:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610963247;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h3fuvZp+lrDwiaB7C6iDX8zQyy7iI1p6lhJanq5+GG8=;
 b=ANp00R6aCxuF8cTfuZbGqEnYgYcLze/DVu+vMAU0vc6XTBSAuBj2ApUxihKrzUQV0614Jc
 Effy28Z7hY14h93rwd2HlRkMwoOt/zU0p6NJchhebDlKNllUY2KICAMPNO5k2y4C49AOJg
 +3BvlCwcvsxkqw3/pee1lkTpndMHLGY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-472-8mvhGSxFN2OKkItYGupj5w-1; Mon, 18 Jan 2021 04:47:25 -0500
X-MC-Unique: 8mvhGSxFN2OKkItYGupj5w-1
Received: by mail-wm1-f72.google.com with SMTP id h21so4233000wmq.7
 for <qemu-devel@nongnu.org>; Mon, 18 Jan 2021 01:47:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=h3fuvZp+lrDwiaB7C6iDX8zQyy7iI1p6lhJanq5+GG8=;
 b=FKyD9tItuaR/Fw842+L3tUprdSaVIihl2KcWiGGIMXEXI6IYd6NrKipN0HZ3C0J1P2
 QRwBLGKPd5u1UwSEowf23yu38AgqZNGv/l/0zMbl4J1bWQPpP1q+HsFwYIb/oSN+dFRl
 rIpByHCzNA8cBruK5+VQTtQOaUmhGcvnlqmuHu1xpf1zh/IbpAdtCbPpHSy1JVoTizYy
 2UmrRFfvguWuQ5SbMFKkEvJMihdUidRApS3s7cHDWPQ8gK+c6FmsTmpP4dc+szuYhfOK
 6Oi0dLZzThdlNOmrXOwXFNsDFtzqKaih+EOtY+M+/uS1SP8ThT2571QDVnwDmUsxrjyd
 LfGA==
X-Gm-Message-State: AOAM5336/Xgo8fT38Pj/T365eu+4g1fMBUOm9FErf6vKl9uTNj7IMccO
 RkNbYQyVCHybd1v1iDH7GAN6+iv1D6ml2isYcFojZ8xZSprF1Za6Bj1tLpbp9MT9cQttSgFWI/3
 BCYE2uEzlNE8WRJE=
X-Received: by 2002:a7b:c09a:: with SMTP id r26mr4844297wmh.64.1610963244290; 
 Mon, 18 Jan 2021 01:47:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy8COcCkXe8PQWeE8FIzffZ9MNBL4S35PWLxiBL8vLCQnUOMhWx4vouHjd3jlolTgo5leIwvQ==
X-Received: by 2002:a7b:c09a:: with SMTP id r26mr4844288wmh.64.1610963244180; 
 Mon, 18 Jan 2021 01:47:24 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id g5sm29664539wro.60.2021.01.18.01.47.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Jan 2021 01:47:23 -0800 (PST)
Subject: Re: [PATCH v2 6/9] tests: Rename PAGE_SIZE definitions
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org
References: <20210118063808.12471-1-jiaxun.yang@flygoat.com>
 <20210118063808.12471-7-jiaxun.yang@flygoat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <abafe09d-369c-0f97-db89-b4a163843ad4@redhat.com>
Date: Mon, 18 Jan 2021 10:47:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210118063808.12471-7-jiaxun.yang@flygoat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.189,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.252, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Viktor Prutyanov <viktor.prutyanov@phystech.edu>, kvm@vger.kernel.org,
 Alistair Francis <alistair@alistair23.me>, Greg Kurz <groug@kaod.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, qemu-ppc@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-block@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/18/21 7:38 AM, Jiaxun Yang wrote:
> As per POSIX specification of limits.h [1], OS libc may define
> PAGE_SIZE in limits.h.
> 
> Self defined PAGE_SIZE is frequently used in tests, to prevent
> collosion of definition, we give PAGE_SIZE definitons reasonable
> prefixs.
> 
> [1]: https://pubs.opengroup.org/onlinepubs/7908799/xsh/limits.h.html
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> ---
>  tests/migration/stress.c            | 10 ++---
>  tests/qtest/libqos/malloc-pc.c      |  4 +-
>  tests/qtest/libqos/malloc-spapr.c   |  4 +-
>  tests/qtest/m25p80-test.c           | 54 +++++++++++-----------
>  tests/tcg/multiarch/system/memory.c |  6 +--
>  tests/test-xbzrle.c                 | 70 ++++++++++++++---------------
>  6 files changed, 74 insertions(+), 74 deletions(-)
...

> diff --git a/tests/tcg/multiarch/system/memory.c b/tests/tcg/multiarch/system/memory.c
> index d124502d73..eb0ec6f8eb 100644
> --- a/tests/tcg/multiarch/system/memory.c
> +++ b/tests/tcg/multiarch/system/memory.c
> @@ -20,12 +20,12 @@
>  # error "Target does not specify CHECK_UNALIGNED"
>  #endif
>  
> -#define PAGE_SIZE 4096             /* nominal 4k "pages" */
> -#define TEST_SIZE (PAGE_SIZE * 4)  /* 4 pages */
> +#define MEM_PAGE_SIZE 4096             /* nominal 4k "pages" */
> +#define TEST_SIZE (MEM_PAGE_SIZE * 4)  /* 4 pages */

Clearer renaming TEST_PAGE_SIZE and TEST_MEM_SIZE.

If possible using TEST_PAGE_SIZE / TEST_MEM_SIZE:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

>  
>  #define ARRAY_SIZE(x) ((sizeof(x) / sizeof((x)[0])))
>  
> -__attribute__((aligned(PAGE_SIZE)))
> +__attribute__((aligned(MEM_PAGE_SIZE)))
>  static uint8_t test_data[TEST_SIZE];


