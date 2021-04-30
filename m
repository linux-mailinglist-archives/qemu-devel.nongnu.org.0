Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07BF036F51F
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 06:35:33 +0200 (CEST)
Received: from localhost ([::1]:45174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcKsF-0004Ki-Fs
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 00:35:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcKrQ-0003tI-4v
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 00:34:40 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:43668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcKrO-0006Zc-GJ
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 00:34:39 -0400
Received: by mail-pg1-x530.google.com with SMTP id p12so48613965pgj.10
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 21:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ds73l1Ih0WvqvXeoFk6fG54/7YycnGk5FmXyNCbuRB8=;
 b=V0U2r25rc1Lk7kWCP6eXAvlvO9hia7VNChCDThJ86ofhs2S/dQtKIKiI3f/Tyh2CwW
 DbTOltggwFf3JgKX6j5itcAJ0oFONpl6fj9tpdK85lFz4FgekDXR5XhozJSdXOY3M93p
 syBS1ASB0zN6Eb8CotL/E33Y6F8HykMYQRKvwhyytNEgCnq4nPtUXaSOrCh8P1peJndr
 3Em0uFFIqhUaEeAzTy8lc4YjoTEz+xURa+a4WeHvBnczDVCT3nACPEWGcBJ8OOwo+V+/
 JDFNXOmjV4pkjsHOYz8wL+xdLlR8EZ7o04AdpRbZUZVYNSJIOLl8D0OwWFSVfcgytCnh
 TZhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ds73l1Ih0WvqvXeoFk6fG54/7YycnGk5FmXyNCbuRB8=;
 b=tb9qHCi4If5JX6YOoqSlumzYVhGcU2gZMuzFWbfDBvSDJ2rleIxOFKwqX3fI/kR0X1
 Zam5lqv9fWiUHWm+yWsOSIlfv+o07/rWOF66Vq46QX3+Mv1GjPO//BcADtYzPmk3J/0k
 BINK7HIWMYRTH5NsGsUK9im/XExSNpKO1fu+Paju5K2ZEl3OT4cZ2wAx8aVXnWWee2us
 FDeyvfA13ZFBtCmKo/ULV1AR/g45KkfFV0chLYSUOXsEd9x41AXau+bGcuqV5Ouwnsvt
 YLnHpvQFn+wpkuLUmNPdEBRWuhvfzVZ676ErlFWfRqmI2UhIkrVJ2J8dhN0/IifFa/mr
 e5XA==
X-Gm-Message-State: AOAM533aar39I7/Dnk9li0jmHQA2w4YOfYR9V7p6lIuPUpddZmHPT+/b
 XDPDpAEU4TuCIb/3Rg7LVIo6Og==
X-Google-Smtp-Source: ABdhPJxaTDHzy9eMKbvPYH52g+oh1vxGUerVQ+oFjDsSNmzGypCom7Gdy+yZ69JQkGjUPhD7C7vjIQ==
X-Received: by 2002:a63:e007:: with SMTP id e7mr3099161pgh.260.1619757276906; 
 Thu, 29 Apr 2021 21:34:36 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id 134sm712183pfy.117.2021.04.29.21.34.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Apr 2021 21:34:36 -0700 (PDT)
Subject: Re: [PATCH v2 4/7] target/ppc: turned SPR R/W callbacks not static
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>,
 qemu-devel@nongnu.org
References: <20210429162130.2412-1-bruno.larsen@eldorado.org.br>
 <20210429162130.2412-5-bruno.larsen@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <21130ba6-1c32-99e3-4046-e910edf66a41@linaro.org>
Date: Thu, 29 Apr 2021 21:34:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210429162130.2412-5-bruno.larsen@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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
Cc: farosas@linux.ibm.com, lucas.araujo@eldorado.org.br,
 luis.pires@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/29/21 9:21 AM, Bruno Larsen (billionai) wrote:
> To be able to compile translate_init.c.inc as a standalone file,
> we have to make the callbacks accessible outside of translate.c;
> This patch does that, making the callbacks not static and creating
> a new .h file
> 
> Signed-off-by: Bruno Larsen (billionai)<bruno.larsen@eldorado.org.br>
> ---
>   target/ppc/spr_tcg.c.inc | 203 ++++++++++++++++++++-------------------
>   target/ppc/spr_tcg.h     | 121 +++++++++++++++++++++++
>   2 files changed, 223 insertions(+), 101 deletions(-)
>   create mode 100644 target/ppc/spr_tcg.h

FWIW, a good follow-up would be to separately compile this.


r~

