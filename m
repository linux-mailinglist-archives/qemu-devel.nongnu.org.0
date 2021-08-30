Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D6C3FB8FD
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 17:28:34 +0200 (CEST)
Received: from localhost ([::1]:34978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKjD6-0007nV-JH
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 11:28:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mKjBj-0004rZ-K9
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 11:27:07 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:40928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mKjBg-0006sx-IX
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 11:27:07 -0400
Received: by mail-pl1-x635.google.com with SMTP id c4so8725173plh.7
 for <qemu-devel@nongnu.org>; Mon, 30 Aug 2021 08:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rIa4tKM96jkbh/gf5IOz9hRl8n7H0HMEGyk/cdqDbRc=;
 b=jvl67eW/rjSdodzaFxVdQLLGVLohSLWlNUBNc7sL2woeNLq588HnlI41UXe5eJgLC1
 qpGkX+6f2VwYC3XElAGGY4e+YqXqAeDfzHBEhWijakLdZpD/p4UMfRx3YuDUYW4BhHja
 nhu8HrXfpBr54PeTW+H253wW6gRkrV9hPkDiWXOq/cN2rCLnXlx4iiktuKp1ZW0TeO3s
 E++wwLwLXRFbyJXwvu+Dcx1X+G96ZlZposZdHx9ojau4ajy9VYq26igQXScw5nqb60Bd
 mlVNu4IgQ/8ArB0gUl4zUpH4nxXbXKbkv8lGNIv1CX4CI4z1adyNNAU8REiG+uRdyrB9
 pMOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rIa4tKM96jkbh/gf5IOz9hRl8n7H0HMEGyk/cdqDbRc=;
 b=ZvXd9bNlwzE+hYcTXlcOPDWN0WF5t5T0ec+mWUN11MLdCZWAPswV8xmleCzlz6o/lD
 7LNx9sQF3nBKr1IcrAR3I9S8fMRDfilEP9VQpht4pkbDYMIXhNe/aYmusrrwRqF0lEal
 jR8zs2hILlwYLl+1NnFPEETS5zHj46Wwbv/9c2h15GFeTEaNxrMFzUnRNwguwYLkVlJo
 iaImqDTb4sx8C5jJyfXqENegflmnWi7og/zj4hZOae5H79svq86cdOTaguuEFRKDLyTy
 HweIrfgHXggqo4ZQjqS+wBFdbkOK2UC78Hs1PYA0oIyWUBbuD5Mf1uzUOxVpxCIQjOFY
 To7Q==
X-Gm-Message-State: AOAM531gX2IAnHG1CVnhC9oIDGLqw/N82fN5iae5fXEqoyyzSIDN7omF
 lKD+HH/B4D/w+WRZICAZJPJ/rw==
X-Google-Smtp-Source: ABdhPJxCPgaYZRUhAOKL4H8oEqt3s5+YPYcSvdx1mHtaVsb3Y0lFB6dod53NesFE4PJr6jPE9vcZVQ==
X-Received: by 2002:a17:902:bb81:b0:12d:a7ec:3d85 with SMTP id
 m1-20020a170902bb8100b0012da7ec3d85mr205056pls.17.1630337220852; 
 Mon, 30 Aug 2021 08:27:00 -0700 (PDT)
Received: from [192.168.1.11] (174-21-72-39.tukw.qwest.net. [174.21.72.39])
 by smtp.gmail.com with ESMTPSA id b5sm10861043pfr.26.2021.08.30.08.27.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Aug 2021 08:27:00 -0700 (PDT)
Subject: Re: [PATCH v4 00/21] target/riscv: Use tcg_constant_*
To: Alistair Francis <alistair23@gmail.com>
References: <20210820174257.548286-1-richard.henderson@linaro.org>
 <CAKmqyKM7aoT9a7rZnbNukZb7mO-2zJddnKr1XkA+WbkidHRoxQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <92c46154-0260-bdf8-b5f2-e37e8f009625@linaro.org>
Date: Mon, 30 Aug 2021 08:26:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAKmqyKM7aoT9a7rZnbNukZb7mO-2zJddnKr1XkA+WbkidHRoxQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, Alistair Francis <alistair.francis@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/30/21 3:12 AM, Alistair Francis wrote:
> On Sat, Aug 21, 2021 at 3:43 AM Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Replace use of tcg_const_*, which makes a copy into a temp which must
>> be freed, with direct use of the constant.  Reorg handling of $zero,
>> with different accessors for source and destination.  Reorg handling
>> of csrs, passing the actual write_mask instead of a regno.  Use more
>> helpers for RVH expansion.
>>
>> Patches lacking review:
>>    02-tests-tcg-riscv64-Add-test-for-division.patch
>>    03-target-riscv-Clean-up-division-helpers.patch
>>    11-target-riscv-Add-DisasExtend-to-gen_unary.patch
>>    17-target-riscv-Use-gen_shift_imm_fn-for-slli_uw.patch
>>    21-target-riscv-Use-get-dest-_gpr-for-RVV.patch
> 
> This should be all reviewed now. Do you want me to take it or do you plan on it?

Please take it through the riscv tree.  Thanks for the review.


r~

