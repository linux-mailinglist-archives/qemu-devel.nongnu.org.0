Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 217F52F277C
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 06:05:55 +0100 (CET)
Received: from localhost ([::1]:60568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzBsQ-0006rh-5m
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 00:05:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kzBiy-0005eW-Di
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 23:56:08 -0500
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:38727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kzBiw-0003Bg-LD
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 23:56:08 -0500
Received: by mail-pf1-x432.google.com with SMTP id d2so665768pfq.5
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 20:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=k/4rWe3H6tDSDiGM27nyBODT+TsqmhPLwnSBt/O2TOI=;
 b=PAJIkHfqc7Gc4N9I+IZD6R5+ghEDqtj9QOtQwq1sEewP3phZMeAGAG8efwWdX90CcB
 3DeMa0Y20smtA91is6UEokTWyR/16PTpgWVLGk+OSmqRqxQY3E+PzEogdLAdeMli7KxN
 6dhXGmlEHlXu8n+zKvR9yVuJu2DDbqKg6CXnQsun6YFiP8z0ntie6Ou8iSOc3a9b2bGp
 uk12yPTdu11mPgON38+LHisq0Dy3qNT8BM70+LRLwdYSbDpV29ds0bl2hMKodEbFO67D
 3aFJwmitQhhUnd5K21VjT+OEHY57i/REdcpp1oluR7D4asJGQogX2110eMVeNQn+vSfZ
 GfcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=k/4rWe3H6tDSDiGM27nyBODT+TsqmhPLwnSBt/O2TOI=;
 b=smjRaH8edW5WVcMAW5B4hrb8SlCVXV+nm6dxRLXju3LDYl/j1cPCykCokO+y4NlXtF
 Wy3xXrTUMPxsry2nn1f27TIh67kNtRDMVY6sziyWVroZw535OKrHco/yLgY1nImBZG5F
 CeGskiHfA9sa2RmAk3Ki8fUP42+8mNSaVJ8RfJ1kIu4DwtPRzkkdLtKIibMztzA8+DVe
 durP4k0oM1MJlgX8XQ2DtjPDw9NBnd2p0CKR5VUT5HhzPyYBbDn+df1bVM22FZtmCiO5
 9r+XwGO8vXWGJ3VbSloCBQyq2Kv+QDt2EumIYJqRPP0/5PxvqaLmKJnaXhFnJJRq9MZm
 FfBg==
X-Gm-Message-State: AOAM531tNTcU1RHChM5y8hEYaJafi88JU2+ZIxjSfbB+o4+V9whuvgqK
 UmWUpji57QlR6cNj7vnQZ+BHWA==
X-Google-Smtp-Source: ABdhPJzFzSwUQ4/5YTFd0tzKXts9RfWR86yDlLGbVRgCI73jIYOJIZngmd2k3je6rQQURVHm9avhrw==
X-Received: by 2002:a63:947:: with SMTP id 68mr2912167pgj.279.1610427365244;
 Mon, 11 Jan 2021 20:56:05 -0800 (PST)
Received: from [10.25.18.36] (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id u25sm1372904pfn.170.2021.01.11.20.56.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jan 2021 20:56:04 -0800 (PST)
Subject: Re: [RFC v3 09/16] target/riscv: rvb: single-bit instructions
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20210112022001.20521-1-frank.chang@sifive.com>
 <20210112022001.20521-10-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fa04ac6c-fc2a-a17e-946e-232eae97347a@linaro.org>
Date: Mon, 11 Jan 2021 18:56:00 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210112022001.20521-10-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Kito Cheng <kito.cheng@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/11/21 4:19 PM, frank.chang@sifive.com wrote:
> From: Kito Cheng <kito.cheng@sifive.com>
> 
> Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/insn32-64.decode           |  8 +++
>  target/riscv/insn32.decode              |  9 +++
>  target/riscv/insn_trans/trans_rvb.c.inc | 90 +++++++++++++++++++++++++
>  target/riscv/translate.c                | 61 +++++++++++++++++
>  4 files changed, 168 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

