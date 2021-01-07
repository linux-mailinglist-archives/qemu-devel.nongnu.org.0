Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F262EE810
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 23:03:44 +0100 (CET)
Received: from localhost ([::1]:34882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxdNf-0000kF-8D
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 17:03:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kxdMT-0000BX-0r
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:02:29 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:42493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kxdMR-0005Kc-CX
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:02:28 -0500
Received: by mail-pf1-x42c.google.com with SMTP id h10so4883072pfo.9
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 14:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wIrYqelWQrLF7t7DOjYcFcQd5x0pSDtWI74x1YUH7vU=;
 b=bp06FwBEyhu+gPAoNzPGfdGXUet9fejNyoQ/sZKBPKsf9HfN5xcwb5fS6UoMGqsTaA
 ohube+8/boY1JYepgr1f2m/1BZAKnm/E/6cQDF+gXR56WVrH2Pznp9kjySK1K9+0gPUk
 5uAgqdQHYpNm/KbZmje9L6ZR501CgTFwmCT9W//azkMsAFkMabXBjzsLxYAfPL1Aa3vE
 xGkWT4YCYdisrkLns8in1mkRXml2uFlo+nAVbmAn9HtDiatkri5pQOdAJLU0t/2SQlxF
 pI4ikh8tRf1qK3W9kF0aUaxDRFp4gGlngota3iZe2IX0lD44vT0thlMhJvpk7Yd69lHl
 21mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wIrYqelWQrLF7t7DOjYcFcQd5x0pSDtWI74x1YUH7vU=;
 b=T7HkYRXAPcBcyX4CAis6OtS4IF/UMMvFdorFe2ej2PZKjgtUY1XK//J+2Qo73m5D3e
 lhxd6Z408Jslt/g8RNomLWuk9dozn64Y2Pg1s45oizF7bMAjrtya5BLHggNc279yCK5U
 BONnUWDN127Xvgs29uTpp3JMMuL3B6C2hrmmNG6zrUYZvGfKA8UTjxEN/wdO2sn2l1p2
 APzydqFVLUw4sHfBTtNKY/U696sgizuH+5z2NRSar94tO5yPbA3FgOI8qGvMFjgW3UIs
 hKEBjjJco7ryvnwo8dM+WiHd0DXyOvpekFqbHrJynz7bE//mjfQIV73oWHHZLOj9o1+S
 PErw==
X-Gm-Message-State: AOAM530q/DPO9o/mCdox7PlR8Tt/joQ2eCeBw6Pn7JqZRqNfmZKlSVln
 yaoFImQFzfd3NxdlPoeI6t9XOg==
X-Google-Smtp-Source: ABdhPJzcVPqFiPdobgU7612qnH24yI/leb5KzDhjVUMgP2Y1i3z0jROUD4ddTy8OLH1M4/icoDADXQ==
X-Received: by 2002:a62:7858:0:b029:19d:c011:1cfe with SMTP id
 t85-20020a6278580000b029019dc0111cfemr547178pfc.47.1610056945802; 
 Thu, 07 Jan 2021 14:02:25 -0800 (PST)
Received: from [10.25.18.38] (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id a4sm7972298pgn.40.2021.01.07.14.02.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Jan 2021 14:02:25 -0800 (PST)
Subject: Re: [PATCH v2 24/24] target/arm: Enforce alignment for sve
 unpredicated LDR/STR
To: Peter Maydell <peter.maydell@linaro.org>
References: <20201208180118.157911-1-richard.henderson@linaro.org>
 <20201208180118.157911-25-richard.henderson@linaro.org>
 <CAFEAcA97CfTvAJkSHEYtEKrg9jZjCLTbra-KFxfYZVuCH7MMkA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6ff3c7b0-9254-2e36-89e0-e9eb59fd6e7f@linaro.org>
Date: Thu, 7 Jan 2021 12:02:21 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA97CfTvAJkSHEYtEKrg9jZjCLTbra-KFxfYZVuCH7MMkA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.267,
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/7/21 7:39 AM, Peter Maydell wrote:
>> +        if (align > MO_ALIGN_8) {
>> +            t0 = tcg_temp_new_i64();
>> +            tcg_gen_qemu_ld_i64(t0, clean_addr, midx, MO_LEQ | align);
>> +            tcg_gen_addi_i64(clean_addr, clean_addr, 8);
>> +            tcg_gen_addi_ptr(i, i, 8);
>> +            tcg_gen_st_i64(t0, cpu_env, vofs);
>> +            tcg_temp_free_i64(t0);
>> +            align = 0;
>> +        }
>> +
> 
> Why do we need to do this (and the similar thing in do_str()) ?
> Most of the rest of the patch is fairly clear in that it is just
> passing the alignment requirement through to the load/store fns,
> but this is a bit more opaque to me...

What follows this context is a single memory access within a tcg loop.

When align is <= the size of the access, every access can use the same
alignment mop.  But for MO_ALIGN_16, since we're emitting 8-byte accesses, the
second access will not be 16-byte aligned.  So I peel off one loop iteration at
the beginning to perform the alignment check.


r~

