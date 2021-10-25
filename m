Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7866F439F0C
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 21:14:11 +0200 (CEST)
Received: from localhost ([::1]:36688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mf5QA-0007ph-Hb
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 15:14:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mf5MK-0003QE-HX
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 15:10:12 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:37586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mf5MI-0008Vv-LO
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 15:10:12 -0400
Received: by mail-pl1-x62f.google.com with SMTP id n11so8606788plf.4
 for <qemu-devel@nongnu.org>; Mon, 25 Oct 2021 12:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hVanuikBIg7iyJOS0bHt7RhnYa/QqZ8SXAaMv28MRCc=;
 b=I5YeXiU+E8K4hSFqUrjuT3DlfFvbelVcqh9PwQz4z/Jra09M5jLZ1cqfVeGGxChfvO
 +8RDlP1PuMf5yp9v668yCt+YC6nA2Req9Vjdm71UMOQFfEBaAAgvThvtf9/LSCp3I293
 cNNKpqBRZNFMl1I8VqqIoXn12eRoa4gIrSWcQSE6+OpjBZiXb/zhc3NTnqUF3AjjXyxQ
 gEPZI/VuQVeWOmYjZiAA3I9nx1SNhS8flyyGW8fa9ZjGU7joORocQkjNwCPi39GGZn9z
 jxNhPKMmcaPLz6yo3K4mTKvDWhkpaXMlpOA74J6VkBtW6hmRr46JTO7OjD4i9zCi7A8Z
 PFHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hVanuikBIg7iyJOS0bHt7RhnYa/QqZ8SXAaMv28MRCc=;
 b=CaNAlofTomhyqK4iYS0Go/vJ0a4Y5NEpSpVwbV5mZMVVGaLgMi/5i3mcCi5Mku5fe2
 yparEdGcP+vBT6i7A4Jxv1qHPSaJ60MOz3FloyfNaIbFqFotwNo25bgqLFMq+fsgwe8K
 7LXB4oLChyR3FhfGvS36aiOOAvhtBy4WN4wdIe0cBS01yjUrekz8z4nTBJyFSfP0PxpZ
 cocflusj4mcyKZQd5SDL68te/+2ONhoJ5CcSbOZCsxcmSQmOfO/lolTSxciLRMAU3f8p
 wKGaKs3/zJ9PxZ5WSXqBL8PROGYbTbxlfBi26rvNcKUDi9hssOoN+gc2mq8qjXsxbSEz
 hOnQ==
X-Gm-Message-State: AOAM5337Z2Wak1ttN6wUaIE0jEtFzrh8yW0X8Z85xQ9v+mmdjYmht8YE
 NuGdcx5+1bxLpc1jDiberceMaQ==
X-Google-Smtp-Source: ABdhPJzmmm0LVJc1Us3arsoLIJg85QV6Q0QPG1TuAt6WrJdewJ4WNLfrZHZa36dzpbpLRqFjq0piGw==
X-Received: by 2002:a17:902:ed86:b0:140:2896:3fc7 with SMTP id
 e6-20020a170902ed8600b0014028963fc7mr17660065plj.37.1635189009192; 
 Mon, 25 Oct 2021 12:10:09 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id m22sm19302177pfo.71.2021.10.25.12.10.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Oct 2021 12:10:08 -0700 (PDT)
Subject: Re: [PATCH v4 05/17] target/riscv: array for the 64 upper bits of
 128-bit registers
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <20211025122818.168890-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20211025122818.168890-6-frederic.petrot@univ-grenoble-alpes.fr>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <18de8766-9193-12a9-fda3-6b8b7a59bc56@linaro.org>
Date: Mon, 25 Oct 2021 12:10:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211025122818.168890-6-frederic.petrot@univ-grenoble-alpes.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.846,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: philmd@redhat.com, bin.meng@windriver.com, alistair.francis@wdc.com,
 palmer@dabbelt.com, fabien.portas@grenoble-inp.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/25/21 5:28 AM, Frédéric Pétrot wrote:
> The upper 64-bit of the 128-bit registers have now a place inside
> the cpu state structure, and are created as globals for future use.
> 
> Signed-off-by: Frédéric Pétrot<frederic.petrot@univ-grenoble-alpes.fr>
> Co-authored-by: Fabien Portas<fabien.portas@grenoble-inp.org>
> ---
>   target/riscv/cpu.h       |  2 ++
>   target/riscv/cpu.c       |  9 +++++++++
>   target/riscv/machine.c   | 20 ++++++++++++++++++++
>   target/riscv/translate.c |  5 ++++-
>   4 files changed, 35 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

