Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E1F3ACF32
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 17:34:56 +0200 (CEST)
Received: from localhost ([::1]:42416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luGWF-0003t6-GO
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 11:34:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luGR9-0002xM-7Y
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 11:29:39 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:39930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luGR7-0000ZX-H4
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 11:29:38 -0400
Received: by mail-pf1-x432.google.com with SMTP id g192so249578pfb.6
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 08:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=n265VLXJKlp19a34jfKRrMAZ6K9MrjubNvzpKGz8WsY=;
 b=AvEgVu4tkB4At6YyHyIPejzj85hiv+9iZchDD52oVPV5e5LVEm2L1embEz7jMEevdl
 DQkOvsHr9FNtFXaeFcDLF+At1Gl9Zi8rrJYXxcag9mWtvTxDk99C6IVoisAVHfRuHHkm
 92XW8D6l7WiM14Km53c9m2iPY4UluB2S2DAehqsomu6FwJ4MFQdQStGrhg8I2OAP8QpS
 RCbS1xPRjHa4Y4mk/Mj6b8DbshanJ0HmNne7ShCnjhI6RpTHNbS3Ux3govdyFat/9Ivr
 QkFEjcYk5qW8UNBlTxXqSnnAIXsnGjL2eV9nkGaXXWga2wtiARv6y2EXYVmTbwEdmZ50
 lQpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=n265VLXJKlp19a34jfKRrMAZ6K9MrjubNvzpKGz8WsY=;
 b=JDNK6CwdN4t/RHvoT+EB8vxUML9T9pkecS3zb83udSDEserOXwER2oB06L0DrtwRg1
 DEdjvKHPU5bqwGCN4H+I4Ab9dKuL0wQTzG66tlGrnr5DuOz51VaMP1Y5pnWA1xbyrW1f
 aw1jq+syuMJe4dmI3CTqLlNKoK0DzfoKF99zYhZ/45caLzpL1PIWR5FxALHecTOuPrsg
 2qW/NLf4fgfFmaVNIsaH3nB2tDWRaf+EQBOzggviYQO7xKjTMDAUSVFwe3CnZVR2z4oJ
 5662+pX/udu/kHzEAbWt+lJ9A7qb+BSfzoxws2cIylLh6nBO2yxDRLxtKyV6DhVXriwl
 nJtQ==
X-Gm-Message-State: AOAM532/4ybGCt8jj2dmXmWsZvbymfDqaIcxdY6AK435QcmEjPfOiyf8
 3cOZGdmhNyWX9t2XD31mCTIUOnAQKbcJag==
X-Google-Smtp-Source: ABdhPJzYq6w8nRj+Xe7KmgFHAOgkhQjGTauZoViKEl79rW5Y+lJUTriOGc1Df3662/EFPTkJydYVdA==
X-Received: by 2002:a62:7f15:0:b029:2e9:c6b8:516d with SMTP id
 a21-20020a627f150000b02902e9c6b8516dmr5656116pfd.52.1624030175910; 
 Fri, 18 Jun 2021 08:29:35 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id e2sm8361382pfc.135.2021.06.18.08.29.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jun 2021 08:29:35 -0700 (PDT)
Subject: Re: [PATCH 3/7] target/arm: Don't NOCP fault for FPCXT_NS accesses
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210618141019.10671-1-peter.maydell@linaro.org>
 <20210618141019.10671-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2700aded-499e-e00c-68cc-1ed5673ae73b@linaro.org>
Date: Fri, 18 Jun 2021 08:29:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210618141019.10671-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.202,
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

On 6/18/21 7:10 AM, Peter Maydell wrote:
> The M-profile architecture requires that accesses to FPCXT_NS when
> there is no active FP state must not take a NOCP fault even if the
> FPU is disabled. We were not implementing this correctly, because
> in our decode we catch the NOCP faults early in m-nocp.decode.
> 
> Fix this bug by moving all the handling of M-profile FP system
> register accesses from vfp.decode into m-nocp.decode and putting
> it above the NOCP blocks. This provides the correct behaviour:
>   * for accesses other than FPCXT_NS the trans functions call
>     vfp_access_check(), which will check for FPU disabled and
>     raise a NOCP exception if necessary
>   * for FPCXT_NS we have the special case code that doesn't
>     call vfp_access_check()
>   * when these trans functions want to raise an UNDEF they return
>     false, so the decoder will fall through into the NOCP blocks.
>     This means that NOCP correctly takes precedence over UNDEF
>     for these insns. (This is a difference from the other insns
>     handled by m-nocp.decode, where UNDEF takes precedence and
>     which we implement by having those trans functions call
>     unallocated_encoding() in the appropriate places.)
> 
> [Note for backport to stable: this commit has a semantic dependency
> on commit 9a486856e9173af, which was not marked as cc-stable because
> we didn't know we'd need it for a for-stable bugfix.]
> 
> Cc:qemu-stable@nongnu.org
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> A big patch, but it's almost entirely code movement.
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

