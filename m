Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B96BE3C17C7
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 19:10:08 +0200 (CEST)
Received: from localhost ([::1]:35916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1XXL-0006NW-Ms
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 13:10:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1Wid-0007NR-Mq
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 12:17:43 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:35464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1WiY-0001jM-3N
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 12:17:43 -0400
Received: by mail-pg1-x52a.google.com with SMTP id v7so6544358pgl.2
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 09:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5kLWuL0Tj4Wxx+sgrfGzoimIIY7mOxQRdqHTGLcOp+8=;
 b=Vv1k/Ns0nHXFC3mIL9c732XFHM1v7TV91cmfrQ8wEe62enZyHxqmksriZeaN5yYf7U
 eIYsM5n+TZgnjtP89jh70JqSIfsBLlNast2WYgTxdR9mdu3kISIiu3mPMxwQcTacjSk4
 v2R3vLHD4I0OARc0zmYEQRwhH0m/5DwnPP9G88OX+M74y+eZfFCmYa2hJdt6bM7dJHdO
 M5ZtVymxVPr/ttubrUurAUOkDpBHMcMg1/SZ5RjEMCyV+hnANUUCBcE+NlfUkmm5Kxiw
 rwShWfyNhUjrjjQfpRxJNFpVaj06+agh3kpLVceDg5ThokxirX6y0P/+yZ0L3G23ExWh
 dtzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5kLWuL0Tj4Wxx+sgrfGzoimIIY7mOxQRdqHTGLcOp+8=;
 b=N460BEHNCNeSYsj/5+qpDBmqiQhPR6wKFxH7+9TUXVmYeYoJMy5Xew9a8nsa/E//RM
 S5AHmcc7NJoUeryvU2WFrVvHI55x4wx11wuLWJsUvu/JMRq4pGID1fX7ojnRkQIOdjhR
 GrYDct0TT7boLzo2lo5HRIbv1vEqc2MR6BNbpvvL6foV1Br2q7DPmTnSPWGK1ShmBfYe
 GixxlyX9v2vN5F4vCeYdc9NFuDkoSIXRejHhEhb5OxndCPqQsamwDIEFl40fvKjpnYSz
 rNgqKLgAue0LZd7xYWtwDfyj3lzCigSNd9ABbycSNk40B/n0MKucNBPj0sezAezhHLC/
 /dIw==
X-Gm-Message-State: AOAM533Voo+mMdpgNC+t16pAXosIseaUImplJILDm1zeKV0arOdhV8He
 GpCQG6HNT8yng2YMjPjzDZpbl/Q/CRwecg==
X-Google-Smtp-Source: ABdhPJwZ+gUPP0nczl9kce/a078AOp3FYSj+bvr3r9JRZC5xzHZEfs+oyNoIz2ea02eK0QPVxuBFOQ==
X-Received: by 2002:a63:5156:: with SMTP id r22mr33542781pgl.264.1625761056528; 
 Thu, 08 Jul 2021 09:17:36 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id g10sm9908263pji.10.2021.07.08.09.17.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jul 2021 09:17:36 -0700 (PDT)
Subject: Re: [PATCH v2 05/28] target/arm: Use gen_jmp for ISB and SB
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210630183226.3290849-1-richard.henderson@linaro.org>
 <20210630183226.3290849-6-richard.henderson@linaro.org>
 <CAFEAcA_EkW7a6SFuAHxdYvu_gdcdDwY4xQVOFnmtatcx+T1qGg@mail.gmail.com>
 <88562e08-3d6c-3224-5d84-67e3ffd3774b@linaro.org>
 <CAFEAcA8Xs0Ct6hDBAk-N7TVhb66dwv2EJudo83XzJ5dQn9k7VA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <589d27e5-58e5-6af2-dfd8-11130fdbc2d9@linaro.org>
Date: Thu, 8 Jul 2021 09:17:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8Xs0Ct6hDBAk-N7TVhb66dwv2EJudo83XzJ5dQn9k7VA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/8/21 9:11 AM, Peter Maydell wrote:
>>> Why isn't it enough here just to set is_jmp to DISAS_NEXT ?
>>
>> You mean DISAS_TOO_MANY?  That would work, yes.
>> At the time I was just thinking of replacing one jump with another.
> 
> You've implicitly answered my question, which is that the main
> translator loop code treats DISAS_NEXT as "keep adding insns to
> the TB" :-)
> 
> It feels slightly like misuse to use DISAS_TOO_MANY, unless we
> renamed it to something like DISAS_END_TB (which is what it's
> actually doing).

Yeah, better naming would have been a good.  In this instance I think I chose an odd 
colour for the bike shed.

The problem with just DISAS_END_TB is that there are many ways to end a tb, with at least: 
(1) goto_tb next, (2) goto_ptr next, (3) exit_tb.  We wind up replicating these three 
across many of the targets, so it would be a really nice cleanup to standardize, and with 
good names.


r~


