Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C65F55A2DB
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 22:39:40 +0200 (CEST)
Received: from localhost ([::1]:53980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4q5b-0007nI-Ak
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 16:39:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o4q16-0003fk-Tz
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 16:35:02 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:43718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o4q15-0004UR-Es
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 16:35:00 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 dw10-20020a17090b094a00b001ed00a16eb4so3885286pjb.2
 for <qemu-devel@nongnu.org>; Fri, 24 Jun 2022 13:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=uPspGSoLk5kGw/SBQ3chHEEQNlFlq4lKRA8mHfk/xdw=;
 b=lJup/DFgxyS42cIr3BU/FdOfIpA4x07jsxVoMixZHzmZ8TdxMqqG1qC30grHOkMl4+
 8YISzeEwCTLNeRZWDbwZbj7+a/2JD7c25zH2Puzbx7Hk2UzjeChmzhrM6GKgReYE7Igp
 366x2ecrWvewie3ccuZ3xwmERWzWaEl5QYQyz1bgftGHbwgl2vQFiH0VBdzmwnpXXY5J
 JIfzIzk+A6T/Y+6bwIl5hQyThJr6DNiFegpczckRnebIkwYmMM5+e+rYVz2UEUe32MTT
 qb2/BmbzFL45S3kzEEoUTvbrU6AscWY1yzKK9PwaWlURZ3V7P91njFfYySBGsXXNlX/I
 DkXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=uPspGSoLk5kGw/SBQ3chHEEQNlFlq4lKRA8mHfk/xdw=;
 b=QEspJRUuqLUzWmsvWknmpwv2a0T+N7eK3B+AyWzqdKt14eS8EIi/YQBraCm/f8gNvO
 FayP5Jua1Bl4uxSZv8F4BVcK5d9e2leIM3GPns8Lc62+S3wHnNTaFtAjLaaRzMnulhM3
 jF8FDhdozH9r5DGWTggPn+h2Rov9wae8KE8XTGMJPwpnH98f6qTQdkblnIFu5c/LDtmb
 LGm+7pHXBDwwFL7evI0T+tKNpFscLp3W7ghzMjwdEXVsVvKqX2jVaVYD0jNfr3cRD0CX
 0eq1Oo2hA8zUcnt7XPlDgR+BFaqfrUyVcsl1P7x/A5UALsEq8TXI11c2+xZnQnIA0xaI
 hUeg==
X-Gm-Message-State: AJIora9rF+YTgqx8eQ7JiIxXLmRrm7JaoBKh+bSS+WpT4KcFj/DkJrCS
 QZAjAkwUCqVnL9mDinMSActl7A==
X-Google-Smtp-Source: AGRyM1vsxJngw2wFPnEWCVswPip3vdICYXxs2sRU3BBp6J1m8n/PAEBvm03cYSUnz1b+tmGFgBTiLw==
X-Received: by 2002:a17:90a:fe16:b0:1ec:a69e:d135 with SMTP id
 ck22-20020a17090afe1600b001eca69ed135mr6106429pjb.31.1656102897974; 
 Fri, 24 Jun 2022 13:34:57 -0700 (PDT)
Received: from ?IPV6:2602:ae:1543:f001:b25a:9949:8352:ec5d?
 ([2602:ae:1543:f001:b25a:9949:8352:ec5d])
 by smtp.gmail.com with ESMTPSA id
 c5-20020a170902c1c500b00163f2f9f07csm2241241plc.48.2022.06.24.13.34.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jun 2022 13:34:57 -0700 (PDT)
Message-ID: <eecb93a9-0f5a-2a40-eef5-3a5fe0a2079b@linaro.org>
Date: Fri, 24 Jun 2022 13:34:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v3 22/51] target/arm: Trap AdvSIMD usage when Streaming
 SVE is active
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20220620175235.60881-1-richard.henderson@linaro.org>
 <20220620175235.60881-23-richard.henderson@linaro.org>
 <CAFEAcA-9XuMV06P_A079c24xeUGuxOQ2hR+mxwJy-fA3xVS+Ug@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA-9XuMV06P_A079c24xeUGuxOQ2hR+mxwJy-fA3xVS+Ug@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/24/22 08:30, Peter Maydell wrote:
> So the thing that worries me about structuring this this way
> is that the SME supplement appendix includes this caution:
> 
> # The instruction encoding tables in this section [...] will
> # require correction if subsequent versions of the A64 ISA
> # add new instructions which overlap with these encodings.
> 
> My guess (based on how the H.a Arm ARM has incorporated
> SME) is that these tables aren't going to be included
> in the Arm ARM and updated going forward. Instead the
> behaviour will be documented based on whether (existing
> and new) instructions call CheckNonStreamingSVEEnabled()
> or CheckSVEEnabled() in their pseudocode.

I agree that this would be cleaner and more correct long-term.

> So I'm a bit uncertain about how awkward it's going to be
> in future to maintain this transliteration of the SME
> supplement tables into decodetree: we might find that
> we have to look at new instructions and kind of
> reverse-engineer back out any required changes to the
> tables here, rather than simply "write the trans_ function
> for the new insn, looking at the pseudocode to see which
> _access_check() function it should be calling"...

I thought about this, and if it were simply a matter of annotating the trans_* functions 
within translate-sve.c, I would have done it.  But I would need to adjust A64 AdvSIMD as 
well, which is still done with the by-hand decoder.

Can we use this solution in the short term, and fix up advsimd while coverting it to 
decodetree?  I'm more and more convinced we'll want this sooner than later.


r~

