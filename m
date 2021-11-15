Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2525544FFA4
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 09:03:32 +0100 (CET)
Received: from localhost ([::1]:55800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmWxe-0002lN-Ps
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 03:03:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mmWwG-0001uE-1f
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 03:02:04 -0500
Received: from [2a00:1450:4864:20::433] (port=39552
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mmWwD-0007U2-TU
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 03:02:03 -0500
Received: by mail-wr1-x433.google.com with SMTP id d27so28843891wrb.6
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 00:02:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GbpP/8KAioO/YRtL4rx7xGjmagDxShnhsARaSYnQBmA=;
 b=EjWHLAPUYpTI39hZCwI/0jzic4v890SQb9c40U0ss3urDTnIEM1J5/NOUAueyPHAZZ
 jZyMDAS97O3nDnlFlXk26wt9qYbEzwrF6K98/ZADv7a0/oGiwo9q7d8Q6VsUwWXW66p7
 D+OEIOyRaNdxOHJX+re9iMTSWrOke14UbhgxNUgENwVIs98sr9GAcXOua8S5wnKuO2Z9
 8uZzCP/GGc9b9pRzV63g/wSYuULFZEW0M1lZuaYuLoUyn87IaHHBDb9dTbbJKj2zIHVz
 /058FXBRK61Z7PZV2SXNwYhJQS2rra9ssqOHueyTZaKc2bOPCGWhLxgkvpZ386T0XpcJ
 xk/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GbpP/8KAioO/YRtL4rx7xGjmagDxShnhsARaSYnQBmA=;
 b=noQUhtq7jQ6ArhbyNMeVZqyMShwW7AK5ESm8GKheJ+huuykDYK0CQ84Q7DJEJbt5JN
 43E2j5SqkEXlvHjs1IMBdmbbJRcFq5f1CzcAGrDdttNXNPr6+HzvjkEa2voSO1eU5KFh
 ezMxiAx64aPRrUnAWosUXv/G3FfyY1NBPEEf+WgG0MystK0LZ+aGcXE0nQvl/xkLxsGQ
 Swk6Tbj01q6PHU5ZB/eAPGX7Z491fusbHyUoDLQCozNWt5DFPBt01+23YFGdNz1SewJa
 9zLfqmwwU/ZHsqvPyLE0qNF3DsV4B3GiaEvudCGrImVQDgf2rPRNbJ1UYw4L9cCrXHkF
 brUg==
X-Gm-Message-State: AOAM533NVbACKYFrwLmpA7Jz1rpnE1qkmG9qe5mvwCdCEyLBh5WMxmsz
 r4lFwEFsFitl9VfwFTey7LCNVQ==
X-Google-Smtp-Source: ABdhPJxGP1sBWgz1fUXwlGhKFIGGRR0BSwOavlVjs4ws9Biskq2Wl3nNXK3zN9c6fcDzMESuNj4npg==
X-Received: by 2002:adf:d852:: with SMTP id k18mr42029970wrl.391.1636963319292; 
 Mon, 15 Nov 2021 00:01:59 -0800 (PST)
Received: from [192.168.8.105] (137.red-176-80-46.dynamicip.rima-tde.net.
 [176.80.46.137])
 by smtp.gmail.com with ESMTPSA id n32sm22316799wms.1.2021.11.15.00.01.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Nov 2021 00:01:58 -0800 (PST)
Subject: Re: [PATCH v5 02/18] exec/memop: Adding signed quad and octo defines
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <20211112145902.205131-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20211112145902.205131-3-frederic.petrot@univ-grenoble-alpes.fr>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <334343ea-77e6-431b-4dfc-433fd1986ede@linaro.org>
Date: Mon, 15 Nov 2021 09:01:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211112145902.205131-3-frederic.petrot@univ-grenoble-alpes.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.278,
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
Cc: philmd@redhat.com, bin.meng@windriver.com, alistair.francis@wdc.com,
 palmer@dabbelt.com, fabien.portas@grenoble-inp.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/12/21 3:58 PM, Frédéric Pétrot wrote:
> Adding defines to handle signed 64-bit and unsigned 128-bit quantities in
> memory accesses.
> 
> Signed-off-by: Frédéric Pétrot<frederic.petrot@univ-grenoble-alpes.fr>
> ---
>   include/exec/memop.h | 7 +++++++
>   1 file changed, 7 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

