Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A55F3722E5
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 00:17:38 +0200 (CEST)
Received: from localhost ([::1]:51124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldgsi-0006Nt-TF
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 18:17:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldgp6-0004WF-Kb
 for qemu-devel@nongnu.org; Mon, 03 May 2021 18:13:52 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:36424)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldgp0-00007E-S7
 for qemu-devel@nongnu.org; Mon, 03 May 2021 18:13:50 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 l24-20020a7bc4580000b029014ac3b80020so161163wmi.1
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 15:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Tlsq2U5wV6nYMGkXmTiTfo2rIsEKAFvJInjmnbenVKs=;
 b=eeABLV7JDuCEHgMyNQxdHT7tQxM+RDI3uiJhcLKzMS97fjCAufU6Rx0yI1d/7mTnQO
 796gLg2csfLsfT9ms/KELE/Y8HNT//EQ9pQC7/kWdFMsgQoPjwDzhikGKFqpY+4VVgP4
 /VJCRRe5f6v7SQz1INVArwsGCNT/6TV1NaAZIJ0VnFYLaWofpc8vmfQU9ipBpjsI6yyc
 juG4EkSGqIBjEzYOTzv3fvjtaaDl2ZrdF8wfqUyNH1MWJ40nu1JgpV/ozeb2oJfNJwnT
 9yi7p31S4FmN7rxhJSqMhbMEEAOuQIEip8sxf6vmF5UYYvdWeixZY1mEhYNpjhECHlSZ
 a6zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Tlsq2U5wV6nYMGkXmTiTfo2rIsEKAFvJInjmnbenVKs=;
 b=aj6FjHYwxIaBM4/cyQUnSH0vyb/lR1iJC5ceVfCoItvsuRqRNRfarG/jGaVACVuh8M
 S5FOqwAkSDWlZAWq5DBZpUNSxNEttRiyBDfvqcDSDa3qSCE55z5IH7mh6VlNTryp5RsB
 yOTNKMtXmY6X6K39yIdq3ViA/yM+EJUvKiOZOFuQaKufvl5n5pp3U5Q9FxUBAyUmm5Zw
 mTLtelJci5b8jaeRMKjqBsxJzBTT1r/HqbPSN1/6EI1TQ6UeZe04iJ4JxGcPJMspbWkB
 wZH5r9qulaNv8WpJBKZYq3nsCuoqH36yo6pHfIcV9TnVk85K3PYhP9LoMxUZK332iBge
 kNmQ==
X-Gm-Message-State: AOAM533hmaV8ruurnFgxvHcDNgM+iSw6qjA/sfHXMNiwAe4Lpyl2gwxe
 ChZQYUdytOS0Boc2V4CkkWNF6c6maRUecg==
X-Google-Smtp-Source: ABdhPJyFPiTKad/f2wp2RT50ntAppjqnu7Gc50K8Nif8eZBvrQeXZDZosNnH2kTGz95LaiOnFwelbQ==
X-Received: by 2002:a05:600c:3205:: with SMTP id
 r5mr23882434wmp.78.1620080025252; 
 Mon, 03 May 2021 15:13:45 -0700 (PDT)
Received: from [192.168.1.19] (anancy-651-1-208-144.w109-217.abo.wanadoo.fr.
 [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id p10sm13309620wrr.58.2021.05.03.15.13.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 May 2021 15:13:44 -0700 (PDT)
Subject: Re: [PATCH v6 18/26] tcg/tci: Implement andc, orc, eqv, nand, nor
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210502235727.1979457-1-richard.henderson@linaro.org>
 <20210502235727.1979457-19-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <7fc5f371-c2f9-6c43-10d9-6c8c5568dc58@amsat.org>
Date: Tue, 4 May 2021 00:13:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210502235727.1979457-19-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/3/21 1:57 AM, Richard Henderson wrote:
> These were already present in tcg-target.c.inc,
> but not in the interpreter.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/tci/tcg-target.h | 20 ++++++++++----------
>  tcg/tci.c            | 40 ++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 50 insertions(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

