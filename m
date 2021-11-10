Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8086244C53F
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 17:43:16 +0100 (CET)
Received: from localhost ([::1]:53964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkqgt-0001Fg-DV
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 11:43:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mkqfs-0000Q0-P1
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 11:42:12 -0500
Received: from [2a00:1450:4864:20::32b] (port=46879
 helo=mail-wm1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mkqfr-0006si-0A
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 11:42:12 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 b184-20020a1c1bc1000000b0033140bf8dd5so2402264wmb.5
 for <qemu-devel@nongnu.org>; Wed, 10 Nov 2021 08:42:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BbqcPbwJJQ9LwBZZFl1LAHMnOLQpoh7bsCL50e6xi6E=;
 b=LdxbZieYC+BNAzvXfA8Cw4HGmt6uXqYa7k88f32sIfCp8CiPKaA/QSnabgrE29+GLc
 Ea57jn1RJXgm0x/XlMV9pdCnlGyT2OJZxJx7ClSQFGdCX45UEdQYcxy3L5WjdsNmSTAD
 WZlAucDeNjkwT4wKHmQUiWZ7wyWoxe4f5wg0MNSxG4OAYX++RPszyQH887HJid141dJF
 nVZnW3/0gfIOI3FH41gOpe38FQYK61L9DF4ZkyDZWGFlFlZmqJrzaLSRR7fVs9nUmTR/
 7mdOsfJl/zNDepheGpwLH3vjlplidk0Tvg7Qo/XxbjvwruTpoD8p/NfvFCEUwvfsivTO
 WrtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BbqcPbwJJQ9LwBZZFl1LAHMnOLQpoh7bsCL50e6xi6E=;
 b=Uh/sn8ODeiYsChOEjY5t1SJ6zKijvNSdb/8gjd8IKpIzU7vRVnCMmuReNaYZ/eQ9oE
 EUrR2x8TbGfaQAXOVbwWDcS0qhMo39StMW4MODCMHrp5BEQBEQrfrjPDAvBbVP9lKEFQ
 +jRWxOG9R+bSx4cjbllr7ZRb9Pw7u86OWJ7LFHbeuPIpzE/9gYRQwU3T7ciP5FsKy7nz
 DRrvj1X8R5Ilez3qgs1Io90zezySv68FnBcBCbXuhw91OIlklijnXRaEkKAYnbOSvIXL
 Ron5Fev2U+RjuAFu48H31vKRM3Yd0fKI6JAbd9CGonWHq7STshRORFge5DUq1blbGBA6
 3tuw==
X-Gm-Message-State: AOAM5322zUkjWABgBMkTX/phIhcaGLZqUOIXAAe9qOGQnVdNpPqlkswH
 trvXfrPOi3NmmX32sId/QJ7FDg==
X-Google-Smtp-Source: ABdhPJxe0aD8ALE+xNTans1CoEy2rtep9mh3zG5nkrrNnRx2dRjKEj4C7RQeaGrWhFtiFdOpa6+9Og==
X-Received: by 2002:a05:600c:1:: with SMTP id g1mr566892wmc.19.1636562525376; 
 Wed, 10 Nov 2021 08:42:05 -0800 (PST)
Received: from [192.168.8.106] (104.red-2-142-241.dynamicip.rima-tde.net.
 [2.142.241.104])
 by smtp.gmail.com with ESMTPSA id y6sm403995wrh.18.2021.11.10.08.42.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Nov 2021 08:42:04 -0800 (PST)
Subject: Re: [RFC v2 1/6] linux-user: Add host_signal_set_pc to set pc in
 mcontext
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20211110163133.76357-1-imp@bsdimp.com>
 <20211110163133.76357-2-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <32bfbe52-fd12-5997-5697-0267a16415a0@linaro.org>
Date: Wed, 10 Nov 2021 17:42:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211110163133.76357-2-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.678,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Philippe Mathieu-Daude <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/10/21 5:31 PM, Warner Losh wrote:
> +static inline void host_signal_set_pc(ucontext_t *uc, uintptr_t pc)
> +{
> +#ifdef __arch64__
> +    uc->uc_mcontext.mc_gregs[MC_PC] = pc;
> +#else
> +    &uc->uc_mcontext.gregs[REG_PC] = pc;

Stray & here.  Not that I have a sparc32 host on which to compile this...


r~

