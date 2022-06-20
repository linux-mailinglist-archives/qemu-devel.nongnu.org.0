Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B850B55248A
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 21:24:38 +0200 (CEST)
Received: from localhost ([::1]:57590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3N0n-0003OH-NA
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 15:24:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3MvT-0000Oa-31
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 15:19:07 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:43575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3MvR-0006mU-Cr
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 15:19:06 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 y13-20020a17090a154d00b001eaaa3b9b8dso11172129pja.2
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 12:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=vcH3D8ORIUk+caI/YcF0fm1BdgBq03NGayjULhS0QKs=;
 b=s7ct69Ilm6cWdHRnTa37Kb1zWSeKPwI0gw2KQqRqRU/EgXnw8q1NS4D/cJx94H63LF
 mRCE/Uj5jLIO6yDpw/1sMlUKTEyUwW/ABoX2uTDrin3W6NECsVTcxdLntDTurTL61xPJ
 /aq+3cJPUf3yEUfV12F5RLWVNph9ExQKmOC9JesNqsrpF7i0L4ok/gq+Dm7RQpE6vTmG
 qhvYHvDIyJqUPAiqgfvuPU8/ASPw8hl2GF6QjbDLfRiXrdxqmdv0Y2r1EFIMKCsR6L1U
 bqmowWLJEVwzZe/WMnZT4r/sCaZhWFPbx9AKh6Oainv/U7nYfLNPKqYGlF147BNg2oTp
 WfPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vcH3D8ORIUk+caI/YcF0fm1BdgBq03NGayjULhS0QKs=;
 b=Y1gxE0OCxdt01Rd0VHNWRDfp+NWLcHS+0lmYspnhc6l8KAk+s1G+Fnz1Cmm/bYpFNF
 EBJWb1/JCCUt/gXH9q0wL7PyRCZFp6I4IOP/8FGywVJxJGlmlelqX6BU7qnUlWwqVWOV
 UXUsxCwZ3Vwr28rnZX33BoOeeccgNVZIsafKHFQNPZ8EFppHgKTxH8/QlH+7R6Wib9YZ
 bRwEUgaRJ1TSD4BIrpva2SNrxjtS7v+EkqPvDjxpsPjAgTxDH+xOTpagv9QPmYJT7JvK
 f+LNxaNgc37EuMkMDcnOFxwsGJFIohYCnz8d3wQKBtOmlQ26ccJJS3UH64iXClf7rd1w
 vYYw==
X-Gm-Message-State: AJIora+Tp8yH+uMxaa0DFU/0fmYxEl4Rxy/6uxEdvA2nsmGNmahtRsqb
 P0/xW5Gse3geWwKMfcUTazdzEw==
X-Google-Smtp-Source: AGRyM1thmyy23rAiD0KRpP7bAqgos8XbQ3dLjeVYzRMjz+ZvfEZO/I1LYSGDh9H3q1cQRI1aZBhPWw==
X-Received: by 2002:a17:90a:4a92:b0:1ec:c087:d345 with SMTP id
 f18-20020a17090a4a9200b001ecc087d345mr1684697pjh.39.1655752743594; 
 Mon, 20 Jun 2022 12:19:03 -0700 (PDT)
Received: from ?IPV6:2602:47:d49e:3c01:a3e0:8a80:7b85:aea6?
 ([2602:47:d49e:3c01:a3e0:8a80:7b85:aea6])
 by smtp.gmail.com with ESMTPSA id
 ds12-20020a17090b08cc00b001e0c1044ceasm8530789pjb.43.2022.06.20.12.19.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jun 2022 12:19:03 -0700 (PDT)
Message-ID: <69acd2d0-35bc-63fa-dfb2-1144a4bf0b66@linaro.org>
Date: Mon, 20 Jun 2022 12:19:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 06/10] bsd-user: Implement chflags, lchflags and fchflags
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: Kyle Evans <kevans@freebsd.org>, Stacey Son <sson@FreeBSD.org>
References: <20220620174220.22179-1-imp@bsdimp.com>
 <20220620174220.22179-7-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220620174220.22179-7-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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

On 6/20/22 10:42, Warner Losh wrote:
> Signed-off-by: Stacey Son<sson@FreeBSD.org>
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/bsd-file.h           | 32 ++++++++++++++++++++++++++++++++
>   bsd-user/freebsd/os-syscall.c | 12 ++++++++++++
>   2 files changed, 44 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

