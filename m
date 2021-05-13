Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA9C737F5F6
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 12:52:52 +0200 (CEST)
Received: from localhost ([::1]:51984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lh8xS-0006Em-7W
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 06:52:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lh8nB-0002Qx-Q5
 for qemu-devel@nongnu.org; Thu, 13 May 2021 06:42:09 -0400
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b]:33428)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lh8nA-0008JG-9A
 for qemu-devel@nongnu.org; Thu, 13 May 2021 06:42:09 -0400
Received: by mail-qt1-x82b.google.com with SMTP id 1so19416751qtb.0
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 03:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wWG59j86E6zusGCWN6VOgKRmDlN8mgGM8idEkgDYLaE=;
 b=Qb5RYHw7likRUtonREng2KR6YkVDCsFvbUEa9I/b9/4P1TiX1W52Bub6/DSWOXuVxI
 9fd2cQ3GSE7Hpebq5Y6b0NU0KKOYT+vUQ7cTo+24wp6q/zCyY95Eem1Ki9fGaycncnvo
 yCI1SclxnLbV8gkc5dRIpeH1QrniKCSMMkXeLkyFgwtztkOWrHjw1W7ZgO7fCmedpTh5
 ElbmxEwTuKOMFKhI43dBiYDys8HA/wL8itS8+pNGnsJnlsz2E7lCx0kBad6X+rv6NCNF
 lbQogQxWzU56rNX2o0RIIL4e0qhN3tQorOTMcN3h7fyXrWNS90EER45adiOpc7TUDscI
 qKHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wWG59j86E6zusGCWN6VOgKRmDlN8mgGM8idEkgDYLaE=;
 b=SzYt3yrfgwS1pVNW5i8qK9KDB0zm/emzPt2zYgERI2RnT2akALuEEgTKQZxR5FLGnp
 QNfkl5mqRZsmwGck0TaMs7Q4/kk4Ky7Ho0Gh5LWXoNUg+xAFVzVMId5R1FXAch6iyXnw
 ZJ+10mYbx3b7ztRSmWxmy0oaz0O9QcMdCKq950BqLtjYcBU5bJBGryHaCiT4T5XdNmnp
 hyTqhHm99sozwsRujtI5iUOEWvFLP5uEEqGJjGCD8smtq5k20IVcQF0UHTYrJY/wbvp/
 5iw7J/JAHNz+u99o0prT2MDSyrKO6PUEcM+AqH1akXK8vjTRaKcFn4A70r1G9u4Gq/oT
 SmMg==
X-Gm-Message-State: AOAM532q9P0qP2s+jwmDyCmK8qkGzBYRzB1HuUwjJci8SEb9OtdAjjjc
 pIZcR4hlfxy6IP1QeBf3FIHrQw==
X-Google-Smtp-Source: ABdhPJxy0Rr5UxWE6HhGcrg8W2rlxF8rLyLH45MfLlrSR8SzcCjKyI1Am3RRSdqPbAatmp1K40gRaA==
X-Received: by 2002:ac8:5cc4:: with SMTP id s4mr36894938qta.214.1620902527312; 
 Thu, 13 May 2021 03:42:07 -0700 (PDT)
Received: from [192.168.183.155] (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id c141sm2043052qke.12.2021.05.13.03.42.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 May 2021 03:42:07 -0700 (PDT)
Subject: Re: [PATCH v4 23/31] TCG: add tcg_constant_tl
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20210512185441.3619828-1-matheus.ferst@eldorado.org.br>
 <20210512185441.3619828-24-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9b38239c-e1eb-d869-1d79-124bdef7e621@linaro.org>
Date: Thu, 13 May 2021 05:42:04 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210512185441.3619828-24-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82b;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82b.google.com
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
Cc: lagarcia@br.ibm.com, bruno.larsen@eldorado.org.br,
 luis.pires@eldorado.org.br, f4bug@amsat.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/12/21 1:54 PM, matheus.ferst@eldorado.org.br wrote:
> From: Matheus Ferst<matheus.ferst@eldorado.org.br>
> 
> Used in D/DS/X-form load/store implementation.
> 
> Signed-off-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
> ---
>   include/tcg/tcg-op.h | 2 ++
>   1 file changed, 2 insertions(+)

Ah, thanks.  Queuing to tcg-next.


r~

