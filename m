Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C10C2FC7F6
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 03:33:34 +0100 (CET)
Received: from localhost ([::1]:47528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l23JM-00039i-JT
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 21:33:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l23IM-0002j8-Nt
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 21:32:30 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:40605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l23IL-0001Du-0U
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 21:32:30 -0500
Received: by mail-pj1-x1033.google.com with SMTP id m5so1183663pjv.5
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 18:32:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=64ZctxPzBkRj3OUaqsrzKtKWMuI+A531hHPLxVYvaMY=;
 b=fNhJWGEI6x92F2a9BhBzhIv/sPBuUZZR50UrDHoqPklYxcbR4qMiCbEaYlo0DDqB+5
 cB95QgC7I2KFCVpT693VIcnnu6kCpcNRDJk5gX1oU9fBRzL+uh+PsHbvanwYKHCLVpBO
 1SJ84RkSsSW/QYdrjAz3ClZmjsJzEGPp2JkJq+dLqj2AVTdyjWGDn5aDnlU6g79Cw62r
 8gy45aQ8NYBIc3mjgT4mJuWqgH8E9LGCIjqAR0RtoffrUTFui2xBLkqjFmOwvGMXE6Zl
 yMNxYKdsam35Z5M5DkO6vR8zdpp7sO73OuFdgj/B1KaaBY1aO2GyzInJoA9fK3aoxfGQ
 Wf9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=64ZctxPzBkRj3OUaqsrzKtKWMuI+A531hHPLxVYvaMY=;
 b=WzxnEsNcAYOtGsmL4wgNgb+3FsJtCaroEhL1wWl4Xg5LDpTdd5nQuwungMl4ZT4eX/
 Xv0OqCqKq83NfNHCmJmYwkvNXgIq1zzYXoMBFMAtvNh6AIjPfDahGhj7V+qslXHGwtgo
 JclNxg0aB0SPy/lf/4o9nfyBTabeN13EUjIflVdhrelisISMOhC1vmzTpe/kJd6b7tu5
 p0WbPWS6/XUWSbmijFVFZduL+PLQxuzoJPFqkFPgLY1IoxHFYJFx/Ac2tU/1A0pFGHtF
 ebJ17eD7LF7Jzp+ATPwOhGIhpKdoHcyE9qi0RceCI4hHwT5NF7s3XKZdnwq2wbVbBgy2
 8Iaw==
X-Gm-Message-State: AOAM5321XfgpB8jjUSLqKvziSTXbdGOa7cGFQdGz75Wzmd5Hq+X076n5
 /sHa70pp6i7W/EspPDxd5Ygqw0UCX5kXbg==
X-Google-Smtp-Source: ABdhPJwdbfNqIEskdIl4K4ZChg53RtXFR2emB2ySW6Vnwt91X5p6L5AKhyTq5M/NGBiDNXW0OUCOKA==
X-Received: by 2002:a17:902:9304:b029:da:fa20:b86a with SMTP id
 bc4-20020a1709029304b02900dafa20b86amr7663519plb.36.1611109946901; 
 Tue, 19 Jan 2021 18:32:26 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-75-72-126.hawaii.res.rr.com.
 [66.75.72.126])
 by smtp.gmail.com with ESMTPSA id e68sm391040pfe.23.2021.01.19.18.32.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Jan 2021 18:32:26 -0800 (PST)
Subject: Re: [PATCH v2 21/22] tcg/tci: Split out constraint sets to
 tcg-target-con-set.h
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210115210456.1053477-1-richard.henderson@linaro.org>
 <20210115210456.1053477-22-richard.henderson@linaro.org>
 <CAFEAcA9hWjUERcefn=R-Gj29+qKJnTz7SkXPKsYcstWpGzAduA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <861a6381-5e18-eeb0-897e-0b21b958172c@linaro.org>
Date: Tue, 19 Jan 2021 16:32:22 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9hWjUERcefn=R-Gj29+qKJnTz7SkXPKsYcstWpGzAduA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/19/21 6:09 AM, Peter Maydell wrote:
> On Fri, 15 Jan 2021 at 21:23, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> This requires finishing the conversion to tcg_target_op_def.
>> Remove quite a lot of ifdefs, since we can reference opcodes
>> even if they are not implemented.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> 
> This one's a lot more painful to review than the native targets :-(
> 
>> ---
> 
>> -/* TODO: documentation. */
>> -static const TCGTargetOpDef tcg_target_op_defs[] = {
>> -    { INDEX_op_exit_tb, { NULL } },
>> -    { INDEX_op_goto_tb, { NULL } },
>> -    { INDEX_op_br, { NULL } },
> 
> I don't see any cases in the new code for these ops,
> or for INDEX_op_mb which has {}. Is the function in fact
> never called for those ops ?

Correct.  Just before tcg_target_op_def() is called:

        if (nb_args == 0) {
            continue;
        }

>> -#if TCG_TARGET_HAS_div_i32
>> -    { INDEX_op_div_i32, { R, R, R } },
>> -    { INDEX_op_divu_i32, { R, R, R } },
>> -    { INDEX_op_rem_i32, { R, R, R } },
>> -    { INDEX_op_remu_i32, { R, R, R } },
>> -#elif TCG_TARGET_HAS_div2_i32
>> -    { INDEX_op_div2_i32, { R, R, "0", "1", R } },
>> -    { INDEX_op_divu2_i32, { R, R, "0", "1", R } },
>> -#endif
> 
> Why don't we need all the ifdeffery the old code has ? Is
> it because we know the ifdefs are always true (or always false) ?
> If so, can we do the "drop ifdefs" in a separate patch beforehand?
> I think that might help make the patch a bit easier to review.

Ok, I've split this up a bit.


r~


