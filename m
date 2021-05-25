Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08FA83902C4
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 15:51:05 +0200 (CEST)
Received: from localhost ([::1]:39866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llXSa-00012f-2O
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 09:51:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llXO8-00027a-QJ
 for qemu-devel@nongnu.org; Tue, 25 May 2021 09:46:32 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:37854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llXO6-0006m5-Oe
 for qemu-devel@nongnu.org; Tue, 25 May 2021 09:46:28 -0400
Received: by mail-pf1-x42e.google.com with SMTP id q67so6599252pfb.4
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 06:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=T89o+EEhE3YmTlXuFOCypxlk4VBnSrEH5veYgeXqxmg=;
 b=CHxctTMyT1ksNutf4vJahIRuecQanie4uvbleAjlHaNPObun/rTnAPhd2WSUduXwIO
 PjcWl4cNHrFwhoo4EV+FSbPZRQd33EdDsViB83a7VfPGEY9zgT610UhninmotpaPRNE0
 lLdEgjnVLXjj/kPxoJn+p6w4eVsNpBeZTfXyzCjKVyKUcz2+xdDsdH8HxZ0spqhvniYT
 5FakRD7HTE9nCuSY1mUAHK/GRf7WjYgXjcwaAftkQumWJE1D43GHX5x3Y4VSxlfw2tqG
 S3nNLCxy+Dyk9nygY/pQwUfiKznOuy1F4nxP0Tfdp6vhZx1YDdJsDAfdnwVOmoGvBFBV
 A8YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=T89o+EEhE3YmTlXuFOCypxlk4VBnSrEH5veYgeXqxmg=;
 b=XD84t5KTwqbeWVh446Ocvi1ic0ddA/mI9mULxyXTyLGz/LinDGY67sDtnW+8MAIIz3
 WUSuHzHdP3hhLJMACZpqVGX1Iz1gzIMJX9neuSSMZqw2omJeIwz/KBor5wPPz21NRZG5
 XgLradnCw4FMQDd6IbrzmSc+3ZTTcNBizJ3NYmcvPGfjohRZRSJ3BfGRRei7Hl+mobWq
 T+bmds8LUFD3JQOLY2rf8TI1mawmCWJGq14BxwvE1LXOmarloUuWAMZ1hIvcu+Y2NuNO
 qa6b+ufHONN1eG3rhRrQZwzKlZjTF7C5BxG8/A8OczrRM6+y0icFwOg5dIg5RNxhBL/+
 IXKQ==
X-Gm-Message-State: AOAM530E+5HGYzm1KUrKMHsZJ6bbGFvCSvxKU3Afy49OkYsNkjMImIk7
 XuKlWUYLadtn5wAA27b3WquP2ypxnvNgEA==
X-Google-Smtp-Source: ABdhPJxN+o6NcQpvqbi2/jtrbQUU4BacKH3Ouf2x8Hs9m2eyGfrv1lf8g9qtEXZIhQ/gMMQMcZxdPQ==
X-Received: by 2002:a65:6819:: with SMTP id l25mr18712559pgt.280.1621950385450; 
 Tue, 25 May 2021 06:46:25 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 v3sm6133787pfb.203.2021.05.25.06.46.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 May 2021 06:46:25 -0700 (PDT)
Subject: Re: [PATCH 6/9] accel/tlb: Add
 tlb_flush_range_by_mmuidx_all_cpus_synced()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210509151618.2331764-1-f4bug@amsat.org>
 <20210509151618.2331764-7-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c78522bd-ac66-6b29-36e2-732cb70371e2@linaro.org>
Date: Tue, 25 May 2021 06:46:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210509151618.2331764-7-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/9/21 8:16 AM, Philippe Mathieu-Daudé wrote:
> From: Richard Henderson <richard.henderson@linaro.org>
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> Message-Id: <20210508201640.1045808-1-richard.henderson@linaro.org>
> [PMD: Split from bigger patch]
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   include/exec/exec-all.h | 12 ++++++++++++
>   accel/tcg/cputlb.c      | 27 ++++++++++++++++++++-------
>   2 files changed, 32 insertions(+), 7 deletions(-)

Forward tlb_flush_page_bits_by_mmuidx_all_cpus_synced to
tlb_flush_range_by_mmuidx_all_cpus_synced passing TARGET_PAGE_SIZE.


r~

