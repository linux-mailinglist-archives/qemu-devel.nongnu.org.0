Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE922DC733
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 20:33:57 +0100 (CET)
Received: from localhost ([::1]:53406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpcYd-0006hF-No
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 14:33:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpcQ5-00006S-Cr
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 14:25:05 -0500
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334]:42695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpcQ2-0000kC-JK
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 14:25:04 -0500
Received: by mail-ot1-x334.google.com with SMTP id 11so24206587oty.9
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 11:25:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZqG3gACJWEE5w34wi0ELwJ5T6ml1uspullwzuSqHH3w=;
 b=h4GRWQsbbEicKemvQClhBzEWDgOrJoA1m+/d87RUE8BL4teg0Pp+uZswPpDaTB62y+
 cn3bZUX4dCnI14mOl9mEQU/duvNX6TvkLm3zRAr2mVtlk50ADSV+BBhBx7H1y4Vhaw5A
 fdZYVSKhG+VpywFnXirDachplqQsLDz2y6FhECvqZrVDTlnoWLfUK7wt1CAdcRAttYSu
 8rhjQHruSVUXhD+ejHZWqb7BlwZ7QgX9IzcmFecX8gyi8HwV7m85eRBJwWKmsmu/8+Jo
 ERfkxWUVyWDEv4umavZaR1WOCa6xND1AuNIbBZE2Jldx0RhNMvus7qahW3F7uAAGotvF
 oNAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZqG3gACJWEE5w34wi0ELwJ5T6ml1uspullwzuSqHH3w=;
 b=PYuQbRAkCjoKkoMuO9TMxe5aBXkGcMNcsuHC7gc+bzrSbx4lYSsfhVroAy4sqFtO94
 LkVMjy5gFRkXvEIs597catqowYvU8s6a9iUg/ro1R5CWs5VdA1tF4FTb9fCgUpqre10Y
 PU7ninLozoSqAx3iyiRp5EjSGBPZA19id3pL10DOkT20TPXc2h00cK5FEo5s7+z1/A7p
 M07kMwRk0KUEbKth4UIojZ8ilRQZIsISI1pDTHn7JYj1oAyyeP6gV2rK8bClHaiA0Z1M
 EEoq9vjMFklIOYWt8CTOml4clIJZlgrIqoYSpk2pQD9gieQKXd8MgCBi3tsLECO6rJJ+
 eHGg==
X-Gm-Message-State: AOAM533fSMFkc05N5n1eA9j48onrvLxf8ZrzaUFKatrEg2FmpTxdpGXu
 /Jl6Iq6MFJDkXTUWAbQPl62+Qg==
X-Google-Smtp-Source: ABdhPJxBFZPOemZZCIZ2yrxd05EjBthsDsxpkM0kY1lTjkB9gOMckuFZUGhyNytEdXqsNqfWffejKQ==
X-Received: by 2002:a9d:7746:: with SMTP id t6mr27537706otl.349.1608146701097; 
 Wed, 16 Dec 2020 11:25:01 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id q4sm743481ooo.1.2020.12.16.11.24.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Dec 2020 11:25:00 -0800 (PST)
Subject: Re: [PATCH v5 0/2] util/oslib: qemu_try_memalign() improvements
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20201021173803.2619054-1-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <606cf522-d23e-10aa-2bb5-61c5ba1dcdcb@linaro.org>
Date: Wed, 16 Dec 2020 13:24:57 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201021173803.2619054-1-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::334;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x334.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Stefan Weil <sw@weilnetz.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/21/20 12:38 PM, Philippe Mathieu-Daudé wrote:
> - Use _aligned_malloc for qemu_try_memalign on win32
> - Assert qemu_try_memalign() alignment is a power of 2
> 
> Since v4:
> - Drop superfluous assert (Richard)
> 
> Philippe Mathieu-Daudé (1):
>   util/oslib: Assert qemu_try_memalign() alignment is a power of 2
> 
> Richard Henderson (1):
>   util/oslib-win32: Use _aligned_malloc for qemu_try_memalign
> 
>  util/oslib-posix.c |  2 ++
>  util/oslib-win32.c | 12 +++++-------
>  2 files changed, 7 insertions(+), 7 deletions(-)
> 

Ping.


r~

