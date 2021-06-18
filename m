Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3324D3ACE5D
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 17:12:34 +0200 (CEST)
Received: from localhost ([::1]:35024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luGAb-0004U5-8z
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 11:12:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luG98-0003bR-CG
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 11:11:02 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:43586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luG95-0005SY-KH
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 11:11:02 -0400
Received: by mail-pf1-x42d.google.com with SMTP id a127so7875852pfa.10
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 08:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=781V4HYiK+sAWxI2lA4puFTkpvvsAvIR9/CvTGB/X8s=;
 b=W/n8xj49kDXyoz0M72d1gC44x1cwIvMsHOQXKJea5eHa10Uawat456jnyPxDYVBCU6
 Vv3RegsZlI3HGUoQcUMcHEm/LJSZJzfbNHlXhZlhi5lw8cnaxul8N0Dz5fkMt8S3NYPd
 z3pJsqYdVCa3WRRK6EgjHHAjTWMgaVm3jMyJVUm1tl9PbP7mbnW66H8Mao0vw7s3JjrH
 zjbGvO5x3ax0dQ+49caeF/kQm6ptobxoFg/o//89nSau65KFpce+pAJVheJ0oFZSKzxy
 ofM9c//DshVtwNnrYel5sBJwQ510CQVmS+fr7Va9aLcalzd0pbzXr9776n08tIvVJPFQ
 Zu8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=781V4HYiK+sAWxI2lA4puFTkpvvsAvIR9/CvTGB/X8s=;
 b=qi5xA4PST/CYbkgvi1Dm4+B2WqK97VaogMl7HACkTv8XmYoS2QqyYOOmYN3aIoztHR
 MYK/RyN+vqRJkzk7wpQPeAhwx+sFq6OBD5bNdvjJwlvldQuhVUCQzLmVsdsIXL89+m/1
 2RI+umQGvfdVPGvb8SShdXluBDUKdKF23rB49TBmEM11P/yejeJGYlRNM87Fp2unt6uR
 bzRxauCMhf1cSYlk633SPOGB0fnWUQbfjJLX/5bqSAILqTKINH7+BAVAHyz7iOB32kjU
 QlzrTNaR0SuEAANG06wM/YTnDVr64hNtkqmGU7lz7UacjpZw8DgHUDDJme55kkSXFoxJ
 kjqw==
X-Gm-Message-State: AOAM532Kkye94WV7YJtePgUSkKSx0fHCn/AA5NdhbsyGVhjIM1tMpFBp
 PIijhc0VfK9JOMdtHxDQGU70UrVdVtTLdQ==
X-Google-Smtp-Source: ABdhPJyT9iR5i1ShwUWol73ndZTVeGmZWbH/4/qhN3yWfKoMUjAXcCTlV8ANZ/0QuKmNEaZc4Q2CnA==
X-Received: by 2002:aa7:8641:0:b029:2f4:7263:5524 with SMTP id
 a1-20020aa786410000b02902f472635524mr5621269pfo.70.1624029057883; 
 Fri, 18 Jun 2021 08:10:57 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id r14sm4002215pgu.18.2021.06.18.08.10.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jun 2021 08:10:57 -0700 (PDT)
Subject: Re: [PATCH 2/7] target/arm: Handle FPU being disabled in FPCXT_NS
 accesses
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210618141019.10671-1-peter.maydell@linaro.org>
 <20210618141019.10671-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b265ef2d-e963-e742-ce2a-d8df717c91d4@linaro.org>
Date: Fri, 18 Jun 2021 08:10:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210618141019.10671-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.202,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/18/21 7:10 AM, Peter Maydell wrote:
> If the guest makes an FPCXT_NS access when the FPU is disabled,
> one of two things happens:
>   * if there is no active FP context, then the insn behaves the
>     same way as if the FPU was enabled: writes ignored, reads
>     same value as FPDSCR_NS
>   * if there is an active FP context, then we take a NOCP
>     exception
> 
> Add code to the sysreg read/write functions which emits
> code to take the NOCP exception in the latter case.
> 
> At the moment this will never be used, because the NOCP checks in
> m-nocp.decode happen first, and so the trans functions are never
> called when the FPU is disabled.  The code will be needed when we
> move the sysreg access insns to before the NOCP patterns in the
> following commit.
> 
> Cc:qemu-stable@nongnu.org
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

