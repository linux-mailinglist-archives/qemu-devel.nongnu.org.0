Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A09786A3DD2
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 10:07:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWZSE-0006Qx-EH; Mon, 27 Feb 2023 04:05:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWZSC-0006Q2-1j
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 04:05:52 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWZSA-0002AM-Ff
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 04:05:51 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 p23-20020a05600c1d9700b003ead4835046so3735286wms.0
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 01:05:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qUfnkj+8TrKtAgCfgVEMbz4qz9NEWYnkfi0dsKgSzdE=;
 b=qQLPeqsqIHphsX9N5iEAF6EbnTIylOj+6/i32CIitgZBWZwkxhhFGlNZGYKSLwoGhV
 m0UjMnwUi82eMTlR4cW1leFNxCLT/qkNx1Pv2InQmS/nYtOSJnV6lcqS1x9omB+0QVhk
 Q2fBGrQCMUUbkKeWRHbVO7t/SAGA8+LxWICJJJrJKOBIe+khotdoT99h86NGdD/qIkDg
 +MnfAbS48WCh9pWjDYJ0Mjl3nefNJAq/PGQz5N8iSFzQQaQZG7dnlAZsbCUFSTIEbaLJ
 0xmNXgaW3Yr8dTw3x1c17EO5VS04sAIq5YiPLsi7CbzxOoeI51BDPcJo847d3SH8YGGH
 R2Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qUfnkj+8TrKtAgCfgVEMbz4qz9NEWYnkfi0dsKgSzdE=;
 b=vXn41hP6+hXoHwH1ZmafCD+VdqCK+9EeEPyw4AhYm6Vy6gyVsJHojhC2ghEXzMfRoa
 Rqz0YSER1v0vxH+EnEZjK5R3FzTuBxyTt7FgA3E/nIugTiYQK46isanj0viaoFvuntPJ
 XUMoJM9gqohTOF2VjCTNs2L11wYAnx4GuHj3mUdHnyi4bkuuMbX0nBtk68o9wqaJtMY7
 c/38OnDfGDEpCpXioy3zjyShVdh1eENXYfvdSY5LhU2o8qdHWAqzxCHdYrHNkVv53u0M
 +yn1nDQJwj8yiCWr9OasokNXYARcXHeweLeZ/XMyZf6dwo/h05RnNDhh9CFqe0H22+go
 00NQ==
X-Gm-Message-State: AO0yUKUnRD0D6Matj7XlwU3fkiwX8ZwgD+AQsYotUZMdEYHYTb4z5Ndi
 vCaHC2jFB+OMGHNVOgHmWbYftg==
X-Google-Smtp-Source: AK7set98W/nkRHK2zwK35x+Yq8OHJkVXUAOHi2UPob5GX4cdQ+ZvyE8qX3qkOx11T8Yb4FwNUUQLpQ==
X-Received: by 2002:a05:600c:4e89:b0:3e2:5f6:3647 with SMTP id
 f9-20020a05600c4e8900b003e205f63647mr5997954wmq.16.1677488748870; 
 Mon, 27 Feb 2023 01:05:48 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 l8-20020a05600c1d0800b003de2fc8214esm8804045wms.20.2023.02.27.01.05.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Feb 2023 01:05:48 -0800 (PST)
Message-ID: <57484d75-00b6-e83c-13c4-48d639ed607e@linaro.org>
Date: Mon, 27 Feb 2023 10:05:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 45/70] target/riscv: Avoid tcg_const_*
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-46-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230227054233.390271-46-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 27/2/23 06:42, Richard Henderson wrote:
> All uses are strictly read-only.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/riscv/translate.c                  | 4 ++--
>   target/riscv/insn_trans/trans_rvv.c.inc   | 4 ++--
>   target/riscv/insn_trans/trans_rvzfh.c.inc | 2 +-
>   3 files changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


