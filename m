Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE35B3FC1B2
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 05:51:41 +0200 (CEST)
Received: from localhost ([::1]:45044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKuoA-0004C1-C4
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 23:51:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mKumm-0003UI-1V
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 23:50:08 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:44815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mKumj-0007ly-CU
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 23:50:07 -0400
Received: by mail-pl1-x636.google.com with SMTP id e1so9780115plt.11
 for <qemu-devel@nongnu.org>; Mon, 30 Aug 2021 20:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=F8Bfl8lZ2xQx/CB3YIc8n8i/eTxVZ8aP/bFt+hdJeek=;
 b=nNKBYKAE3Bgq1K5T0Qc6DIOJnPjM/ZcZKg0BBHjWm0OCY6ch9iokekauu6bbb37Nl8
 5G4hQq39CgRbDhzB8LXX1h7Wchdr9yjANKOu4OarRGEH5A/T/9Y61CdXAm7saMSAPmrR
 21K04/kx6UPp3T7f7bj67EoCNLQ6NdpOc9VD7rhi4QW9C8VwwHAGmvb0VSSZJLUaMewv
 hnn/bm978dm0yrSbVTfPKolL0CF5QbdEVMLh0HLQBFTfJp9XcMf0PzjuyKsWDtK9/X1a
 dSwQfRaKdnheFR6oHXyvnpsM3z0juIjVYsiE2vywtAkfukMPcFrZHNKGP6EEkhla2hI4
 JD7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=F8Bfl8lZ2xQx/CB3YIc8n8i/eTxVZ8aP/bFt+hdJeek=;
 b=ZRBB1EaW0Hcal4Rip8BONn/0GVocfr+meYXK0+uc1qiMkvAjcMZ0YihHaw8KpXQiss
 BPhWUGUIEbOiikLs5SryxQ5VurEMYJUQ0MZJK7AF7oFiVJdOp8c3YTnioL+XCZIu1xT/
 L5qZrUgVhcB1FYsDq5b2u82TwiDZIjtJ7QTdIaHVLZ7LtxFNS3jytx0RHoLhBQWTC0IG
 SHsH6z4MM10giODYSp7+p1aiFW3Vb5LdYBzxPDVnYaz5ZtDWIurf8hNdeQy4GzazSu6E
 ReKg9drTW2pqC4OIXGeiWDYhOCI12qO9yaeV49L3H3Ne6cdP/OXKO8zD+aw87twTzlTI
 fTtg==
X-Gm-Message-State: AOAM533u54IHuF4yszNnApooYyozR2D9uPxyEtHxA5ngksTAXr/StbG7
 wvMQ8PlnZw+PAkDkymbDgFW9ejLtAHQk5g==
X-Google-Smtp-Source: ABdhPJxHokTyK3NQsYlM65T/DEdauNfPm9j7ztJ/2sq/vWgaFPAO32utNUGkLM/pgfbMo76k7XtY7A==
X-Received: by 2002:a17:903:32cd:b0:138:9904:ef79 with SMTP id
 i13-20020a17090332cd00b001389904ef79mr2618432plr.27.1630381803796; 
 Mon, 30 Aug 2021 20:50:03 -0700 (PDT)
Received: from [192.168.1.11] (174-21-72-39.tukw.qwest.net. [174.21.72.39])
 by smtp.gmail.com with ESMTPSA id y11sm4779475pfl.198.2021.08.30.20.50.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Aug 2021 20:50:03 -0700 (PDT)
Subject: Re: [PATCH 00/48] tcg: optimize redundant sign extensions
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210830062451.639572-1-richard.henderson@linaro.org>
 <520d8314-501f-a4c8-1a00-ec329a0cc7ee@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <101ef61d-1293-1dd4-9da5-634a972f9f71@linaro.org>
Date: Mon, 30 Aug 2021 20:50:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <520d8314-501f-a4c8-1a00-ec329a0cc7ee@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.932,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/30/21 3:00 PM, Philippe Mathieu-Daudé wrote:
> Hi Richard,
> 
> On 8/30/21 8:24 AM, Richard Henderson wrote:
>> Currently, we have support for optimizing redundant zero extensions,
>> which I think was done with x86 and aarch64 in mind, which zero-extend
>> all 32-bit operations into the 64-bit register.
>>
>> But targets like Alpha, MIPS, and RISC-V do sign-extensions instead.
>> The last 5 patches address this.
>>
>> But before that, split the quite massive tcg_optimize function.
> 
> Looks promising after quick review. Do you have any comparison perf numbers?

No, not yet.  I expect there to be *lots* of redundant extensions with the patches for 
RV32 on RV64.  I think only MIPS n32 would compare, and I don't have a chroot for that, 
only n64.


r~

