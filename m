Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3DF13A71B7
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 00:02:04 +0200 (CEST)
Received: from localhost ([::1]:56748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsuei-00028e-36
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 18:02:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsubH-0007We-3m
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 17:58:31 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:37458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsubF-0005ZF-8h
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 17:58:30 -0400
Received: by mail-pg1-x52a.google.com with SMTP id t9so9783894pgn.4
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 14:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=mYa/g4/Mw2qGq+y/k9E8eE5hCU6MshHAslXqZpFtjTc=;
 b=moUvxyKHbDT/GNswTE3t6JLDRtTL+nMoqrIXJonlT0ssihfbYl1llcz+OCor6NA9oi
 8Ofc2EStFpKHGYw2EvuLupctO2G75rHf2lyeHXWWlTum/dDCob1YbRGkAZ3mFron1bXi
 2m8ZUhBABlMFzTwkYxju9+9j112MXZXfuybduh4mLGx+sRHUq7COCXtK003bz3SwykOP
 uc96LuBXBZLBK06mfZfuUaYX0HvZS8OwHyvy73nwRfMgYYR3vtkkmZyK/+LqoQLn1x29
 0PiYr6WtMbEbocB/c5A06mjEUvZlO2tHPb4Fhk8Tnxz5BeT0D5TkfIZdCDQBvXZCblVS
 If8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mYa/g4/Mw2qGq+y/k9E8eE5hCU6MshHAslXqZpFtjTc=;
 b=G1ykPpJ9+yUJMRarHcXH6CORSV6VUuYROmCS4HrP7GXxMjekjz385otPrA4hUOH7n1
 wDXwleAMJc8cioN0hqPCU2416t36Ahgbjbj05LV32ll3mD6PqflQ02EzL0agw/mLfmoa
 GB+/aa58HOU00wD/OADCBDckCcr9RlmdUivooYhZLfL/ie/fudaba/yLf8H+b8Jy3Fcb
 hhHc9oijx+agYAmrN2eq8XQMHmi3jjhJPL8NSUyptK1rb8xPig+rIAfxmf7y2kKgEGmV
 jNohGrlnvZvvAAclsLq0goPkiBaQE8uMPYdH/3Y+BvZdt9/NO4QVMUqzpKkEvIiShm+b
 m3og==
X-Gm-Message-State: AOAM532FaDdxN/6msw5t0NqVkgLT0v5UnFLatUZX9p7Rvn507UrihzEw
 6W52AZTjW8tjRSHuZYTjfNJ9bytX14zdEQ==
X-Google-Smtp-Source: ABdhPJzfJIGH84NQrEW8SDAWDEO3NkA2ZtiD6Lu5winzlRD0zCqI/WycxjbuqhSy1hDpc+0m+bmfpQ==
X-Received: by 2002:a05:6a00:bc7:b029:2f5:7bdb:f694 with SMTP id
 x7-20020a056a000bc7b02902f57bdbf694mr1019844pfu.41.1623707907678; 
 Mon, 14 Jun 2021 14:58:27 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 pi8sm12887959pjb.52.2021.06.14.14.58.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jun 2021 14:58:27 -0700 (PDT)
Subject: Re: [PATCH v2 53/57] target/arm: Implement MVE VADC, VSBC
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210614151007.4545-1-peter.maydell@linaro.org>
 <20210614151007.4545-54-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a1945e65-c0cb-215f-7ec6-a37ed9f50592@linaro.org>
Date: Mon, 14 Jun 2021 14:58:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210614151007.4545-54-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.489,
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

On 6/14/21 8:10 AM, Peter Maydell wrote:
> Implement the MVE VADC and VSBC insns.  These perform an
> add-with-carry or subtract-with-carry of the 32-bit elements in each
> lane of the input vectors, where the carry-out of each add is the
> carry-in of the next.  The initial carry input is either 1 or is from
> FPSCR.C; the carry out at the end is written back to FPSCR.C.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h    |  5 ++++
>   target/arm/mve.decode      |  5 ++++
>   target/arm/mve_helper.c    | 52 ++++++++++++++++++++++++++++++++++++++
>   target/arm/translate-mve.c | 37 +++++++++++++++++++++++++++
>   4 files changed, 99 insertions(+)

Much better.
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

