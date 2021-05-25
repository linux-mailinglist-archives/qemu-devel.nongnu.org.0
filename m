Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D38763902B0
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 15:43:38 +0200 (CEST)
Received: from localhost ([::1]:51256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llXLN-0006UD-VM
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 09:43:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llXK2-0005oH-Bn
 for qemu-devel@nongnu.org; Tue, 25 May 2021 09:42:14 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:56260)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llXJz-00043C-LW
 for qemu-devel@nongnu.org; Tue, 25 May 2021 09:42:14 -0400
Received: by mail-pj1-x1029.google.com with SMTP id kr9so8788919pjb.5
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 06:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=G6Iv47jUsZBcHudk9Lz1DwQPv8sbysh9XG8OT9cytHc=;
 b=NBP9qlT5A1yW01ZKj5SPlGbsv98+y8Lx7GB9MyAbDIbM0sZuoCNcns2AIFqJe0zgR9
 NJRP5uEQ/B9+u7dI3XycjeTleZNUnvbY9X6zQU5ngz4/0gwIQv1nnszToCrhpDrM8Yf2
 NsDoXSwSN0WTPRZsiS1cIgP67vD0qnzkAPrjW/eiDARtQDATlT746DqHecgDRj0LUBIM
 TJ2dF/tzU7F7GwSCal2FfvpWzmO6p7FEftLk6+rptSOZ1wFsSJxSplwiExybQNvw/Pwb
 SYFmiXCQ8XlYLjyl8SS+fZvyvzmT1O5uJKhH3+yeFb2vnOdcqrresDAPBRP38mdOK7uf
 6puQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=G6Iv47jUsZBcHudk9Lz1DwQPv8sbysh9XG8OT9cytHc=;
 b=uFpOBlO9kyEMd14FZfqhut7GZP+m8enlQMvDC6q6Kt/ruaNeYGkEEAdLreBKueHyW/
 y+1nhOvoJxxioU/7QJWf/95O4xmb0t73UfubbLDi8BKp+HrtLZJEJH4wz4B+gXNKYFHJ
 px6tZzNEbq/tNPTRQ7pvMI8AbpErIRKqTeANJS1FSNfkCfsai3WeYQSLoYwjGApy7Cat
 nBW/nQMQYOsSbpvQUJVnH9JHmBd0mYXNjZa8yOYeow68GmayDT161l+/GRNO3xi5NVJi
 Y844NKwdWNkekxqgPQYs3ifzrse9aIdNuwlS9cTPd5MdIxlFMhHTPzIVc5P3KM6Fk6bb
 dTPA==
X-Gm-Message-State: AOAM531q5Vky3n0H1bqQjFxON/2PQgio/lU3Ltl1yNoem8njfJKgtIvt
 a4ShHR6ROssZGPk+4m7dfAznOA==
X-Google-Smtp-Source: ABdhPJymhH2qGS8ETavZCw0N5EqUshs2S7pW/fwr36e1fl6twcOm5k4/yeT/ANhlgujsHFSDYIRNqA==
X-Received: by 2002:a17:90b:a18:: with SMTP id
 gg24mr4816761pjb.188.1621950129593; 
 Tue, 25 May 2021 06:42:09 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 o24sm14218561pgl.55.2021.05.25.06.42.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 May 2021 06:42:09 -0700 (PDT)
Subject: Re: [PATCH 4/9] accel/tcg: Add tlb_flush_range_by_mmuidx()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210509151618.2331764-1-f4bug@amsat.org>
 <20210509151618.2331764-5-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2a9e6141-157e-9d4f-5589-8c5952347c8c@linaro.org>
Date: Tue, 25 May 2021 06:42:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210509151618.2331764-5-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
>   include/exec/exec-all.h | 19 +++++++++++++++++++
>   accel/tcg/cputlb.c      | 20 +++++++++++++++-----
>   2 files changed, 34 insertions(+), 5 deletions(-)

Forward tlb_flush_page_bits_by_mmuidx to tlb_flush_range_by_mmuidx
passing TARGET_PAGE_SIZE.


r~

