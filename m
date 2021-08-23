Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E40AF3F4EFA
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 19:06:21 +0200 (CEST)
Received: from localhost ([::1]:60202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIDOv-0000Wp-1X
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 13:06:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mIDI4-0000dY-Rp
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 12:59:16 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:33544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mIDI3-00013u-Bl
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 12:59:16 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 28-20020a17090a031cb0290178dcd8a4d1so328947pje.0
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 09:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GZ91UvPmTggX6Fr0gYii0q8J0un50nqAv8uwzBDdB/o=;
 b=y8Yt2WIC2KLytYU1b6VYqaPjSYPoizz8G3AJuRTCjSOMtapvtLHIzi8hDooeEIroAQ
 sRDFwoqEYvsl1NgYGNlKSTOaWEjMJlWIetBErnVe6Um4vRl04oxPROF/dAX7bVysBOwu
 3YwMDXh+yLVcn0HIi8/ZGHpqTyBY9Ss1Uj3NjpjZfSmBbhomL2udlskpzvnMBFJ4Nr/v
 qqjIok/2AHe8IAcpYUhoAPolMDocmf2eGZNvaCS2TLZR89vqafK6rS0PQPR23k1XRbOv
 2ONsaMGNUlucVGRlnwW4UDJuG+7HgXF65YmPqfYhwoDMW5In9ksq5qOcJkXbrwp95rfe
 1Jkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GZ91UvPmTggX6Fr0gYii0q8J0un50nqAv8uwzBDdB/o=;
 b=pKPXUPqLZ0J2zmxG5GemAN9b3hd906BLIobOGtGK8pl49iFo9XbftFtg8B0tTcFwd5
 60/I0ZgmtS6oeMqXPGLu5HfcJ8u3meqjyG3khKg2NmxAprcEn4OegeEpRNwYSQF5bC9u
 hMIoqDU+g/gj7q39B/tXuCXp7E/UsPjEBylJHDbKGt5Np7K2NcN2tTeaFX2qReVI4V7G
 gj6aNTkd3xNhGBFkoJf8IsZ8QLaZTYSuLjeArUCS8s4fi4ih95h54MuUfEgidvn+pebw
 PAa0X0YjqkBueIShJmOjOfFc5ixKPjUUQWdTxH8MpUreylKA3wChuRQ6qe/O7U8aht3X
 gIsg==
X-Gm-Message-State: AOAM533aPy/3BqsJplVNAw1sDcreymTnOoJatLKGfRYr9EkOcDaNfyGN
 WsXD2tBFjTj9nCDyEFeM6FcMJg==
X-Google-Smtp-Source: ABdhPJzl7sI6ev2hJ4ki/ojPYoE9fAtiIfLXWOM1CRuvPg8q4g3pSNfTf3ep6NXmDANIz/DMYr2THQ==
X-Received: by 2002:a17:90a:bd06:: with SMTP id
 y6mr21442225pjr.6.1629737953965; 
 Mon, 23 Aug 2021 09:59:13 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id y23sm17065733pfb.130.2021.08.23.09.59.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Aug 2021 09:59:13 -0700 (PDT)
Subject: Re: [PATCH v3 02/15] target/riscv: Reassign instructions to the
 Zba-extension
To: Philipp Tomsich <philipp.tomsich@vrull.eu>, qemu-devel@nongnu.org
References: <20210823164038.2195113-1-philipp.tomsich@vrull.eu>
 <20210823164038.2195113-3-philipp.tomsich@vrull.eu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5764bb5b-1d72-7c81-ac05-09f6f805ade8@linaro.org>
Date: Mon, 23 Aug 2021 09:59:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210823164038.2195113-3-philipp.tomsich@vrull.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.023,
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
Cc: Kito Cheng <kito.cheng@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/23/21 9:40 AM, Philipp Tomsich wrote:
> The following instructions are part of Zba:
>   - add.uw (RV64 only)
>   - sh[123]add (RV32 and RV64)
>   - sh[123]add.uw (RV64-only)
>   - slli.uw (RV64-only)
> 
> Signed-off-by: Philipp Tomsich<philipp.tomsich@vrull.eu>
> ---
> 
> Changes in v3:
> - The changes to the Zba instructions (i.e. the REQUIRE_ZBA macro
>    and its use for qualifying the Zba instructions) are moved into
>    a separate commit.
> 
>   target/riscv/insn32.decode              | 20 ++++++++++++--------
>   target/riscv/insn_trans/trans_rvb.c.inc | 17 ++++++++++++-----
>   2 files changed, 24 insertions(+), 13 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

